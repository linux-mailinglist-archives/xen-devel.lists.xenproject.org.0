Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFB72B0927
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 16:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25946.54027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdEyV-00065x-Nb; Thu, 12 Nov 2020 15:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25946.54027; Thu, 12 Nov 2020 15:57:27 +0000
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
	id 1kdEyV-00065Y-Kg; Thu, 12 Nov 2020 15:57:27 +0000
Received: by outflank-mailman (input) for mailman id 25946;
 Thu, 12 Nov 2020 15:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7ei=ES=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kdEyU-00065T-LD
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 15:57:26 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3866cb0-5131-4d4e-a969-a349ada0503c;
 Thu, 12 Nov 2020 15:57:23 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ACFvK2O022019
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2020 16:57:21 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 85E722E9CA8; Thu, 12 Nov 2020 16:57:15 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=B7ei=ES=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kdEyU-00065T-LD
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 15:57:26 +0000
X-Inumbo-ID: d3866cb0-5131-4d4e-a969-a349ada0503c
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d3866cb0-5131-4d4e-a969-a349ada0503c;
	Thu, 12 Nov 2020 15:57:23 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ACFvK2O022019
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2020 16:57:21 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 85E722E9CA8; Thu, 12 Nov 2020 16:57:15 +0100 (MET)
Date: Thu, 12 Nov 2020 16:57:15 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Subject: dom0 PVH: 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
Message-ID: <20201112155715.GA5003@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Thu, 12 Nov 2020 16:57:21 +0100 (MET)

Hello,
I'm trying to add dom0 PVH support to NetBSD. I'm tesing with Xen 4.13
on a brand new Intel x86 server (Dell R440).
While the dom0 kernel configures hardware, Xen panics with:
(XEN) Xen call trace:
(XEN)    [<ffff82d08031cc28>] R vpci_msix_arch_mask_entry+0x18/0x20
(XEN)    [<ffff82d08025a38a>] S drivers/vpci/msix.c#msix_write+0x18a/0x2b0
(XEN)    [<ffff82d08030d943>] S arch/x86/hvm/intercept.c#hvm_mmio_write+0x23/0x3
0
(XEN)    [<ffff82d08030dd19>] S hvm_process_io_intercept+0x1e9/0x260
(XEN)    [<ffff82d08030ddad>] S hvm_io_intercept+0x1d/0x40
(XEN)    [<ffff82d0802fe7ba>] S arch/x86/hvm/emulate.c#hvmemul_do_io+0x26a/0x4d0
(XEN)    [<ffff82d080259ef9>] S drivers/vpci/msix.c#msix_accept+0x9/0x20
(XEN)    [<ffff82d0802fea56>] S arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x36
/0x70
(XEN)    [<ffff82d0802ff005>] S arch/x86/hvm/emulate.c#hvmemul_linear_mmio_access+0x1e5/0x300
(XEN)    [<ffff82d0802fff44>] S arch/x86/hvm/emulate.c#linear_write+0x84/0x160
(XEN)    [<ffff82d080301ca8>] S arch/x86/hvm/emulate.c#hvmemul_write+0xe8/0x100
(XEN)    [<ffff82d0802de6cc>] S x86_emulate+0x289dc/0x2cfb0
(XEN)    [<ffff82d08027c7ab>] S map_domain_page+0x4b/0x600
(XEN)    [<ffff82d080340eaa>] S __get_gfn_type_access+0x6a/0x100
(XEN)    [<ffff82d08034a367>] S arch/x86/mm/p2m-ept.c#ept_next_level+0x107/0x150
(XEN)    [<ffff82d0802e4961>] S x86_emulate_wrapper+0x21/0x60
(XEN)    [<ffff82d08030024f>] S arch/x86/hvm/emulate.c#_hvm_emulate_one+0x4f/0x220
(XEN)    [<ffff82d0803004ed>] S hvmemul_get_seg_reg+0x4d/0x50
(XEN)    [<ffff82d08030042e>] S hvm_emulate_one+0xe/0x10
(XEN)    [<ffff82d08030e4ca>] S hvm_emulate_one_insn+0x3a/0xf0
(XEN)    [<ffff82d0802e4af0>] S x86_insn_is_mem_access+0/0x260
(XEN)    [<ffff82d08030e5c9>] S handle_mmio_with_translation+0x49/0x60
(XEN)    [<ffff82d080305d78>] S hvm_hap_nested_page_fault+0x2c8/0x720
(XEN)    [<ffff82d0802fea56>] S arch/x86/hvm/emulate.c#hv(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 13:
(XEN) Assertion 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
(XEN) ****************************************

This is when it configures the broadcom network interface, which interrupts
at "msix3 vec 0". It is the first MSI-X device configured; the previous
ones are MSI only.

Is it a bug on the Xen side, or something missing on the NetBSD side ?
If the later, where can I find informations about it ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

