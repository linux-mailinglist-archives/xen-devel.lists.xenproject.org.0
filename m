Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29CD6E1571
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 21:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520922.809058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn2zl-0005dW-MM; Thu, 13 Apr 2023 19:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520922.809058; Thu, 13 Apr 2023 19:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn2zl-0005ad-JX; Thu, 13 Apr 2023 19:52:37 +0000
Received: by outflank-mailman (input) for mailman id 520922;
 Thu, 13 Apr 2023 19:52:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pn2zk-0005aX-As
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 19:52:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn2zj-00042K-On; Thu, 13 Apr 2023 19:52:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn2zj-0003lk-IF; Thu, 13 Apr 2023 19:52:35 +0000
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
	bh=j1KrRqqmhEktj1V6/+wIzgGRKMBaGQ84ANZtwb9CGZU=; b=r0oHIxKERQxW0Ur9kAIO1RSUtG
	nEmiKIUzLW6vRdnvnP6ScdWgMxkfRFYDezwYt1rk9IB+PJ6YeMOsiHB/j1A3bizvW0Rlg5c88OKpo
	ZIytpeKSZkzv8a3YzgD0TQ2qVBP+UIuClUgn+Iqldszbf+wcwx3GYbgnBhkjS3jQYQww=;
Message-ID: <03cc0c98-c5ef-16f1-ed24-6a39320b08e5@xen.org>
Date: Thu, 13 Apr 2023 20:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-3-luca.fancellu@arm.com>
 <72f38b2b-a391-fb7c-f8c0-cf3561470875@xen.org>
 <B3A82639-6D61-4DA2-B918-A92A421C75D3@arm.com>
 <e8075849-8bd5-7fd4-efaa-81e48c867635@xen.org>
 <4F5DC5EC-F538-42CE-A93F-2B5E3FAC13BB@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4F5DC5EC-F538-42CE-A93F-2B5E3FAC13BB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 13/04/2023 15:05, Luca Fancellu wrote:
> 
> 
>> On 13 Apr 2023, at 14:30, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 13/04/2023 14:24, Luca Fancellu wrote:
>>> Hi Julien,
>>
>> Hi Luca,
>>
>>>>>   @@ -594,6 +597,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>>>       unsigned int max_vcpus;
>>>>>       unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
>>>>>       unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
>>>>> +    unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
>>>>>         if ( (config->flags & ~flags_optional) != flags_required )
>>>>>       {
>>>>> @@ -602,6 +606,26 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>>>           return -EINVAL;
>>>>>       }
>>>>>   +    /* Check feature flags */
>>>>> +    if ( sve_vl_bits > 0 )
>>>>> +    {
>>>>> +        unsigned int zcr_max_bits = get_sys_vl_len();
>>>>> +
>>>>> +        if ( !zcr_max_bits )
>>>>> +        {
>>>>> +            dprintk(XENLOG_INFO, "SVE is unsupported on this machine.\n");
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>> +
>>>>> +        if ( sve_vl_bits > zcr_max_bits )
>>>>> +        {
>>>>> +            dprintk(XENLOG_INFO,
>>>>> +                    "Requested SVE vector length (%u) > supported length (%u)\n",
>>>>> +                    sve_vl_bits, zcr_max_bits);
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>
>>>> Is SVE supported for 32-bit guest? If not, then you should had a check here to prevent the creation of the domain if sve_vl_bits is set.
>>> No SVE is not supported for 32 bit guests, here I think we will get “SVE is unsupported on this machine” because get_sys_vl_len() will return 0.
>>
>>  From my understanding, get_sys_vl_len() will return the len supported by the hosts. So if you run a 32-bit guest on top of a 64-bit hosts, then I believe get_sys_vl_len() will be non-zero.
> 
> Yes you are right, I realise that I need the domain type information and I can’t have it in arch_sanitise_domain_config, however they might have sense there, and I can do a check
> like this afterwards:
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c1f0d1d78431..ce1235c25769 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3694,6 +3694,12 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>           return -EINVAL;
>       }
>   
> +    if ( d->arch.sve_vl && (kinfo->type == DOMAIN_32BIT) )
> +    {
> +        printk("SVE is not available for 32-bit domain\n");
> +        return -EINVAL;
> +    }
> +
>       if ( is_64bit_domain(d) )
>           vcpu_switch_to_aarch64_mode(v);
> 
> Would it be ok for you?

construct_domain() is only going to be used for domains created by Xen. 
You would need the same check for the ones created by the toolstack.

Do you need to know the SVE length when the domain is created? If not, 
then I would suggest to create a new domctl that would be called after 
we switch the domain to 32-bit.

Cheers,

-- 
Julien Grall

