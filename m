Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830DE2703DE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 20:23:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJL2B-0007FT-QW; Fri, 18 Sep 2020 18:22:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPqB=C3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kJL2A-0007FF-34
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 18:22:58 +0000
X-Inumbo-ID: f6a0877c-df10-43c3-a1ac-96e1e3e1557f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6a0877c-df10-43c3-a1ac-96e1e3e1557f;
 Fri, 18 Sep 2020 18:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=aLlEXVutsIkRsJca/JJZ6Al2MadHXwr0CCJtWR0rJZQ=; b=Fc88fKNa67mPbdZQ+13D8s1G3u
 O52BrBvuC9MAsA+jTazxKKZEEf4neD0xta+HSNJhfjO51zreTFDPjmsRwxO4aIg1PVnSALW7LbBrd
 tuLqZFzY/zEQtouVA/xXpP+IgvXJb7lasDWIsD0ee2/MtzMFrTOKeThsmUUb48Kafnlg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kJL27-0005MO-LU; Fri, 18 Sep 2020 18:22:55 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kJL27-0007x5-Aj; Fri, 18 Sep 2020 18:22:55 +0000
Subject: Re: DT with memory bank of size 0 (WAS: Re: AW: AW: Colibri imx8qxp:
 Missing kernel boot module)
To: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Daniel Wagner2 <Daniel.Wagner2@itk-engineering.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <bdb15b12e6f345249ea8bc685ca88787@itk-engineering.de>
 <b97ddb1f-fa6c-b5ea-4fd8-1d0c09c7a693@xen.org>
 <e421d4214c8a4201a917a9aa833de939@itk-engineering.de>
 <45400b8b-6379-e00e-50de-941bb2ff423c@xen.org>
 <alpine.DEB.2.21.2009161727100.27508@sstabellini-ThinkPad-T480s>
 <da14d8f8-453a-9271-2803-2ffc85ca10ee@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ba3584bf-a187-3b06-30e5-caf37ee9a863@xen.org>
Date: Fri, 18 Sep 2020 19:22:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <da14d8f8-453a-9271-2803-2ffc85ca10ee@arm.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andre,

On 17/09/2020 10:46, André Przywara wrote:
> On 17/09/2020 01:31, Stefano Stabellini wrote:
> 
> Hi,
> 
>> On Wed, 16 Sep 2020, Julien Grall wrote:
>>> On 14/09/2020 15:26, Daniel Wagner2 wrote:
>>>> Hi Julien,
>>>
>>> Hi Daniel,
>>>
>>> I am moving the thread to xen-devel and adding a couple of more folks.
>>>
>>>>>
>>>>>>
>>>>>> this is the full version of the fdt that threw the error:
>>>>>> https://pastebin.com/63TZ9z3k
>>>>>> The problematic memory node appears in line 126
>>>>>
>>>>> Thanks! The output looks corrupted as some of the lines are not valid DTB:
>>>>>
>>>>> fsl,pins = * 0x000000009300184c [0x00000048];
>>>>>
>>>>> Although, I am not sure if it is just U-boot dumping the DTB differently.
>>>>>
>>>>> Anyway, after removing the "corrupted" line, I managed to get a compile
>>>> the
>>>>> DTB. I don't have a Colibri IMX8QXP. However, given this is an early
>>>> parsing
>>>>> error, I have just embed the DTB in Xen binary via CONFIG_DTB_FILE.
>>>>>
>>>>> Unfortunately I couldn't reproduce your error. This either suggests the
>>>> DTB gets
>>>>> corrupted or Xen doesn't access the DTB with the correct memory attribute.
>>>>>
>>>>> Do you have the DTB in hand?
>>>>
>>>> Sorry for the corrupted version, I've uploaded the DTB
>>>> (fsl-imx8qxp-colibri-eval-v3.dtb) to
>>>> https://drive.google.com/drive/folders/1jbpnz35sC0NbCyEjrkLqelBsKBztW1S6?usp
>>>> =sharing
>>>>
>>>> I have also uploaded my modified xen source files.
>>>> 1. arch/arm/bootfdt.c
>>>> where I have added the additional printk's seen in the log and
>>>> 2. arch/arm/setup.c
>>>> where I rerun the devicetree parser in line 935 to get the logs, since the
>>>> console is not yet initialised when the function is called for the first
>>>> time and I
>>>> didn't manage to enable earlyprintk.
>>>>
>>>> I think the breaking point is the second memory bank which appears in the
>>>> logs (see the output line marked with "!!")  with start=0x8 8000 0000 and
>>>> size=0.
>>>> It isn't specified in the DTB, so I am not sure where this comes from.
>>>> It has size=0 so
>>>> if ( !size )
>>>>       {
>>>>           printk("invalid size, bank %d\n",i);
>>>>           return -EINVAL;
>>>>       }
>>>> In bootfdt.c makes the function stop.
>>>>
>>>> Log:
>>>> (XEN) arch/arm/bootfdt.c: early_scan_node
>>>> (XEN) -> fdt: node `memory@80000000': parsing
>>>> (XEN) -> process_memory_node
>>>> (XEN)
>>>> (XEN) arch/arm/bootfdt.c: process_memory_node
>>>> (XEN) ->found memory:reg
>>>> (XEN) ->cell=
>>>> (XEN) ->banks=2
>>>> (XEN) ->mem->nr_banks=1
>>>> (XEN) ->NR_MEM_BANKS=128
>>>> (XEN) ->start=0x80200000 size=0x7fe00000
>>>> !! (XEN) ->start=0x880000000 size=0
>>>> (XEN) invalid size, bank 1
>>>> (XEN) END of arch/arm/bootfdt.c: process_memory_node
>>>
>>> When I tried to run it on the model I get:
>>>
>>> (XEN) device_tree_for_each_node: memory@80000000
>>> (XEN)
>>> (XEN) arch/arm/bootfdt.c: early_scan_node
>>> (XEN) -> fdt: node `memory@80000000': parsing
>>> (XEN) -> process_memory_node
>>> (XEN)
>>> (XEN) arch/arm/bootfdt.c: process_memory_node
>>> (XEN) ->found memory:reg
>>> (XEN) ->cell=
>>> (XEN) ->banks=1
>>> (XEN) ->mem->nr_banks=0
>>> (XEN) ->NR_MEM_BANKS=128
>>> (XEN) ->start=0x80000000 size=0x40000000
>>> (XEN) END of arch/arm/bootfdt.c: process_memory_node
>>>
>>>>
>>>> Btw 8_8000_0000 is the start address of this systems DDR Main memory,
>>>> according to the Reference Manual of the i.MX8QXP.
>>> I couldn't find this value in the DT. It is possible that U-boot is modifying
>>> the memory node before jumping to Xen (or Linux).
> 
> U-Boot almost always rewrites the memory node, filling in its own view
> of DRAM. It's actually not that easy to avoid that.
> This is in U-Boot's colibri-imx8x.h:
> #define CONFIG_SYS_SDRAM_BASE           0x80000000
> #define PHYS_SDRAM_1                    0x80000000
> #define PHYS_SDRAM_2                    0x880000000
> #define PHYS_SDRAM_1_SIZE               SZ_2G           /* 2 GB */
> #define PHYS_SDRAM_2_SIZE               0x00000000      /* 0 GB */
> 
> The Colibri iMX8X SoM seems to support "Up to 2GB LPDDR4", so not sure
> why we have the upper memory here at all. It could just set
> CONFIG_NR_DRAM_BANKS to 1 and be done. But anyway ...
> 
>>> Looking at Linux, they seem to ignore any bank with size == 0. I am starting
>>> to wonder whether your DT is (ab)using it.
>>>
>>> Do you have Linux running on baremetal on this board? If so would you mind to
>>> dump the DT from the userspace (via /proc/device-tree) this time?
>>>
>>> In any case, we may want to relax the check in Xen. Any opinions?
>>
>> Yeah, ignoring a bank with size=0 is fine. I checked the epapr and it
> 
> Not sure you meant this, but the official DT spec replaced ePAPR for a
> while now: https://www.devicetree.org/specifications/
> It has been heavily updated and even got some bug fixes.
> 
>> doesn't specify that size=0 is invalid, so I think it is actually better
>> to ignore it and continue even from a spec perspective.
> 
> Yeah, I don't see any harm as well with ignoring 0 sized banks.

Great! I have sent a patch that should solve this.

> Just not sure if that has any implication with the number of memory
> banks that Xen wants to deal with (it if counts two, but there is only
> one valid one).

It should not have any impact as we store in memory our representation 
of the memory.

Cheers,

-- 
Julien Grall

