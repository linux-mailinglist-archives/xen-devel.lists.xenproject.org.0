Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73173D116
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 14:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554787.866189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDPD7-0001Zf-1L; Sun, 25 Jun 2023 12:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554787.866189; Sun, 25 Jun 2023 12:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDPD6-0001Xp-Uv; Sun, 25 Jun 2023 12:51:20 +0000
Received: by outflank-mailman (input) for mailman id 554787;
 Sun, 25 Jun 2023 12:51:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDPD6-0001Xj-14
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 12:51:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDPD5-0000FO-B9; Sun, 25 Jun 2023 12:51:19 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDPD5-0003Fd-4P; Sun, 25 Jun 2023 12:51:19 +0000
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
	bh=KtE45Rv0HLGq1YREgWC6PbahnrPzxCmGsfdb+w/5bJc=; b=iLhwkNZjbtA9Mw/nfcazjGcBsY
	VKiSqajxna/Dy2JQ+FSqxSaAYzNztb2R0e8enu5CT+hDpm2z7c8ZxOLlmRagrInTcuKoopmO5pfH+
	HopsxNiQNdy92TCb/NN/zDRtkoAIBMMbUViT400o4K2ECEZSNzMZvmBdEP80x5hof8Y4=;
Message-ID: <a5ef5d8d-5dd1-a535-77ec-458e1559a083@xen.org>
Date: Sun, 25 Jun 2023 13:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/2] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig
 option
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230620152924.23622-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230620152924.23622-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/06/2023 16:29, Stewart Hildebrand wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
> the feature is not yet complete in the current upstream codebase. The purpose of
> this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
> testing and development of PCI passthrough on ARM.
> 
> Since PCI passthrough on ARM is still work in progress at this time, make it
> depend on UNSUPPORTED.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> (cherry picked from commit 9a08f1f7ce28ec619640ba9ce11018bf443e9a0e from the
>   downstream branch [1])
> 
> Changes from downstream to v1:
> * depends on ARM_64 (Stefano)
> * Don't select HAS_VPCI_GUEST_SUPPORT since this config option is not currently
>    used in the upstream codebase. This will want to be re-added here once the
>    vpci series [2] is merged.
> * Don't select ARM_SMMU_V3 since this option can already be selected
>    independently. While PCI passthrough on ARM depends on an SMMU, it does not
>    depend on a particular version or variant of an SMMU.
> * Don't select HAS_ITS since this option can already be selected independently.
>    HAS_ITS may want to be added here once the MSI series [1] is merged.
> * Don't select LATE_HWDOM since this option is unrelated to PCI passthrough.
> 
> [1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commits/poc/pci-passthrough
> [2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
> ---
>   xen/arch/arm/Kconfig | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 61e581b8c2b0..3d22cd26a68c 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -184,6 +184,15 @@ config STATIC_SHM
>   	help
>   	  This option enables statically shared memory on a dom0less system.
>   
> +config PCI_PASSTHROUGH
> +	bool "PCI passthrough on ARM (UNSUPPORTED)" if UNSUPPORTED

The series is already under an Arm category. So I would drop "ARM" here.

NIT: Also, I think it should be EXPERT rather than UNSUPPORTED. I view 
the former as in more "experimental" than the latter.

> +	depends on ARM_64
> +	select HAS_PCI
> +	select HAS_VPCI
> +	default n
> +	help
> +	  PCI device passthrough on ARM (UNSUPPORTED)

Same.

> +
>   endmenu
>   
>   menu "ARM errata workaround via the alternative framework"

Cheers,

-- 
Julien Grall

