Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390D66726AE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 19:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480743.745297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pID4K-0000Zf-GI; Wed, 18 Jan 2023 18:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480743.745297; Wed, 18 Jan 2023 18:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pID4K-0000Xg-DU; Wed, 18 Jan 2023 18:21:52 +0000
Received: by outflank-mailman (input) for mailman id 480743;
 Wed, 18 Jan 2023 18:21:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pID4I-0000XF-UH
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 18:21:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pID4A-0000UM-He; Wed, 18 Jan 2023 18:21:42 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.8.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pID4A-0006WH-8b; Wed, 18 Jan 2023 18:21:42 +0000
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
	bh=rb1G0dY56QTMw1NtktB7Jvgg7616U4TCKBbdqFearnY=; b=jLfP0vfBHKSE97w5W64H7erz2I
	0bXj15PqYG7astrioKl5rMGrZGon6Nb5kaMxgiNBRE9J3Vica4hbyalYHojTFI7MU/eIocu9N/QEJ
	XIk1KdqWjU2BQuCclzv2+8/Z7x+h6tXKzdxsCLOeg4+vsRuSiO3EfgLza8d3I8ubw6K8=;
Message-ID: <64359f65-4a99-f9ef-b35d-49b44670c7e6@xen.org>
Date: Wed, 18 Jan 2023 18:21:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 00/10] Rework PCI locking
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <9a98a83a-32e5-67fe-431d-7bc5f070674e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9a98a83a-32e5-67fe-431d-7bc5f070674e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/09/2022 11:32, Jan Beulich wrote:
> On 31.08.2022 16:10, Volodymyr Babchuk wrote:
>> Hello,
>>
>> This is yet another take to a PCI locking rework. This approach
>> was suggest by Jan Beulich who proposed to use a reference
>> counter to control lifetime of pci_dev objects.
>>
>> When I started added reference counting it quickly became clear
>> that this approach can provide more granular locking insted of
>> huge pcidevs_lock() which is used right now. I studied how this
>> lock used and what it protects. And found the following:
>>
>> 0. Comment in pci.h states the following:
>>
>>   153 /*
>>   154  * The pcidevs_lock protect alldevs_list, and the assignment for the
>>   155  * devices, it also sync the access to the msi capability that is not
>>   156  * interrupt handling related (the mask bit register).
>>   157  */
>>
>> But in reality it does much more. Here is what I found:
>>
>> 1. Lifetime of pci_dev struct
>>
>> 2. Access to pseg->alldevs_list
>>
>> 3. Access to domain->pdev_list
>>
>> 4. Access to iommu->ats_list
>>
>> 5. Access to MSI capability
>>
>> 6. Some obsucure stuff in IOMMU drivers: there are places that
>> are guarded by pcidevs_lock() but it seems that nothing
>> PCI-related happens there.
> 
> Right - the lock being held was (ab)used in IOMMU code in a number of
> places. This likely needs to change in the course of this re-work;
> patch titles don't suggest this is currently part of the series.
> 
>> 7. Something that I probably overlooked
> 
> And this is the main risk here. The huge scope of the original lock
> means that many things are serialized now but won't be anymore once
> the lock is gone.
> 
> But yes - thanks for the work. To be honest I don't expect to be able
> to look at this series in detail until after the Xen Summit. And even
> then it may take a while ...

I was wondering if this is still in your list to review?

Cheers,

-- 
Julien Grall

