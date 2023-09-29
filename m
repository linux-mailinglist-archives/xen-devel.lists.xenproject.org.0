Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156E07B3A1B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 20:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610666.950144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmIKA-0006qw-1b; Fri, 29 Sep 2023 18:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610666.950144; Fri, 29 Sep 2023 18:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmIK9-0006p2-Ur; Fri, 29 Sep 2023 18:34:49 +0000
Received: by outflank-mailman (input) for mailman id 610666;
 Fri, 29 Sep 2023 18:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmIK9-0006ow-2K
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 18:34:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd53221b-5ef6-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 20:34:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C7600B81FBD;
 Fri, 29 Sep 2023 18:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC24C433C8;
 Fri, 29 Sep 2023 18:34:43 +0000 (UTC)
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
X-Inumbo-ID: dd53221b-5ef6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696012485;
	bh=Flr1Vn5p4ZMDz7FEA1fGrSM45gVLCFWuxRudoWLlXUg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lwHT24RLCYotYantG+hJuWr+k3WVAH/pkyHUg2clNLPPP1n1ZFJk18xQ6ofmjYSqD
	 aC7NWnzkhRR48whunMc6fw2IuCvrhBB00YqLkVP4ywck4hSPGDm1YCGIuvUxlUS3qH
	 mswnECC03balIBkNDwx2eSqnbJIgzdOG465ypScYvBHo2JKuVrnd04nNqnU5Fku625
	 o2gasMpZKmo5gjUjbqV2Jr19QYreeD40eczgzNQ74BRz81WCUoq2Ic1b8zyIboKt/v
	 9CHGYbqnp/Ow2h+d/sonLQpVM5ooaoYnrAaKgSIkNJ9m89hHF7JL8hOZTPWY95VsRP
	 n1T7vHY6RRsrg==
Date: Fri, 29 Sep 2023 11:34:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, jbeulich@suse.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Gianluca Luparini <gianluca.luparini@bugseng.com>
Subject: Re: [XEN PATCH v7 3/4] x86/include: address violations of MISRA
 C:2012 Rule 7.2
In-Reply-To: <c07fbce7-2da7-4d0b-9068-00e27b508d83@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309291134350.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1695913900.git.simone.ballarin@bugseng.com> <6f0ac778edc5de8cf079a657917696ceae919e8b.1695913900.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2309281552130.1996340@ubuntu-linux-20-04-desktop>
 <c07fbce7-2da7-4d0b-9068-00e27b508d83@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Sep 2023, Simone Ballarin wrote:
> On 29/09/23 00:58, Stefano Stabellini wrote:
> > On Thu, 28 Sep 2023, Simone Ballarin wrote:
> > > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> > > headline states:
> > > "A 'u' or 'U' suffix shall be applied to all integer constants
> > > that are represented in an unsigned type".
> > > 
> > > Add the 'U' suffix to integers literals with unsigned type.
> > > Use _AC() for macro costants that are used also in assembly files.
> > > 
> > > For the sake of uniformity, the following changes are made:
> > > - add the 'U' suffix to macros in 'pci.h'
> > > - use _AC() for macros near 'X86_CR0_PG'
> > > 
> > > Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > > ---
> > > Changes in v7:
> > > - switch order of Signed-off-by tags
> > > - change tag from x86/arm to x86/include
> > > Changes in v6:
> > > - new patch obtained by splitting ASM related changes from
> > > "xen/x86: address violations of MISRA C:2012 Rule 7.2 (v5)"
> > > - use UL suffix for X86_CR0_* macros
> > > ---
> > >   xen/arch/x86/include/asm/apicdef.h   |   2 +-
> > >   xen/arch/x86/include/asm/config.h    |   2 +-
> > >   xen/arch/x86/include/asm/hpet.h      |   2 +-
> > >   xen/arch/x86/include/asm/msi.h       |   2 +-
> > >   xen/arch/x86/include/asm/msr-index.h | 182 +++++++++++++--------------
> > >   xen/arch/x86/include/asm/pci.h       |   8 +-
> > >   xen/arch/x86/include/asm/x86-defns.h |  22 ++--
> > >   7 files changed, 110 insertions(+), 110 deletions(-)
> > > 
> > > diff --git a/xen/arch/x86/include/asm/apicdef.h
> > > b/xen/arch/x86/include/asm/apicdef.h
> > > index a261436993..8d1b0087d4 100644
> > > --- a/xen/arch/x86/include/asm/apicdef.h
> > > +++ b/xen/arch/x86/include/asm/apicdef.h
> > > @@ -8,7 +8,7 @@
> > >    * Ingo Molnar <mingo@redhat.com>, 1999, 2000
> > >    */
> > >   -#define		APIC_DEFAULT_PHYS_BASE	0xfee00000
> > > +#define		APIC_DEFAULT_PHYS_BASE	0xfee00000U
> > >      #define		APIC_ID		0x20
> > >   #define			APIC_ID_MASK		(0xFFu<<24)
> > > diff --git a/xen/arch/x86/include/asm/config.h
> > > b/xen/arch/x86/include/asm/config.h
> > > index fbc4bb3416..bbced338be 100644
> > > --- a/xen/arch/x86/include/asm/config.h
> > > +++ b/xen/arch/x86/include/asm/config.h
> > > @@ -257,7 +257,7 @@ extern unsigned char boot_edid_info[128];
> > >   #endif /* CONFIG_PV32 */
> > >     #define MACH2PHYS_COMPAT_VIRT_START    HYPERVISOR_COMPAT_VIRT_START
> > > -#define MACH2PHYS_COMPAT_VIRT_END      0xFFE00000
> > > +#define MACH2PHYS_COMPAT_VIRT_END      0xFFE00000U
> > >   #define MACH2PHYS_COMPAT_NR_ENTRIES(d) \
> > >       ((MACH2PHYS_COMPAT_VIRT_END-MACH2PHYS_COMPAT_VIRT_START(d))>>2)
> > >   diff --git a/xen/arch/x86/include/asm/hpet.h
> > > b/xen/arch/x86/include/asm/hpet.h
> > > index 9919f74730..c5e8e9c8db 100644
> > > --- a/xen/arch/x86/include/asm/hpet.h
> > > +++ b/xen/arch/x86/include/asm/hpet.h
> > > @@ -41,7 +41,7 @@
> > >   #define HPET_TN_ROUTE		0x3e00
> > >   #define HPET_TN_FSB		0x4000
> > >   #define HPET_TN_FSB_CAP		0x8000
> > > -#define HPET_TN_RESERVED	0xffff0081
> > > +#define HPET_TN_RESERVED	0xffff0081U
> > >   #define HPET_TN_INT_ROUTE_CAP	(0xffffffffULL << 32)
> > >     diff --git a/xen/arch/x86/include/asm/msi.h
> > > b/xen/arch/x86/include/asm/msi.h
> > > index a53ade95c9..d89723d009 100644
> > > --- a/xen/arch/x86/include/asm/msi.h
> > > +++ b/xen/arch/x86/include/asm/msi.h
> > > @@ -37,7 +37,7 @@
> > >    */
> > >     #define MSI_ADDR_BASE_HI            0
> > > -#define MSI_ADDR_BASE_LO            0xfee00000
> > > +#define MSI_ADDR_BASE_LO            0xfee00000U
> > >   #define MSI_ADDR_BASE_MASK          (~0xfffff)
> > >   #define MSI_ADDR_HEADER             MSI_ADDR_BASE_LO
> > >   diff --git a/xen/arch/x86/include/asm/msr-index.h
> > > b/xen/arch/x86/include/asm/msr-index.h
> > > index 11ffed543a..718f8f860d 100644
> > > --- a/xen/arch/x86/include/asm/msr-index.h
> > > +++ b/xen/arch/x86/include/asm/msr-index.h
> > > @@ -22,7 +22,7 @@
> > >   #define  APIC_BASE_BSP                      (_AC(1, ULL) <<  8)
> > >   #define  APIC_BASE_EXTD                     (_AC(1, ULL) << 10)
> > >   #define  APIC_BASE_ENABLE                   (_AC(1, ULL) << 11)
> > > -#define  APIC_BASE_ADDR_MASK                0x000ffffffffff000ULL
> > > +#define  APIC_BASE_ADDR_MASK                _AC(0x000ffffffffff000, ULL)
> > 
> > This is not used by assembly code?
> > 
> > 
> > >   #define MSR_TEST_CTRL                       0x00000033
> > >   #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
> > > @@ -30,7 +30,7 @@
> > >     #define MSR_INTEL_CORE_THREAD_COUNT         0x00000035
> > >   #define  MSR_CTC_THREAD_MASK                0x0000ffff
> > > -#define  MSR_CTC_CORE_MASK                  0xffff0000
> > > +#define  MSR_CTC_CORE_MASK                  _AC(0xffff0000, U)
> > 
> > Also this one is not?
> > 
> > 
> > >   #define MSR_SPEC_CTRL                       0x00000048
> > >   #define  SPEC_CTRL_IBRS                     (_AC(1, ULL) <<  0)
> > > @@ -186,7 +186,7 @@
> > >   #define MSR_UARCH_MISC_CTRL                 0x00001b01
> > >   #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
> > >   -#define MSR_EFER                            0xc0000080 /* Extended
> > > Feature Enable Register */
> > > +#define MSR_EFER                            _AC(0xc0000080, U) /*
> > > Extended Feature Enable Register */
> > >   #define  EFER_SCE                           (_AC(1, ULL) <<  0) /*
> > > SYSCALL Enable */
> > >   #define  EFER_LME                           (_AC(1, ULL) <<  8) /* Long
> > > Mode Enable */
> > >   #define  EFER_LMA                           (_AC(1, ULL) << 10) /* Long
> > > Mode Active */
> > > @@ -199,35 +199,35 @@
> > >       (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_FFXSE
> > > | \
> > >        EFER_AIBRSE)
> > >   -#define MSR_STAR                            0xc0000081 /* legacy mode
> > > SYSCALL target */
> > > -#define MSR_LSTAR                           0xc0000082 /* long mode
> > > SYSCALL target */
> > > -#define MSR_CSTAR                           0xc0000083 /* compat mode
> > > SYSCALL target */
> > > -#define MSR_SYSCALL_MASK                    0xc0000084 /* EFLAGS mask for
> > > syscall */
> > > -#define MSR_FS_BASE                         0xc0000100 /* 64bit FS base
> > > */
> > > -#define MSR_GS_BASE                         0xc0000101 /* 64bit GS base
> > > */
> > > -#define MSR_SHADOW_GS_BASE                  0xc0000102 /* SwapGS GS
> > > shadow */
> > > -#define MSR_TSC_AUX                         0xc0000103 /* Auxiliary TSC
> > > */
> > > +#define MSR_STAR                            _AC(0xc0000081, U) /* legacy
> > > mode SYSCALL target */
> > > +#define MSR_LSTAR                           _AC(0xc0000082, U) /* long
> > > mode SYSCALL target */
> > > +#define MSR_CSTAR                           _AC(0xc0000083, U) /* compat
> > > mode SYSCALL target */
> > > +#define MSR_SYSCALL_MASK                    _AC(0xc0000084, U) /* EFLAGS
> > > mask for syscall */
> > > +#define MSR_FS_BASE                         _AC(0xc0000100, U) /* 64bit
> > > FS base */
> > > +#define MSR_GS_BASE                         _AC(0xc0000101, U) /* 64bit
> > > GS base */
> > > +#define MSR_SHADOW_GS_BASE                  _AC(0xc0000102, U) /* SwapGS
> > > GS shadow */
> > > +#define MSR_TSC_AUX                         _AC(0xc0000103, U) /*
> > > Auxiliary TSC */
> > 
> > None of these set seems to be used by assembly code
> > 
> > 
> > > -#define MSR_K8_SYSCFG                       0xc0010010
> > > +#define MSR_K8_SYSCFG                       _AC(0xc0010010, U)
> > 
> > This one also is not?
> > 
> > 
> > >   #define  SYSCFG_MTRR_FIX_DRAM_EN            (_AC(1, ULL) << 18)
> > >   #define  SYSCFG_MTRR_FIX_DRAM_MOD_EN        (_AC(1, ULL) << 19)
> > >   #define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)
> > >   #define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)
> > >   #define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)
> > >   -#define MSR_K8_IORR_BASE0                   0xc0010016
> > > -#define MSR_K8_IORR_MASK0                   0xc0010017
> > > -#define MSR_K8_IORR_BASE1                   0xc0010018
> > > -#define MSR_K8_IORR_MASK1                   0xc0010019
> > > +#define MSR_K8_IORR_BASE0                   _AC(0xc0010016, U)
> > > +#define MSR_K8_IORR_MASK0                   _AC(0xc0010017, U)
> > > +#define MSR_K8_IORR_BASE1                   _AC(0xc0010018, U)
> > > +#define MSR_K8_IORR_MASK1                   _AC(0xc0010019, U)
> > 
> > These ones are not?
> > 
> > 
> > > -#define MSR_K8_TSEG_BASE                    0xc0010112 /* AMD doc:
> > > SMMAddr */
> > > -#define MSR_K8_TSEG_MASK                    0xc0010113 /* AMD doc:
> > > SMMMask */
> > > +#define MSR_K8_TSEG_BASE                    _AC(0xc0010112, U) /* AMD
> > > doc: SMMAddr */
> > > +#define MSR_K8_TSEG_MASK                    _AC(0xc0010113, U) /* AMD
> > > doc: SMMMask */
> > 
> > These ones are not?
> > 
> > >   -#define MSR_K8_VM_CR                        0xc0010114
> > > +#define MSR_K8_VM_CR                        _AC(0xc0010114, U)
> > 
> > Also this one
> > 
> > 
> > >   #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
> > >   #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
> > >   -#define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout
> > > matches MSR_SPEC_CTRL */
> > > +#define MSR_VIRT_SPEC_CTRL                  _AC(0xc001011f, U) /* Layout
> > > matches MSR_SPEC_CTRL */
> > 
> > And this one.
> > 
> > What am I missing? Did you also add _AC to all the places where the
> > constants end up being used in asm inline? Because I don't think that
> > asm inline needs the _AC...
> 
> Initially I've used _AC only when strictly required, then I've received
> the following comment
> (https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02207.html):
> 
> 	I understand you use _AC() here because the constant is used in
> 	assembly code. But I don't understand why you use it only here,
> 	and not throughout at least the "modern" portion of the file. I
> 	wonder what other x86 maintainers think about this.

Ah OK...

 
> >   While "UL" here instead of "U"? They are all 32-bit values.
> 
> Initially U was used, then I've received the following indication
> (https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02308.html):
> 
> 	CR0 being a 64-bit register, I consider this risky. Imo either
> 	UL needs to be used as suffix, or the change needs limiting to
> 	just PG (and even then perhaps better using UL).


In that case, I'll leave it to you and from my perspective:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

