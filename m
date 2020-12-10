Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A32D578D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 10:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49041.86753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knIc8-0006hU-Ep; Thu, 10 Dec 2020 09:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49041.86753; Thu, 10 Dec 2020 09:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knIc8-0006h5-BV; Thu, 10 Dec 2020 09:51:56 +0000
Received: by outflank-mailman (input) for mailman id 49041;
 Thu, 10 Dec 2020 09:51:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oBdS=FO=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1knIc7-0006h0-4M
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 09:51:55 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 666ef150-8685-41a6-b230-392ca3a1202f;
 Thu, 10 Dec 2020 09:51:52 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0BA9pipr014969
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 10:51:45 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id BAC912E946C; Thu, 10 Dec 2020 10:51:39 +0100 (MET)
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
X-Inumbo-ID: 666ef150-8685-41a6-b230-392ca3a1202f
Date: Thu, 10 Dec 2020 10:51:39 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PV looping on search_pre_exception_table()
Message-ID: <20201210095139.GA455@antioche.eu.org>
References: <20201209101512.GA1299@antioche.eu.org>
 <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
 <20201209135908.GA4269@antioche.eu.org>
 <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
 <20201209154431.GA4913@antioche.eu.org>
 <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
 <20201209163049.GA6158@antioche.eu.org>
 <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
 <20201209185714.GS1469@antioche.eu.org>
 <6c06abf1-7efe-f02c-536a-337a2704e265@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c06abf1-7efe-f02c-536a-337a2704e265@citrix.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Thu, 10 Dec 2020 10:51:46 +0100 (MET)

On Wed, Dec 09, 2020 at 07:08:41PM +0000, Andrew Cooper wrote:
> Oh of course - we don't follow the exit-to-guest path on the way out here.
> 
> As a gross hack to check that we've at least diagnosed the issue
> appropriately, could you modify NetBSD to explicitly load the %ss
> selector into %es (or any other free segment) before first entering user
> context?

If I understood it properly, the user %ss is loaded by Xen from the
trapframe when the guest swictes from kernel to user mode, isn't it ?
So you mean setting %es to the same value in the trapframe ?

Actually I used %fs because %es is set equal to %ds.
Xen 4.13 boots fine with this change, but with 4.15 I get a loop of:


(XEN) *** LDT: gl1e 0000000000000000 not present                               
(XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
[  12.3586540] Process (pid 1) got sig 11                                      

which means that the dom0 gets the trap, and decides that the fault address
is not mapped. Without the change the dom0 doesn't show the
"Process (pid 1) got sig 11"

I activated the NetBSD trap debug code, and this shows:
[   6.7165877] kern.module.path=/stand/amd64-xen/9.1/modules                    (XEN) *** LDT: gl1e 0000000000000000 not present                                
(XEN) *** pv_map_ldt_shadow_page(0x40) failed                                   
[   6.9462322] pid 1.1 (init): signal 11 code=1 (trap 0x6) @rip 0x7f7ef0c007d0 a
ddr 0xffffbd800000a040 error=14
[   7.0647896] trapframe 0xffffbd80381cff00
[   7.1126288] rip 0x00007f7ef0c007d0  rsp 0x00007f7fff10aa30  rfl 0x00000000000
00202
[   7.2041518] rdi 000000000000000000  rsi 000000000000000000  rdx 0000000000000
00000
[   7.2956758] rcx 000000000000000000  r8  000000000000000000  r9  0000000000000
00000
[   7.3872013] r10 000000000000000000  r11 000000000000000000  r12 0000000000000
00000
[   7.4787216] r13 000000000000000000  r14 000000000000000000  r15 0000000000000
00000
[   7.5702439] rbp 000000000000000000  rbx 0x00007f7fff10afe0  rax 0000000000000
00000
[   7.6617663] cs 0x47  ds 0x23  es 0x23  fs 0000  gs 0000  ss 0x3f
[   7.7345663] fsbase 000000000000000000 gsbase 000000000000000000

so it looks like something resets %fs to 0 ...

Anyway the fault address 0xffffbd800000a040 is in the hypervisor's range,
isn't it ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

