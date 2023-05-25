Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2EF7108E2
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539479.840391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27IN-0006Ti-Sq; Thu, 25 May 2023 09:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539479.840391; Thu, 25 May 2023 09:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27IN-0006Q2-PG; Thu, 25 May 2023 09:30:07 +0000
Received: by outflank-mailman (input) for mailman id 539479;
 Thu, 25 May 2023 09:30:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q27IM-0006Pw-Cb
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:30:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q27IM-0001FK-86
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:30:06 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.31.224]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q27IM-0006nL-1u
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:30:06 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=mAHcM+JyaGpkSiKOnIxs92Vw9HmmNqq8PddYLpb3OLg=; b=2nN1PF/CsjWoPAiogXbQCznDgM
	6Qw8RRsfzel7Vb8WZQFT/CW2Xwbs6e5d/5RImFIqrGKzhjBqy/c5wKsC5k6oUw0Pf3gIzlaNNrJ0r
	bSsYqjB5r4mov3Y1Yr/JhWH+5iAtGodTufx3PMm9pQmGX4bECoAkQzPOWrI3cuh8Orog=;
Message-ID: <5871ee5a-95b3-bd3b-7440-d40212a4d5e7@xen.org>
Date: Thu, 25 May 2023 10:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v7 11/12] xen/arm: add sve property for dom0less domUs
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-12-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230523074326.3035745-12-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/05/2023 08:43, Luca Fancellu wrote:
> Add a device tree property in the dom0less domU configuration
> to enable the guest to use SVE.
> 
> Update documentation.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v6:
>   - Use ifdef in create_domUs and fail if 'sve' is used on systems
>     with CONFIG_ARM64_SVE not selected (Bertrand, Julien, Jan)
> Changes from v5:
>   - Stop the domain creation if SVE not supported or SVE VL
>     errors (Julien, Bertrand)
>   - now sve_sanitize_vl_param is renamed to sve_domctl_vl_param
>     and returns a boolean, change the affected code.
>   - Reworded documentation.
> Changes from v4:
>   - Now it is possible to specify the property "sve" for dom0less
>     device tree node without any value, that means the platform
>     supported VL will be used.
> Changes from v3:
>   - Now domainconfig_encode_vl is named sve_encode_vl
> Changes from v2:
>   - xen_domctl_createdomain field name has changed into sve_vl
>     and its value is the VL/128, use domainconfig_encode_vl
>     to encode a plain VL in bits.
> Changes from v1:
>   - No changes
> Changes from RFC:
>   - Changed documentation
> ---
>   docs/misc/arm/device-tree/booting.txt | 16 +++++++++++++++
>   xen/arch/arm/domain_build.c           | 28 +++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 3879340b5e0a..32a0e508c471 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -193,6 +193,22 @@ with the following properties:
>       Optional. Handle to a xen,cpupool device tree node that identifies the
>       cpupool where the guest will be started at boot.
>   
> +- sve
> +
> +    Optional. The `sve` property enables Arm SVE usage for the domain and sets
> +    the maximum SVE vector length, the option is applicable only to AArch64

Depending on the discussion on the other patch, s/aarch64/arm64/. With 
the other comments addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

> +    guests.
> +    A value equal to 0 disables the feature, this is the default value.
> +    Specifying this property with no value, means that the SVE vector length
> +    will be set equal to the maximum vector length supported by the platform.
> +    Values above 0 explicitly set the maximum SVE vector length for the domain,
> +    allowed values are from 128 to maximum 2048, being multiple of 128.
> +    Please note that when the user explicitly specifies the value, if that value
> +    is above the hardware supported maximum SVE vector length, the domain
> +    creation will fail and the system will stop, the same will occur if the
> +    option is provided with a non zero value, but the platform doesn't support
> +    SVE.
> +
>   - xen,enhanced
>   
>       A string property. Possible property values are:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9202a96d9c28..ba4fe9e165ee 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -4008,6 +4008,34 @@ void __init create_domUs(void)
>               d_cfg.max_maptrack_frames = val;
>           }
>   
> +        if ( dt_get_property(node, "sve", &val) )
> +        {
> +#ifdef CONFIG_ARM64_SVE
> +            unsigned int sve_vl_bits;
> +            bool ret = false;
> +
> +            if ( !val )
> +            {
> +                /* Property found with no value, means max HW VL supported */
> +                ret = sve_domctl_vl_param(-1, &sve_vl_bits);
> +            }
> +            else
> +            {
> +                if ( dt_property_read_u32(node, "sve", &val) )
> +                    ret = sve_domctl_vl_param(val, &sve_vl_bits);
> +                else
> +                    panic("Error reading 'sve' property");
> +            }
> +
> +            if ( ret )
> +                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
> +            else
> +                panic("SVE vector length error\n");
> +#else
> +            panic("'sve' property found, but CONFIG_ARM64_SVE not selected");
> +#endif
> +        }
> +
>           /*
>            * The variable max_init_domid is initialized with zero, so here it's
>            * very important to use the pre-increment operator to call

-- 
Julien Grall

