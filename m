Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382DC7D14DF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 19:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619897.965723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttJ5-0005uX-TD; Fri, 20 Oct 2023 17:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619897.965723; Fri, 20 Oct 2023 17:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttJ5-0005sh-QG; Fri, 20 Oct 2023 17:29:07 +0000
Received: by outflank-mailman (input) for mailman id 619897;
 Fri, 20 Oct 2023 17:29:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qttJ4-0005sb-Ov
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 17:29:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qttJ4-0000lX-FG; Fri, 20 Oct 2023 17:29:06 +0000
Received: from [54.239.6.188] (helo=[192.168.205.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qttJ4-0004fP-7x; Fri, 20 Oct 2023 17:29:06 +0000
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
	bh=FtriFG5QKNohorzL1vY5FGE3lJ9qHxbEYNLYAAOG7bo=; b=5Y+yzTx7LNXfe5C4czLZWUJPXt
	c6uABN2Iul0WEXOX8G85ZJtCt7oQ9j3+jin3T88cg5IZFUGGIkUFQvvdDqv42p7BfGAXaXTY/qIK0
	rOwsFrnM2C8TpBsFrRlym/QrzOy7Yg3JIUuVkeXNblBMKwqUzeTdLSRiWVzZVaRhuxCg=;
Message-ID: <972ac641-9dff-4668-87eb-f48d9d0497c6@xen.org>
Date: Fri, 20 Oct 2023 18:29:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] xen/arm: make has_vpci() depend on
 d->arch.has_vpci
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
 <20231009195747.889326-4-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009195747.889326-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/10/2023 20:57, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> VPCI is disabled on ARM. Make it depend on d->arch.has_vpci to enable the PCI
> passthrough support on ARM.
> 
> While here, remove the comment on the preceding line.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

I think this patch should be folded in patch #2. With that the 
hypervisor part would be properly plumbed as soon as the flag is introduced.

> ---
> There are two downstreams [1] [2] that have independently made a version this
> change, each with different Signed-off-by's. I simply picked one at random for
> the Author: field, and added both Signed-off-by lines. Please let me know if
> there are any objections.
> 
> v2->v3:
> * use d->arch.has_vpci since plumbing struct arch_domain with a vPCI flag
> 
> v1->v2:
> * add is_hardware_domain check. This will need to be removed after the vPCI
>    series [3] is merged.
> 
> downstream->v1:
> * change to IS_ENABLED(CONFIG_HAS_VPCI) instead of hardcoded to true
> * remove the comment on the preceding line
> 
> [1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
> [2] https://github.com/xen-troops/xen/commit/bf12185e6fb2e31db0d8e6ea9ccd8a02abadec17
> [3] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
> ---
>   xen/arch/arm/include/asm/domain.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 0a66ed09a617..ebba2c25dceb 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -300,8 +300,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>   
>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>   
> -/* vPCI is not available on Arm */
> -#define has_vpci(d)    ({ (void)(d); false; })
> +#define has_vpci(d) ( (d)->arch.has_vpci )

Coding style: I don't believe we add space after ( and before ) in this 
situation.

Cheers,

-- 
Julien Grall

