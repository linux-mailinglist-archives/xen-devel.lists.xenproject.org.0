Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAEB20C689
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jun 2020 08:59:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpRGd-0002jF-2l; Sun, 28 Jun 2020 06:58:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wKTm=AJ=web.de=joshua_peter@srs-us1.protection.inumbo.net>)
 id 1jpRGb-0002jA-Vt
 for xen-devel@lists.xenproject.org; Sun, 28 Jun 2020 06:58:18 +0000
X-Inumbo-ID: bd4ebb4a-b90c-11ea-8446-12813bfff9fa
Received: from mout.web.de (unknown [217.72.192.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd4ebb4a-b90c-11ea-8446-12813bfff9fa;
 Sun, 28 Jun 2020 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593327495;
 bh=NNIfy6Qb51fWZFOY6Z5CwNKi4EfIAC0oBskgu1FU4CI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=bAK/1+f11BYYEN1C6Fmj9Fh1C8QPhSsK3CCmZ22V8tpPVBCmaUG7LJ49x9d7teoif
 kMuGL56SpPwPeqWpiijrLNiDXBTHedPGsbjeRHdDBsqe7/NhQsAafnU38IlOo5aKpD
 rhNsSRpSA4quxqrlOxf+SxxCTddy6YdArt9N+KxM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [79.201.93.129] ([79.201.93.129]) by web-mail.web.de
 (3c-app-webde-bap42.server.lan [172.19.172.42]) (via HTTP); Sun, 28 Jun
 2020 08:58:14 +0200
MIME-Version: 1.0
Message-ID: <trinity-b65f5be3-8ffe-4ce5-a1e9-88e512959fc5-1593327494913@3c-app-webde-bap42>
From: joshua_peter@web.de
To: xen-devel@lists.xenproject.org
Subject: Questions about PVH memory layout
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Jun 2020 08:58:14 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:7h398uufS1yhCrfUDVXaGb22eEZs85FklJoX48vabYF039MQFdN90wtHygqryUOSi5Wqz
 qm53L4awRDp/YjNZ7tmfMOInppRkB5JNOjURXL9+n7woxm4d0ZGx1X6wd7g6fks/Yngm4MoEjhYO
 CtLv1Dx7m7hKOzS5RpHAgy9zRM/Trnkzquq+nt8K0jtHG9is367Gza/sKC+g8LhWKOHsXjQnIcbR
 vlk3DsFDkUgRjeLU8p8LqoDsCjQyCjzyL/0hG1t0owGbLCa2zGGCcvrwvikkUnNBDRwUa8Tk0paD
 u0=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ppMOxAhQmlc=:ljL1d8ae0i+aSvUMuk9m0E
 YnyJXOgXinCxIpwrNGOzCkYVp74e7pNQ2mCbz+iSh/kwRTsaOONjzTpoh7xSI43l6SZp+g4xy
 pmKrdUfK1AGgWPrabkoKRcNf4M2EyB4hSc4FwhOIGhTLq53Xxel40p3yxGlCOB7nhb1u2dc8P
 IFUO5/V8FIP3A5Bt9U4dEkUdZJOflAPENOSDaOM+tZUixmyDVEUrKiAGWdqNEWNC+reHLA6VN
 BmaODpRVcufmLu0knX0aeuTGjkD4MX2gskOAINwuSs8D0LG3llKJ/E8tyIxW+N5VYoq67xBVX
 nk5dSRyZrZGbxHhCPYODAhe8aUvKpwvYAJlyFLh7rSWGwSffdG1L8/O28j2mnV0wlvipvwdvw
 vfQskmPp85+C0ksMqDEUuo5dYjdf0BIidj3VjOLBSY+znaCIU11XLZwvdSUzLF28wIvQipV7n
 Ka2WquytDjgLdjQ/gRdvkJQNTdCSOb8bubPICkO5hLPEVmzluQvPh69rxtRXD2SN3CpyGRQ6P
 RbvaQ1NK7cQr2diEVqj3WgHgK/crYgzcSY9f9ogfyLmzRJaySK9tA7SXiMKz8WNdbuqvHIkjq
 Ya3OztyEGsW+ZZmJVZLR2ztr4bzF0QY2N+mU1FkRewzY8uB4WEhBvKORcyvOaYaIlg5wlIO5c
 Rs6RjBULYY+01FzlZbPDKZuca8vpOT4QjQ869xLF0H6LuP0Y6IEM2FwnYCCJLgoVQXw8=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello everyone,

I hope this is the right forum for these kinds of questions (the website
states no "technical support queries"; I'm not sure if this qualifies).
If not, sorry for the disturbance; just simply direct me elsewhere then.

Anyway, I'm currently trying to get into how Xen works in detail, so
for one I've been reading a lot of code, but also I dumped the P2M table
of my PVH guest to get a feel for how things are layed out in memory. I
mean there is the usual stuff, such as lots of RAM, and the APIC is
mapped at 0xFEE00000 and the APCI tables at 0xFC000000 onwards. But two
things stuck out to me, which for the life of me I couldn't figure out
from just reading the code. The first one is, there are a few pages at
the end of the 32bit address space (from 0xFEFF8000 to 0xFEFFF000),
which according to the E820 is declared simply as "reserved". The other
thing is, the first 512 pages at the beginning of the address space are
mapped linearly, which usually leads to them being mapped as a single
2MB pages. But there is this one page at 0x00001000 that sticks out
completely. By that I mean (to make things more concrete), in my PVH
guest the page at 0x00000000 maps to 0x13C200000, 0x00002000 maps to
0x13C202000, 0x00003000 maps to 0x13C203000, etc. But 0x00001000 maps
to 0xB8DBD000, which seems very odd to me (at least from simply looking
at the addresses). My initial guess was that this is some bootloader
related stuff, but Google didn't show up any info related to that
memory area, and most of the x86/PC boot stuff seems to happen below
the 0x1000 mark.

Would someone be so kind to tell me what those two things are? Many
thanks in advance.

(Btw. I'm running Xen 4.13.1 on Intel x64, booting my PVH guest with
PyGRUB, if it's relevant.)

Best regards,
Peter

