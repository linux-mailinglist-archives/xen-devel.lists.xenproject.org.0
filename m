Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6F6250BAF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 00:30:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAKxv-0000D5-JW; Mon, 24 Aug 2020 22:29:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9JQT=CC=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kAKxt-0000D0-Oj
 for xen-devel@lists.xen.org; Mon, 24 Aug 2020 22:29:21 +0000
X-Inumbo-ID: 65254c31-fb46-47c4-bab2-8bbe314378aa
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65254c31-fb46-47c4-bab2-8bbe314378aa;
 Mon, 24 Aug 2020 22:29:19 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 07OMTINP021982
 for <xen-devel@lists.xen.org>; Tue, 25 Aug 2020 00:29:18 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 57D692803; Tue, 25 Aug 2020 00:29:18 +0200 (CEST)
Date: Tue, 25 Aug 2020 00:29:18 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xen.org
Subject: HVM BIOS ROM and modules
Message-ID: <20200824222918.GA522@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]);
 Tue, 25 Aug 2020 00:29:18 +0200 (MEST)
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

Hello again,
I'm now facing another issue with qemu-xen, this time on Xen 4.13

Starting a HVM domains with qemu-xen instead of qemu-dm fails with
(d9) Writing SMBIOS tables ...
(d9) Loading SeaBIOS ...
(d9) no BIOS ROM image found
(d9) *** HVMLoader bug at hvmloader.c:394
(d9) *** HVMLoader crashed.

I tracked this down to info->nr_modules being 0 in
hvmloader.c:get_module_entry()

but I failed to see where this is supposed to be initialised.
qemu-system-i386 does read the ROM file (I checked with ktrace) but
I can't see where it would setup info->nr_modules for the guest
(it does for PVH but not for HVM, AFAIK).
Is qemu supposed to setup modules params in info, or should
xl do it ? If the former, where does it happens in qemu-xen sources ?
If the later, how does it know which rom to load ?

thanks,

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

