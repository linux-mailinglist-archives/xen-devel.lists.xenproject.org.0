Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493121D1D57
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 20:21:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYvzA-0006U1-2S; Wed, 13 May 2020 18:20:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mb4t=63=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jYvz7-0006D8-Qu
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 18:20:01 +0000
X-Inumbo-ID: 5bb291b7-9546-11ea-a3f1-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bb291b7-9546-11ea-a3f1-12813bfff9fa;
 Wed, 13 May 2020 18:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8M5LPu96qCWo9M3ouaNwpZgV7DJQdhFtxTpmVytz0AY=; b=JNcTXvRnMJgPF9Qb51FzU4/ZR2
 t5vPM0Rtf8wf4bGUlNmBZuMsjZc9bvTL5Fy21o0c1eBOBoCTopVpxbTo7D90t1e12G1yNd5+0Mb4m
 8du26szNZq0nl0D5eyXJx4SPz+6/S5LGa1BhDWJg3jfuDWA/cgYbSvG/NRaiz5KsEVDg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jYvz4-0005e7-Vm; Wed, 13 May 2020 18:19:58 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jYvz4-00027p-N4; Wed, 13 May 2020 18:19:58 +0000
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <CAMmSBy-w1HOyGGCjB_nJcn2xw+4sNdDrtJ8PC3foaxJOtdRmnQ@mail.gmail.com>
 <alpine.DEB.2.21.2005042004500.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy-yymEGQcuUBHZi-tL9ra7x9nDv+ms8SLiZr1H=BpHUiQ@mail.gmail.com>
 <alpine.DEB.2.21.2005051508180.14706@sstabellini-ThinkPad-T480s>
 <9ee0fb6f-98df-d993-c42e-f47270bf2eaa@suse.com>
 <DB6PR0402MB2760AF88FE7E3DF47401BE5988A40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CADz_WD5Ln7Pe1WAFp73d2Mz9wxspzTE3WgAJusp5S8LX4=83Bw@mail.gmail.com>
 <2187cd7c-4d48-986b-77d6-4428e8178404@oracle.com>
 <CADz_WD68bYj-0CSm_zib+LRiMGd1+1eoNLgiJj=vHog685Khsw@mail.gmail.com>
 <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy_wcSD3BVcVFJVR1y1CtvxA9xMkobKwbsdf8dGxS5Hcbw@mail.gmail.com>
 <alpine.DEB.2.21.2005121723240.26167@sstabellini-ThinkPad-T480s>
 <42253259-9663-67e8-117f-8ba631243585@xen.org>
 <alpine.DEB.2.21.2005130810270.26167@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <d940d405-5706-c749-f546-c0c60528394d@xen.org>
Date: Wed, 13 May 2020 19:19:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005130810270.26167@sstabellini-ThinkPad-T480s>
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
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>,
 "minyard@acm.org" <minyard@acm.org>, roman@zededa.com,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 13/05/2020 16:11, Stefano Stabellini wrote:
> On Wed, 13 May 2020, Julien Grall wrote:
>> Hi,
>>
>> On 13/05/2020 01:33, Stefano Stabellini wrote:
>>> I worked with Roman to do several more tests and here is an update on
>>> the situation. We don't know why my patch didn't work when Boris' patch
>>> [1] worked.  Both of them should have worked the same way.
>>>
>>> Anyway, we continued with Boris patch to debug the new mmc error which
>>> looks like this:
>>>
>>> [    3.084464] mmc0: unrecognised SCR structure version 15
>>> [    3.089176] mmc0: error -22 whilst initialising SD card
>>>
>>> I asked to add a lot of trancing, see attached diff.
>>
>> Please avoid attachment on mailing list and use pastebin for diff.
>>
>>> We discovered a bug
>>> in xen_swiotlb_init: if io_tlb_start != 0 at the beginning of
>>> xen_swiotlb_init, start_dma_addr is not set correctly. This oneline
>>> patch fixes it:
>>>
>>> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
>>> index 0a40ac332a4c..b75c43356eba 100644
>>> --- a/drivers/xen/swiotlb-xen.c
>>> +++ b/drivers/xen/swiotlb-xen.c
>>> @@ -191,6 +191,7 @@ int __ref xen_swiotlb_init(int verbose, bool early)
>>>            * IO TLB memory already allocated. Just use it.
>>>            */
>>>           if (io_tlb_start != 0) {
>>> +               start_dma_addr = io_tlb_start;
>>>                   xen_io_tlb_start = phys_to_virt(io_tlb_start);
>>>                   goto end;
>>>           }
>>>
>>> Unfortunately it doesn't solve the mmc0 error.
>>>
>>>
>>> As you might notice from the logs, none of the other interesting printks
>>> printed anything, which seems to mean that the memory allocated by
>>> xen_swiotlb_alloc_coherent and mapped by xen_swiotlb_map_page should be
>>> just fine.
>>>
>>> I am starting to be out of ideas. Do you guys have any suggestions on
>>> what could be the issue or what could be done to discover it?
>>
>> Sorry if my suggestions are going to be obvious, but I can't confirm whether
>> this was already done:
>>      1) Does the kernel boot on baremetal (i.e without Xen)? This should help
>> to confirm whether the bug is Xen is related.
> 
> Yes it boots
> 
>>      2) Swiotlb should not be necessary for basic dom0 boot on Arm. Did you try
>> to disable it? This should help to confirm whether swiotlb is the problem or
>> not.
> 
> It boots disabling swiotlb-xen

Thank you for the answer! swiotlb-xen should basically be a NOP for 
dom0. So this suggests swiotlb is doing some transformation on the DMA 
address.

I have an idea what may have gone wrong. AFAICT, xen-swiotlb seems to 
assume the DMA address space and CPU address space is the same. Is RPI 
using the same address space?

As an aside, I can't find the 1=== and === from the log in your diff. So 
I am not entirely which path is used. Can you provide the associated log 
with your diff?

Cheers,

-- 
Julien Grall

