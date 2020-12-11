Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1D02D6D8E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 02:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50050.88527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXGk-0007JK-Ob; Fri, 11 Dec 2020 01:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50050.88527; Fri, 11 Dec 2020 01:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXGk-0007Ic-Jx; Fri, 11 Dec 2020 01:30:50 +0000
Received: by outflank-mailman (input) for mailman id 50050;
 Fri, 11 Dec 2020 01:30:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKjA=FP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knXFU-0005re-G3
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 01:29:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2caf9f42-77b1-44e4-b91b-dc8ebceea8b5;
 Fri, 11 Dec 2020 01:29:12 +0000 (UTC)
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
X-Inumbo-ID: 2caf9f42-77b1-44e4-b91b-dc8ebceea8b5
Date: Thu, 10 Dec 2020 17:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607650151;
	bh=RNy/hsKX8R9WjeekNbj2MDN7cquJjS8ntLT46xfA4Cg=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=UGxc3ujSOtJJ5TbaaIuxsYeLYP7Cxc8SggwSHIMDC3E7K+4itP0qS5UU4IdZ2zZdW
	 0mBGiW4ulP7obARrLTn0N3RaI1rLu1TCJzL8zH3ISeTFElGC4A+e8ofJUCiqv/eAJf
	 qhHVxgZJqnudYvPjrJBXd/QJS4yBrq+XatSj/na3RDdO0gkyxcCa0DvZsR0VjUE/ho
	 DRM8K9ysawZXtNnSgMTTeaqwuIo6j/0yv1dW/Hp+dDsN3Xe0FZiIZBZuo8lp2BnV2i
	 N+O7+AtbEu1PM07VnSIXBsUn30a1HrCUfR3cn0p0GWRVFnVFm8WqBypTVyqqXmRvFh
	 RwohoahgaRHIA==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #843419
In-Reply-To: <20201210104258.111-1-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2012101630080.6285@sstabellini-ThinkPad-T480s>
References: <20201210104258.111-1-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Dec 2020, Luca Fancellu wrote:
> On the Cortex A53, when executing in AArch64 state, a load or store instruction
> which uses the result of an ADRP instruction as a base register, or which uses
> a base register written by an instruction immediately after an ADRP to the
> same register, might access an incorrect address.
> 
> The workaround is to enable the linker flag --fix-cortex-a53-843419
> if present, to check and fix the affected sequence. Otherwise print a warning
> that Xen may be susceptible to this errata
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  docs/misc/arm/silicon-errata.txt |  1 +
>  xen/arch/arm/Kconfig             | 19 +++++++++++++++++++
>  xen/arch/arm/Makefile            |  8 ++++++++
>  xen/scripts/Kbuild.include       | 12 ++++++++++++
>  4 files changed, 40 insertions(+)
> 
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
> index 27bf957ebf..1925d8fd4e 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -45,6 +45,7 @@ stable hypervisors.
>  | ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_827319    |
>  | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_824069    |
>  | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_819472    |
> +| ARM            | Cortex-A53      | #843419         | ARM64_ERRATUM_843419    |
>  | ARM            | Cortex-A55      | #1530923        | N/A                     |
>  | ARM            | Cortex-A57      | #852523         | N/A                     |
>  | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_832075    |
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index f5b1bcda03..41bde2f401 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -186,6 +186,25 @@ config ARM64_ERRATUM_819472
>  
>  	  If unsure, say Y.
>  
> +config ARM64_ERRATUM_843419
> +	bool "Cortex-A53: 843419: A load or store might access an incorrect address"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This option adds an alternative code sequence to work around ARM
> +	  erratum 843419 on Cortex-A53 parts up to r0p4.
> +
> +	  When executing in AArch64 state, a load or store instruction which uses
> +	  the result of an ADRP instruction as a base register, or which uses a
> +	  base register written by an instruction immediately after an ADRP to the
> +	  same register, might access an incorrect address.
> +
> +	  The workaround enables the linker to check if the affected sequence is
> +	  produced and it will fix it with an alternative not affected sequence
> +	  that produce the same behavior.
> +
> +	  If unsure, say Y.
> +
>  config ARM64_ERRATUM_832075
>  	bool "Cortex-A57: 832075: possible deadlock on mixing exclusive memory accesses with device loads"
>  	default y
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 296c5e68bb..ad2d497c45 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -101,6 +101,14 @@ prelink.o: $(ALL_OBJS) FORCE
>  	$(call if_changed,ld)
>  endif
>  
> +ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
> +    ifeq ($(call ld-option, --fix-cortex-a53-843419),n)
> +        $(warning ld does not support --fix-cortex-a53-843419; xen may be susceptible to erratum)
> +    else
> +        XEN_LDFLAGS += --fix-cortex-a53-843419
> +    endif
> +endif

I was going to comment that maybe we should put the warning elsewhere.
However, I tested the patch and works fine with both new and old
compilers and you really need to go way back to gcc 4.9 to trigger the
warning, so on second thought I think it is OK as is.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  targets += prelink.o
>  
>  $(TARGET)-syms: prelink.o xen.lds
> diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
> index e62eddc365..83c7e1457b 100644
> --- a/xen/scripts/Kbuild.include
> +++ b/xen/scripts/Kbuild.include
> @@ -43,6 +43,18 @@ define as-option-add-closure
>      endif
>  endef
>  
> +# $(if-success,<command>,<then>,<else>)
> +# Return <then> if <command> exits with 0, <else> otherwise.
> +if-success = $(shell { $(1); } >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")
> +
> +# $(success,<command>)
> +# Return y if <command> exits with 0, n otherwise
> +success = $(call if-success,$(1),y,n)
> +
> +# $(ld-option,<flag>)
> +# Return y if the linker supports <flag>, n otherwise
> +ld-option = $(call success,$(LD) -v $(1))
> +
>  # cc-ifversion
>  # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
>  cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
> -- 
> 2.17.1
> 

