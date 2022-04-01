Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49C4EEB34
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 12:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297307.506401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEVF-0000Xa-47; Fri, 01 Apr 2022 10:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297307.506401; Fri, 01 Apr 2022 10:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEVF-0000Vd-0e; Fri, 01 Apr 2022 10:27:37 +0000
Received: by outflank-mailman (input) for mailman id 297307;
 Fri, 01 Apr 2022 10:27:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naEVC-0000VX-RQ
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 10:27:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naEVB-0002aJ-Nj; Fri, 01 Apr 2022 10:27:33 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naEVB-00073m-Gr; Fri, 01 Apr 2022 10:27:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=v79uHVZcuhwVxT49cZ1znI60Cbqgl8zSt4BbRZLNmFM=; b=MHXsoTlcndzLjRl2PNunR5Rgtb
	+O0PytIMrlWh1s57ko2RSEIy/iIuUQrftalVrlyx7nn5PWf/sDoiBWvCTWeIjd80azdCnPtGYw/lN
	meCXpJ0WbNYpYY3RU/nVFWYfrnJowAAa+dxABmBtyS7rzfXjoxJCP3TRwCGY4arX68eA=;
Message-ID: <e3c60e34-98f5-8854-c979-37e3a5ba4e69@xen.org>
Date: Fri, 1 Apr 2022 11:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/5] tools: add example application to initialize
 dom0less PV drivers
From: Julien Grall <julien@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-5-sstabellini@kernel.org>
 <395710eb-ba51-eb67-1519-2a949326f699@xen.org>
 <alpine.DEB.2.22.394.2203221821520.2910984@ubuntu-linux-20-04-desktop>
 <07fa2884-e497-250b-53ab-dd452b501920@xen.org>
 <alpine.DEB.2.22.394.2203311412490.2910984@ubuntu-linux-20-04-desktop>
 <94f37cdc-cce3-cd37-62bc-4310ca1b05ba@xen.org>
In-Reply-To: <94f37cdc-cce3-cd37-62bc-4310ca1b05ba@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/04/2022 11:02, Julien Grall wrote:
> Hi Stefano,
> 
> On 01/04/2022 01:35, Stefano Stabellini wrote:
>>>>>> +
>>>>>> +    /* Alloc magic pages */
>>>>>> +    if (alloc_magic_pages(info, &dom) != 0) {
>>>>>> +        printf("Error on alloc magic pages\n");
>>>>>> +        return 1;
>>>>>> +    }
>>>>>> +
>>>>>> +    xc_dom_gnttab_init(&dom);
>>>>>
>>>>> This call as the risk to break the guest if the dom0 Linux doesn't 
>>>>> support
>>>>> the
>>>>> acquire interface. This is because it will punch a hole in the domain
>>>>> memory
>>>>> where the grant-table may have already been mapped.
>>>>>
>>>>> Also, this function could fails.
>>>>
>>>> I'll check for return errors. Dom0less is for fully static
>>>> configurations so I think it is OK to return error and abort if
>>>> something unexpected happens: dom0less' main reason for being is that
>>>> there is nothing unexpected :-)
>>> Does this mean the caller will have to reboot the system if there is 
>>> an error?
>>> IOW, we don't expect them to call ./init-dom0less twice.
>>
>> Yes, exactly. I think init-dom0less could even panic. My mental model is
>> that this is an "extension" of construct_domU. Over there we just panic
>> if something is wrong and here it would be similar. The user provided a
>> wrong config and should fix it.
> 
> Ok. I think we should make explicit how it can be used.
> 
>>>>>> +
>>>>>> +    libxl_uuid_generate(&uuid);
>>>>>> +    xc_domain_sethandle(dom.xch, info->domid,
>>>>>> libxl_uuid_bytearray(&uuid));
>>>>>> +
>>>>>> +    rc = gen_stub_json_config(info->domid, &uuid);
>>>>>> +    if (rc)
>>>>>> +        err(1, "gen_stub_json_config");
>>>>>> +
>>>>>> +    rc = restore_xenstore(xsh, info, uuid, dom.xenstore_evtchn);
>>>>>> +    if (rc)
>>>>>> +        err(1, "writing to xenstore");
>>>>>> +
>>>>>> +    xs_introduce_domain(xsh, info->domid,
>>>>>> +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + 
>>>>>> XENSTORE_PFN_OFFSET,
>>>>>> +            dom.xenstore_evtchn);
>>>>>
>>>>> xs_introduce_domain() can technically fails.
>>>>
>>>> OK
>>>>
>>>>
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +/* Check if domain has been configured in XS */
>>>>>> +static bool domain_exists(struct xs_handle *xsh, int domid)
>>>>>> +{
>>>>>> +    return xs_is_domain_introduced(xsh, domid);
>>>>>> +}
>>>>>
>>>>> Would not this lead to initialize a domain with PV driver disabled?
>>>>
>>>> I am not sure I understood your question, but I'll try to answer 
>>>> anyway.
>>>> This check is purely to distinguish dom0less guests, which needs 
>>>> further
>>>> initializations, from regular guests (e.g. xl guests) that don't need
>>>> any actions taken here.
>>>
>>> Dom0less domUs can be divided in two categories based on whether they 
>>> are xen
>>> aware (e.g. xen,enhanced is set).
>>>
>>> Looking at this script, it seems to assume that all dom0less domUs 
>>> are Xen
>>> aware. So it will end up to allocate Xenstore ring and call
>>> xs_introduce_domain(). I suspect the call will end up to fail because 
>>> the
>>> event channel would be 0.
>>>
>>> So did you try to use this script on a platform where there only xen 
>>> aware
>>> domU and/or a mix?
>>
>> Good idea of asking for this test. I thought I already ran that test,
>> but I did it again to be sure. Everything works OK (although the
>> xenstore page allocation is unneeded). xs_introduce_domain does not
>  > fail:
> 
> Are you sure? If I pass 0 as the 4th argument (event channel), the 
> command will return EINVAL. However, looking at the code you are not 
> checking the return for the call. So you will continue as if it were 
> successful.
> 
> So you will end up to write nodes for a domain Xenstored is not aware 
> and also set HVM_PARAM_STORE_PFN which may further confuse the guest as 
> it may try to initialize Xenstored it discovers the page.

^ if it discovers

> 
>> I think that's because it is usually called on all domains by the
>> toolstack, even the ones without xenstore support in the kernel.
> 
> The toolstack will always allocate the event channel irrespective to 
> whether the guest will use Xenstore. So both the shared page and the 
> event channel are always valid today.
> 
> With your series, this will change as the event channel will not be 
> allocated when "xen,enhanced" is not set.
> 
> In your case, I think we may want to register the domain to xenstore but 
> say there are no connection available for the domain. Juergen, what do 
> you think?
> 
> Cheers,
> 

-- 
Julien Grall

