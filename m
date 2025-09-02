Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB802B4007C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106295.1457020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQ7n-0000vP-Rm; Tue, 02 Sep 2025 12:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106295.1457020; Tue, 02 Sep 2025 12:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQ7n-0000sA-Oy; Tue, 02 Sep 2025 12:28:35 +0000
Received: by outflank-mailman (input) for mailman id 1106295;
 Tue, 02 Sep 2025 12:28:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jdug=3N=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1utQ7l-0000de-UQ
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:28:33 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56d63e8a-87f8-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 14:28:33 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.18.1/8.16.1) with ESMTPS id 582CSUuB018402
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 2 Sep 2025 14:28:31 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 582CSUr8017102;
 Tue, 2 Sep 2025 14:28:30 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 5ADE0107F7; Tue,  2 Sep 2025 14:28:29 +0200 (CEST)
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
X-Inumbo-ID: 56d63e8a-87f8-11f0-8adc-4578a1afcccb
Date: Tue, 2 Sep 2025 14:28:29 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: issue with dom0_pvh on Xen 4.20
Message-ID: <aLbi7QhGy4QEH8E9@mail.soc.lip6.fr>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Tue, 02 Sep 2025 14:28:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.4.1 on 132.227.60.2

On Tue, Sep 02, 2025 at 02:22:29PM +0200, Juergen Gross wrote:
> On 02.09.25 12:56, Manuel Bouyer wrote:
> > On Tue, Sep 02, 2025 at 11:44:36AM +0100, Andrew Cooper wrote:
> > > On 02/09/2025 11:17 am, Manuel Bouyer wrote:
> > > > Hello,
> > > > I'm trying to boot a NetBSD PVH dom0 on Xen 4.20.
> > > > The same NetBSD kernel works fine with Xen 4.18
> > > > 
> > > > The boot options are:
> > > > menu=Boot netbsd-current PVH Xen420:dev hd0f:;load /netbsd-PVH console=com0 root=wd0f; multiboot /xen420-debug.gz dom0_mem=1024M console=com1 com1=38400,8n1 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 sync_console=1 dom0=pvh
> > > > 
> > > > and the full log from serial console is attached.
> > > > 
> > > > With 4.20 the boot fails with:
> > > > 
> > > > (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> > > > (XEN) Freed 664kB init memory
> > > > (XEN) d0v0 Triple fault - invoking HVM shutdown action 1
> > > > (XEN) *** Dumping Dom0 vcpu#0 state: ***
> > > > (XEN) ----[ Xen-4.20.2-pre_20250821nb0  x86_64  debug=y  Tainted:   C    ]----
> > > > (XEN) CPU:    7
> > > > (XEN) RIP:    0008:[<000000000020e268>]
> > > > (XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d0v0)
> > > > (XEN) rax: 000000002024c003   rbx: 000000000020e260   rcx: 00000000000dfeb7
> > > > (XEN) rdx: 0000000000100000   rsi: 0000000000103000   rdi: 000000000013e000
> > > > (XEN) rbp: 0000000080000000   rsp: 00000000014002e4   r8:  0000000000000000
> > > > (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
> > > > (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
> > > > (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
> > > > (XEN) cr3: 0000000000000000   cr2: 0000000000000000
> > > > (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> > > > (XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008
> > > > 
> > > > because of the triple fault the RIP above doens't point to the code.
> > > > 
> > > > I tracked it down to this code:
> > > >          cmpl    $0,%ecx                 ;       /* zero-sized? */       \
> > > >          je      2f                      ; \
> > > >          pushl   %ebp                    ; \
> > > >          movl    RELOC(nox_flag),%ebp    ; \
> > > > 1:      movl    %ebp,(PDE_SIZE-4)(%ebx) ;       /* upper 32 bits: NX */ \
> > > >          movl    %eax,(%ebx)             ;       /* store phys addr */   \
> > > >          addl    $PDE_SIZE,%ebx          ;       /* next PTE/PDE */      \
> > > >          addl    $PAGE_SIZE,%eax         ;       /* next phys page */    \
> > > >          loop    1b                      ; \
> > > >          popl    %ebp                    ; \
> > > > 2:                                      ;
> > > > 
> > > > there are others pushl/popl before so I don't think that's the problem
> > > > (in fact the exact same fragment is called just before with different
> > > > inputs and it doesn't fault). So the culprit it probably the write to (%ebx),
> > > > which would be 0x20e260
> > > > This is in the range:
> > > > (XEN)  [0000000000100000, 0000000040068e77] (usable)
> > > > so I can't see why this would be a problem.
> > > > 
> > > > Any idea, including how to debug this further, welcome
> > > 
> > > Even though triple fault's are aborts, they're generally accurate under
> > > virt, so 0x20e268 is most likely where things die.
> > 
> > but that's the RIP of the last fault, not the first one, right ?
> > 0x20e268 isn't in the text segment of the kernel, my guess is that the
> > first fault triggers an exception, but the exeption handler isn't set up yet
> > so we end up jumping to some random value.
> > 
> 
> What puzzles me is that:
> 
> - %cr2 is 0, so probably the first fault wasn't a page fault

AFAIK it can't be as we're still in real mode

> - RIP is %ebx + 8, so maybe the code was just clobbered by the loop?
> 
> Could it be the code has been moved to this location, or is about to
> be moved away afterwards?

No. RIP shouldn't end up there in any way. the assembly code is quite simple,
it's just a loop and I'm quite confident that we did enter the loop with
sane values

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

