Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C2930C864
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 18:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80679.147734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6zox-0001uf-PQ; Tue, 02 Feb 2021 17:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80679.147734; Tue, 02 Feb 2021 17:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6zox-0001uG-M7; Tue, 02 Feb 2021 17:50:35 +0000
Received: by outflank-mailman (input) for mailman id 80679;
 Tue, 02 Feb 2021 17:50:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l6zov-0001uB-Nh
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 17:50:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l6zou-0002Vy-Na; Tue, 02 Feb 2021 17:50:32 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l6zou-0005qx-HV; Tue, 02 Feb 2021 17:50:32 +0000
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
	bh=lcy2N9XuXSWSqalYRLS1T/ccGfxxM6G/C6AQaaGTGwM=; b=UFiRPikbD1sqNmtUchdtO+inFo
	UM3dLL8WkLKuk6oOfXYiNK9CrS1m5NQ4rX6w5GhKShb5U9AsDbDiU+sqI77fLqdWexEWVjineBQjr
	Ee95YYckgzFMHfVUgfgxUMZ0UjXy2s3NbKl8Q7djWV4KfS/izXJ4yDvlMyIPxnBBVzH4=;
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "brian.woods@xilinx.com" <brian.woods@xilinx.com>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
 <C094E054-885F-4363-ABF3-E0FB4DDD7A2A@arm.com>
 <alpine.DEB.2.21.2102020937480.29047@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <7ddc6e1b-41ce-37ae-f86e-39893f53a0ec@xen.org>
Date: Tue, 2 Feb 2021 17:50:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102020937480.29047@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 02/02/2021 17:44, Stefano Stabellini wrote:
> On Tue, 2 Feb 2021, Rahul Singh wrote:
>> Hello Stefano,
>>
>>> On 26 Jan 2021, at 10:58 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>
>>> Hi all,
>>>
>>> This series introduces support for the generic SMMU bindings to
>>> xen/drivers/passthrough/arm/smmu.c.
>>>
>>> The last version of the series was
>>> https://marc.info/?l=xen-devel&m=159539053406643
>>>
>>> I realize that it is late for 4.15 -- I think it is OK if this series
>>> goes in afterwards.
>>
>> I tested the series on the Juno board it is woking fine.
>> I found one issue in SMMU driver while testing this series that is not related to this series but already existing issue in SMMU driver.
>>
>> If there are more than one device behind SMMU and they share the same Stream-Id, SMMU driver is creating the new SMR entry without checking the already configured SMR entry if SMR entry correspond to stream-id is already configured.  Because of this I observed the stream match conflicts on Juno board.
>>
>> (XEN) smmu: /iommu@7fb30000: Unexpected global fault, this could be serious
>> (XEN) smmu: /iommu@7fb30000: 	GFSR 0x00000004, GFSYNR0 0x00000006, GFSYNR1 0x00000000, GFSYNR2 0x00000000
>>
>>
>> Below two patches is required to be ported to Xen to fix the issue from Linux driver.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/iommu/arm-smmu.c?h=linux-5.8.y&id=1f3d5ca43019bff1105838712d55be087d93c0da
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/iommu/arm-smmu.c?h=linux-5.8.y&id=21174240e4f4439bb8ed6c116cdbdc03eba2126e
> 
> 
> Good catch and thanks for the pointers! Do you have any interest in
> backporting these two patches or should I put them on my TODO list?
> 
> Unrelated to who does the job, we should discuss if it makes sense to
> try to fix the bug for 4.15. The patches don't seem trivial so I am
> tempted to say that it might be best to leave the bug unfixed for 4.15
> and fix it later.

SMMU support on Juno is not that interesting because IIRC the stream-ID 
is the same for all the devices. So it is all or nothing passthrough.

For other HW, this may be a useful feature. Yet we would need a way to 
group the devices for passthrough.

In this context, I would consider it more a feature than a bug because 
the SMMU driver never remotely work on such HW.

Cheers,

-- 
Julien Grall

