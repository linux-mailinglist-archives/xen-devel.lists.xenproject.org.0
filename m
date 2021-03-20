Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED6342CAB
	for <lists+xen-devel@lfdr.de>; Sat, 20 Mar 2021 13:01:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99471.189177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNaIF-0007DN-0Y; Sat, 20 Mar 2021 12:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99471.189177; Sat, 20 Mar 2021 12:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNaIE-0007Cy-TS; Sat, 20 Mar 2021 12:01:22 +0000
Received: by outflank-mailman (input) for mailman id 99471;
 Sat, 20 Mar 2021 12:01:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lNaID-0007Ct-Tc
 for xen-devel@lists.xenproject.org; Sat, 20 Mar 2021 12:01:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNaIC-0005YI-P1; Sat, 20 Mar 2021 12:01:20 +0000
Received: from home.octic.net ([81.187.162.82]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNaIC-0005Se-H3; Sat, 20 Mar 2021 12:01:20 +0000
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
	bh=83efPL5Alrv5nhdcp2Q7lF7t8Cc7ahwNlnonU8nkjNE=; b=r14jCNUfRB1vKdfcZX7RdW8KLv
	Cyzhz2C+ajxYmVd7uVrFGDNJw7zcktSfAgMzvr14458bNifgwPy4mCYMyfMSDn7t5VgsNAIkdzHb/
	7zdFH6OS9qNXp8ULfuxCRLQB53vyQ8dWhoHmnDhlBfUaGfBrXb77TIbjMa8Y7VgPR8V8=;
Subject: Re: [PATCH 5/5] xen/arm: smmuv1: Intelligent SMR allocation
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
 <789abfb57568dcbaba122ea9b68c627e6c9707c4.1615312254.git.rahul.singh@arm.com>
 <299c8294-5f76-2fd6-85ec-d20c0b99368b@xen.org>
 <1C808D23-E8F3-4888-86AD-C37FCBAAD0D1@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cda80b1a-d9f4-bf95-f5ed-ab0a46b8c618@xen.org>
Date: Sat, 20 Mar 2021 12:01:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1C808D23-E8F3-4888-86AD-C37FCBAAD0D1@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 16/03/2021 17:54, Rahul Singh wrote:
> Hello Julien,

Hi Rahul,

>> On 16 Mar 2021, at 3:08 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 09/03/2021 18:19, Rahul Singh wrote:
>>> Backport 588888a7399db352d2b1a41c9d5b3bf0fd482390
>>> "iommu/arm-smmu: Intelligent SMR allocation" from the Linux kernel
>>> This patch fix the stream match conflict issue when two devices have the
>>> same stream-id.
>>> Only difference while applying this patch is to use spinlock in place of
>>> mutex and move iommu_group_alloc(..) function call in
>>> arm_smmu_add_device(..) function from the start of the function
>>> to the end.
>>
>> As you may remember the discussion on the SMMUv3 thread, replacing a spinlock by a mutex has consequences. Can you explain why this is fine?
> Yes, I remember the discussion on the SMMUv3 thread, replacing a spinlock with a mutex has consequences.
> 
> I replaced the mutex with spinlock in the SMMUv1 code when we are configuring the SMMUv1 hardware arm_smmu_master_alloc_smes(..).
> 
> I think it is fine to use the spinlock in place of mutex in SMMUv1 where we are configuring the hardware via registers as compared to SMMUv3 where we are configuring the SMMUv3 hardware with Memory-based circular buffer queues. Configuring the hardware via queues might take a long time that why mutex is a good choice but if we are configuring the hardware via registers it is very fast.
> 
> Configuring the SMMUv1 with the register is very fast and there are no side effects of this if we use spinlock. Let me know your view on this.

This looks fine. Can you explain it the commit message?

Cheers,

-- 
Julien Grall

