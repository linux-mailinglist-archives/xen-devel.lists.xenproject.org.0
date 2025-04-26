Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EF9A9D999
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 11:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969096.1358409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8bWP-000070-Cn; Sat, 26 Apr 2025 09:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969096.1358409; Sat, 26 Apr 2025 09:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8bWP-0008Vt-77; Sat, 26 Apr 2025 09:08:29 +0000
Received: by outflank-mailman (input) for mailman id 969096;
 Sat, 26 Apr 2025 09:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pqNG=XM=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u8bWN-0008Vn-Qt
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 09:08:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 021d63c7-227e-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 11:08:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E29DB4A5C9;
 Sat, 26 Apr 2025 09:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D666CC4CEE2;
 Sat, 26 Apr 2025 09:08:19 +0000 (UTC)
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
X-Inumbo-ID: 021d63c7-227e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745658503;
	bh=gtPGdDzl64Mz9Zx1cUzJOISLq2z3aPslFucPHuiO+fA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sn/xHeda0Ce/B3kGA2mC+8qnGHbSm7nRkIFCRQ4wp1KtCf3BA5YM6ubsDrAxhrNE/
	 XpJz4rKh7lY7OmLGJ4j1ic0bQ3bO68Y/U4d7Q45XLE8O+Ey09zNZChO6EYE3AZZGKF
	 pGD0qSkvNVB+7dbncqBBE5v+UXk2OvCXzXYsTnsHF2uSwGmGj6pK0KMyYK1k0H82KI
	 2nfHXMnOetJXD0aNsSAiONei8f2sG6d5Uvnx4qqg18CPw7Cj4JwxcQZ5+E6tMa31nq
	 pBuE2iEPSKmxHIf1v0PjymHn5e/rOag3QbSAkdWmEHlNRehhau7oZ2HQSFoZgupLJd
	 /MBQc3+mu0reQ==
Date: Sat, 26 Apr 2025 11:08:17 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Message-ID: <aAyiganPp_UsNlnZ@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425141740.734030-1-arnd@kernel.org>


* Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> With cx8 and tsc being mandatory features, the only important
> architectural features are now cmov and pae.
> 
> Change the large list of target CPUs to no longer pick the instruction set
> itself but only the mtune= optimization level and in-kernel optimizations
> that remain compatible with all cores.
> 
> The CONFIG_X86_CMOV instead becomes user-selectable and is now how
> Kconfig picks between 586-class (Pentium, Pentium MMX, K6, C3, GeodeGX)
> and 686-class (everything else) targets.
> 
> In order to allow running on late 32-bit cores (Athlon, Pentium-M,
> Pentium 4, ...), the X86_L1_CACHE_SHIFT can no longer be set to anything
> lower than 6 (i.e. 64 byte cache lines).
> 
> The optimization options now depend on X86_CMOV and X86_PAE instead
> of the other way round, while other compile-time conditionals that
> checked for MATOM/MGEODEGX1 instead now check for CPU_SUP_* options
> that enable support for a particular CPU family.
> 
> Link: https://lore.kernel.org/lkml/dd29df0c-0b4f-44e6-b71b-2a358ea76fb4@app.fastmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This is what I had in mind as mentioned in the earlier thread on
> cx8/tsc removal. I based this on top of the Ingo's [RFC 15/15]
> patch.
> ---
>  arch/x86/Kconfig                |   2 +-
>  arch/x86/Kconfig.cpu            | 100 ++++++++++++++------------------
>  arch/x86/Makefile_32.cpu        |  48 +++++++--------
>  arch/x86/include/asm/vermagic.h |  36 +-----------
>  arch/x86/kernel/tsc.c           |   2 +-
>  arch/x86/xen/Kconfig            |   1 -
>  drivers/misc/mei/Kconfig        |   2 +-
>  7 files changed, 74 insertions(+), 117 deletions(-)

While the simplification is nice on its face, this looks messy:

> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index a9d717558972..1e33f88c9b97 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1438,7 +1438,7 @@ config HIGHMEM
>  
>  config X86_PAE
>  	bool "PAE (Physical Address Extension) Support"
> -	depends on X86_32 && X86_HAVE_PAE
> +	depends on X86_32 && X86_CMOV

Coupling CMOV to PAE ... :-/

> +config X86_CMOV
> +	bool "Require 686-class CMOV instructions" if X86_32
> +	default y
>  	help
> -	  This is the processor type of your CPU. This information is
> -	  used for optimizing purposes. In order to compile a kernel
> -	  that can run on all supported x86 CPU types (albeit not
> -	  optimally fast), you can specify "586" here.
> +	  Most x86-32 processor implementations are compatible with
> +	  the the CMOV instruction originally added in the Pentium Pro,
> +	  and they perform much better when using it.
> +
> +	  Disable this option to build for 586-class CPUs without this
> +	  instruction. This is only required for the original Intel
> +	  Pentium (P5, P54, P55), AMD K6/K6-II/K6-3D, Geode GX1 and Via
> +	  CyrixIII/C3 CPUs.

Very few users will know anything about CMOV.

I'd argue the right path forward is to just bite the bullet and remove 
non-CMOV support as well, that would be the outcome *anyway* in a few 
years. That would allow basically a single 'modern' 32-bit kernel that 
is supposed to boot on every supported CPU. People might even end up 
testing it ... ;-)

Thanks,

	Ingo

