Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FCE4E7A4E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 19:47:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294931.501841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXoxC-0008Nm-NA; Fri, 25 Mar 2022 18:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294931.501841; Fri, 25 Mar 2022 18:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXoxC-0008LK-Jy; Fri, 25 Mar 2022 18:46:30 +0000
Received: by outflank-mailman (input) for mailman id 294931;
 Fri, 25 Mar 2022 18:46:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXoxC-0008LE-1i
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 18:46:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXoxB-0001Or-Ha; Fri, 25 Mar 2022 18:46:29 +0000
Received: from [54.239.6.185] (helo=[192.168.14.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXoxB-00033O-Am; Fri, 25 Mar 2022 18:46:29 +0000
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
	bh=UeRZWORTDKvwzEB8XOzbNRVXOylse3EeN7fgBIOJvIc=; b=Bkd+USmVWXy/NwfoAMsNEqSHa4
	Gt0ufZWyLC1xxsLubX6enZgbsFkxOcuk4t6rNCaeEMeJ9tKC64eKg30iZh3ZDNQmZer4L8NZcEScx
	GzPEAXtfncGSMTsz5Q+uoDjwW9r1mGYCDbJsUU2P8xZgHnMgRu6X8iKdsa8NIMXHlx24=;
Message-ID: <799f69b2-f581-9f5f-004a-8f9f790aba2a@xen.org>
Date: Fri, 25 Mar 2022 18:46:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/5] xen/arm: configure dom0less domain for enabling
 xenstore after boot
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-3-sstabellini@kernel.org>
 <e55c03f6-5b20-ce9c-ce88-11dc85623dce@xen.org>
 <alpine.DEB.2.22.394.2203221722430.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203221722430.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/03/2022 01:18, Stefano Stabellini wrote:
> On Sat, 29 Jan 2022, Julien Grall wrote:
>> On 28/01/2022 21:33, Stefano Stabellini wrote:
>>> +    rc = evtchn_alloc_unbound(&alloc, true);
>>> +    if ( rc )
>>> +    {
>>> +        printk("Failed allocating event channel for domain\n");
>>> +        return rc;
>>> +    }
>>> +
>>> +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>    static int __init construct_domU(struct domain *d,
>>>                                     const struct dt_device_node *node)
>>>    {
>>> @@ -3014,7 +3043,19 @@ static int __init construct_domU(struct domain *d,
>>>            return rc;
>>>          if ( kinfo.vpl011 )
>>> +    {
>>>            rc = domain_vpl011_init(d, NULL);
>>> +        if ( rc < 0 )
>>> +            return rc;
>>> +    }
>>> +
>>> +    if ( kinfo.dom0less_enhanced )
>>> +    {
>>> +        rc = alloc_xenstore_evtchn(d);
>>> +        if ( rc < 0 )
>>> +            return rc;
>>> +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
>>
>> I think it would be easy to allocate the page right now. So what prevent us to
>> do it right now?
> 
> Because (as you noted as a comment to the following patch) as soon as
> d->arch.hvm.params[HVM_PARAM_STORE_PFN] is set the guest can continue
> with the initialization and will expect the right data to be set on the
> page.

I think you misunderstood my question. From my understanding, at the 
moment, Linux would break with your proposal. So you need to modify the 
kernel in order to support what you are doing.

IOW, we have room to decide the approach here.

Xenstore protocol has a way to allow (re)connection (see 
docs/mics/xenstore-ring.txt). This feature looks quite suited to what 
you are trying to do here (we want to delay the connection).

The main advantage with this approach is the resources allocation for 
Xenstore will be done in the place and the work in Linux could be 
re-used for non-dom0less domain.

Have you explored it?

> In other words: it is not enough to have the pfn allocated, we
> also need xenstore to initialize it. At that point, it is better to do
> both later from init-dom0less.c.
See above. My main concern with your proposal is the allocation is split 
and this making more difficult to understand the initialization. Could 
you write some documentation how everything is meant to work?

Cheers,

-- 
Julien Grall

