Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6064B2D43A3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:00:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48274.85338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn005-0003gu-By; Wed, 09 Dec 2020 13:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48274.85338; Wed, 09 Dec 2020 13:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn005-0003gV-8e; Wed, 09 Dec 2020 13:59:25 +0000
Received: by outflank-mailman (input) for mailman id 48274;
 Wed, 09 Dec 2020 13:59:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XdhY=FN=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kn004-0003gQ-Ev
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 13:59:24 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95922b69-8533-40ff-9909-9189a95ad141;
 Wed, 09 Dec 2020 13:59:21 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0B9DxDJh007027
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 14:59:14 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id BB6FA2E946C; Wed,  9 Dec 2020 14:59:08 +0100 (MET)
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
X-Inumbo-ID: 95922b69-8533-40ff-9909-9189a95ad141
Date: Wed, 9 Dec 2020 14:59:08 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PV looping on search_pre_exception_table()
Message-ID: <20201209135908.GA4269@antioche.eu.org>
References: <20201208175738.GA3390@antioche.eu.org>
 <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
 <20201209101512.GA1299@antioche.eu.org>
 <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 09 Dec 2020 14:59:15 +0100 (MET)

On Wed, Dec 09, 2020 at 01:28:54PM +0000, Andrew Cooper wrote:
> 
> Pagefaults on IRET come either from stack accesses for operands (not the
> case here as Xen is otherwise working fine), or from segement selector
> loads for %cs and %ss.
> 
> In this example, %ss is in the LDT, which specifically does use
> pagefaults to promote the frame to PGT_segdesc.
> 
> I suspect that what is happening is that handle_ldt_mapping_fault() is
> failing to promote the page (for some reason), and we're taking the "In
> hypervisor mode? Leave it to the #PF handler to fix up." path due to the
> confusion in context, and Xen's #PF handler is concluding "nothing else
> to do".
> 
> The older behaviour of escalating to the failsafe callback would have
> broken this cycle by rewriting %ss and re-entering the kernel.
> 
> 
> Please try the attached debugging patch, which is an extension of what I
> gave you yesterday.  First, it ought to print %cr2, which I expect will
> point to Xen's virtual mapping of the vcpu's LDT.  The logic ought to
> loop a few times so we can inspect the hypervisor codepaths which are
> effectively livelocked in this state, and I've also instrumented
> check_descriptor() failures because I've got a gut feeling that is the
> root cause of the problem.

here's the output:
(XEN) IRET fault: #PF[0000]                                            [23/1999]
(XEN) %cr2 ffff820000010040                                                    
(XEN) IRET fault: #PF[0000]                                                    
(XEN) %cr2 ffff820000010040                                                 
(XEN) IRET fault: #PF[0000]
(XEN) %cr2 ffff820000010040
(XEN) IRET fault: #PF[0000]
(XEN) %cr2 ffff820000010040
(XEN) domain_crash called from extable.c:216
(XEN) Domain 0 (vcpu#0) crashed on cpu#0:
(XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:   C   ]----
(XEN) CPU:    0
(XEN) RIP:    0047:[<00007f7ff60007d0>]
(XEN) RFLAGS: 0000000000000202   EM: 0   CONTEXT: pv guest (d0v0)
(XEN) rax: ffff82d04038c309   rbx: 0000000000000000   rcx: 000000000000e008
(XEN) rdx: 0000000000010086   rsi: ffff83007fcb7f78   rdi: 000000000000e010
(XEN) rbp: 0000000000000000   rsp: 00007f7fff4876c0   r8:  0000000e00000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000002660
(XEN) cr3: 0000000079cdb000   cr2: ffffa1000000a040
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: ffffffff80cf2dc0
(XEN) ds: 0023   es: 0023   fs: 0000   gs: 0000   ss: 003f   cs: 0047
(XEN) Guest stack trace from rsp=00007f7fff4876c0:
(XEN)    0000000000000001 00007f7fff487bd8 0000000000000000 0000000000000000
(XEN)    0000000000000003 00000000aee00040 0000000000000004 0000000000000038
(XEN)    0000000000000005 0000000000000008 0000000000000006 0000000000001000
(XEN)    0000000000000007 00007f7ff6000000 0000000000000008 0000000000000000
(XEN)    0000000000000009 00000000aee01cd0 00000000000007d0 0000000000000000
(XEN)    00000000000007d1 0000000000000000 00000000000007d2 0000000000000000
(XEN)    00000000000007d3 0000000000000000 000000000000000d 00007f7fff488000
(XEN)    00000000000007de 00007f7fff4877c0 0000000000000000 0000000000000000
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

