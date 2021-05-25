Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF638FD45
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 10:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132116.246555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llStq-0003MR-Bu; Tue, 25 May 2021 08:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132116.246555; Tue, 25 May 2021 08:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llStq-0003Jn-83; Tue, 25 May 2021 08:58:54 +0000
Received: by outflank-mailman (input) for mailman id 132116;
 Tue, 25 May 2021 08:58:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llSto-0003Jh-HD
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 08:58:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd202bfb-c0d6-4243-a979-5f899ab486fa;
 Tue, 25 May 2021 08:58:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E935EAE1F;
 Tue, 25 May 2021 08:58:50 +0000 (UTC)
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
X-Inumbo-ID: cd202bfb-c0d6-4243-a979-5f899ab486fa
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621933131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irAn1gzuscv/VwlzsNzq0Us/QytPEd7377xAvJnaDMQ=;
	b=We1PWTIcXT518mnqXgldwXeIJZToWDFxnhypNR1xpkbK5tJeGGXkei/YS/7UEb4G23bNlE
	7nfXkR4zzbqpJjwvthTAGs1wi6sLWxVMaSPS8kcLBrJKZC+q/8cagz5nU6vUI7RCVb7J5u
	B1M/uLCHkioc4f/9vnookGggPtO8Vn0=
Subject: Re: Invalid _Static_assert expanded from HASH_CALLBACKS_CHECK
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
References: <ccb37c2e-a3a6-a2e4-bf15-da81f97c94be@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38898d21-fe76-36dc-f1e6-497b52c5c0b7@suse.com>
Date: Tue, 25 May 2021 10:58:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <ccb37c2e-a3a6-a2e4-bf15-da81f97c94be@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.05.2021 06:29, Roberto Bagnara wrote:
> I stumbled upon parsing errors due to invalid uses of
> _Static_assert expanded from HASH_CALLBACKS_CHECK where
> the tested expression is not constant, as mandated by
> the C standard.
> 
> Judging from the following comment, there is partial awareness
> of the fact this is an issue:
> 
> #ifndef __clang__ /* At least some versions dislike some of the uses. */
> #define HASH_CALLBACKS_CHECK(mask) \
>      BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
> 
> Indeed, this is not a fault of Clang: the point is that some
> of the expansions of this macro are not C.  Moreover,
> the fact that GCC sometimes accepts them is not
> something we can rely upon:
> 
> $ cat p.c
> void f() {
> static const int x = 3;
> _Static_assert(x < 4, "");
> }
> $ gcc -c -O p.c
> $ gcc -c p.c
> p.c: In function ‘f’:
> p.c:3:20: error: expression in static assertion is not constant
> 3 | _Static_assert(x < 4, "");
> | ~^~
> $

I'd nevertheless like to stick to this as long as not proven
otherwise by future gcc.

> Finally, I think this can be easily avoided: instead
> of initializing a static const with a constant expression
> and then static-asserting the static const, just static-assert
> the constant initializer.

Well, yes, but the whole point of constructs like

    HASH_CALLBACKS_CHECK(callback_mask);
    hash_domain_foreach(d, callback_mask, callbacks, gmfn);

is to make very obvious that the checked mask and the used mask
match. Hence if anything I'd see us eliminate the static const
callback_mask variables altogether. I did avoid doing so in the
earlier change, following the assumption that the choice of
using a static const there was for a reason originally (my guess:
a combination of not wanting to use a #define and of having the
mask values live next to their corresponding arrays).

Cc-ing Tim as the maintainer, to possibly override my views.

Jan

