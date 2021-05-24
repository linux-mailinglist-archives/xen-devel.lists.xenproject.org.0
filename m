Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6BD38E05F
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 06:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131642.245936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ll2Dk-0004S9-GZ; Mon, 24 May 2021 04:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131642.245936; Mon, 24 May 2021 04:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ll2Dk-0004QL-CM; Mon, 24 May 2021 04:29:40 +0000
Received: by outflank-mailman (input) for mailman id 131642;
 Mon, 24 May 2021 04:29:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Omqp=KT=bugseng.com=roberto.bagnara@srs-us1.protection.inumbo.net>)
 id 1ll2Di-0004QF-Pv
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 04:29:38 +0000
Received: from spartacus.cs.unipr.it (unknown [160.78.167.140])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84cc6cb0-8f19-4fa9-83b3-56d6194fd072;
 Mon, 24 May 2021 04:29:36 +0000 (UTC)
Received: from [192.168.1.137] (host-87-7-30-209.retail.telecomitalia.it
 [87.7.30.209])
 by spartacus.cs.unipr.it (Postfix) with ESMTPSA id 03E674E0C29
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 06:29:34 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 84cc6cb0-8f19-4fa9-83b3-56d6194fd072
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
Subject: Invalid _Static_assert expanded from HASH_CALLBACKS_CHECK
To: xen-devel@lists.xenproject.org
Message-ID: <ccb37c2e-a3a6-a2e4-bf15-da81f97c94be@bugseng.com>
Date: Mon, 24 May 2021 06:29:34 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


Hi there.

I stumbled upon parsing errors due to invalid uses of
_Static_assert expanded from HASH_CALLBACKS_CHECK where
the tested expression is not constant, as mandated by
the C standard.

Judging from the following comment, there is partial awareness
of the fact this is an issue:

#ifndef __clang__ /* At least some versions dislike some of the uses. */
#define HASH_CALLBACKS_CHECK(mask) \
     BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)

Indeed, this is not a fault of Clang: the point is that some
of the expansions of this macro are not C.  Moreover,
the fact that GCC sometimes accepts them is not
something we can rely upon:

$ cat p.c
void f() {
static const int x = 3;
_Static_assert(x < 4, "");
}
$ gcc -c -O p.c
$ gcc -c p.c
p.c: In function ‘f’:
p.c:3:20: error: expression in static assertion is not constant
3 | _Static_assert(x < 4, "");
| ~^~
$

Finally, I think this can be easily avoided: instead
of initializing a static const with a constant expression
and then static-asserting the static const, just static-assert
the constant initializer.

Kind regards,

    Roberto Bagnara

