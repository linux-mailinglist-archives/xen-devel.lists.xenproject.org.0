Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A298489E51B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 23:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702838.1098440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruJF1-0006qK-02; Tue, 09 Apr 2024 21:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702838.1098440; Tue, 09 Apr 2024 21:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruJF0-0006nd-TD; Tue, 09 Apr 2024 21:42:54 +0000
Received: by outflank-mailman (input) for mailman id 702838;
 Tue, 09 Apr 2024 21:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ECT=LO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ruJEz-0006nH-Ub
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 21:42:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d8db7b3-f6ba-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 23:42:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF65061A34;
 Tue,  9 Apr 2024 21:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C778C433C7;
 Tue,  9 Apr 2024 21:42:49 +0000 (UTC)
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
X-Inumbo-ID: 1d8db7b3-f6ba-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712698970;
	bh=xQT2EdI5cB1VZ0965OQiPl+vGyn2Pr7iIa3G+rk2UhA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bS1CbCF+ECSa7Nulbr+KV51eAG2lrayJuKXUPulbBQgkfDVSuWKa7vxCL1eH9GHPM
	 9fc1SlO0bmTNHXZz4e6CqwWFqh88blrXdaU2f2KwJ3hWCDQOlfV72lGDce9PU8+o5f
	 RF7whJSpfVJBaHypmd/juFLZgTdvY3KXOe/6cvFJStbtoVdgdfpmKWMklQzhRLPDWg
	 Auu2CJSLbNhYjNESi1oakWVFxqJCw67O/X5YCCoq+hGXygm8xwI7A1RcpuiCSLqgrA
	 ziX7OlSCehfSoF5kByL55yNwQ8CrAJG8k/+dzzT5ohrVSgBe+boboEGlLz7kIKrxyA
	 zlWiGnlTpUpxQ==
Date: Tue, 9 Apr 2024 14:42:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [PATCH v2.5 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
In-Reply-To: <20231027191926.3283871-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404091435170.2245130@ubuntu-linux-20-04-desktop>
References: <ZTu_WxdWTrthCs4m@macbook> <20231027191926.3283871-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1528487512-1712698970=:2245130"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1528487512-1712698970=:2245130
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 27 Oct 2023, Andrew Cooper wrote:
> We eventually want to be able to build a stripped down Xen for a single
> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
> available to randconfig), and adjust the microcode logic.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I read the discussion here:
https://marc.info/?l=xen-devel&m=169865507432363
https://lore.kernel.org/xen-devel/ZT9yNrdoCKZs3_uY@macbook/

I think we want two top-level simple CONFIG_AMD and CONFIG_INTEL
options. Do we also want finer granular sub-options such as
CONFIG_AMD_CPU and CONFIG_INTEL_CPU, which would be controlled by the
top-level options CONFIG_AMD and CONFIG_INTEL? I think we could go
either way. CONFIG_{AMD,INTEL} could be sufficient, but also having
them control CONFIG_{AMD,INTEL}_CPU and CONFIG_{AMD,INTEL}_IOMMU is
fine too.

We already have CONFIG_{AMD,INTEL}_IOMMU. At the time I wondered if we
could have just used CONFIG_{AMD,INTEL} for evertything. But given we
have CONFIG_{AMD,INTEL}_IOMMU, I can see why the reviewers suggested to
use CONFIG_{AMD,INTEL}_CPU.

I would have introduced CONFIG_{AMD,INTEL} only, given that it is not
possible to have an AMD CPU with an INTEL IOMMU and vice versa. 

Anyway, I don't really have a strong opinion either way but we need this
patch to move forward one way or another so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

(I would also ck different versions of this patch.)


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Stefano Stabellini <stefano.stabellini@amd.com>
> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> 
> I've intentionally ignored the other vendors for now.  They can be put into
> Kconfig by whomever figures out the actual dependencies between their init
> routines.
> 
> v2:
>  * Tweak text
> v2.5:
>  * Fix indentation
>  * Rename with _CPU suffixes as requested
> ---
>  xen/arch/x86/Kconfig                 |  2 ++
>  xen/arch/x86/Kconfig.cpu             | 22 ++++++++++++++++++++++
>  xen/arch/x86/cpu/microcode/Makefile  |  4 ++--
>  xen/arch/x86/cpu/microcode/private.h |  9 +++++++++
>  4 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 xen/arch/x86/Kconfig.cpu
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index eac77573bd75..d9eacdd7e0fa 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -49,6 +49,8 @@ config HAS_CC_CET_IBT
>  
>  menu "Architecture Features"
>  
> +source "arch/x86/Kconfig.cpu"
> +
>  source "arch/Kconfig"
>  
>  config PV
> diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
> new file mode 100644
> index 000000000000..b68c41977a3b
> --- /dev/null
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -0,0 +1,22 @@
> +menu "Supported CPU vendors"
> +	visible if EXPERT
> +
> +config AMD_CPU
> +	bool "AMD"
> +	default y
> +	help
> +	  Detection, tunings and quirks for AMD platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on AMD platforms.
> +
> +config INTEL_CPU
> +	bool "Intel"
> +	default y
> +	help
> +	  Detection, tunings and quirks for Intel platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Intel platforms.
> +
> +endmenu
> diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
> index aae235245b06..194ddc239ee3 100644
> --- a/xen/arch/x86/cpu/microcode/Makefile
> +++ b/xen/arch/x86/cpu/microcode/Makefile
> @@ -1,3 +1,3 @@
> -obj-y += amd.o
> +obj-$(CONFIG_AMD_CPU) += amd.o
>  obj-y += core.o
> -obj-y += intel.o
> +obj-$(CONFIG_INTEL_CPU) += intel.o
> diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
> index b58611e908aa..bb329933ac89 100644
> --- a/xen/arch/x86/cpu/microcode/private.h
> +++ b/xen/arch/x86/cpu/microcode/private.h
> @@ -70,7 +70,16 @@ struct microcode_ops {
>   * support available) and (not) ops->apply_microcode (i.e. read only).
>   * Otherwise, all hooks must be filled in.
>   */
> +#ifdef CONFIG_AMD_CPU
>  void ucode_probe_amd(struct microcode_ops *ops);
> +#else
> +static inline void ucode_probe_amd(struct microcode_ops *ops) {}
> +#endif
> +
> +#ifdef CONFIG_INTEL_CPU
>  void ucode_probe_intel(struct microcode_ops *ops);
> +#else
> +static inline void ucode_probe_intel(struct microcode_ops *ops) {}
> +#endif
>  
>  #endif /* ASM_X86_MICROCODE_PRIVATE_H */
> -- 
> 2.30.2
> 
> 
--8323329-1528487512-1712698970=:2245130--

