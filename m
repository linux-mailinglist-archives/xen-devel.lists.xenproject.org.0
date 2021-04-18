Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD40436370F
	for <lists+xen-devel@lfdr.de>; Sun, 18 Apr 2021 19:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112514.214648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYBXS-000401-Ut; Sun, 18 Apr 2021 17:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112514.214648; Sun, 18 Apr 2021 17:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYBXS-0003zf-Re; Sun, 18 Apr 2021 17:48:54 +0000
Received: by outflank-mailman (input) for mailman id 112514;
 Sun, 18 Apr 2021 17:48:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYBXR-0003zW-GQ
 for xen-devel@lists.xenproject.org; Sun, 18 Apr 2021 17:48:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYBXQ-0007CI-8x; Sun, 18 Apr 2021 17:48:52 +0000
Received: from home.octic.net ([81.187.162.82]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYBXP-0001PL-Lt; Sun, 18 Apr 2021 17:48:52 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=bqpfq4FaJMHpUPMHAIiFk2xa9WG+tbnsoVdh5jHUY7k=; b=o3NkmSGpWFS6fh60aAA2QHw/mr
	29ENt2XsNAQDo+iavGmovwuWhgZJMhCBcwPV8zTAgyDxBijtijI1nZGr0d16KhqhdBmL5bqMYItvl
	fDlkXEwHtaZjVVFyGrvNCmTttFCfcOtGs+/8MT4TCxiOVcqj1IdBPwknjo8W42IHlMBA=;
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
 <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org>
 <E2FE265F-B7A4-45C3-BA9C-3EF9109F8B5E@arm.com>
 <8569c856-8838-e5d1-b653-e7eb476dacdc@xen.org>
 <4C9CE5FC-551A-4F26-B975-FC7F33877FF2@arm.com>
 <78c30978-c3be-4357-fecc-5b2f24bf563f@xen.org>
 <348C921E-1150-4247-A693-1D81933FC3F7@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <996b5db1-da59-f03c-9e04-9ac283aa38f2@xen.org>
Date: Sun, 18 Apr 2021 18:48:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <348C921E-1150-4247-A693-1D81933FC3F7@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 16/04/2021 17:41, Rahul Singh wrote:
> Hi Julien

Hi Rahul,

>> On 16 Apr 2021, at 5:08 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 16/04/2021 17:05, Rahul Singh wrote:
>>>> On 16 Apr 2021, at 4:23 pm, Julien Grall <julien@xen.org> wrote:
>>>>
>>>>
>>>>
>>>> On 16/04/2021 16:01, Rahul Singh wrote:
>>>>> Hi Julien,
>>>>
>>>> Hi Rahul,
>>>>
>>>>>> On 16 Apr 2021, at 3:35 pm, Julien Grall <julien@xen.org> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 16/04/2021 12:25, Rahul Singh wrote:
>>>>>>> Revert the code that associates the group pointer with the S2CR as this
>>>>>>> code causing an issue when the SMMU device has more than one master
>>>>>>> device.
>>>>>>
>>>>>> It is not clear to me why this change was first added. Are we missing any feature when reverting it?
>>>>> This feature was added when we backported the code from Linux to fix the stream match conflict issue
>>>>> as part of commit "xen/arm: smmuv1: Intelligent SMR allocation”.
>>>>> This is an extra feature added to allocate IOMMU group based on stream-id. If two device has the
>>>>> same stream-id then we assign those devices to the same group.
>>>>
>>>> If we revert the patch, then it would not be possible to use the SMMU if two devices use the same stream-id. Is that correct?
>>> No. If we revert the patch we can use the SMMU if two devices use the same stream-id without any issue but each device will be in a separate group.This is same behaviour before the code is merged.
>>
>> Ok. So there is no change in behavior. Good. Can you propose a commit message clarifying that?
> 
> Please have a look if it make sense.
> 
> xen/arm: smmuv1: Revert associating the group pointer with the S2CR
> 
> Revert the code that associates the group pointer with the S2CR as this
> code causing an issue when the SMMU device has more than one master
> device with same stream-id. This issue is introduced by the below commit:
> 
> “0435784cc75dcfef3b5f59c29deb1dbb84265ddb:xen/arm: smmuv1: Intelligent SMR allocation”
>   
> Reverting the code will not impact to use of SMMU if two devices use the
> same stream-id but each device will be in a separate group. This is the same
> behaviour before the code is merged.

Look good to me. Is this patch to be applied on top of Stefano's series? 
If not, is there going to be more clash?

Cheers,

-- 
Julien Grall

