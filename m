Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0398F20390A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 16:24:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnNM2-00051q-LQ; Mon, 22 Jun 2020 14:23:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O88q=AD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jnNM0-00051l-PD
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 14:23:20 +0000
X-Inumbo-ID: ebc940bc-b493-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebc940bc-b493-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jrqxFqIC+BTFC5+kkr7QfOjtcOsp2KVBBk4aYROktng=; b=XjzQoSxUqaxjTz6weSsCiKgxpH
 glhMT9cWM/7Ll0b9/N/DMGtg/MuKBxdOvoZ+TcY/uTVj8+eZ4C1G7vlDvQqnsfOf05L7bJEx641Cf
 2/vgGickwM7Y5WgSRnLbRA/OAmPdebPcO3ZlhUrdgRzuq7toh9OnenfkYsRWsE6i9SIQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnNLz-0008V3-7l; Mon, 22 Jun 2020 14:23:19 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnNLy-0003Um-WC; Mon, 22 Jun 2020 14:23:19 +0000
Subject: Re: UEFI support in ARM DomUs
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <17a14578-6fc7-925d-6f69-8b2fcbf40ff3@epam.com>
 <9d4a6e78-49d3-01c3-251b-6d66f56c2761@xen.org>
 <ebf32205-55b0-8a40-1935-d3591be058ce@epam.com>
 <d7334aea-363e-49f6-f8c3-336e3c20eb0f@xen.org>
 <424cfbdc-0744-fcf7-5bb4-52aca2357df7@epam.com>
 <b3e805ef-fb0d-308c-57fb-e7b78f82a786@xen.org>
 <e40308c0-6a0e-a32c-b36e-ef0620a9b9a9@gmail.com>
 <e0148721-7889-0b77-2f99-568a6150a101@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0f1e6ee7-3cd9-87ed-f18e-7c135eb9233e@xen.org>
Date: Mon, 22 Jun 2020 15:23:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e0148721-7889-0b77-2f99-568a6150a101@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 22/06/2020 14:56, Oleksandr Andrushchenko wrote:
> 
> On 6/19/20 4:29 PM, Oleksandr Andrushchenko wrote:
>> On 6/19/20 4:15 PM, Julien Grall wrote:
>>>
>>>
>>> On 19/06/2020 14:06, Oleksandr Andrushchenko wrote:
>>>>
>>>> On 6/19/20 3:59 PM, Julien Grall wrote:
>>>>> Hi,
>>>>>
>>>>> On 19/06/2020 13:51, Oleksandr Andrushchenko wrote:
>>>>>> On 6/19/20 3:47 PM, Julien Grall wrote:
>>>>>>> They will not be available from the fdt, but you can retrieve them with an hypervisor call (see HVM_PARAM_STORE_PFN, HVM_PARAM_CONSOLE_PFN).
>>>>>> Yes, and it used in the relevant pieces of code (hyp calls)
>>>>>>> One question though, why do you need to map them in advance? Couldn't you map them on demand?
>>>>>>
>>>>>> Well, we need to at least estimate the pg_table size so we can reserve and allocate memory later,
>>>>>
>>>>> Oh, so U-boot doesn't support runtime page-table table allocation. Is that right?
>>>> As per my understanding no, we provide a memory map and the tables are allocated beforehand
>>>
>>> Ok :(.
>>>
>>>>>
>>>>>>
>>>>>> so I have to provide memory range from either by coding a constant or looking into the devtree at
>>>>>>
>>>>>> hypervisor { reg = <>; }. It is a bit tricky though
>>>>>
>>>>> Looking for a node in the device-tree shouldn't be too difficult given that you have fdt_* available.
>>>>>
>>>>> However, please not that <reg> doesn't refer to the guest magic pages. Instead, it provides a region you can use for mapping the grant-table frames
>>>>
>>>> Indeed, this is in my case 0x38000000, but the magic is at 0x39000000
>>>>
>>>> So, I need the memory range set up beforehand, but I can't as there is no cute way to get that.
>>>>
>>>> Of course, I can issue a hyp call to get HVM_PARAM_CONSOLE_PFN and use it as the base address,
>>>>
>>>> but this smells like a hack. I can call other HVM_PARAM_ to get their pfns and set up the memory regions,
>>>>
>>>> but this looks a bit weird.
>>>
>>> Why is it weird? In general, you only want to map exactly what you need. Not less, not more.
>>>
>>> In your situation, you only care about two pages, the console page and the xenstore page. The rest shouldn't be mapped.
>> Ok, so I'll try get pfns for HVM_PARAM_CONSOLE_PFN + XENSTORE_PFN_OFFSET via hyp call and map those
>>>
>>>> I need that constant badly ;)
>>>
>>> No you don't ;).
> 
> We have managed to make use of the relevant hypercalls to get the PFNs, but for that
> 
> we need to maintain the caches as this happens (the calls) when MMU is not yet
> 
> setup and is in the process of.

Glad to hear it works. Yes, that's unfortunately the drawback of using 
hypercalls with MMU off. But at least you make U-boot more generic :).

Cheers,

-- 
Julien Grall

