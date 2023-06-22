Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB218739CA8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553445.864004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGWu-0003B4-3I; Thu, 22 Jun 2023 09:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553445.864004; Thu, 22 Jun 2023 09:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGWu-00038C-0L; Thu, 22 Jun 2023 09:23:04 +0000
Received: by outflank-mailman (input) for mailman id 553445;
 Thu, 22 Jun 2023 09:23:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qCGWs-000386-5b
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 09:23:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCGWr-00034W-N7; Thu, 22 Jun 2023 09:23:01 +0000
Received: from [54.239.6.188] (helo=[192.168.27.222])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCGWr-0006Zw-Gt; Thu, 22 Jun 2023 09:23:01 +0000
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
	bh=EPSH1MX34Kru+s9HZIupoiehIYNsbUfFMIFk9ZVhnuQ=; b=tvVusF4uYC5Ih4xUmSmJ0wqbSF
	1CIDtC755DXUV0ft9ORG1DOfQ2URdQlaXyZQ/ypJfQ6SlQB3OXTxTWV1JO2UADYTIzIht/RYVfjgg
	2n/Au5MpKqSJ1EebQcPgVhdwjdIQ7vcm/3ilRPVcwDm81Iz9mUZNQbzUwOt2dLs46NUc=;
Message-ID: <030fc5e8-8293-2306-06eb-9275c2a2c9e5@xen.org>
Date: Thu, 22 Jun 2023 10:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52
 processor
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230620151736.3720850-1-ayan.kumar.halder@amd.com>
 <d92e26fb-86d4-1681-0d10-be6c2e2cc846@xen.org>
 <d7701ff7-4cee-800a-69c9-deb8560804d3@amd.com>
 <3b7f584e-700e-4598-f36e-51a96140323e@xen.org>
 <bdaa74a7-8707-62a0-fcc9-24f80772a104@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bdaa74a7-8707-62a0-fcc9-24f80772a104@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 22/06/2023 09:59, Ayan Kumar Halder wrote:
> 
> On 20/06/2023 21:43, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 20/06/2023 19:28, Ayan Kumar Halder wrote:
>>>
>>> On 20/06/2023 17:41, Julien Grall wrote:
>>>> Hi,
>>> Hi Julien,
>>>>
>>>> On 20/06/2023 16:17, Ayan Kumar Halder wrote:
>>>>> Add a special configuration (CONFIG_AARCH32_V8R) to setup the 
>>>>> Cortex-R52
>>>>> specifics.
>>>>>
>>>>> Cortex-R52 is an Arm-V8R AArch32 processor.
>>>>>
>>>>> Refer ARM DDI 0487I.a ID081822, G8-9647, G8.2.112 MIDR,
>>>>> bits[31:24] = 0x41 , Arm Ltd
>>>>> bits[23:20] = Implementation defined
>>>>> bits[19:16] = 0xf , Arch features are individually identified
>>>>> bits[15:4] = Implementation defined
>>>>> bits[3:0] = Implementation defined
>>>>>
>>>>> Thus, the processor id is 0x410f0000 and the processor id mask is
>>>>> 0xff0f0000
>>>>>
>>>>> Also, there is no special initialization required for R52.
>>>>
>>>> Are you saying that Xen upstream + this patch will boot on Cortex-R52?
>>>
>>> This patch will help for earlyboot of Xen. With this patch, 
>>> cpu_init() will work on Cortex-R52.
>>>
>>> There will be changes required for the MPU configuration, but that 
>>> will be sent after Penny's patch serie "[PATCH v2 00/41] xen/arm: Add 
>>> Armv8-R64 MPU support to Xen - Part#1" is upstreamed.
>>>
>>> My aim is to extract the non-dependent changes and send them for review.
>>
>> I can review the patch. But I am not willing to merge it as it gives 
>> the false impression that Xen would boot on Cortex-R52.
>>
>> In fact, I think this patch should only be merged once we have all the 
>> MPU merged.
>>
>> IMHO, patches are independent are rework (e.g. code split...) that 
>> would help the MPU.
> 
> Yes, that's exactly what I intend to do. I will send out the patches 
> (similar to this) which will not be impacted by the MPU changes.
> 
> So, that both as an author/reviewer, it helps to restrict MPU serie to 
> only MPU specific changes. >
> Can you suggest some change to the commit message, so that we can commit 
> it (without giving any false impression that Xen boots on Cortex-R52) >
> May be adding this line to the commit message helps ? >
> "However, Xen does not fully boot on Cortex-R52 as it requires MPU 
> support which is under review. >
> Once Xen is supported on Cortex-R52, SUPPORT.md will be amended to 
> reflect it."

While writing an answer for this patch, I was actually wondering whether 
the CPU allowlist still make sense for the 32-bit ARMv8-R?

 From Armv7-A, we needed it because some CPUs need specific quirk when 
booting. But it would be best if we can get rid of it for 32-bit ARMv8-R.

Looking at your patch, your merely providing stubs. Do you have any plan 
to fill them up?

Cheers,

-- 
Julien Grall

