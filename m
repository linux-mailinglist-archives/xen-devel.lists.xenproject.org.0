Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF6DA44F8C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 23:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895974.1304648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn36S-0003da-5x; Tue, 25 Feb 2025 22:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895974.1304648; Tue, 25 Feb 2025 22:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn36S-0003au-30; Tue, 25 Feb 2025 22:08:36 +0000
Received: by outflank-mailman (input) for mailman id 895974;
 Tue, 25 Feb 2025 22:08:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tn36R-0003ao-1j
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 22:08:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tn36Q-004q6a-2i;
 Tue, 25 Feb 2025 22:08:34 +0000
Received: from [2a02:8012:3a1:0:7459:3ad7:9235:a91e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tn36Q-005CPz-1D;
 Tue, 25 Feb 2025 22:08:34 +0000
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
	bh=9n4N3eLXrKgFgy9qHkGeXXS3R+PV6de9tG7lKJocNtM=; b=WXdKZZ7i/vOgpfuqF8Tk61O/UU
	8q+WS8ZJDNeCFSygMxJRYmG7w+XfovfKVFaDftJeDAHrms3CuxpbOwWOJdCyWcArKLXqNYISmbu6m
	bYr0rlrCZJpYpq8162P+ZXRHwjW9yd2j4XRiiaFpcuYmw04szcEQ00RobH/hjBgWyRoc=;
Message-ID: <a593bbed-24de-464e-9fea-db988cc61f7b@xen.org>
Date: Tue, 25 Feb 2025 22:08:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
 file
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-4-ayan.kumar.halder@amd.com>
 <18E074A3-A76B-4C9E-A8B4-8E23B07CB7B7@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <18E074A3-A76B-4C9E-A8B4-8E23B07CB7B7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 06/02/2025 15:01, Luca Fancellu wrote:
> Hi Ayan,
> 
>> On 4 Feb 2025, at 19:23, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> For AArch32, refer to ARM DDI 0568A.c ID110520.
>> MPU_REGION_SHIFT is same between AArch32 and AArch64 (HPRBAR).
>> Also, NUM_MPU_REGIONS_SHIFT is same between AArch32 and AArch64
>> (HMPUIR).
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> xen/arch/arm/arm64/mpu/head.S              | 2 +-
>> xen/arch/arm/include/asm/early_printk.h    | 2 +-
>> xen/arch/arm/include/asm/{arm64 => }/mpu.h | 6 +++---
>> 3 files changed, 5 insertions(+), 5 deletions(-)
>> rename xen/arch/arm/include/asm/{arm64 => }/mpu.h (87%)
>>
>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
>> index e4f2021f45..7b659aa42b 100644
>> --- a/xen/arch/arm/arm64/mpu/head.S
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -3,7 +3,7 @@
>>   * Start-of-day code for an Armv8-R MPU system.
>>   */
>>
>> -#include <asm/arm64/mpu.h>
>> +#include <asm/mpu.h>
>> #include <asm/early_printk.h>
>>
>> /* Backgroud region enable/disable */
>> diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
>> index 219705a8b6..644fd0fcfb 100644
>> --- a/xen/arch/arm/include/asm/early_printk.h
>> +++ b/xen/arch/arm/include/asm/early_printk.h
>> @@ -11,7 +11,7 @@
>> #define __ARM_EARLY_PRINTK_H__
>>
>> #include <xen/page-size.h>
>> -#include <asm/arm64/mpu.h>
>> +#include <asm/mpu.h>
>> #include <asm/fixmap.h>
>>
>> #ifdef CONFIG_EARLY_PRINTK
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/mpu.h
> 
> Why not in include/mpu/ ?

Do you mean include/asm/mpu? or something different?

Cheers,

-- 
Julien Grall


