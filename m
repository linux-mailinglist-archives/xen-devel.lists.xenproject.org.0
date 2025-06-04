Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9EBACDE49
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 14:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005513.1384974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMnXk-0001h2-8u; Wed, 04 Jun 2025 12:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005513.1384974; Wed, 04 Jun 2025 12:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMnXk-0001f0-5m; Wed, 04 Jun 2025 12:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1005513;
 Wed, 04 Jun 2025 12:48:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMnXi-0001eu-Pe
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 12:48:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMnXi-001uWN-0w;
 Wed, 04 Jun 2025 12:48:30 +0000
Received: from [15.248.3.91] (helo=[10.24.67.75])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMnXi-000gpF-1i;
 Wed, 04 Jun 2025 12:48:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=UcRq1X/Jk/hGFNv8Vnqvksc8YIMxv4iDO52XpfmJ4Oo=; b=dqn4bMeaztrA62b5yP9b61DUjj
	OhjTbw2K7pO6NGif+C4eUd9VxiVJkvDVhq62IvcHQLBZJqBoqI4TUL+RRk9L2WiGJ2UeO1eyHfhEE
	kjp4B/Sj9VlQcBhzqjCnR33ds1qL5JarFv7fIveCKcw9ZYn/KmfTpPO0mvMF9FFJJ2BY=;
Message-ID: <56e44ec8-c9c0-4d58-98f3-730cc1c1bb86@xen.org>
Date: Wed, 4 Jun 2025 13:48:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Content-Language: en-GB
To: Demi Marie Obenour <demiobenour@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1748422217.git.mykyta_poturai@epam.com>
 <71741747bdc0cfcacbe86e66ddd6239ea2f5a3af.1748422217.git.mykyta_poturai@epam.com>
 <9bfc305b-602e-4c96-bd7a-763075e506d7@gmail.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9bfc305b-602e-4c96-bd7a-763075e506d7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Demi,

When replying to a thread, please keep the folks in CC unless there is a 
reason to drop them. Sending to just xen-devel is likely going to be 
lost. I personally don't always keep an eyes on discussion where I am 
not CCed, there are too many!

So adding re-adding the CC for you and keeping your reply as-is.

On 29/05/2025 03:10, Demi Marie Obenour wrote:
> On 5/28/25 05:12, Mykyta Poturai wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Implement support for PCI devices in the SMMU driver. Trigger iommu-map
>> parsing when new PCI device is added. Add checks to assign/deassign
>> functions to ensure PCI devices are handled correctly. Implement basic
>> quarantining.
>>
>> All pci devices are automatically assigned to hardware domain if it exists
>> to ensure it can probe them.
> This is only safe for devices present at boot time.  It’s not safe for
> hotplugged devices, which should be quarantined.

-- 
Julien Grall


