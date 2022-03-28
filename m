Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7963E4E9C2C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 18:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295528.502958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYsB0-0008W2-Vs; Mon, 28 Mar 2022 16:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295528.502958; Mon, 28 Mar 2022 16:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYsB0-0008Tc-Sj; Mon, 28 Mar 2022 16:25:06 +0000
Received: by outflank-mailman (input) for mailman id 295528;
 Mon, 28 Mar 2022 16:25:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nYsAz-0008TU-Kt
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 16:25:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nYsAy-0000jo-Fr; Mon, 28 Mar 2022 16:25:04 +0000
Received: from [54.239.6.185] (helo=[192.168.7.207])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nYsAy-0008JG-9A; Mon, 28 Mar 2022 16:25:04 +0000
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
	bh=vyVttO0mpx+DvefUB+zwyjb9MWr1/LRrnzp0cm9giqw=; b=6KjovLon2yzRQcC+pfbcwhgjhC
	DNkEyp/DTN3UAiOj5+81OMcwZ6Bs0ACWvEucJt/HbV2qZNua9/+DPJTG29HhlV7PRgNrK7JE5qAIV
	F+MF8vAKxxpAvzdjZHXqTwmuZJEQWLqfE/YEcWWObRXe0bcoqavsCDivg8A8lTSb5o1g=;
Message-ID: <07fa2884-e497-250b-53ab-dd452b501920@xen.org>
Date: Mon, 28 Mar 2022 17:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/5] tools: add example application to initialize
 dom0less PV drivers
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203221821520.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/03/2022 02:50, Stefano Stabellini wrote:
> On Sat, 29 Jan 2022, Julien Grall wrote:
>> On 28/01/2022 21:33, Stefano Stabellini wrote:
>>> +    libxl_uuid uuid;
>>> +    uint64_t v;
>>> +    int rc;
>>> +
>>> +    printf("Init dom0less domain: %d\n", info->domid);
>>> +    dom.guest_domid = info->domid;
>>> +    dom.xenstore_domid = 0;
>>> +    dom.xch = xc_interface_open(0, 0, 0);
>>> +
>>> +    rc = xc_hvm_param_get(dom.xch, info->domid, HVM_PARAM_STORE_EVTCHN,
>>> &v);
>>> +    if (rc != 0) {
>>> +        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
>>> +        return 1;
>>> +    }
>>> +    dom.xenstore_evtchn = v;
>>> +
>>> +    /* Console won't be initialized but set its data for completeness */
>>> +    dom.console_domid = 0;
>>
>> I find a bit odd you set the domid but not the event channel, page. Can you
>> explain?
>>
>> Actually, can you explain why only half of the structure is initialized?
>   
> We are only using the struct xc_dom_image parameter for
> xc_dom_gnttab_init, and nothing else. We only need very few fields in
> it. Basically we could call xc_dom_gnttab_seed directly and then we
> wouldn't need struct xc_dom_image at all. Only the needed fields are
> currently populated.

I would prefer if we don't use xc_dom_image and call 
xc_dom_gnttab_seed(). This would:
   1) reduce the risk that one of the unitialized field is will be 
mistakenly use
   2) extra documentation (currently missing) to explain which fields is 
used.

>>> +
>>> +    /* Alloc magic pages */
>>> +    if (alloc_magic_pages(info, &dom) != 0) {
>>> +        printf("Error on alloc magic pages\n");
>>> +        return 1;
>>> +    }
>>> +
>>> +    xc_dom_gnttab_init(&dom);
>>
>> This call as the risk to break the guest if the dom0 Linux doesn't support the
>> acquire interface. This is because it will punch a hole in the domain memory
>> where the grant-table may have already been mapped.
>>
>> Also, this function could fails.
> 
> I'll check for return errors. Dom0less is for fully static
> configurations so I think it is OK to return error and abort if
> something unexpected happens: dom0less' main reason for being is that
> there is nothing unexpected :-)
Does this mean the caller will have to reboot the system if there is an 
error? IOW, we don't expect them to call ./init-dom0less twice.

>>> +
>>> +    libxl_uuid_generate(&uuid);
>>> +    xc_domain_sethandle(dom.xch, info->domid, libxl_uuid_bytearray(&uuid));
>>> +
>>> +    rc = gen_stub_json_config(info->domid, &uuid);
>>> +    if (rc)
>>> +        err(1, "gen_stub_json_config");
>>> +
>>> +    rc = restore_xenstore(xsh, info, uuid, dom.xenstore_evtchn);
>>> +    if (rc)
>>> +        err(1, "writing to xenstore");
>>> +
>>> +    xs_introduce_domain(xsh, info->domid,
>>> +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
>>> +            dom.xenstore_evtchn);
>>
>> xs_introduce_domain() can technically fails.
> 
> OK
> 
> 
>>> +    return 0;
>>> +}
>>> +
>>> +/* Check if domain has been configured in XS */
>>> +static bool domain_exists(struct xs_handle *xsh, int domid)
>>> +{
>>> +    return xs_is_domain_introduced(xsh, domid);
>>> +}
>>
>> Would not this lead to initialize a domain with PV driver disabled?
> 
> I am not sure I understood your question, but I'll try to answer anyway.
> This check is purely to distinguish dom0less guests, which needs further
> initializations, from regular guests (e.g. xl guests) that don't need
> any actions taken here.

Dom0less domUs can be divided in two categories based on whether they 
are xen aware (e.g. xen,enhanced is set).

Looking at this script, it seems to assume that all dom0less domUs are 
Xen aware. So it will end up to allocate Xenstore ring and call 
xs_introduce_domain(). I suspect the call will end up to fail because 
the event channel would be 0.

So did you try to use this script on a platform where there only xen 
aware domU and/or a mix?

Cheers,

-- 
Julien Grall

