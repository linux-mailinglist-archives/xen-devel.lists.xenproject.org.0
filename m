Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C54D0521
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 18:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286348.485854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRH1a-0007Dm-0k; Mon, 07 Mar 2022 17:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286348.485854; Mon, 07 Mar 2022 17:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRH1Z-0007BP-Sk; Mon, 07 Mar 2022 17:19:57 +0000
Received: by outflank-mailman (input) for mailman id 286348;
 Mon, 07 Mar 2022 17:19:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRH1Y-0007BJ-Fw
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 17:19:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRH1X-00015z-Ss; Mon, 07 Mar 2022 17:19:55 +0000
Received: from [54.239.6.188] (helo=[192.168.26.124])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRH1X-0006Cd-MR; Mon, 07 Mar 2022 17:19:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=3SrX5XMJMtGn10qrI+gdXUyC4ttQTBmmysSPDfN2WKk=; b=W1xlIJsGTu1br+5LxPD5Bv5b/E
	wesAfBVtqktBoyCxnh0CM8YfVIN5StbX2kujZ1doskptniAR6TI2Xq8ySS02XpNDohlU/qeiI9O7D
	DF8PFZxBGpEGNrxcQXJ0d1nka/Kc1HAvlu7UUsV1ln1mJXTJL41edv3rN4vnAE0IbRLQ=;
Message-ID: <f6e3f58a-ca7c-6173-815b-8bf300df33ed@xen.org>
Date: Mon, 7 Mar 2022 17:19:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] livepatch: set -f{function,data}-sections compiler
 option
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220307155558.72876-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220307155558.72876-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 07/03/2022 15:55, Roger Pau Monne wrote:
> If livepatching support is enabled build the hypervisor with
> -f{function,data}-sections compiler options, which is required by the
> livepatching tools to detect changes and create livepatches.
> 
> This shouldn't result in any functional change on the hypervisor
> binary image, but does however require some changes in the linker
> script in order to handle that each function and data item will now be
> placed into its own section in object files. As a result add catch-all
> for .text, .data and .bss in order to merge each individual item
> section into the final image.
> 
> The main difference will be that .text.startup will end up being part
> of .text rather than .init, and thus won't be freed. .text.exit will
> also be part of .text rather than dropped. Overall this could make the
> image bigger, and package some .text code in a sub-optimal way.
> 
> Note that placement of the sections inside of .text is also slightly
> adjusted to be more similar to the position found in the default GNU
> ld linker script. This requires having a separate section for the
> header in order to place it at the begging of the output image,
> followed with the unlikely and related sections, and finally the main
> .text section.
> 
> On Arm the .data.read_mostly needs to be moved ahead of the .data
> section like it's already done on x86, and the alignment needs to be
> set to PAGE_SIZE so it doesn't end up being placed at the tail of a
> read-only page from the previous section. While there move the
> alignment of the .data section ahead of the section declaration, like
> it's done for other sections.

This sounds like a bug not related to this patch. Can this be split 
separately?

> 
> The benefit of having CONFIG_LIVEPATCH enable those compiler option
> is that the livepatch build tools no longer need to fiddle with the
> build system in order to enable them. Note the current livepatch tools
> are broken after the recent build changes due to the way they
> attempt to set  -f{function,data}-sections.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>   - Introduce CC_SPLIT_SECTIONS for selecting the compiler options.
>   - Drop check for compiler options, all supported versions have them.
>   - Re-arrange section placement in .text, to match the default linker
>     script.
>   - Introduce .text.header to contain the headers bits that must appear
>     first in the final binary.
> ---
> Given that now the header is explicitly placed in .text.header, it's
> likely possible to simplify some of the ordering of the object files
> for the prelink.o generation, as arch/x86/boot/built_in.o no longer
> needs to be the first object file in the list.
> 
> It also seems on Arm the schedulers and hypfs .data sections should be
> moved into read_mostly.
> ---
> Tested by gitlab in order to assert I didn't introduce any regression
> on Arm specially.
> ---
>   xen/Makefile              |  2 ++
>   xen/arch/arm/arm32/head.S |  1 +
>   xen/arch/arm/arm64/head.S |  1 +
>   xen/arch/arm/xen.lds.S    | 49 +++++++++++++++++++++------------------
>   xen/arch/x86/boot/head.S  |  2 +-
>   xen/arch/x86/xen.lds.S    | 22 +++++++++++-------
>   xen/common/Kconfig        |  4 ++++
>   7 files changed, 49 insertions(+), 32 deletions(-)
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 5c21492d6f..18a4f7e101 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -273,6 +273,8 @@ else
>   CFLAGS += -fomit-frame-pointer
>   endif
>   
> +CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
> +
>   CFLAGS += -nostdinc -fno-builtin -fno-common
>   CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
>   $(call cc-option-add,CFLAGS,CC,-Wvla)
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 7a906167ef..c837d3054c 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -120,6 +120,7 @@
>   
>   #endif /* !CONFIG_EARLY_PRINTK */
>   
> +        .section .text.header, "ax", %progbits
>           .arm
>   
>           /*
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 66d862fc81..e62c48ec1c 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -133,6 +133,7 @@
>           add \xb, \xb, x20
>   .endm
>   
> +        .section .text.header, "ax", %progbits
>           /*.aarch64*/
>   
>           /*
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 08016948ab..836da880c3 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -30,9 +30,16 @@ SECTIONS
>     _start = .;
>     .text : {
>           _stext = .;            /* Text section */
> +       *(.text.header)

With this change, the changes in arch/*/arch.mk to order head.o looks 
unnecessary. Can we remove it at the same time? (The .text.header and 
the update of arch.mk may want to be done together in a separate patch).

> +
> +       *(.text.cold .text.cold.*)
> +       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> +
>          *(.text)
> -       *(.text.cold)
> -       *(.text.unlikely)
> +#ifdef CONFIG_CC_SPLIT_SECTIONS
> +       *(.text.*)
> +#endif
> +
>          *(.fixup)
>          *(.gnu.warning)
>          _etext = .;             /* End of text section */
> @@ -78,10 +85,24 @@ SECTIONS
>   #endif
>     _erodata = .;                /* End of read-only data */

Cheers,

-- 
Julien Grall

