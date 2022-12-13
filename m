Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC7D64AC8C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 01:41:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460011.717800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4tMW-0008Up-Mb; Tue, 13 Dec 2022 00:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460011.717800; Tue, 13 Dec 2022 00:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4tMW-0008Sd-Jx; Tue, 13 Dec 2022 00:41:36 +0000
Received: by outflank-mailman (input) for mailman id 460011;
 Tue, 13 Dec 2022 00:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unTl=4L=zlw.email=sisyphean@srs-se1.protection.inumbo.net>)
 id 1p4tMU-0008SX-UY
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 00:41:35 +0000
Received: from mail.zlw.email (unknown [112.49.95.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de4507f1-7a7e-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 01:41:32 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
 by mail.zlw.email (Postfix) with ESMTP id EC015174161;
 Tue, 13 Dec 2022 00:41:45 +0000 (UTC)
Received: from mail.zlw.email ([127.0.0.1])
 by localhost (mail.zlw.email [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pnm1MAVpsklM; Tue, 13 Dec 2022 08:41:43 +0800 (CST)
Received: from [192.168.66.233] (OpenWrt.lan [192.168.66.1])
 by mail.zlw.email (Postfix) with ESMTPSA id 82D73173F34;
 Tue, 13 Dec 2022 08:41:42 +0800 (CST)
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
X-Inumbo-ID: de4507f1-7a7e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlw.email; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:to:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id; s=dkim; t=
	1670892103; x=1673484104; bh=9ppe57Cy4N/beW2jJ1rZXIEp+DX7nvoB+or
	WJ0OI+qg=; b=kyZgyEGMKtLYoPE1TTo16wsaJIRVbuw+WpCYsuo8zRR9f9UXt2g
	0Szv3sX+VOG2AOyJAM9LIZlckrM99nLg/to8swGHaQ0q65kLpn/9Asf8eCjumoLl
	iOg7apHkS+NW+fkys6kkOD+8aX31bYvV135RKA8hZ0uDq2zAkXjJyJkg=
X-Virus-Scanned: amavisd-new at zlw.email
Message-ID: <757ac91b-150d-53fe-751b-7f42ec447f15@zlw.email>
Date: Tue, 13 Dec 2022 08:41:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [BUG]Add PCIE devie to SMMUv3 fail
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <793eb471-e68b-c3ff-52e8-20d77252c0bf@zlw.email>
 <A9FCD688-3CA2-484A-ADC1-F1235F18890F@arm.com>
 <75bbfc8c-b89f-9478-63af-c37fda0ad3c0@zlw.email>
 <e7766518-275c-1030-e8c0-51a5787a9985@xen.org>
From: sisyphean <sisyphean@zlw.email>
In-Reply-To: <e7766518-275c-1030-e8c0-51a5787a9985@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

在 2022/12/12 18:05, Julien Grall 写道:
>
> On 12/12/2022 05:49, sisyphean wrote:
>> Hi,
>
> Hi,
Sorry for my negligence, I will add a cc to all subsequent emails.
> When submitting a bug report for Arm, can you please CC the Arm 
> maintainers?
>
>> 在 2022/12/9 17:50, Rahul Singh 写道:
>> After setting XEN and kernel as above, I tried the following two 
>> methods to add a PCIE device passthrough:
>>
>> 1. According to your suggestion, use the command xl 
>> pci-assignable-add 0002:21:00.0 to set in the Dom0. But in function
>> iommu_do_pci_domctl,  after device_assigned is called, ENODEV error 
>> is obtained.
>>
>> 2. Add xen-pciback.hide=(0002:21:00.0) to dom0-bootargs in the device 
>> tree, I encountered the same problem as before
>> when initializing the kernel. In function pci_add_device, PCIE 
>> devices cannot be added to SMMUv3.
>>
>> The kernel version I use is 5.10. Does this have an impact?
>>
>> In addition, an error was encountered after XEN enabling ITS:
>>
>> In function gicv3_cpu_init, gicv3_its_setup_collection return 
>> -ETIMEDOUT. This problem was solved after I made the
>> following changes:
>>
>> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
>> index 9558bad..a12c0d1 100644
>> --- a/xen/arch/arm/gic-v3-its.c
>> +++ b/xen/arch/arm/gic-v3-its.c
>> @@ -118,11 +118,11 @@ static int its_send_command(struct host_its 
>> *hw_its, const void *its_cmd)
>>       }
>>
>>       memcpy(hw_its->cmd_buf + writep, its_cmd, ITS_CMD_SIZE);
>> -    if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
>> +    // if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
>
> This is suggesting that the logic in its_map_cbaser() doesn't detect 
> the command queue is uncacheable.
>
> Looking at the code, Xen will write the register with the shareability 
> it wants and then read back to confirm the ITS "accept it". If it 
> didn't accept, then we will use uncacheable.
>
Function its_map_cbaser() is called twice, and the reg values read by 
readq_relaxed(cbasereg)
are 0xB8000000EBD004FF and 0xB8000000EBC004FF respectively
> Can you print the value read from the ITS in its_map_cbaser()?
>
> Cheers,
>
Cheers,

