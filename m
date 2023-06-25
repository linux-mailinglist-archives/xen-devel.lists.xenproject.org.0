Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3F773D112
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 14:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554783.866180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDP7m-00008V-Dt; Sun, 25 Jun 2023 12:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554783.866180; Sun, 25 Jun 2023 12:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDP7m-00005R-B7; Sun, 25 Jun 2023 12:45:50 +0000
Received: by outflank-mailman (input) for mailman id 554783;
 Sun, 25 Jun 2023 12:45:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDP7k-00005K-Dg
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 12:45:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDP7j-00009a-Kf; Sun, 25 Jun 2023 12:45:47 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDP7j-00039L-EV; Sun, 25 Jun 2023 12:45:47 +0000
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
	bh=mRCQlwp35TFAlpUXll5GF4GBJ/rWWC0RcVcOTu1fwVw=; b=YHrsMhVmPXMFQItJstMjGA/Ts1
	Yx8K7oMlCgW9yCE7uf3igdYxYGIQpE0C1SE95yD1U4/9NkkFXdWDbR6Vkx05TDwVj3f4xXh9XOtam
	kFqO5McAzKM3XpnprRW1K0mIvlCi0ZAcMMgi2fgaSuyCXtVdaIiFR/+RscuI9OPAtg3I=;
Message-ID: <102b31fb-0e47-cead-8555-5758531f13af@xen.org>
Date: Sun, 25 Jun 2023 13:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v1 2/2] xen/arm: Make has_vpci depend on CONFIG_HAS_VPCI
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>, Rahul Singh <rahul.singh@arm.com>
References: <20230620152924.23622-1-stewart.hildebrand@amd.com>
 <20230620152924.23622-2-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230620152924.23622-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/06/2023 16:29, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> VPCI is disabled on ARM. Make it depend on CONFIG_HAS_VPCI to test the PCI
> passthrough support.
> 
> While here, remove the comment on the preceding line.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> There are two downstreams [1] [2] that have independently made a version this
> change, each with different Signed-off-by's. I simply picked one at random for
> the Author: field, and added both Signed-off-by lines. Please let me know if
> there are any objections.
> 
> downstream->v1:
> * change to IS_ENABLED(CONFIG_HAS_VPCI) instead of hardcoded to true
> * remove the comment on the preceding line
> 
> [1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
> [2] https://github.com/xen-troops/xen/commit/bf12185e6fb2e31db0d8e6ea9ccd8a02abadec17
> ---
>   xen/arch/arm/include/asm/domain.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 99e798ffff68..6e016b00bae1 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -298,8 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>   
>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>   
> -/* vPCI is not available on Arm */
> -#define has_vpci(d)    ({ (void)(d); false; })
> +#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })

This will enable vPCI for all the domains. However, in the cover letter, 
you seemed to suggest that guest support is not there. So shouldn't this 
be "is_harware_domain(d)"? Or d->arch.has_vcpi?

Cheers,

-- 
Julien Grall

