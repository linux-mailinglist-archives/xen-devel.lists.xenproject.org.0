Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C78296C97
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 12:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10827.28899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVu6n-0000Y5-L0; Fri, 23 Oct 2020 10:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10827.28899; Fri, 23 Oct 2020 10:15:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVu6n-0000Xg-Hs; Fri, 23 Oct 2020 10:15:41 +0000
Received: by outflank-mailman (input) for mailman id 10827;
 Fri, 23 Oct 2020 10:15:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVu6l-0000Xb-W0
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:15:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f769d8a3-91f5-44f3-8792-6680d4277fc5;
 Fri, 23 Oct 2020 10:15:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4959CABD1;
 Fri, 23 Oct 2020 10:15:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVu6l-0000Xb-W0
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:15:40 +0000
X-Inumbo-ID: f769d8a3-91f5-44f3-8792-6680d4277fc5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f769d8a3-91f5-44f3-8792-6680d4277fc5;
	Fri, 23 Oct 2020 10:15:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603448138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MLwvR0bR6+91bNT+kLoaVPWwhWujrDgATP2ywjwdqf0=;
	b=M+9SsSGoWFUFaYx7Q+hQ/Tteg4ewAK6PKLZW/ZiHZVKZpuZItTI0w0G/siF27huwQ9JBpw
	P81J0cI92BoyOE9/B9QURoNCH5c+yk0r6zkZ2BRob6XbRGw5NfmfLqSkhVfrONDNL01TnK
	XvEMMDuaccxOPlnbRgpv2aTeWCUWBhk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4959CABD1;
	Fri, 23 Oct 2020 10:15:38 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/8] xen: beginnings of moving library-like code into an
 archive
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Date: Fri, 23 Oct 2020 12:15:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In a few cases we link in library-like functions when they're not
actually needed. While we could use Kconfig options for each one
of them, I think the better approach for such generic code is to
build it always (thus making sure a build issue can't be introduced
for these in any however exotic configuration) and then put it into
an archive, for the linker to pick up as needed. The series here
presents a first few tiny steps towards such a goal.

Not that we can't use thin archives yet, due to our tool chain
(binutils) baseline being too low.

The first patch actually isn't directly related to the rest of the
series, except that - to avoid undue redundancy - I ran into the
issue addressed there while (originally) making patch 3 convert to
using $(call if_changed,ld) "on the fly". IOW it's a full
(contextual and functional) prereq to the series.

Further almost immediate steps I'd like to take if the approach
meets no opposition are
- split and move the rest of common/lib.c,
- split and move common/string.c, dropping the need for all the
  __HAVE_ARCH_* (implying possible per-arch archives then need to
  be specified ahead of lib/lib.a on the linker command lines),
- move common/libelf/ and common/libfdt/.

It's really only patch 7 which has changed in v7, but since no
other feedback arrived which would require adjustments, I'm
resending with just this one change.

1: lib: split _ctype[] into its own object, under lib/
2: lib: collect library files in an archive
3: lib: move list sorting code
4: lib: move parse_size_and_unit()
5: lib: move init_constructors()
6: lib: move rbtree code
7: lib: move bsearch code
8: lib: move sort code

Jan

