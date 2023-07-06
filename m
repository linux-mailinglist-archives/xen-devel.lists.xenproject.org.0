Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B47474971D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559758.875048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHK2k-00016P-NZ; Thu, 06 Jul 2023 08:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559758.875048; Thu, 06 Jul 2023 08:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHK2k-00014W-KQ; Thu, 06 Jul 2023 08:08:50 +0000
Received: by outflank-mailman (input) for mailman id 559758;
 Thu, 06 Jul 2023 08:08:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHK2j-00014M-MX
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:08:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHK2j-0002u7-48; Thu, 06 Jul 2023 08:08:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHK2i-0007CK-UJ; Thu, 06 Jul 2023 08:08:49 +0000
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
	bh=wi+CY5hp1ZexLwyeibtj/Eu1V6QpPqKpCLFWMgelhMA=; b=kNxUKcKbJJgscati7BY2rfXQzM
	JCNEEf54Ui8eLXs6xspYO1YvBED9DcMfZWn8CH3Vdt30TIBlwzNoOTerZFarLWsts409tzr04/JxZ
	KdAMLbuKP/RAZpIixXbPanVXZIHeWI1D7UmugDaaa0CTFvbP0y3gIlTaBu4TALUGfPbQ=;
Message-ID: <d64d1ba6-7826-bc75-e8f1-ac597aa675e2@xen.org>
Date: Thu, 6 Jul 2023 09:08:47 +0100
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
 <d2c0d251-8b10-c211-48ee-ce547aacbe91@xen.org>
 <f731455a-0639-d0fb-62cc-544347ce6e1d@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f731455a-0639-d0fb-62cc-544347ce6e1d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Penny,

On 06/07/2023 08:36, Penny Zheng wrote:
> Hi Julien
> 
> On 2023/7/5 18:30, Julien Grall wrote:
>> Hi Penny,
>>
>> On 05/07/2023 07:51, Penny Zheng wrote:
>>> On 2023/7/5 05:54, Julien Grall wrote:
>>>> Hi Penny,
>>>>
>>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>>> From: Wei Chen <wei.chen@arm.com>
>>>>>
>>>>> Xen defines some global configuration macros for Arm in config.h.
>>>>> We still want to use it for MMU systems, but there are some address
>>>>
>>>> Did you mean MPU?
>>>>
>>>
>>> yes, typo
>>>
>>>>> layout related definitions that are defined for MMU systems only.
>>>>> These definitions could not be used by MPU systems, but adding
>>>>> ifdefery with CONFIG_HAS_MPU to gate these definitions will result
>>>>> in a messy and hard-to-read/maintain code.
>>>>>
>>>>> So we keep some common definitions still in config.h, but move MMU
>>>>> related definitions to a new file - mmu/layout.h to avoid spreading
>>>>> "#ifdef" everywhere.
>>>>
>>>> Just to ease the review, can you add some details which one are 
>>>> considered common?
>>>>
>>>
>>> Sure,
>>> IMO， the only part left in common is as follows:
>>> ```
>>> #ifdef CONFIG_ARM_64
>>>
>>> #define FRAMETABLE_SIZE        GB(32)
>>> #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>>>
>>> #endif
>>> ```
>>
>> Hmmm... Looking at the result of the patch, you moved FRAMETABLE_SIZE 
>> and FRAMETABLE_NR in layout.h. Also, I can't find any layout specific 
>> define in config.h. So I think the paragraph could be dropped.
>>
> 
> That's because I define this same snippet in both mmu/layout.h and
> mpu/layout.h, see [PATCH v3 23/52] xen/arm: create mpu/layout.h for MPU 
> related address definitions.
> So it is common for both mmu/layout.h and mpu/layout.h.
This is different from what you wrote in the commit message:

"So we keep some common definitions still in config.h"

 From the perspective of this patch you moved everything related to the 
layout in mmu/layout.h. Whether there might be duplication in the future 
is a different subject.

In this case, I would prefer the duplication because the size of the 
frametable really depend on how you configure the layout. So it should 
stay close the rest of the defines.

Cheers,

-- 
Julien Grall

