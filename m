Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4EA8B6DD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955492.1349253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u50A6-0005vI-Gu; Wed, 16 Apr 2025 10:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955492.1349253; Wed, 16 Apr 2025 10:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u50A6-0005tN-EC; Wed, 16 Apr 2025 10:38:34 +0000
Received: by outflank-mailman (input) for mailman id 955492;
 Wed, 16 Apr 2025 10:38:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u50A4-0005tH-Jh
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:38:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u50A4-001XQe-0f;
 Wed, 16 Apr 2025 10:38:32 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u50A3-00Hb0N-0I;
 Wed, 16 Apr 2025 10:38:32 +0000
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
	bh=b26BaROSn2IPN1efL6pUoGtCtc280nUR+WdO8BXTY24=; b=K7MWCrUkcYk9yxKh1DKEpU5A8A
	ND+X4pk4Wc+OHbP57A6mB9qBM/APJjtnvhcV8un7q6WMzrQyUgvZ0FsKcIMt2sC087Vsl8yDDr+LN
	ClIat54X0vj/zVeNQMJflIePpWKEa19Wvl+qmVDTH2ICvLmL3dKqpyTcgCDG3ywB5p/E=;
Message-ID: <d64011fc-84bc-40fb-a98e-aa85eb2574c3@xen.org>
Date: Wed, 16 Apr 2025 19:38:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add support for MSI injection on Arm
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <cover.1744621166.git.mykyta_poturai@epam.com>
 <98feb427-7da5-47ff-831c-2b4bcb26c4b9@xen.org>
 <alpine.DEB.2.22.394.2504151536240.8008@ubuntu-linux-20-04-desktop>
 <15938705-ae5e-43c9-826f-d7a8c7425baa@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <15938705-ae5e-43c9-826f-d7a8c7425baa@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Rahul)

On 16/04/2025 17:37, Mykyta Poturai wrote:
> On 16.04.25 01:40, Stefano Stabellini wrote:
>> On Mon, 14 Apr 2025, Julien Grall wrote:
>>> Hi Mykyta,
>>>
>>> On 14/04/2025 18:51, Mykyta Poturai wrote:
>>>> This series adds the base support for MSI injection on Arm. This is
>>>> needed to streamline virtio-pci interrupt triggering.
>>>>
>>>> With this patches, MSIs can be triggered in guests by issuing the new
>>>> DM op, inject_msi2. This op is similar to inject_msi, but it allows
>>>> to specify the source id of the MSI.
>>>>
>>>> We chose the approach of adding a new DM op instead of using the pad
>>>> field of inject_msi because we have no clear way of distinguishing
>>>> between set and unset pad fields. New implementations also adds flags
>>>> field to clearly specify if the SBDF is set.
>>>>
>>>> Patches were tested on QEMU with
>>>
>>> [...]
>>>
>>>> patches for ITS support for DomUs applied.
>>>
>>> This means this series is unusable without external patches. Given this is
>>> adding a new DM operations, I think it would be more sensible to have the vITS
>>> support merged first. Then we can look at merging this series.
>>
>> Hi Mykyta, just checking explicitly with you whether this series
>> requires vgic-v3-its.c for DomUs?
>>
>> If yes, how far are you from sending the relevant patches to xen-devel?
>> How many are they?
> 
> Hi Stefano,
> Yes, I am planning to send them together with VPCI MSI support after
> SMMU patches are merged.
> 
> Although the DomU vits itself is only two patches.

I am assuming this is work in progress patches rather than the one you 
plan to send, correct?

Asking, because currently there are a few 
ASSERT(is_hardware_domain(its->d)) to indicate where changes are likely 
for the guests. You seem to remove them without explaining why or any 
associated code.

While I will not ask to have a security support guest vITS from the 
start. I would like some confidence that we are going in the right 
direction. IOW, I would like to see a design document that would explain 
how we can achieve it. Some of the part to consider:
   * Command queue
   * LPIs
   * 1:1 pITS <-> vITS vs one vITS to many pITS
   * The page-tables are shared between the device and CPU. Are we ok to 
keep the doorbell writable by the CPU?

There was some discussion in the past about it (I have added Rahul 
because IIRC he was driving the discussion). So most likely, we would 
need the design to be respinned and agreed first.

Lastly, I see you seem to go down the route of exposing one vITS only. 
But I don't think your patch is sufficient to support multiple pITS (the 
guest doorbell will be mapped to a different host doorbell depending on 
the guest).

Cheers,

-- 
Julien Grall


