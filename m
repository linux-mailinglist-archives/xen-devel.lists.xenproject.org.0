Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D613C80B3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 10:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155976.287864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3ac3-0004Yc-As; Wed, 14 Jul 2021 08:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155976.287864; Wed, 14 Jul 2021 08:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3ac3-0004WI-7s; Wed, 14 Jul 2021 08:51:27 +0000
Received: by outflank-mailman (input) for mailman id 155976;
 Wed, 14 Jul 2021 08:51:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3ac1-0004WC-TG
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 08:51:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3aby-00014A-Q7; Wed, 14 Jul 2021 08:51:22 +0000
Received: from home.octic.net ([81.187.162.82]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3aby-0005mr-K0; Wed, 14 Jul 2021 08:51:22 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ce0k8nv9M0UiJcx5V0XHMXMmZ8zrHs/4S+tcueUk5SI=; b=hHszIL3N5Vutz9iVNsu11Sr41W
	fu0xFyZ903xGggDgCKtGYLQhBOEZrli6WgM0NSH74w4YSY4WOyCPyaES9zz6n36wFETsV/fP9SkFd
	0pZGSlzHrcxMqKC7SVW20mex0tQgblLmhwrXEhk9aNOX43ghsf/ShJHnt+daK9aUrdl4=;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Juergen Gross <jgross@suse.com>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
 <ce9e3ba3-7e1a-b592-7e9a-e35099c8d483@suse.com>
 <b27990f4-ac98-8221-ddb8-fa4699a0d43b@xen.org>
 <6c6afbc3-4444-7c3b-d6ef-2d3a2baa0b53@suse.com>
 <c7f47a50-b559-f8ba-5ad2-6868c01b6f52@xen.org>
 <51a62c3f-e3ef-f7ec-748f-75ade81f51cd@suse.com>
 <de797e4f-cab9-a31e-4cf7-5e8996cae5bc@xen.org>
 <06a6b8de-520f-1c62-0f5f-a28eb1d9c7fd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <21064d2f-3c6d-15fc-b967-6e5d10459f46@xen.org>
Date: Wed, 14 Jul 2021 09:51:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <06a6b8de-520f-1c62-0f5f-a28eb1d9c7fd@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 14/07/2021 07:11, Jan Beulich wrote:
> On 13.07.2021 18:33, Julien Grall wrote:
>> Hi,
>>
>> On 13/07/2021 17:27, Jan Beulich wrote:
>>> On 13.07.2021 18:15, Julien Grall wrote:
>>>> On 13/07/2021 16:52, Jan Beulich wrote:
>>>>> On 13.07.2021 16:33, Julien Grall wrote:
>>>>>> On 13/07/2021 15:23, Jan Beulich wrote:
>>>>>>> On 13.07.2021 16:19, Julien Grall wrote:
>>>>>>>> On 13/07/2021 15:14, Jan Beulich wrote:
>>>>>>>>>> And I don't think it should be named XC_PAGE_*, but rather XEN_PAGE_*.
>>>>>>>>>
>>>>>>>>> Even that doesn't seem right to me, at least in principle. There shouldn't
>>>>>>>>> be a build time setting when it may vary at runtime. IOW on Arm I think a
>>>>>>>>> runtime query to the hypervisor would be needed instead.
>>>>>>>>
>>>>>>>> Yes, we want to be able to use the same userspace/OS without rebuilding
>>>>>>>> to a specific hypervisor page size.
>>>>>>>>
>>>>>>>>> And thinking
>>>>>>>>> even more generally, perhaps there could also be mixed (base) page sizes
>>>>>>>>> in use at run time, so it may need to be a bit mask which gets returned.
>>>>>>>>
>>>>>>>> I am not sure to understand this. Are you saying the hypervisor may use
>>>>>>>> at the same time different page size?
>>>>>>>
>>>>>>> I think so, yes. And I further think the hypervisor could even allow its
>>>>>>> guests to do so.
>>>>>>
>>>>>> This is already the case on Arm. We need to differentiate between the
>>>>>> page size used by the guest and the one used by Xen for the stage-2 page
>>>>>> table (what you call EPT on x86).
>>>>>>
>>>>>> In this case, we are talking about the page size used by the hypervisor
>>>>>> to configure the stage-2 page table
>>>>>>
>>>>>>> There would be a distinction between the granularity at
>>>>>>> which RAM gets allocated and the granularity at which page mappings (RAM
>>>>>>> or other) can be established. Which yields an environment which I'd say
>>>>>>> has no clear "system page size".
>>>>>>
>>>>>> I don't quite understand why you would allocate and etablish the memory
>>>>>> with a different page size in the hypervisor. Can you give an example?
>>>>>
>>>>> Pages may get allocated in 16k chunks, but there may be ways to map
>>>>> 4k MMIO regions, 4k grants, etc. Due to the 16k allocation granularity
>>>>> you'd e.g. still balloon pages in and out at 16k granularity.
>>>> Right, 16KB is a multiple of 4KB, so a guest could say "Please allocate
>>>> a contiguous chunk of 4 4KB pages".
>>>>
>>>>    From my understanding, you are suggesting to tell the guest that we
>>>> "support 4KB, 16KB, 64KB...". However, it should be sufficient to say
>>>> "we support 4KB and all its multiple".
>>>
>>> No - in this case it could legitimately expect to be able to balloon
>>> out a single 4k page. Yet that's not possible with 16k allocation
>>> granularity.
>>
>> I am confused... why would you want to put such restriction? IOW, what
>> are you trying to protect against?
> 
> Protect? It may simply be that the most efficient page size is 16k.
> Hence accounting of pages may be done at 16k granularity.

I am assuming you are speaking about accounting in the hypervisor. So...

> IOW there
> then is one struct page_info per 16k page. How would you propose a
> guest would alloc/free 4k pages in such a configuration?
... the hypercall interface would be using 16KB page granularity as a base.

But IIUC, you are thinking to also allow mapping to be done with 4KB. I 
think from the hypercall interface, this should be considered as a subpage.

I am not entirely convinced the subpage size should be exposed in a 
generic hypercall query because only a subset will support it. If all 
were supporting, the base granularity would be the subpage granularity 
rendering the discussion moot....

Anyway, we can discuss that when there is a formal proposal on the ML.

Cheers,

-- 
Julien Grall

