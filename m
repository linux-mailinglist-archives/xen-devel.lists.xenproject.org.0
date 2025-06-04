Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 687E8ACE557
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 21:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005913.1385233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMuAX-0007ke-Sc; Wed, 04 Jun 2025 19:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005913.1385233; Wed, 04 Jun 2025 19:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMuAX-0007iS-Pg; Wed, 04 Jun 2025 19:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1005913;
 Wed, 04 Jun 2025 19:52:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMuAV-0007iF-OL
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 19:52:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMuAV-0023Fw-0Y;
 Wed, 04 Jun 2025 19:52:59 +0000
Received: from [2a02:8012:3a1:0:dd42:978c:f857:f7b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMuAV-005RgB-0Y;
 Wed, 04 Jun 2025 19:52:58 +0000
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
	bh=OACipzjAlCNCN9PanSeoIOjwbI77IZdSjM7We3jlyxg=; b=JISu1V6zL5D4k+WRME/zVHYwrj
	T9ieoxjfU6Z98EtWceXDDOvIg08/WrBTYOSjY8bCxa2uVKSWiByQZ9ghCiGDlFDpsbCuC7787nnqq
	aHCAI7lqV8CcvLFBn9P1hyIjSsVh/BKNs/jMBtg3nnPAe7fC2fhWyXQTPn17p21Zny+E=;
Message-ID: <a616c5dd-597a-45b2-b098-f9069827e96c@xen.org>
Date: Wed, 4 Jun 2025 20:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Content-Language: en-GB
To: Demi Marie Obenour <demiobenour@gmail.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <cover.1748422217.git.mykyta_poturai@epam.com>
 <71741747bdc0cfcacbe86e66ddd6239ea2f5a3af.1748422217.git.mykyta_poturai@epam.com>
 <9bfc305b-602e-4c96-bd7a-763075e506d7@gmail.com>
 <56e44ec8-c9c0-4d58-98f3-730cc1c1bb86@xen.org>
 <62b32285-8ce5-4bee-b3b7-66e3a91a0a26@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <62b32285-8ce5-4bee-b3b7-66e3a91a0a26@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Demi,

On 04/06/2025 19:57, Demi Marie Obenour wrote:
> On 6/4/25 08:48, Julien Grall wrote:
>> Hi Demi,
>>
>> When replying to a thread, please keep the folks in CC unless there is a
>> reason to drop them. Sending to just xen-devel is likely going to be
>> lost. I personally don't always keep an eyes on discussion where I am
>> not CCed, there are too many!
>>
>> So adding re-adding the CC for you and keeping your reply as-is.
>>
>> On 29/05/2025 03:10, Demi Marie Obenour wrote:
>>> On 5/28/25 05:12, Mykyta Poturai wrote:
>>>> From: Rahul Singh <rahul.singh@arm.com>
>>>>
>>>> Implement support for PCI devices in the SMMU driver. Trigger iommu-map
>>>> parsing when new PCI device is added. Add checks to assign/deassign
>>>> functions to ensure PCI devices are handled correctly. Implement basic
>>>> quarantining.
>>>>
>>>> All pci devices are automatically assigned to hardware domain if it exists
>>>> to ensure it can probe them.
>>> This is only safe for devices present at boot time.  It’s not safe for
>>> hotplugged devices, which should be quarantined.
> 
> Thank you!  This makes me wonder if Thunderbird is a good choice for an
> email client, or if I should use something like Mutt or Aerc.

I have been using Thunderbird for the past 10 years without any issue.

The UI tends to offer me two options "reply" and "reply all". I need to 
click on the latter to CC everyone.

I am not sure whether you can hide the "reply" (so drop all the CC) only.

Cheers,

-- 
Julien Grall


