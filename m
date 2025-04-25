Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67801A9CD3A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 17:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968314.1357959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8L4p-0001vm-9u; Fri, 25 Apr 2025 15:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968314.1357959; Fri, 25 Apr 2025 15:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8L4p-0001tB-7B; Fri, 25 Apr 2025 15:34:55 +0000
Received: by outflank-mailman (input) for mailman id 968314;
 Fri, 25 Apr 2025 15:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tq29=XL=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u8L4o-0001t5-H6
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 15:34:54 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3a13ce6-21ea-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 17:34:51 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53PFYLdk2886041
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 25 Apr 2025 08:34:21 -0700
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
X-Inumbo-ID: d3a13ce6-21ea-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53PFYLdk2886041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745595262;
	bh=xquCoLx0EClrpIqU/qUlrzBrIsfVOPaUZzqU87EdpwY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=BX3HMffLlNpx/LYQ7xFc9hoV2yFjQgyVgU4Noc2vtwkFaWwsn7fUYGugqvcZ9bHzx
	 6JrqG0yqkpPa2/nGO/p0gzmTYp2DMvqlF2+DN2KPi78Ob4Ge2jny19g3XBqcDBg8x+
	 JRAEK79RjjO1vhN8MmSKecEqNmCBjQuB/eP+qj+kB8GrQf3ktqiTMdv2luGopNW8Fn
	 G8zUGVJLHPtXDB01+RsfR3V+FPUNQxN9O4XfIMMGQnS0GZGYqjvNI1y7bJ413qPeUU
	 D37G3DK9ILdKnTWBaO5Ns84SGR2e0lJFa8r5sSdRagIq8K2K54l21slo9cOnz6AaKt
	 FB4e7KOILHaKw==
Date: Fri, 25 Apr 2025 08:34:19 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
CC: Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <20250425141740.734030-1-arnd@kernel.org>
References: <20250425141740.734030-1-arnd@kernel.org>
Message-ID: <7CEE8E85-D7B1-4066-AD4D-747CA4340F65@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 25, 2025 7:15:15 AM PDT, Arnd Bergmann <arnd@kernel=2Eorg> wrote:
>From: Arnd Bergmann <arnd@arndb=2Ede>
>
>With cx8 and tsc being mandatory features, the only important
>architectural features are now cmov and pae=2E
>
>Change the large list of target CPUs to no longer pick the instruction se=
t
>itself but only the mtune=3D optimization level and in-kernel optimizatio=
ns
>that remain compatible with all cores=2E
>
>The CONFIG_X86_CMOV instead becomes user-selectable and is now how
>Kconfig picks between 586-class (Pentium, Pentium MMX, K6, C3, GeodeGX)
>and 686-class (everything else) targets=2E
>
>In order to allow running on late 32-bit cores (Athlon, Pentium-M,
>Pentium 4, =2E=2E=2E), the X86_L1_CACHE_SHIFT can no longer be set to any=
thing
>lower than 6 (i=2Ee=2E 64 byte cache lines)=2E
>
>The optimization options now depend on X86_CMOV and X86_PAE instead
>of the other way round, while other compile-time conditionals that
>checked for MATOM/MGEODEGX1 instead now check for CPU_SUP_* options
>that enable support for a particular CPU family=2E
>
>Link: https://lore=2Ekernel=2Eorg/lkml/dd29df0c-0b4f-44e6-b71b-2a358ea76f=
b4@app=2Efastmail=2Ecom/
>Signed-off-by: Arnd Bergmann <arnd@arndb=2Ede>
>---
>This is what I had in mind as mentioned in the earlier thread on
>cx8/tsc removal=2E I based this on top of the Ingo's [RFC 15/15]
>patch=2E
>---
> arch/x86/Kconfig                |   2 +-
> arch/x86/Kconfig=2Ecpu            | 100 ++++++++++++++------------------
> arch/x86/Makefile_32=2Ecpu        |  48 +++++++--------
> arch/x86/include/asm/vermagic=2Eh |  36 +-----------
> arch/x86/kernel/tsc=2Ec           |   2 +-
> arch/x86/xen/Kconfig            |   1 -
> drivers/misc/mei/Kconfig        |   2 +-
> 7 files changed, 74 insertions(+), 117 deletions(-)
>
>diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>index a9d717558972=2E=2E1e33f88c9b97 100644
>--- a/arch/x86/Kconfig
>+++ b/arch/x86/Kconfig
>@@ -1438,7 +1438,7 @@ config HIGHMEM
>=20
> config X86_PAE
> 	bool "PAE (Physical Address Extension) Support"
>-	depends on X86_32 && X86_HAVE_PAE
>+	depends on X86_32 && X86_CMOV
> 	select PHYS_ADDR_T_64BIT
> 	help
> 	  PAE is required for NX support, and furthermore enables
>diff --git a/arch/x86/Kconfig=2Ecpu b/arch/x86/Kconfig=2Ecpu
>index 6f1e8cc8fe58=2E=2E0619566de93f 100644
>--- a/arch/x86/Kconfig=2Ecpu
>+++ b/arch/x86/Kconfig=2Ecpu
>@@ -1,23 +1,32 @@
> # SPDX-License-Identifier: GPL-2=2E0
> # Put here option for CPU selection and depending optimization
>-choice
>-	prompt "x86-32 Processor family"
>-	depends on X86_32
>-	default M686
>+
>+config X86_CMOV
>+	bool "Require 686-class CMOV instructions" if X86_32
>+	default y
> 	help
>-	  This is the processor type of your CPU=2E This information is
>-	  used for optimizing purposes=2E In order to compile a kernel
>-	  that can run on all supported x86 CPU types (albeit not
>-	  optimally fast), you can specify "586" here=2E
>+	  Most x86-32 processor implementations are compatible with
>+	  the the CMOV instruction originally added in the Pentium Pro,
>+	  and they perform much better when using it=2E
>+
>+	  Disable this option to build for 586-class CPUs without this
>+	  instruction=2E This is only required for the original Intel
>+	  Pentium (P5, P54, P55), AMD K6/K6-II/K6-3D, Geode GX1 and Via
>+	  CyrixIII/C3 CPUs=2E
>=20
> 	  Note that the 386 and 486 is no longer supported, this includes
> 	  AMD/Cyrix/Intel 386DX/DXL/SL/SLC/SX, Cyrix/TI 486DLC/DLC2,
> 	  UMC 486SX-S and the NexGen Nx586, AMD ELAN and all 486 based
> 	  CPUs=2E
>=20
>-	  The kernel will not necessarily run on earlier architectures than
>-	  the one you have chosen, e=2Eg=2E a Pentium optimized kernel will run=
 on
>-	  a PPro, but not necessarily on a i486=2E
>+choice
>+	prompt "x86-32 Processor optimization"
>+	depends on X86_32
>+	default X86_GENERIC
>+	help
>+	  This is the processor type of your CPU=2E This information is
>+	  used for optimizing purposes, but does not change compatibility
>+	  with other CPU types=2E
>=20
> 	  Here are the settings recommended for greatest speed:
> 	  - "586" for generic Pentium CPUs lacking the TSC
>@@ -45,14 +54,13 @@ choice
>=20
> config M586TSC
> 	bool "Pentium-Classic"
>-	depends on X86_32
>+	depends on X86_32 && !X86_CMOV
> 	help
>-	  Select this for a Pentium Classic processor with the RDTSC (Read
>-	  Time Stamp Counter) instruction for benchmarking=2E
>+	  Select this for a Pentium Classic processor=2E
>=20
> config M586MMX
> 	bool "Pentium-MMX"
>-	depends on X86_32
>+	depends on X86_32 && !X86_CMOV
> 	help
> 	  Select this for a Pentium with the MMX graphics/multimedia
> 	  extended instructions=2E
>@@ -117,7 +125,7 @@ config MPENTIUM4
>=20
> config MK6
> 	bool "K6/K6-II/K6-III"
>-	depends on X86_32
>+	depends on X86_32 && !X86_CMOV
> 	help
> 	  Select this for an AMD K6-family processor=2E  Enables use of
> 	  some extended instructions, and passes appropriate optimization
>@@ -125,7 +133,7 @@ config MK6
>=20
> config MK7
> 	bool "Athlon/Duron/K7"
>-	depends on X86_32
>+	depends on X86_32 && !X86_PAE
> 	help
> 	  Select this for an AMD Athlon K7-family processor=2E  Enables use of
> 	  some extended instructions, and passes appropriate optimization
>@@ -147,42 +155,37 @@ config MEFFICEON
>=20
> config MGEODEGX1
> 	bool "GeodeGX1"
>-	depends on X86_32
>+	depends on X86_32 && !X86_CMOV
> 	help
> 	  Select this for a Geode GX1 (Cyrix MediaGX) chip=2E
>=20
> config MGEODE_LX
> 	bool "Geode GX/LX"
>-	depends on X86_32
>+	depends on X86_32 && !X86_PAE
> 	help
> 	  Select this for AMD Geode GX and LX processors=2E
>=20
> config MCYRIXIII
> 	bool "CyrixIII/VIA-C3"
>-	depends on X86_32
>+	depends on X86_32 && !X86_CMOV
> 	help
> 	  Select this for a Cyrix III or C3 chip=2E  Presently Linux and GCC
> 	  treat this chip as a generic 586=2E Whilst the CPU is 686 class,
> 	  it lacks the cmov extension which gcc assumes is present when
> 	  generating 686 code=2E
>-	  Note that Nehemiah (Model 9) and above will not boot with this
>-	  kernel due to them lacking the 3DNow! instructions used in earlier
>-	  incarnations of the CPU=2E
>=20
> config MVIAC3_2
> 	bool "VIA C3-2 (Nehemiah)"
>-	depends on X86_32
>+	depends on X86_32 && !X86_PAE
> 	help
> 	  Select this for a VIA C3 "Nehemiah"=2E Selecting this enables usage
> 	  of SSE and tells gcc to treat the CPU as a 686=2E
>-	  Note, this kernel will not boot on older (pre model 9) C3s=2E
>=20
> config MVIAC7
> 	bool "VIA C7"
>-	depends on X86_32
>+	depends on X86_32 && !X86_PAE
> 	help
>-	  Select this for a VIA C7=2E  Selecting this uses the correct cache
>-	  shift and tells gcc to treat the CPU as a 686=2E
>+	  Select this for a VIA C7=2E
>=20
> config MATOM
> 	bool "Intel Atom"
>@@ -192,20 +195,19 @@ config MATOM
> 	  accordingly optimized code=2E Use a recent GCC with specific Atom
> 	  support in order to fully benefit from selecting this option=2E
>=20
>-endchoice
>-
> config X86_GENERIC
>-	bool "Generic x86 support"
>-	depends on X86_32
>+	bool "Generic x86"
> 	help
>-	  Instead of just including optimizations for the selected
>+	  Instead of just including optimizations for a particular
> 	  x86 variant (e=2Eg=2E PII, Crusoe or Athlon), include some more
> 	  generic optimizations as well=2E This will make the kernel
>-	  perform better on x86 CPUs other than that selected=2E
>+	  perform better on a variety of CPUs=2E
>=20
> 	  This is really intended for distributors who need more
> 	  generic optimizations=2E
>=20
>+endchoice
>+
> #
> # Define implied options from the CPU selection here
> config X86_INTERNODE_CACHE_SHIFT
>@@ -216,17 +218,14 @@ config X86_INTERNODE_CACHE_SHIFT
> config X86_L1_CACHE_SHIFT
> 	int
> 	default "7" if MPENTIUM4
>-	default "6" if MK7 || MPENTIUMM || MATOM || MVIAC7 || X86_GENERIC || X8=
6_64
>-	default "4" if MGEODEGX1
>-	default "5" if MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII =
|| MPENTIUMII || M686 || M586MMX || M586TSC || MVIAC3_2 || MGEODE_LX
>+	default "6"
>=20
> config X86_F00F_BUG
>-	def_bool y
>-	depends on M586MMX || M586TSC || M586
>+	def_bool !X86_CMOV
>=20
> config X86_ALIGNMENT_16
> 	def_bool y
>-	depends on MCYRIXIII || MK6 || M586MMX || M586TSC || M586 || MVIAC3_2 |=
| MGEODEGX1
>+	depends on MCYRIXIII || MK6 || M586MMX || M586TSC || M586 || MVIAC3_2 |=
| MGEODEGX1 || (!X86_CMOV && X86_GENERIC)
>=20
> config X86_INTEL_USERCOPY
> 	def_bool y
>@@ -234,34 +233,23 @@ config X86_INTEL_USERCOPY
>=20
> config X86_USE_PPRO_CHECKSUM
> 	def_bool y
>-	depends on MCYRIXIII || MK7 || MK6 || MPENTIUM4 || MPENTIUMM || MPENTIU=
MIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MGEODE_LX =
|| MATOM
>+	depends on MCYRIXIII || MK7 || MK6 || MPENTIUM4 || MPENTIUMM || MPENTIU=
MIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MGEODE_LX =
|| MATOM || (X86_CMOV && X86_GENERIC)
>=20
> config X86_TSC
> 	def_bool y
>=20
>-config X86_HAVE_PAE
>-	def_bool y
>-	depends on MCRUSOE || MEFFICEON || MCYRIXIII || MPENTIUM4 || MPENTIUMM =
|| MPENTIUMIII || MPENTIUMII || M686 || MVIAC7 || MATOM || X86_64
>-
> config X86_CX8
> 	def_bool y
>=20
>-# this should be set for all -march=3D=2E=2E options where the compiler
>-# generates cmov=2E
>-config X86_CMOV
>-	def_bool y
>-	depends on (MK7 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII =
|| M686 || MVIAC3_2 || MVIAC7 || MCRUSOE || MEFFICEON || MATOM || MGEODE_LX=
 || X86_64)
>-
> config X86_MINIMUM_CPU_FAMILY
> 	int
> 	default "64" if X86_64
>-	default "6" if X86_32 && (MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPEN=
TIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MATOM || MK7)
>-	default "5" if X86_32
>-	default "4"
>+	default "6" if X86_32 && X86_CMOV
>+	default "5"
>=20
> config X86_DEBUGCTLMSR
> 	def_bool y
>-	depends on !(MK6 || MCYRIXIII || M586MMX || M586TSC || M586) && !UML
>+	depends on X86_CMOV && !UML
>=20
> config IA32_FEAT_CTL
> 	def_bool y
>@@ -297,7 +285,7 @@ config CPU_SUP_INTEL
> config CPU_SUP_CYRIX_32
> 	default y
> 	bool "Support Cyrix processors" if PROCESSOR_SELECT
>-	depends on M586 || M586TSC || M586MMX || (EXPERT && !64BIT)
>+	depends on !64BIT
> 	help
> 	  This enables detection, tunings and quirks for Cyrix processors
>=20
>diff --git a/arch/x86/Makefile_32=2Ecpu b/arch/x86/Makefile_32=2Ecpu
>index f5e933077bf4=2E=2Eebd7ec6eaf34 100644
>--- a/arch/x86/Makefile_32=2Ecpu
>+++ b/arch/x86/Makefile_32=2Ecpu
>@@ -10,30 +10,32 @@ else
> align		:=3D -falign-functions=3D0 -falign-jumps=3D0 -falign-loops=3D0
> endif
>=20
>-cflags-$(CONFIG_M586TSC)	+=3D -march=3Di586
>-cflags-$(CONFIG_M586MMX)	+=3D -march=3Dpentium-mmx
>-cflags-$(CONFIG_M686)		+=3D -march=3Di686
>-cflags-$(CONFIG_MPENTIUMII)	+=3D -march=3Di686 $(call tune,pentium2)
>-cflags-$(CONFIG_MPENTIUMIII)	+=3D -march=3Di686 $(call tune,pentium3)
>-cflags-$(CONFIG_MPENTIUMM)	+=3D -march=3Di686 $(call tune,pentium3)
>-cflags-$(CONFIG_MPENTIUM4)	+=3D -march=3Di686 $(call tune,pentium4)
>-cflags-$(CONFIG_MK6)		+=3D -march=3Dk6
>-# Please note, that patches that add -march=3Dathlon-xp and friends are =
pointless=2E
>-# They make zero difference whatsosever to performance at this time=2E
>-cflags-$(CONFIG_MK7)		+=3D -march=3Dathlon
>-cflags-$(CONFIG_MCRUSOE)	+=3D -march=3Di686 $(align)
>-cflags-$(CONFIG_MEFFICEON)	+=3D -march=3Di686 $(call tune,pentium3) $(al=
ign)
>-cflags-$(CONFIG_MCYRIXIII)	+=3D $(call cc-option,-march=3Dc3,-march=3Di4=
86) $(align)
>-cflags-$(CONFIG_MVIAC3_2)	+=3D $(call cc-option,-march=3Dc3-2,-march=3Di=
686)
>-cflags-$(CONFIG_MVIAC7)		+=3D -march=3Di686
>-cflags-$(CONFIG_MATOM)		+=3D -march=3Datom
>+ifdef CONFIG_X86_CMOV
>+cflags-y			+=3D -march=3Di686
>+else
>+cflags-y			+=3D -march=3Di586
>+endif
>=20
>-# Geode GX1 support
>-cflags-$(CONFIG_MGEODEGX1)	+=3D -march=3Dpentium-mmx
>-cflags-$(CONFIG_MGEODE_LX)	+=3D $(call cc-option,-march=3Dgeode,-march=
=3Dpentium-mmx)
>-# add at the end to overwrite eventual tuning options from earlier
>-# cpu entries
>-cflags-$(CONFIG_X86_GENERIC) 	+=3D $(call tune,generic,$(call tune,i686)=
)
>+cflags-$(CONFIG_M586TSC)	+=3D -mtune=3Di586
>+cflags-$(CONFIG_M586MMX)	+=3D -mtune=3Dpentium-mmx
>+cflags-$(CONFIG_M686)		+=3D -mtune=3Di686
>+cflags-$(CONFIG_MPENTIUMII)	+=3D -mtune=3Dpentium2
>+cflags-$(CONFIG_MPENTIUMIII)	+=3D -mtune=3Dpentium3
>+cflags-$(CONFIG_MPENTIUMM)	+=3D -mtune=3Dpentium3
>+cflags-$(CONFIG_MPENTIUM4)	+=3D -mtune=3Dpentium4
>+cflags-$(CONFIG_MK6)		+=3D -mtune=3Dk6
>+# Please note, that patches that add -mtune=3Dathlon-xp and friends are =
pointless=2E
>+# They make zero difference whatsosever to performance at this time=2E
>+cflags-$(CONFIG_MK7)		+=3D -mtune=3Dathlon
>+cflags-$(CONFIG_MCRUSOE)	+=3D -mtune=3Di686 $(align)
>+cflags-$(CONFIG_MEFFICEON)	+=3D -mtune=3Dpentium3 $(align)
>+cflags-$(CONFIG_MCYRIXIII)	+=3D -mtune=3Dc3 $(align)
>+cflags-$(CONFIG_MVIAC3_2)	+=3D -mtune=3Dc3-2
>+cflags-$(CONFIG_MVIAC7)		+=3D -mtune=3Di686
>+cflags-$(CONFIG_MATOM)		+=3D -mtune=3Datom
>+cflags-$(CONFIG_MGEODEGX1)	+=3D -mtune=3Dpentium-mmx
>+cflags-$(CONFIG_MGEODE_LX)	+=3D -mtune=3Dgeode
>+cflags-$(CONFIG_X86_GENERIC) 	+=3D -mtune=3Dgeneric
>=20
> # Bug fix for binutils: this option is required in order to keep
> # binutils from generating NOPL instructions against our will=2E
>diff --git a/arch/x86/include/asm/vermagic=2Eh b/arch/x86/include/asm/ver=
magic=2Eh
>index e26061df0c9b=2E=2E6554dbdfd719 100644
>--- a/arch/x86/include/asm/vermagic=2Eh
>+++ b/arch/x86/include/asm/vermagic=2Eh
>@@ -5,42 +5,10 @@
>=20
> #ifdef CONFIG_X86_64
> /* X86_64 does not define MODULE_PROC_FAMILY */
>-#elif defined CONFIG_M586TSC
>-#define MODULE_PROC_FAMILY "586TSC "
>-#elif defined CONFIG_M586MMX
>-#define MODULE_PROC_FAMILY "586MMX "
>-#elif defined CONFIG_MATOM
>-#define MODULE_PROC_FAMILY "ATOM "
>-#elif defined CONFIG_M686
>+#elif defined CONFIG_X86_CMOV
> #define MODULE_PROC_FAMILY "686 "
>-#elif defined CONFIG_MPENTIUMII
>-#define MODULE_PROC_FAMILY "PENTIUMII "
>-#elif defined CONFIG_MPENTIUMIII
>-#define MODULE_PROC_FAMILY "PENTIUMIII "
>-#elif defined CONFIG_MPENTIUMM
>-#define MODULE_PROC_FAMILY "PENTIUMM "
>-#elif defined CONFIG_MPENTIUM4
>-#define MODULE_PROC_FAMILY "PENTIUM4 "
>-#elif defined CONFIG_MK6
>-#define MODULE_PROC_FAMILY "K6 "
>-#elif defined CONFIG_MK7
>-#define MODULE_PROC_FAMILY "K7 "
>-#elif defined CONFIG_MCRUSOE
>-#define MODULE_PROC_FAMILY "CRUSOE "
>-#elif defined CONFIG_MEFFICEON
>-#define MODULE_PROC_FAMILY "EFFICEON "
>-#elif defined CONFIG_MCYRIXIII
>-#define MODULE_PROC_FAMILY "CYRIXIII "
>-#elif defined CONFIG_MVIAC3_2
>-#define MODULE_PROC_FAMILY "VIAC3-2 "
>-#elif defined CONFIG_MVIAC7
>-#define MODULE_PROC_FAMILY "VIAC7 "
>-#elif defined CONFIG_MGEODEGX1
>-#define MODULE_PROC_FAMILY "GEODEGX1 "
>-#elif defined CONFIG_MGEODE_LX
>-#define MODULE_PROC_FAMILY "GEODE "
> #else
>-#error unknown processor family
>+#define MODULE_PROC_FAMILY "586 "
> #endif
>=20
> #ifdef CONFIG_X86_32
>diff --git a/arch/x86/kernel/tsc=2Ec b/arch/x86/kernel/tsc=2Ec
>index 489c779ef3ef=2E=2E76b15ef8c85f 100644
>--- a/arch/x86/kernel/tsc=2Ec
>+++ b/arch/x86/kernel/tsc=2Ec
>@@ -1221,7 +1221,7 @@ bool tsc_clocksource_watchdog_disabled(void)
>=20
> static void __init check_system_tsc_reliable(void)
> {
>-#if defined(CONFIG_MGEODEGX1) || defined(CONFIG_MGEODE_LX) || defined(CO=
NFIG_X86_GENERIC)
>+#if defined(CONFIG_CPU_SUP_CYRIX)
> 	if (is_geode_lx()) {
> 		/* RTSC counts during suspend */
> #define RTSC_SUSP 0x100
>diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
>index 222b6fdad313=2E=2E2648459b8e8f 100644
>--- a/arch/x86/xen/Kconfig
>+++ b/arch/x86/xen/Kconfig
>@@ -9,7 +9,6 @@ config XEN
> 	select PARAVIRT_CLOCK
> 	select X86_HV_CALLBACK_VECTOR
> 	depends on X86_64 || (X86_32 && X86_PAE)
>-	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MATOM)
> 	depends on X86_LOCAL_APIC
> 	help
> 	  This is the Linux Xen port=2E  Enabling this will allow the
>diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
>index 7575fee96cc6=2E=2E4deb17ed0a62 100644
>--- a/drivers/misc/mei/Kconfig
>+++ b/drivers/misc/mei/Kconfig
>@@ -3,7 +3,7 @@
> config INTEL_MEI
> 	tristate "Intel Management Engine Interface"
> 	depends on X86 && PCI
>-	default X86_64 || MATOM
>+	default X86_64 || CPU_SUP_INTEL
> 	help
> 	  The Intel Management Engine (Intel ME) provides Manageability,
> 	  Security and Media services for system containing Intel chipsets=2E

I really don't like testing an unrelated feature (CMOV for PAE); furthermo=
re, at least some old hypervisors were known to have broken PAE=2E

At the very least it needs to be abstracted for clarity reasons=2E=20

Nacked-by: H=2E Peter Anvin <hpa@zytor=2Ecom>

