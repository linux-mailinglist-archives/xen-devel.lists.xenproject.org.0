Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D28A9C3FC3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:46:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833893.1249131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUjY-0002lv-OZ; Mon, 11 Nov 2024 13:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833893.1249131; Mon, 11 Nov 2024 13:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUjY-0002jb-Li; Mon, 11 Nov 2024 13:45:36 +0000
Received: by outflank-mailman (input) for mailman id 833893;
 Mon, 11 Nov 2024 13:45:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tAUjX-0002jV-EE
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:45:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tAUjW-0004qX-2a;
 Mon, 11 Nov 2024 13:45:35 +0000
Received: from [2a02:8012:3a1:0:1d0e:424f:5402:6713]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tAUjW-000DRT-2c;
 Mon, 11 Nov 2024 13:45:34 +0000
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
	bh=NkVYULasFeOSx6rhvEyfhS/dt1EpTQMJzqfS20eLfzA=; b=HEzNw6PTX9yhu9NxmlsqNnhpE9
	FjPOslGcpRI4yPnY26/Nj3G/9R1KNqFqiQSzwK5Q8bTRkRlJTB5cGaCUHE81oUr75ZON+XxTVxcMD
	nVJHxuVsjIZtkUsVZt2SXhrKtFvpkrVioBJkCRmCOqsfNpK1Z9S/QbwB8haCgJFnDESU=;
Message-ID: <6dc2ebd8-d206-479b-ac3a-83ed59c7109f@xen.org>
Date: Mon, 11 Nov 2024 13:45:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>
References: <20241108195918.856412-1-ayan.kumar.halder@amd.com>
 <80ac1e78-5259-43d2-8b18-d5bd3abdca1b@xen.org>
 <2ca98e9c-1a4b-43a2-b707-097dc5093e39@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2ca98e9c-1a4b-43a2-b707-097dc5093e39@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 11/11/2024 13:24, Ayan Kumar Halder wrote:
> On 11/11/2024 11:12, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> On 08/11/2024 19:59, Ayan Kumar Halder wrote:
>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>
>>> In Xen, SMMU subsystem is supported for MMU system only. The reason 
>>> being SMMU
>>> driver uses the same page tables as MMU.
>>> Thus, we make it dependent on CONFIG_MMU.
>>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@arm.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>   xen/arch/arm/Kconfig            | 2 +-
>>>   xen/drivers/passthrough/Kconfig | 3 ++-
>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 15b2e4a227..3699e148e9 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -16,7 +16,7 @@ config ARM
>>>       select HAS_DEVICE_TREE
>>>       select HAS_PASSTHROUGH
>>>       select HAS_UBSAN
>>> -    select IOMMU_FORCE_PT_SHARE
>>> +    select IOMMU_FORCE_PT_SHARE if MMU
>>
>> Realistically, everything under drivers/passthrough is MMU specific. 
>> So does it actually make any sense to select HAS_PASSTHROUGH right now?
> 
> Actually we are able to assign devices to different DomUs (eg UART1 to 
> domU1) as long as the device isn't behind an IOMMU. So in our case, the 
> passthrough device tree has this node
> 
>          uart@9c0b0000 {
>              compatible = "arm,pl011\0arm,primecell";
>              reg = <0x00 0x9c0b0000 0x00 0x10000>;
>              interrupt-parent = <0x01>;
>              interrupts = <0x00 0x07 0x04>;
>              clock-names = "uartclk\0apb_pclk";
>              clocks = <0x06 0x07>;
>              xen,path = "/uart@9c0b0000";
>              xen,reg = <0x00 0x9c0b0000 0x00 0x10000 0x00 0x9c0b0000>;
>              xen,force-assign-without-iommu;

So how devices will be protected on an MPU systems?

 >          };> So, should we still disable HAS_PASSTHROUGH for MPU ?

While it may work, a lot of code in drivers/passthrough is IOMMU 
specific (see all the function named iommu_*). So I find really odd that 
you disable IOMMU_FORCE_PT_SHARE but all the rest is still present...

I think we need some consistency. If you are planning to do device 
passthrough without any protection, then I don't think you need any code 
within drivers/passthrough/ (at least for platform devices).

Overall, for this patch, I think it would be better to simply select 
HAS_PASSTHROUGH when MMU is enabled. We can revisit device passthrough 
once we have the patches on the ML.

BTW, I think it should be move under the Kconfig MMU rather than using 
"if MMU".

Cheers,

-- 
Julien Grall


