Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495D211264
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 20:10:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqhB4-0002zQ-Bj; Wed, 01 Jul 2020 18:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rv6a=AM=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jqhB2-0002zF-PO
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 18:09:44 +0000
X-Inumbo-ID: 0a5fee16-bbc6-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a5fee16-bbc6-11ea-bb8b-bc764e2007e4;
 Wed, 01 Jul 2020 18:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=48oe2L4isXyCk4WjRbb9FLGIEr5/k9xk7hkDEs7B+p0=; b=Z3YUVSmA7u5J4+MWnZXV0Cn8ki
 SPMOLcv1N3TZsolj8oPHvzzhWWo+vFA5w3zRgESpeckOAbm+k1HsmcKsNIgShNZwLjO+eKWb6A9fL
 pZshcMW1del8gwtRysT4z//iq80FiCo/Ci1giXo+S5duGbNCdNR3L2m/Kj1DlPsCYSmc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqhAx-0000BA-8k; Wed, 01 Jul 2020 18:09:39 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqhAw-0004Nj-Tu; Wed, 01 Jul 2020 18:09:39 +0000
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
 <85416128-a334-4640-7504-0865f715b3a2@xen.org>
 <48c59780-bedb-ff08-723c-be14a9b73e6b@citrix.com>
 <f2aa4cf9-0689-82c0-cb6c-55d55ecbd5c1@xen.org>
 <a9a33ba1-b121-5e6f-b74c-7d2a60c84b13@xen.org>
 <a7187837-495f-56a5-a8d0-635a53ac9234@citrix.com>
 <95154add-164a-5450-28e1-f24611e1642f@xen.org>
 <df0aa9b4-d7f7-f909-e833-3f2f3040a2dc@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <de298379-43c3-648f-aade-9efc7f761970@xen.org>
Date: Wed, 1 Jul 2020 19:09:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <df0aa9b4-d7f7-f909-e833-3f2f3040a2dc@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 luwei.kang@intel.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 01/07/2020 19:06, Andrew Cooper wrote:
> On 01/07/2020 19:02, Julien Grall wrote:
>> Hi,
>>
>> On 01/07/2020 18:26, Andrew Cooper wrote:
>>> On 01/07/2020 17:18, Julien Grall wrote:
>>>>
>>>>
>>>> On 01/07/2020 17:17, Julien Grall wrote:
>>>>>
>>>>>
>>>>> On 01/07/2020 17:06, Andrew Cooper wrote:
>>>>>> On 01/07/2020 16:12, Julien Grall wrote:
>>>>>>> On 30/06/2020 13:33, Michał Leszczyński wrote:
>>>>>>>> @@ -305,7 +311,6 @@ static int vmx_init_vmcs_config(void)
>>>>>>>>                     SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
>>>>>>>>                     SECONDARY_EXEC_XSAVES |
>>>>>>>>                     SECONDARY_EXEC_TSC_SCALING);
>>>>>>>> -        rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>>>>>>>              if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
>>>>>>>>                  opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
>>>>>>>>              if ( opt_vpid_enabled )
>>>>>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>>>>>>> index 7cc9526139..0a33e0dfd6 100644
>>>>>>>> --- a/xen/common/domain.c
>>>>>>>> +++ b/xen/common/domain.c
>>>>>>>> @@ -82,6 +82,8 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
>>>>>>>>        vcpu_info_t dummy_vcpu_info;
>>>>>>>>      +bool_t vmtrace_supported;
>>>>>>>
>>>>>>> All the code looks x86 specific. So may I ask why this was
>>>>>>> implemented
>>>>>>> in common code?
>>>>>>
>>>>>> There were some questions directed specifically at the ARM
>>>>>> maintainers
>>>>>> about CoreSight, which have gone unanswered.
>>>>>
>>>>> I can only find one question related to the size. Is there any other?
>>>>>
>>>>> I don't know how the interface will look like given that AFAICT the
>>>>> buffer may be embedded in the HW. We would need to investigate how to
>>>>> differentiate between two domUs in this case without impacting the
>>>>> performance in the common code.
>>>>
>>>> s/in the common code/during the context switch/
>>>>
>>>>> So I think it is a little premature to implement this in common code
>>>>> and always compiled in for Arm. It would be best if this stay in x86
>>>>> code.
>>>
>>> I've just checked with a colleague.  CoreSight can dump to a memory
>>> buffer - there's even a decode library for the packet stream
>>> https://github.com/Linaro/OpenCSD, although ultimately it is platform
>>> specific as to whether the feature is supported.
>>>
>>> Furthermore, the choice isn't "x86 vs ARM", now that RISCv support is
>>> on-list, and Power9 is floating on the horizon.
>>>
>>> For the sake of what is literally just one byte in common code, I stand
>>> my original suggestion of this being a common interface.  It is not
>>> something which should be x86 specific.
>>
>> This argument can also be used against putting in common code. What I
>> am the most concern of is we are trying to guess how the interface
>> will look like for another architecture. Your suggested interface may
>> work, but this also may end up to be a complete mess.
>>
>> So I think we want to wait for a new architecture to use vmtrace
>> before moving to common code. This is not going to be a massive effort
>> to move that bit in common if needed.
> 
> I suggest you read the series.

Already went through the series and ...

> 
> The only thing in common code is the bit of the interface saying "I'd
> like buffers this big please".

... I stand by my point. There is no need to have this code in common 
code until someone else need it. This code can be easily implemented in 
arch_domain_create().

Cheers,

-- 
Julien Grall

