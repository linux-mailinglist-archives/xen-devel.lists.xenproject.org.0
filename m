Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12F78CE62A
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 15:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729563.1134760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUwG-0004zJ-9R; Fri, 24 May 2024 13:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729563.1134760; Fri, 24 May 2024 13:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUwG-0004wv-6e; Fri, 24 May 2024 13:26:28 +0000
Received: by outflank-mailman (input) for mailman id 729563;
 Fri, 24 May 2024 13:26:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAUwE-0004wp-Q4
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 13:26:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAUwE-0002Ax-FS; Fri, 24 May 2024 13:26:26 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAUwE-0003ns-8B; Fri, 24 May 2024 13:26:26 +0000
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
	bh=jac7bR+7bZ91CBiafCoUuw2taOp9HF8ytcW5DOkX+yY=; b=ckH/Xw9AD01MtB0OqeppC4ttLp
	ve4moZr9puFECrb18h0qujPo3CO71yQjuaZBuRClUBIGtM0eCjK/Y4oaCbHoxXKd6g8pvZ/nQtbAr
	Uf/My2rOL5Zum2XKQRYAOlJ0CxnCA5Andxm2O3Frd1bnct4SQKLUTubo0nsiuAavmbYI=;
Message-ID: <69f9c0b7-b3f3-49bb-9f9a-42c6ef6d0edc@xen.org>
Date: Fri, 24 May 2024 14:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: Set correct per-cpu cpu_core_mask
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Henry Wang <xin.wang2@amd.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20240321035706.165253-1-xin.wang2@amd.com>
 <9deeb66d-1a69-442e-a860-08006067ff44@amd.com>
 <e724dd97-03fc-4136-9a53-94bbddce160f@amd.com>
 <e81356e7-fcf2-4fdb-8585-e544ac4a15df@amd.com>
 <e9e188ef-6de5-4cc7-8edd-dd7d004670de@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e9e188ef-6de5-4cc7-8edd-dd7d004670de@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/05/2024 08:57, Michal Orzel wrote:
> 
> 
> On 21/05/2024 09:51, Henry Wang wrote:
>> Hi Michal,
>>
>> On 5/21/2024 3:47 PM, Michal Orzel wrote:
>>> Hi Henry.
>>>
>>> On 3/21/2024 11:57 AM, Henry Wang wrote:
>>>>> In the common sysctl command XEN_SYSCTL_physinfo, the value of
>>>>> cores_per_socket is calculated based on the cpu_core_mask of CPU0.
>>>>> Currently on Arm this is a fixed value 1 (can be checked via xl info),
>>>>> which is not correct. This is because during the Arm CPU online
>>>>> process at boot time, setup_cpu_sibling_map() only sets the per-cpu
>>>>> cpu_core_mask for itself.
>>>>>
>>>>> cores_per_socket refers to the number of cores that belong to the same
>>>>> socket (NUMA node). Currently Xen on Arm does not support physical
>>>>> CPU hotplug and NUMA, also we assume there is no multithread. Therefore
>>>>> cores_per_socket means all possible CPUs detected from the device
>>>>> tree. Setting the per-cpu cpu_core_mask in setup_cpu_sibling_map()
>>>>> accordingly. Modify the in-code comment which seems to be outdated. Add
>>>>> a warning to users if Xen is running on processors with multithread
>>>>> support.
>>>>>
>>>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> Thanks.
>>
>>>>>     /* ID of the PCPU we're running on */
>>>>>     DEFINE_PER_CPU(unsigned int, cpu_id);
>>>>> -/* XXX these seem awfully x86ish... */
>>>>> +/*
>>>>> + * Although multithread is part of the Arm spec, there are not many
>>>>> + * processors support multithread and current Xen on Arm assumes there
>>> NIT: s/support/supporting
>>
>> Sorry, it should have been spotted locally before sending. Anyway, I
>> will correct this in v4 with your Reviewed-by tag taken. Thanks for
>> pointing this out.
> I don't think there is a need to resend a patch just for fixing this typo. It can be done on commit.

Fixed and committed.

Cheers,

> 
> ~Michal
> 

-- 
Julien Grall

