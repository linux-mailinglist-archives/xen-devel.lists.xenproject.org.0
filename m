Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA8F6E0E9F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520754.808709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmx1d-0008Ac-C8; Thu, 13 Apr 2023 13:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520754.808709; Thu, 13 Apr 2023 13:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmx1d-000881-8u; Thu, 13 Apr 2023 13:30:09 +0000
Received: by outflank-mailman (input) for mailman id 520754;
 Thu, 13 Apr 2023 13:30:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmx1b-00087q-Ob
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:30:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmx1b-0003Hy-EN; Thu, 13 Apr 2023 13:30:07 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.20.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmx1b-0007Ed-5L; Thu, 13 Apr 2023 13:30:07 +0000
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
	bh=v7H1LFc+RZzX3FjhIKOTo0D/cMmXgeAh9UuYM+IlyqE=; b=BP3GZR88T5E5p09n7NJusPAn80
	uwp9rmi4J0Hy8c/yuvdgK968/tSY1Yzdk1NtuY00apOp0by/DcFmzjUGTOI0TONbFaz9R6R3aT0Vz
	LX/HCaiJzWJrNBv/BSZU8p4JiUy8HJNWa3YAxpOU2qe9HDg+fDbzNfxeWDeP+NPSH15s=;
Message-ID: <e8075849-8bd5-7fd4-efaa-81e48c867635@xen.org>
Date: Thu, 13 Apr 2023 14:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Content-Language: en-US
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <B3A82639-6D61-4DA2-B918-A92A421C75D3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/04/2023 14:24, Luca Fancellu wrote:
> Hi Julien,

Hi Luca,

>>>   @@ -594,6 +597,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>       unsigned int max_vcpus;
>>>       unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
>>>       unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
>>> +    unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
>>>         if ( (config->flags & ~flags_optional) != flags_required )
>>>       {
>>> @@ -602,6 +606,26 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>           return -EINVAL;
>>>       }
>>>   +    /* Check feature flags */
>>> +    if ( sve_vl_bits > 0 )
>>> +    {
>>> +        unsigned int zcr_max_bits = get_sys_vl_len();
>>> +
>>> +        if ( !zcr_max_bits )
>>> +        {
>>> +            dprintk(XENLOG_INFO, "SVE is unsupported on this machine.\n");
>>> +            return -EINVAL;
>>> +        }
>>> +
>>> +        if ( sve_vl_bits > zcr_max_bits )
>>> +        {
>>> +            dprintk(XENLOG_INFO,
>>> +                    "Requested SVE vector length (%u) > supported length (%u)\n",
>>> +                    sve_vl_bits, zcr_max_bits);
>>> +            return -EINVAL;
>>> +        }
>>
>> Is SVE supported for 32-bit guest? If not, then you should had a check here to prevent the creation of the domain if sve_vl_bits is set.
> 
> No SVE is not supported for 32 bit guests, here I think we will get “SVE is unsupported on this machine” because get_sys_vl_len() will return 0.

 From my understanding, get_sys_vl_len() will return the len supported 
by the hosts. So if you run a 32-bit guest on top of a 64-bit hosts, 
then I believe get_sys_vl_len() will be non-zero.

>> Can we move this somewhere else to avoid adding extra padding? Also shouldn't this be protected with #ifdef CONFIG_ARM_64 to make clear this is not supported on Xen 32-bit?
> 
> Yes, I’ll move it and protect with CONFIG_ARM_64, is it ok for you if I move it after:
> 
> /* Monitor options */
> struct {
>      uint8_t privileged_call_enabled : 1;
> } monitor;

Please check the padding with "pahole". If possible, it would be better 
to re-use an existing one.

Cheers,

-- 
Julien Grall

