Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD726C612
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 19:32:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIbGi-0002uH-M7; Wed, 16 Sep 2020 17:30:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCdG=CZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kIbGh-0002uC-Aa
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 17:30:55 +0000
X-Inumbo-ID: ac24004f-0b54-4ba6-963a-05bac8188fc9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac24004f-0b54-4ba6-963a-05bac8188fc9;
 Wed, 16 Sep 2020 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Cc:From:References:To:Subject;
 bh=90TIB7X9cJLPnH3Eex24cOni44wlOWC++6TLykOR2sU=; b=xRJTOcqfZOo4f1SOHqKhXzssHh
 pKisFejsYNdxNtuGZtdgsWMWDWPHf+pxhEF0spkIeO6u7ExJWgThWNCZh5tLQyYKJlv6HTKeRP3eu
 QsTlVCimMbWVY7yy542GbtT9Mgy0a+BRjCl8czZVoyuwbk5c0V3AbluFwSnm9VJkayKM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kIbGc-0004Mr-3r; Wed, 16 Sep 2020 17:30:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kIbGb-00034l-S2; Wed, 16 Sep 2020 17:30:50 +0000
Subject: DT with memory bank of size 0 (WAS: Re: AW: AW: Colibri imx8qxp:
 Missing kernel boot module)
To: Daniel Wagner2 <Daniel.Wagner2@itk-engineering.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <bdb15b12e6f345249ea8bc685ca88787@itk-engineering.de>
 <b97ddb1f-fa6c-b5ea-4fd8-1d0c09c7a693@xen.org>
 <e421d4214c8a4201a917a9aa833de939@itk-engineering.de>
From: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
Message-ID: <45400b8b-6379-e00e-50de-941bb2ff423c@xen.org>
Date: Wed, 16 Sep 2020 18:30:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e421d4214c8a4201a917a9aa833de939@itk-engineering.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/09/2020 15:26, Daniel Wagner2 wrote:
> Hi Julien,

Hi Daniel,

I am moving the thread to xen-devel and adding a couple of more folks.

>>
>>>
>>> this is the full version of the fdt that threw the error:
>>> https://pastebin.com/63TZ9z3k
>>> The problematic memory node appears in line 126
>>
>> Thanks! The output looks corrupted as some of the lines are not valid DTB:
>>
>> fsl,pins = * 0x000000009300184c [0x00000048];
>>
>> Although, I am not sure if it is just U-boot dumping the DTB differently.
>>
>> Anyway, after removing the "corrupted" line, I managed to get a compile
> the
>> DTB. I don't have a Colibri IMX8QXP. However, given this is an early
> parsing
>> error, I have just embed the DTB in Xen binary via CONFIG_DTB_FILE.
>>
>> Unfortunately I couldn't reproduce your error. This either suggests the
> DTB gets
>> corrupted or Xen doesn't access the DTB with the correct memory attribute.
>>
>> Do you have the DTB in hand?
> 
> Sorry for the corrupted version, I've uploaded the DTB
> (fsl-imx8qxp-colibri-eval-v3.dtb) to
> https://drive.google.com/drive/folders/1jbpnz35sC0NbCyEjrkLqelBsKBztW1S6?usp
> =sharing
> 
> I have also uploaded my modified xen source files.
> 1. arch/arm/bootfdt.c
> where I have added the additional printk's seen in the log and
> 2. arch/arm/setup.c
> where I rerun the devicetree parser in line 935 to get the logs, since the
> console is not yet initialised when the function is called for the first
> time and I
> didn't manage to enable earlyprintk.
> 
> I think the breaking point is the second memory bank which appears in the
> logs (see the output line marked with "!!")  with start=0x8 8000 0000 and
> size=0.
> It isn't specified in the DTB, so I am not sure where this comes from.
> It has size=0 so
> if ( !size )
>      {
>          printk("invalid size, bank %d\n",i);
>          return -EINVAL;
>      }
> In bootfdt.c makes the function stop.
> 
> Log:
> (XEN) arch/arm/bootfdt.c: early_scan_node
> (XEN) -> fdt: node `memory@80000000': parsing
> (XEN) -> process_memory_node
> (XEN)
> (XEN) arch/arm/bootfdt.c: process_memory_node
> (XEN) ->found memory:reg
> (XEN) ->cell=
> (XEN) ->banks=2
> (XEN) ->mem->nr_banks=1
> (XEN) ->NR_MEM_BANKS=128
> (XEN) ->start=0x80200000 size=0x7fe00000
> !! (XEN) ->start=0x880000000 size=0
> (XEN) invalid size, bank 1
> (XEN) END of arch/arm/bootfdt.c: process_memory_node

When I tried to run it on the model I get:

(XEN) device_tree_for_each_node: memory@80000000
(XEN)
(XEN) arch/arm/bootfdt.c: early_scan_node
(XEN) -> fdt: node `memory@80000000': parsing
(XEN) -> process_memory_node
(XEN)
(XEN) arch/arm/bootfdt.c: process_memory_node
(XEN) ->found memory:reg
(XEN) ->cell=
(XEN) ->banks=1
(XEN) ->mem->nr_banks=0
(XEN) ->NR_MEM_BANKS=128
(XEN) ->start=0x80000000 size=0x40000000
(XEN) END of arch/arm/bootfdt.c: process_memory_node

> 
> Btw 8_8000_0000 is the start address of this systems DDR Main memory,
> according to the Reference Manual of the i.MX8QXP.
I couldn't find this value in the DT. It is possible that U-boot is 
modifying the memory node before jumping to Xen (or Linux).

Looking at Linux, they seem to ignore any bank with size == 0. I am 
starting to wonder whether your DT is (ab)using it.

Do you have Linux running on baremetal on this board? If so would you 
mind to dump the DT from the userspace (via /proc/device-tree) this time?

In any case, we may want to relax the check in Xen. Any opinions?

Cheers,

-- 
Julien Grall

