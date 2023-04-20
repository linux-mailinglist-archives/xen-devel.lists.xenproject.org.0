Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86D6E9568
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 15:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524275.815090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppU1h-0003Jz-4l; Thu, 20 Apr 2023 13:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524275.815090; Thu, 20 Apr 2023 13:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppU1h-0003HJ-1O; Thu, 20 Apr 2023 13:08:41 +0000
Received: by outflank-mailman (input) for mailman id 524275;
 Thu, 20 Apr 2023 13:08:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ppU1f-0003HD-EA
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 13:08:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppU1e-00063U-Np; Thu, 20 Apr 2023 13:08:38 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.24.51]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppU1e-0000RA-Fm; Thu, 20 Apr 2023 13:08:38 +0000
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
	bh=fmYh1zD2ruL4yp8fnxjdp4QfDu5JUHeqOWrH153mrQk=; b=GqMLPuwytQz93Hrn6+gpt7oN5S
	Y7U6Si5j+AoecmqsFgOFZP6Ggq0dWf2DQFD7lsYynSZIJpUhAyc5zERURIQMXrhDpFHMuQpLa00T+
	ZHDMTQGfVT0z5jZsJymmafIX/WBvMAH3sbr5OcH17D3uEhkxXGhh8XcE56H9oTxSkjEI=;
Message-ID: <00fc2213-d315-f4e8-d4bc-bc78028dd9b2@xen.org>
Date: Thu, 20 Apr 2023 14:08:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
 <F30CEF99-693A-4218-AC80-433A183DE866@arm.com>
 <3DE2B914-FA6E-49EF-8748-BB8DE4B2CC11@arm.com>
 <8DA3FECA-DEBD-479E-9E5A-57676B98ADA4@arm.com>
 <DE00F3DB-C6D9-4D90-97A8-FD964FD03099@arm.com>
 <bb6b5288-f123-8d25-3cc3-ef36164ea04c@xen.org>
 <BE516382-0E45-4D6E-8012-1D75C1F13680@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <BE516382-0E45-4D6E-8012-1D75C1F13680@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 20/04/2023 13:43, Luca Fancellu wrote:
>> On 20 Apr 2023, at 13:29, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 20/04/2023 09:46, Luca Fancellu wrote:
>>>>>>>> +int __init sve_sanitize_vl_param(int val, unsigned int *out)
>>>>>>>> +{
>>>>>>>> +    /*
>>>>>>>> +     * Negative SVE parameter value means to use the maximum supported
>>>>>>>> +     * vector length, otherwise if a positive value is provided, check if the
>>>>>>>> +     * vector length is a multiple of 128 and not bigger than the maximum value
>>>>>>>> +     * 2048
>>>>>>>> +     */
>>>>>>>> +    if ( val < 0 )
>>>>>>>> +        *out = get_sys_vl_len();
>>>>>>>> +    else if ( ((val % SVE_VL_MULTIPLE_VAL) == 0) && (val <= SVE_VL_MAX_BITS) )
>>>>>>>> +        *out = val;
>>>>>>>
>>>>>>> Shouldn't you also check if it is not greater than the maximum vector length ?
>>>>>>
>>>>>> I don’t understand, I am checking that the value is below or equal to SVE_VL_MAX_BITS,
>>>>>> If you mean if it should be checked also against the maximum supported length by the platform,
>>>>>> I think this is not the right place, the check is already in arch_sanitise_domain_config(), introduced
>>>>>> in patch #2
>>>>>
>>>>> If this is not the right place to check it then why checking the rest here ?
>>>>>
>>>>>  From a user or a developer point of view I would expect the validity of the input to be checked only
>>>>> in one place.
>>>>> If here is not the place for that it is ok but then i would check everything in arch_sanitise_domain_config
>>>>> (multiple, min and supported) instead of doing it partly in 2 places.
>>>>
>>>> Ok, given the way we encoded the value in xen_domctl_createdomain structure, we have that the value takes
>>>> very little space, but a small issue is that when we encode it, we are dividing it by 128, which is fine for user params
>>>> that are multiple of 128, but it’s less fine if the user passes “129”.
>>>>
>>>> To overcome this issue we are checking the value when it is not already encoded. Now, thinking about it, the check
>>>> "&& (val <= SVE_VL_MAX_BITS)” is not really needed, because even if the value is above, then in arch_sanitise_domain_config
>>>> we will hit the top limit of the platform maximum VL.
>>>>
>>>> int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>> {
>>>>     unsigned int max_vcpus;
>>>>     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
>>>>     unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
>>>>     unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
>>>>
>>>>     if ( (config->flags & ~flags_optional) != flags_required )
>>>>     {
>>>>         dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
>>>>                 config->flags);
>>>>         return -EINVAL;
>>>>     }
>>>>
>>>>     /* Check feature flags */
>>>>     if ( sve_vl_bits > 0 )
>>>>     {
>>>>         unsigned int zcr_max_bits = get_sys_vl_len();
>>>>
>>>>         if ( !zcr_max_bits )
>>>>         {
>>>>             dprintk(XENLOG_INFO, "SVE is unsupported on this machine.\n");
>>>>             return -EINVAL;
>>>>         }
>>>>
>>>>         if ( sve_vl_bits > zcr_max_bits )
>>>>         {
>>>>             dprintk(XENLOG_INFO,
>>>>                     "Requested SVE vector length (%u) > supported length (%u)\n",
>>>>                     sve_vl_bits, zcr_max_bits);
>>>>             return -EINVAL;
>>>>         }
>>>>     }
>>>>    [...]
>>>>
>>>> Now, I understand your point, we could check everything in sve_sanitize_vl_param(), but it would leave a problem
>>>> for domains created by hypercalls if I am not wrong.
>>>>
>>>> What do you think?
>>> I thought about that and another possibility is to store “sve_vl” as uint16_t inside struct xen_arch_domainconfig, and
>>> check it inside arch_sanitise_domain_config() for it to be mod 128 and less than the max supported VL, this will
>>> allow to have all the checks in one place, taking a bit more space, anyway we would take the space from the implicit
>>> padding as this is the current status:
> 
> Hi Julien,
> 
>>
>> Sorry, I am having trouble to follow the discussion. If you are checking the value in arch_sanitise_domain_config(), then why do you need to take more space in arch_domain?
> 
> Yes I am checking the value in arch_sanitise_domain_config, the value checked is from arch_domain and it is the vector length divided by 128, so an encoded value.

I think this is where the disconnect is coming from. 
arch_sanitise_domain_config() doesn't use struct arch_domain because the 
domain itself is not yet allocated. Instead, it is using 
xen_arch_domainconfig.

I care less about the increase of xen_arch_domainconfig because this is 
a one off structure.

> 
> Bertrand was puzzled by the fact that I also put a check in sve_sanitize_vl_param to see if the vector length passed by the user is mod 128, his point is that we should check a value only in one place and not in two, and it is a valid point but in this case we can’t put all the check into arch_sanitise_domain_config because we don’t have the “full” value from arch_domain, and we can’t put all the checks in sve_sanitize_vl_param because it will leave out from the check domains created by hyper calls.
> 
> So to have only one point where the checks are done (mod 128 and <= HW supported VL), we might need to have a full resolution VL value in struct xen_arch_domainconfig (16 bit).
> 
> But if we want to save space for the future, we could leave the code as it is and rely on the fact that the tools (or Xen) when creating the domain configuration, will check that the SVE VL parameter is mod 128.
> In this last case what is in struct xen_arch_domainconfig is implicitly mod 128 and only the upper boundary of the max supported VL will be checked by Xen inside arch_sanitise_domain_config.

Before answering to the approach, can you explain why you ask the user 
to pass a value that is a multiple of 128 rather than the already 
"divided" value? Is it more natural for the user?

Cheers,

-- 
Julien Grall

