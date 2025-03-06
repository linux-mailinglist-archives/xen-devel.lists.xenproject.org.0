Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547F7A544E7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903089.1311009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6dD-000166-Py; Thu, 06 Mar 2025 08:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903089.1311009; Thu, 06 Mar 2025 08:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6dD-00014L-N6; Thu, 06 Mar 2025 08:31:03 +0000
Received: by outflank-mailman (input) for mailman id 903089;
 Thu, 06 Mar 2025 08:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z0IF=VZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tq6dB-000147-Fp
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:31:02 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d160b9-fa65-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:30:59 +0100 (CET)
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
X-Inumbo-ID: 54d160b9-fa65-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741249857; x=1741509057;
	bh=YFyaLrqSiCCFniO/I2nJRPjvCkxdXPJhz62XjF8z71o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=T1aI1AKTXvjyvBh25hu//JbTDvWQJUk7Eouy7hbQMBOhRGRIjlTNPPlC4O/J03XHN
	 DaPEjGAI9/6Sf+Hmksslaxm/TkaZtwdB9x8x2LB7wf2QkBI+J5roBQDDWNC3IKY4Gz
	 XHtjX8P/Q0peSoqXB+zVj5Ox9sg3xqZngkt9xtTqe30hcHqfcttlL1+T2Hv4KH65aZ
	 D1l2Fxray68RD54rxu85yfcI0apQ2poTY78WcH70UGPVIY/uIAH5EcDFgXatTV3vr2
	 nAKTbuaVoB41JfHCcesjA2W5kT3kWst2+8Pag7YUXClPBTbhA/5TQ/TOkAaI6O3gJR
	 WuOm1TKBu52fQ==
Date: Thu, 06 Mar 2025 08:30:56 +0000
To: xen-devel@lists.xenproject.org
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH] x86/hvm: add HVM-specific Kconfig
Message-ID: <l7VrqyY3R3PrPx3l69-NmwHS5NT5kBg2L5I3AnPuKVThmoX5m2mf6tApmmqtbz_9_9JRP6AibnKCQ4eWMue4RcONkseCpAIJwBX3s3n9Fvw=@proton.me>
In-Reply-To: <20250207220302.4190210-1-dmukhin@ford.com>
References: <20250207220302.4190210-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1aec2f7bbbdb3b84a3698e6e7e8f20417ced16cf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, February 7th, 2025 at 2:03 PM, dmkhn@proton.me <dmkhn@proton.me>=
 wrote:

>=20
>=20
> Add separate menu for configuring HVM build-time settings to help organiz=
ing
> HVM-specific options.
>=20
> Signed-off-by: Denis Mukhin dmukhin@ford.com

Can I get a review please?

>=20
>=20
> ---
> Link to the original patch:
> https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-20-c5d36b31=
d66c@ford.com/
> ---
> ---
> xen/arch/x86/Kconfig | 76 +---------------------------------------
> xen/arch/x86/hvm/Kconfig | 73 ++++++++++++++++++++++++++++++++++++++
> 2 files changed, 74 insertions(+), 75 deletions(-)
> create mode 100644 xen/arch/x86/hvm/Kconfig
>=20
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 9cdd04721a..37362c205d 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -30,7 +30,6 @@ config X86
> select HAS_SCHED_GRANULARITY
> select HAS_UBSAN
> select HAS_VMAP
> - select HAS_VPCI if HVM
> select NEEDS_LIBELF
>=20
> config ARCH_DEFCONFIG
> @@ -107,42 +106,7 @@ config PV_LINEAR_PT
>=20
> If unsure, say Y.
>=20
> -config HVM
> - bool "HVM support"
> - depends on !PV_SHIM_EXCLUSIVE
> - default !PV_SHIM
> - select COMPAT
> - select IOREQ_SERVER
> - select MEM_ACCESS_ALWAYS_ON
> - help
> - Interfaces to support HVM domains. HVM domains require hardware
> - virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
> - guests which have no specific Xen knowledge.
> -
> - This option is needed if you want to run HVM or PVH domains.
> -
> - If unsure, say Y.
> -
> -config AMD_SVM
> - bool "AMD-V" if EXPERT
> - depends on HVM
> - default y
> - help
> - Enables virtual machine extensions on platforms that implement the
> - AMD Virtualization Technology (AMD-V).
> - If your system includes a processor with AMD-V support, say Y.
> - If in doubt, say Y.
> -
> -config INTEL_VMX
> - bool "Intel VT-x" if EXPERT
> - depends on HVM
> - default y
> - select ARCH_VCPU_IOREQ_COMPLETION
> - help
> - Enables virtual machine extensions on platforms that implement the
> - Intel Virtualization Technology (Intel VT-x).
> - If your system includes a processor with Intel VT-x support, say Y.
> - If in doubt, say Y.
> +source "arch/x86/hvm/Kconfig"
>=20
> config XEN_SHSTK
> bool "Supervisor Shadow Stacks"
> @@ -201,25 +165,6 @@ config BIGMEM
>=20
> If unsure, say N.
>=20
> -config HVM_FEP
> - bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
> - default DEBUG
> - depends on HVM
> - help
> -
> - Compiles in a feature that allows HVM guest to arbitrarily
> - exercise the instruction emulator.
> -
> - This feature can only be enabled during boot time with
> - appropriate hypervisor command line option. Please read
> - hypervisor command line documentation before trying to use
> - this feature.
> -
> - This is strictly for testing purposes, and not appropriate
> - for use in production.
> -
> - If unsure, say N.
> -
> config TBOOT
> bool "Xen tboot support (UNSUPPORTED)"
> depends on INTEL && UNSUPPORTED
> @@ -348,14 +293,6 @@ config HYPERV_GUEST
>=20
> endif
>=20
> -config MEM_PAGING
> - bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
> - depends on HVM
> -
> -config MEM_SHARING
> - bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
> - depends on HVM
> -
> config REQUIRE_NX
> bool "Require NX (No eXecute) support"
> help
> @@ -372,17 +309,6 @@ config REQUIRE_NX
> was unavailable. However, if enabled, Xen will no longer boot on
> any CPU which is lacking NX support.
>=20
> -config ALTP2M
> - bool "Alternate P2M support" if EXPERT
> - depends on INTEL_VMX
> - default y
> - help
> - Alternate-p2m allows a guest to manage multiple p2m guest physical
> - "memory views" (as opposed to a single p2m).
> - Useful for memory introspection.
> -
> - If unsure, stay with defaults.
> -
> endmenu
>=20
> source "common/Kconfig"
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> new file mode 100644
> index 0000000000..cbfeb5e4f4
> --- /dev/null
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -0,0 +1,73 @@
> +menuconfig HVM
> + bool "HVM support"
> + depends on !PV_SHIM_EXCLUSIVE
> + default !PV_SHIM
> + select COMPAT
> + select HAS_VPCI
> + select IOREQ_SERVER
> + select MEM_ACCESS_ALWAYS_ON
> + help
> + Interfaces to support HVM domains. HVM domains require hardware
> + virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
> + guests which have no specific Xen knowledge.
> +
> + This option is needed if you want to run HVM or PVH domains.
> +
> + If unsure, say Y.
> +
> +if HVM
> +
> +config AMD_SVM
> + bool "AMD-V" if EXPERT
> + default y
> + help
> + Enables virtual machine extensions on platforms that implement the
> + AMD Virtualization Technology (AMD-V).
> + If your system includes a processor with AMD-V support, say Y.
> + If in doubt, say Y.
> +
> +config INTEL_VMX
> + bool "Intel VT-x" if EXPERT
> + default y
> + select ARCH_VCPU_IOREQ_COMPLETION
> + help
> + Enables virtual machine extensions on platforms that implement the
> + Intel Virtualization Technology (Intel VT-x).
> + If your system includes a processor with Intel VT-x support, say Y.
> + If in doubt, say Y.
> +
> +config ALTP2M
> + bool "Alternate P2M support" if EXPERT
> + depends on INTEL_VMX
> + default y
> + help
> + Alternate-p2m allows a guest to manage multiple p2m guest physical
> + "memory views" (as opposed to a single p2m).
> + Useful for memory introspection.
> +
> + If unsure, stay with defaults.
> +
> +config MEM_PAGING
> + bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
> +
> +config MEM_SHARING
> + bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
> +
> +config HVM_FEP
> + bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
> + default DEBUG
> + help
> + Compiles in a feature that allows HVM guest to arbitrarily
> + exercise the instruction emulator.
> +
> + This feature can only be enabled during boot time with
> + appropriate hypervisor command line option. Please read
> + hypervisor command line documentation before trying to use
> + this feature.
> +
> + This is strictly for testing purposes, and not appropriate
> + for use in production.
> +
> + If unsure, say N.
> +
> +endif
> --
> 2.34.1

