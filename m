Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44235AFFBB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401028.642691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqsu-0001yb-I8; Wed, 07 Sep 2022 08:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401028.642691; Wed, 07 Sep 2022 08:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqsu-0001vt-Em; Wed, 07 Sep 2022 08:58:12 +0000
Received: by outflank-mailman (input) for mailman id 401028;
 Wed, 07 Sep 2022 08:58:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVqss-0001vj-GE
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:58:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVqsq-00012w-CO; Wed, 07 Sep 2022 08:58:08 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVqsq-0006bM-6X; Wed, 07 Sep 2022 08:58:08 +0000
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
	bh=VUbqJmt1GBh5wKmVFTn8dV5334U/+OJNk5veKJ13S70=; b=pqS2y52C/ZgW6+NN2bBTFK9xiT
	UCVc3mMywq151sQwAGs1OSMjcZRyHHR2EXh4aJZFdxmHgCU5buJuHRvCotAn98tcnnUvkvAcg7GLs
	mOSyBGu3H75pljPI85/NyWnBSG52PKmf/YObpgpwUGdb6m6GWwEAOn52pqK1Nm4kHezo=;
Message-ID: <5948f099-7287-2743-aa24-3c7a17033877@xen.org>
Date: Wed, 7 Sep 2022 09:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, Rahul Singh <rahul.singh@arm.com>
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021719270.3931@ubuntu-linux-20-04-desktop>
 <f40f1ac1-fe19-9d62-06d0-b049d4edcd85@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f40f1ac1-fe19-9d62-06d0-b049d4edcd85@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan & Stefano,

On 06/09/2022 09:53, Jan Beulich wrote:
> On 03.09.2022 02:24, Stefano Stabellini wrote:
>> On Thu, 1 Sep 2022, Rahul Singh wrote:
>>> @@ -363,6 +373,39 @@ int __init pci_host_bridge_mappings(struct domain *d)
>>>       return 0;
>>>   }
>>>   
>>> +static int is_bar_valid(const struct dt_device_node *dev,
>>> +                        uint64_t addr, uint64_t len, void *data)
>>> +{
>>> +    struct pdev_bar *bar_data = data;
>>> +    unsigned long s = mfn_x(bar_data->start);
>>> +    unsigned long e = mfn_x(bar_data->end);
>>> +
>>> +    if ( (s <= e) && (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )
>>> +        bar_data->is_valid =  true;
>>
>>
>> This patch looks good and you addressed all Jan's comment well. Before I
>> ack it, one question.
>>
>> I know that you made this change to address Jan's comment but using
>> PFN_DOWN for the (s >= PFN_DOWN(addr)) check and PFN_UP for the (e <=
>> PFN_UP(addr + len - 1)) check means that we are relaxing the
>> requirements, aren't we?
>>
>> I know that this discussion is a bit pointless because addr and len should
>> always be page aligned, and if they weren't it would be a mistake.

Hmmm.... Is that requirement written down somewhere? The reason I am 
asking is "page-aligned" will vary depending on the software. In the 
past we had a couple of cases where the region would be 4KB-aligned but 
not necessarily 64KB-aligned.

If the answer is no to my question then...

> But
>> assuming that they are not page aligned, wouldn't we want this check to
>> be a strict as possible?
>>
>> Wouldn't we want to ensure that the [s,e] range is a strict subset of
>> [addr,addr+len-1] ? If so we would need to do the following instead:
>>
>>      if ( (s <= e) && (s >= PFN_UP(addr)) && (e <= PFN_DOWN(addr + len - 1)) )
>>          bar_data->is_valid =  true;
> 
> But that might mean (in theory at least) a partial overlap, which has
> to be avoided. The only alternative that I see to Rahul's original
> code is to omit use of PFN_DOWN() and PFN_UP() in this construct
> altogether. Assuming that's correct for the passed in (addr,len)
> tuple.

... I think we would want to drop PFN_DOWN/PFN_UP here.

Cheers,

-- 
Julien Grall

