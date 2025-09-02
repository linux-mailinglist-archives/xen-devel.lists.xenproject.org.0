Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F690B3FC06
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 12:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106007.1456810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utO5G-0007nD-U5; Tue, 02 Sep 2025 10:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106007.1456810; Tue, 02 Sep 2025 10:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utO5G-0007lJ-R7; Tue, 02 Sep 2025 10:17:50 +0000
Received: by outflank-mailman (input) for mailman id 1106007;
 Tue, 02 Sep 2025 10:17:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jdug=3N=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1utO5F-0007lB-I6
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 10:17:49 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f7e6dab-87e6-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 12:17:42 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.18.1/8.16.1) with ESMTPS id 582AHfYj029339
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Tue, 2 Sep 2025 12:17:41 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 582AHep1018068
 for <xen-devel@lists.xenproject.org>; Tue, 2 Sep 2025 12:17:40 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 2E7F9107F7; Tue,  2 Sep 2025 12:17:39 +0200 (CEST)
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
X-Inumbo-ID: 0f7e6dab-87e6-11f0-8dd7-1b34d833f44b
Date: Tue, 2 Sep 2025 12:17:39 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Subject: issue with dom0_pvh on Xen 4.20
Message-ID: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="/pxNkvLdhZauztBH"
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Tue, 02 Sep 2025 12:17:41 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.4.1 on 132.227.60.2


--/pxNkvLdhZauztBH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,
I'm trying to boot a NetBSD PVH dom0 on Xen 4.20.
The same NetBSD kernel works fine with Xen 4.18

The boot options are:
menu=Boot netbsd-current PVH Xen420:dev hd0f:;load /netbsd-PVH console=com0 root=wd0f; multiboot /xen420-debug.gz dom0_mem=1024M console=com1 com1=38400,8n1 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 sync_console=1 dom0=pvh

and the full log from serial console is attached.

With 4.20 the boot fails with:

(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 664kB init memory
(XEN) d0v0 Triple fault - invoking HVM shutdown action 1
(XEN) *** Dumping Dom0 vcpu#0 state: ***
(XEN) ----[ Xen-4.20.2-pre_20250821nb0  x86_64  debug=y  Tainted:   C    ]----
(XEN) CPU:    7
(XEN) RIP:    0008:[<000000000020e268>]
(XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d0v0)
(XEN) rax: 000000002024c003   rbx: 000000000020e260   rcx: 00000000000dfeb7
(XEN) rdx: 0000000000100000   rsi: 0000000000103000   rdi: 000000000013e000
(XEN) rbp: 0000000080000000   rsp: 00000000014002e4   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
(XEN) cr3: 0000000000000000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008

because of the triple fault the RIP above doens't point to the code.

I tracked it down to this code:
        cmpl    $0,%ecx                 ;       /* zero-sized? */       \
        je      2f                      ; \
        pushl   %ebp                    ; \
        movl    RELOC(nox_flag),%ebp    ; \
1:      movl    %ebp,(PDE_SIZE-4)(%ebx) ;       /* upper 32 bits: NX */ \
        movl    %eax,(%ebx)             ;       /* store phys addr */   \
        addl    $PDE_SIZE,%ebx          ;       /* next PTE/PDE */      \
        addl    $PAGE_SIZE,%eax         ;       /* next phys page */    \
        loop    1b                      ; \
        popl    %ebp                    ; \
2:                                      ;

there are others pushl/popl before so I don't think that's the problem
(in fact the exact same fragment is called just before with different
inputs and it doesn't fault). So the culprit it probably the write to (%ebx),
which would be 0x20e260
This is in the range:
(XEN)  [0000000000100000, 0000000040068e77] (usable)
so I can't see why this would be a problem.

Any idea, including how to debug this further, welcome

thanks

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--/pxNkvLdhZauztBH
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="4.20.log.gz"
Content-Transfer-Encoding: base64

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
qJoAAA==

--/pxNkvLdhZauztBH--

