Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02AA5B0433
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401602.643469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuSv-0004W4-FP; Wed, 07 Sep 2022 12:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401602.643469; Wed, 07 Sep 2022 12:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuSv-0004Tv-CP; Wed, 07 Sep 2022 12:47:37 +0000
Received: by outflank-mailman (input) for mailman id 401602;
 Wed, 07 Sep 2022 12:47:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVuSu-0004Tp-N0
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:47:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVuSt-0005WH-ID; Wed, 07 Sep 2022 12:47:35 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVuSt-0001LZ-C2; Wed, 07 Sep 2022 12:47:35 +0000
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
	bh=b7uthS8reF8CyMo9QEd2n1PaOzooUpB9Fq0QYgkDbCM=; b=tYOrNJ370+etQGvXJtbecxMhtr
	uzHwwPVg4/pYd0Q5GzJx5vcy6ugS6adsgeIa0w8828+FX0n1JyDNfX73heWR7HFFQnr7KKUCXESrY
	/6a8kB8pFsWXWTAZEP6hLUN3RdqnXOYZFn3I/fZ9BEu3EDOfelBS4UjOOgkYoYIbx870=;
Message-ID: <acb4f7de-61fc-7d73-7fe5-8e73b57ec583@xen.org>
Date: Wed, 7 Sep 2022 13:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, Rahul Singh
 <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021719270.3931@ubuntu-linux-20-04-desktop>
 <f40f1ac1-fe19-9d62-06d0-b049d4edcd85@suse.com>
 <5948f099-7287-2743-aa24-3c7a17033877@xen.org>
 <4ac67001-9406-6cac-b032-b6cbefb598b5@suse.com>
 <4f070d84-a732-3166-ad6c-2c15e6cfc882@xen.org>
 <e5929d69-6dee-c755-b9e8-e6585a51ef6d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e5929d69-6dee-c755-b9e8-e6585a51ef6d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2022 13:01, Jan Beulich wrote:
> On 07.09.2022 12:00, Julien Grall wrote:
>> On 07/09/2022 10:07, Jan Beulich wrote:
>>> On 07.09.2022 10:58, Julien Grall wrote:
>>>> On 06/09/2022 09:53, Jan Beulich wrote:
>>>>> On 03.09.2022 02:24, Stefano Stabellini wrote:
>>>>>> On Thu, 1 Sep 2022, Rahul Singh wrote:
>>>>>>> @@ -363,6 +373,39 @@ int __init pci_host_bridge_mappings(struct domain *d)
>>>>>>>         return 0;
>>>>>>>     }
>>>>>>>     
>>>>>>> +static int is_bar_valid(const struct dt_device_node *dev,
>>>>>>> +                        uint64_t addr, uint64_t len, void *data)
>>>>>>> +{
>>>>>>> +    struct pdev_bar *bar_data = data;
>>>>>>> +    unsigned long s = mfn_x(bar_data->start);
>>>>>>> +    unsigned long e = mfn_x(bar_data->end);
>>>>>>> +
>>>>>>> +    if ( (s <= e) && (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )
>>>>>>> +        bar_data->is_valid =  true;
>>>>>>
>>>>>>
>>>>>> This patch looks good and you addressed all Jan's comment well. Before I
>>>>>> ack it, one question.
>>>>>>
>>>>>> I know that you made this change to address Jan's comment but using
>>>>>> PFN_DOWN for the (s >= PFN_DOWN(addr)) check and PFN_UP for the (e <=
>>>>>> PFN_UP(addr + len - 1)) check means that we are relaxing the
>>>>>> requirements, aren't we?
>>>>>>
>>>>>> I know that this discussion is a bit pointless because addr and len should
>>>>>> always be page aligned, and if they weren't it would be a mistake.
>>>>
>>>> Hmmm.... Is that requirement written down somewhere?
>>>
>>> What do you mean here? Isn't it quite obvious that every byte in the
>>> address space may only be used for a single purpose? I.e. if a byte
>>> is covered by a BAR, it cannot also be covered by a RAM region or
>>> yet something else (e.g. MMIO beyond BARs of PCI devices). What
>>> happens if BAR and RAM indeed overlap depends on fabric and chipset,
>>> but it'll either result in chaos if two parties respond to a single
>>> request on the bus, or it'll be (hopefully) deterministic (for any
>>> individual system) which of the two takes "precedence".
>>
>> I am well aware about that and I am not sure how you implied this is
>> what I was referring to from what I wrote (in particular if you read the
>> next sentence).
>>
>> Stefano wrote that it would be a mistake if the address/length is not
>> page-aligned. However, I am not aware from such requirement written
>> down. It seems to be more an expected common sense that was IIRC not
>> always respected on HW supporting multiple page-granularity.
> 
> I guess the question was then solely directed at Stefano? 

This question yes. The rest was a reply to your suggestion. I will wait 
for Stefano to answer.

Cheers,

-- 
Julien Grall

