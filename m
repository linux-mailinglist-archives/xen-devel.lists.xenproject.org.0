Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AFB7AB502
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 17:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606938.945039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjiJN-0000o6-Nm; Fri, 22 Sep 2023 15:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606938.945039; Fri, 22 Sep 2023 15:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjiJN-0000m8-Kv; Fri, 22 Sep 2023 15:43:21 +0000
Received: by outflank-mailman (input) for mailman id 606938;
 Fri, 22 Sep 2023 15:43:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T0Hu=FG=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qjiJL-0000m2-KQ
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 15:43:19 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf297e41-595e-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 17:43:17 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 38MFgtdE077407
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 22 Sep 2023 11:43:01 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 38MFgtxI077406;
 Fri, 22 Sep 2023 08:42:55 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: bf297e41-595e-11ee-9b0d-b553b5be7939
Date: Fri, 22 Sep 2023 08:42:55 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH WIP] xen/public: move incomplete type definitions to xen.h
Message-ID: <ZQ21//HP/d2Ppdrh@mattapan.m5p.com>
References: <7a880e33ff91d0c76986159e3559c56ee6894d21.1695324653.git.ehem+xen@m5p.com>
 <7aaf91c7-6330-fffc-8df6-4be4b531f456@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aaf91c7-6330-fffc-8df6-4be4b531f456@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Fri, Sep 22, 2023 at 10:21:21AM +0200, Jan Beulich wrote:
> On 21.09.2023 18:18, Elliott Mitchell wrote:
> > Hypercall wrappers need the incomplete type definitions.  Only when the
> > actual structure needed.
> 
> While in the first sentence "only" looks to be missing, I can't really
> make sense of the second (without implying what I think you mean).

I'm not an editor, thinkos in commit messages happen.  Likely should have
removed that sentence.

> >  As such these incomplete definitions should be
> > in xen.h next to their hypercalls, rather than spread all over.
> 
> Perhaps s/incomplete definitions/forward declarations/.
> 
> There's a downside to the movement, though: You now introduce items
> into the namespace which may be entirely unused. The two contradicting
> goals need weighing as to their usefulness.

For the case which this is part of, they're not 100% unused.

> > trap_info_t is particularly notable since even though the hypercall is
> > x86-only, the wrapper is likely to be visible to generic source code.
> 
> Why would it be?

Related to converting ARM to using inline assembly-language wrappers
instead of the current declarations+small assembly wrapper function.

The first step is you split the Linux header
arch/x86/include/asm/xen/hypercall.h.  The upper portion (the x86
inline assembly language) remains in arch/x86/include, all the
HYPERVISOR_*() wrappers go into include/xen/$somewhere.  Several months
ago I sent a candidate header to implement _hypercall#() for ARM.

Problem is:
static inline int
HYPERVISOR_set_trap_table(struct trap_info *table)
{
        return _hypercall1(int, set_trap_table, table);
}
Without without `struct trap_info;` somewhere, this fails.

Now, this isn't used on ARM, but this is tricky to guess.  Someone
setting this up won't know whether any given function is absent due to
being legacy and unlikely to ever be on non-x86.  Versus simply not /yet/
being available on non-x86 (vPCI).

Perhaps xen/include/public/xen.h should only conditionally #define some
of the __HYPERVISOR_* constants.  Likely there should be a way to force
all the hypercall numbers to be available (for linting).  Yet as the
current Linux header hints, perhaps there should be a way to disable the
PV constants even on x86.


> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > ---
> > trap_info_t and HYPERVISOR_set_trap_table() is something I ran into.
> > With the incomplete definition, the wrapper is accaptable to an ARM
> > compiler.  Without the incomplete definition, it fails.
> > 
> > Note, this has been shown to build in my environment.  I'm unsure
> > whether the incomplete structure plus type definition is acceptable to
> > all supportted compilers.
> 
> It's permitted by the standard, so ought to be acceptable to all C89
> compilers (which is what we use as baseline for the public headers).

FreeBSD recently changed $something which now makes this work.  Since I
had (less than 2 years ago) been noticing this.  This could be deemed
unnecessary at this point, I'm simply noting it.

> > --- a/xen/include/public/xen.h
> > +++ b/xen/include/public/xen.h
> > @@ -75,13 +75,25 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
> >   */
> >  
> >  #define __HYPERVISOR_set_trap_table        0
> > +#ifndef __ASSEMBLY__
> > +typedef struct trap_info trap_info_t;
> > +DEFINE_XEN_GUEST_HANDLE(trap_info_t);
> > +#endif
> >  #define __HYPERVISOR_mmu_update            1
> > +#ifndef __ASSEMBLY__
> > +typedef struct mmu_update mmu_update_t;
> > +DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
> > +#endif
> >  #define __HYPERVISOR_set_gdt               2
> >  #define __HYPERVISOR_stack_switch          3
> >  #define __HYPERVISOR_set_callbacks         4
> >  #define __HYPERVISOR_fpu_taskswitch        5
> >  #define __HYPERVISOR_sched_op_compat       6 /* compat since 0x00030101 */
> >  #define __HYPERVISOR_platform_op           7
> > +#ifndef __ASSEMBLY__
> > +typedef struct xen_platform_op xen_platform_op_t;
> > +DEFINE_XEN_GUEST_HANDLE(xen_platform_op_t);
> > +#endif
> >  #define __HYPERVISOR_set_debugreg          8
> >  #define __HYPERVISOR_get_debugreg          9
> >  #define __HYPERVISOR_update_descriptor    10
> > @@ -100,9 +112,17 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
> >  #define __HYPERVISOR_vcpu_op              24
> >  #define __HYPERVISOR_set_segment_base     25 /* x86/64 only */
> >  #define __HYPERVISOR_mmuext_op            26
> > +#ifndef __ASSEMBLY__
> > +typedef struct mmuext_op mmuext_op_t;
> > +DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
> > +#endif
> >  #define __HYPERVISOR_xsm_op               27
> >  #define __HYPERVISOR_nmi_op               28
> >  #define __HYPERVISOR_sched_op             29
> > +#ifndef __ASSEMBLY__
> > +typedef struct sched_shutdown sched_shutdown_t;
> > +DEFINE_XEN_GUEST_HANDLE(sched_shutdown_t);
> > +#endif
> >  #define __HYPERVISOR_callback_op          30
> >  #define __HYPERVISOR_xenoprof_op          31
> >  #define __HYPERVISOR_event_channel_op     32
> 
> Interspersing the #define-s with typedef-s and
> DEFINE_XEN_GUEST_HANDLE()s clutters this section imo. If movement to
> a central place was wanted, then perhaps below all of the #define-s,
> then allowing to get away with just a single "#ifndef __ASSEMBLY__".

I like associating the hypercalls and their special structure type.
Perhaps roughly:
#ifdef __ASSEMBLY__
#define DEFINE_XEN_GUEST_HANDLE(arg)
#define XEN_TYPEDEF(type)
#else
#define XEN_TYPEDEF(type) typedef struct type type#_t;
#endif

(this hasn't been tested)

> > @@ -449,8 +469,6 @@ struct mmuext_op {
> >          xen_pfn_t src_mfn;
> >      } arg2;
> >  };
> > -typedef struct mmuext_op mmuext_op_t;
> > -DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
> >  #endif
> >  
> >  /*
> > @@ -615,8 +633,6 @@ struct mmu_update {
> >      uint64_t ptr;       /* Machine address of PTE. */
> >      uint64_t val;       /* New contents of PTE.    */
> >  };
> > -typedef struct mmu_update mmu_update_t;
> > -DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
> 
> Imo a prereq to moving these up is to move the struct-s themselves into
> the x86 header. From all we can tell no present or future port is going
> to use these PV-only interfaces.

With this patch, an experimental build of FreeBSD/arm64 succeeded.  I'm
unsure which flavor of C standard is presently enabled with FreeBSD
kernel builds though (I believe it was bumped 6-12 months ago).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



