Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F07371F3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 18:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551971.861770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBePl-0001QV-VK; Tue, 20 Jun 2023 16:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551971.861770; Tue, 20 Jun 2023 16:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBePl-0001NL-Se; Tue, 20 Jun 2023 16:41:09 +0000
Received: by outflank-mailman (input) for mailman id 551971;
 Tue, 20 Jun 2023 16:41:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBePk-0001NF-Ld
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 16:41:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBePk-0003TZ-7A; Tue, 20 Jun 2023 16:41:08 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBePk-0000LI-0v; Tue, 20 Jun 2023 16:41:08 +0000
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
	bh=48AOlFeyJSvA8GLZo29vA09KSXtSrIqBIW/0s0IDOCc=; b=zhYl1lqsLVhLZ3Bwkb1J8OMRFc
	M52rdgPcbnZO8IGnjf8vpEy/JQrGDcYOaDN51lNuilO8XICVJenjaFMeqCci6xZXn5KtQP2GjhlLA
	9U/ERZiLqyjBJ+TRV8iZ62eQF1hOTySBjm62ukcF18UjdMdFuNt6e+nRjzrCSdB9gen0=;
Message-ID: <d92e26fb-86d4-1681-0d10-be6c2e2cc846@xen.org>
Date: Tue, 20 Jun 2023 17:41:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52
 processor
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230620151736.3720850-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230620151736.3720850-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/06/2023 16:17, Ayan Kumar Halder wrote:
> Add a special configuration (CONFIG_AARCH32_V8R) to setup the Cortex-R52
> specifics.
> 
> Cortex-R52 is an Arm-V8R AArch32 processor.
> 
> Refer ARM DDI 0487I.a ID081822, G8-9647, G8.2.112 MIDR,
> bits[31:24] = 0x41 , Arm Ltd
> bits[23:20] = Implementation defined
> bits[19:16] = 0xf , Arch features are individually identified
> bits[15:4] = Implementation defined
> bits[3:0] = Implementation defined
> 
> Thus, the processor id is 0x410f0000 and the processor id mask is
> 0xff0f0000
> 
> Also, there is no special initialization required for R52.

Are you saying that Xen upstream + this patch will boot on Cortex-R52?

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/Kconfig         |  7 +++++++
>   xen/arch/arm/arm32/Makefile  |  1 +
>   xen/arch/arm/arm32/proc-v8.S | 32 ++++++++++++++++++++++++++++++++
>   3 files changed, 40 insertions(+)
>   create mode 100644 xen/arch/arm/arm32/proc-v8.S
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 61e581b8c2..c45753a2dd 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -3,6 +3,13 @@ config ARM_32
>   	depends on "$(ARCH)" = "arm32"
>   	select ARCH_MAP_DOMAIN_PAGE
>   
> +config AARCH32_V8R
> +	bool "AArch32 Arm V8R Support (UNSUPPORTED)" if UNSUPPORTED
> +	def_bool n
> +	depends on ARM_32
> +	help
> +	  This option enables Armv8-R profile for AArch32.
> +
>   config ARM_64
>   	def_bool y
>   	depends on !ARM_32
> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
> index 520fb42054..2ab808a7a8 100644
> --- a/xen/arch/arm/arm32/Makefile
> +++ b/xen/arch/arm/arm32/Makefile
> @@ -8,6 +8,7 @@ obj-y += head.o
>   obj-y += insn.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
>   obj-y += proc-v7.o proc-caxx.o
> +obj-$(CONFIG_AARCH32_V8R) += proc-v8.o
>   obj-y += smpboot.o
>   obj-y += traps.o
>   obj-y += vfp.o
> diff --git a/xen/arch/arm/arm32/proc-v8.S b/xen/arch/arm/arm32/proc-v8.S
> new file mode 100644
> index 0000000000..c5a566b165
> --- /dev/null
> +++ b/xen/arch/arm/arm32/proc-v8.S

Below you say the file will contain v8r specific initialization. So 
please rename it to proc-v8r.S.

Cheers,

-- 
Julien Grall

