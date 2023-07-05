Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D0748233
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559034.873698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzmb-0004S4-3L; Wed, 05 Jul 2023 10:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559034.873698; Wed, 05 Jul 2023 10:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzma-0004QO-W9; Wed, 05 Jul 2023 10:30:48 +0000
Received: by outflank-mailman (input) for mailman id 559034;
 Wed, 05 Jul 2023 10:30:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGzmY-0004QI-Ov
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:30:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGzmY-0004j5-7I; Wed, 05 Jul 2023 10:30:46 +0000
Received: from [15.248.3.5] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGzmX-0000Mo-UD; Wed, 05 Jul 2023 10:30:46 +0000
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
	bh=/QWmM8v5X95kpNnn1GWfLEzgAH3n+A/TIDoD1UWZVsE=; b=D1uhnmEL/KQeald57T0qCOx0xa
	lyHj17XLcNC9T9WIK+Gsyjay1rLL6IUvFko191fDemll60U6HtIYyUUsK05oFAV5Zui495vDIqXYo
	WiUPlm55gT02we0dICbEjva7gh73miYFfON3CqPpmoQqN6Z4DvULo0Bngl6ZYqbbCjUo=;
Message-ID: <d2c0d251-8b10-c211-48ee-ce547aacbe91@xen.org>
Date: Wed, 5 Jul 2023 11:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 10/52] xen/arm: Move MMU related definitions from
 config.h to mmu/layout.h
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-11-Penny.Zheng@arm.com>
 <ee493a26-234c-876e-e19f-3708c13cb484@xen.org>
 <02cc1edb-1f69-7fd3-a057-e5b04d2e14f4@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <02cc1edb-1f69-7fd3-a057-e5b04d2e14f4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Penny,

On 05/07/2023 07:51, Penny Zheng wrote:
> On 2023/7/5 05:54, Julien Grall wrote:
>> Hi Penny,
>>
>> On 26/06/2023 04:34, Penny Zheng wrote:
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> Xen defines some global configuration macros for Arm in config.h.
>>> We still want to use it for MMU systems, but there are some address
>>
>> Did you mean MPU?
>>
> 
> yes, typo
> 
>>> layout related definitions that are defined for MMU systems only.
>>> These definitions could not be used by MPU systems, but adding
>>> ifdefery with CONFIG_HAS_MPU to gate these definitions will result
>>> in a messy and hard-to-read/maintain code.
>>>
>>> So we keep some common definitions still in config.h, but move MMU
>>> related definitions to a new file - mmu/layout.h to avoid spreading
>>> "#ifdef" everywhere.
>>
>> Just to ease the review, can you add some details which one are 
>> considered common?
>>
> 
> Sure,
> IMO， the only part left in common is as follows:
> ```
> #ifdef CONFIG_ARM_64
> 
> #define FRAMETABLE_SIZE        GB(32)
> #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
> 
> #endif
> ```

Hmmm... Looking at the result of the patch, you moved FRAMETABLE_SIZE 
and FRAMETABLE_NR in layout.h. Also, I can't find any layout specific 
define in config.h. So I think the paragraph could be dropped.

> I couldn't figure a proper way to remove the limit for MPU system.
> 
> when calculating variable "pdx_group_valid", which is defined as
> ```
> unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
>      (FRAMETABLE_NR + PDX_GROUP_COUNT - 1)/PDX_GROUP_COUNT)] = {[0] = 1}
> '''
> 
> It relies on FRAMETABLE_NR to limit array length. If we are trying to
> get rid of the limit for the MPU, it may bring a lot of changes in pdx 
> common codes, like, variable "pdx_group_valid" needs to be allocated in 
> runtime, according actual frametable size, at least for MPU case.

The main problem is that, at least on Arm, the PDX is initialized before 
you can allocate any memory. You should be able to re-order the code so 
we populate the boot allocator first.

But I don't think this is worth it right now as, if I am not mistaken, 
the pdx_group_valid is only 256 bytes on Arm64.

Cheers,

-- 
Julien Grall

