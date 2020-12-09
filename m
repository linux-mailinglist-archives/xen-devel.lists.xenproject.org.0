Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0122D45BE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 16:45:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48396.85575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn1e0-0007lM-LO; Wed, 09 Dec 2020 15:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48396.85575; Wed, 09 Dec 2020 15:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn1e0-0007kx-HU; Wed, 09 Dec 2020 15:44:44 +0000
Received: by outflank-mailman (input) for mailman id 48396;
 Wed, 09 Dec 2020 15:44:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XdhY=FN=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kn1dz-0007ks-BI
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 15:44:43 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a37f9c88-de81-4f7e-83e9-21da9fc1d759;
 Wed, 09 Dec 2020 15:44:41 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0B9FiaAv014436
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 16:44:37 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 3983E2E946C; Wed,  9 Dec 2020 16:44:31 +0100 (MET)
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
X-Inumbo-ID: a37f9c88-de81-4f7e-83e9-21da9fc1d759
Date: Wed, 9 Dec 2020 16:44:31 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PV looping on search_pre_exception_table()
Message-ID: <20201209154431.GA4913@antioche.eu.org>
References: <20201208175738.GA3390@antioche.eu.org>
 <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
 <20201209101512.GA1299@antioche.eu.org>
 <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
 <20201209135908.GA4269@antioche.eu.org>
 <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 09 Dec 2020 16:44:37 +0100 (MET)

On Wed, Dec 09, 2020 at 02:41:23PM +0000, Andrew Cooper wrote:
> 
> Huh, so it is the LDT, but we're not getting as far as inspecting the
> target frame.
> 
> I wonder if the LDT is set up correctly.

I guess it is, otherwise it wouldn't boot with a Xen 4.13 kernel, isn't it ?

> How about this incremental delta?

Here's the output
(XEN) IRET fault: #PF[0000]                                                    
(XEN) %cr2 ffff820000010040, LDT base ffffc4800000a000, limit 0057             
(XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
(XEN) IRET fault: #PF[0000]                                                    
(XEN) %cr2 ffff820000010040, LDT base ffffc4800000a000, limit 0057             
(XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
(XEN) IRET fault: #PF[0000]                                                 
(XEN) %cr2 ffff820000010040, LDT base ffffc4800000a000, limit 0057
(XEN) *** pv_map_ldt_shadow_page(0x40) failed
(XEN) IRET fault: #PF[0000]
(XEN) %cr2 ffff820000010040, LDT base ffffc4800000a000, limit 0057
(XEN) domain_crash called from extable.c:219
(XEN) Domain 0 (vcpu#0) crashed on cpu#0:
(XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:   C   ]----
(XEN) CPU:    0
(XEN) RIP:    0047:[<00007f7ecaa007d0>]
(XEN) RFLAGS: 0000000000000202   EM: 0   CONTEXT: pv guest (d0v0)
(XEN) rax: ffff82d04038c309   rbx: 0000000000000000   rcx: 000000000000e008
(XEN) rdx: 0000000000010086   rsi: ffff83007fcb7f78   rdi: 000000000000e010
(XEN) rbp: 0000000000000000   rsp: 00007f7fff32e3f0   r8:  0000000e00000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000002660
(XEN) cr3: 0000000079cdb000   cr2: ffffc4800000a040
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: ffffffff80cf2dc0
(XEN) ds: 0023   es: 0023   fs: 0000   gs: 0000   ss: 003f   cs: 0047
(XEN) Guest stack trace from rsp=00007f7fff32e3f0:
(XEN)    0000000000000001 00007f7fff32e908 0000000000000000 0000000000000000
(XEN)    0000000000000003 0000000173e00040 0000000000000004 0000000000000038
(XEN)    0000000000000005 0000000000000008 0000000000000006 0000000000001000
(XEN)    0000000000000007 00007f7ecaa00000 0000000000000008 0000000000000000
(XEN)    0000000000000009 0000000173e01cd0 00000000000007d0 0000000000000000
(XEN)    00000000000007d1 0000000000000000 00000000000007d2 0000000000000000
(XEN)    00000000000007d3 0000000000000000 000000000000000d 00007f7fff32f000
(XEN)    00000000000007de 00007f7fff32e4f0 0000000000000000 0000000000000000
(XEN)    6e692f6e6962732f 0000000000007469 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

