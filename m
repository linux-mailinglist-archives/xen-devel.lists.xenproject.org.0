Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1100E9DBC65
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 20:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845595.1260948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGjsE-0000uW-Re; Thu, 28 Nov 2024 19:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845595.1260948; Thu, 28 Nov 2024 19:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGjsE-0000sy-Ow; Thu, 28 Nov 2024 19:08:22 +0000
Received: by outflank-mailman (input) for mailman id 845595;
 Thu, 28 Nov 2024 19:08:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tGjsD-0000ss-5U
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 19:08:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGjsC-00A7fn-10;
 Thu, 28 Nov 2024 19:08:20 +0000
Received: from [2a02:8012:3a1:0:1024:27fc:e73a:2414]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGjsC-00B0DY-1K;
 Thu, 28 Nov 2024 19:08:20 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=MJSLEUWUD2021tVHT6whE7GqwVvKq55deRZCUACrV+I=; b=Jo2R/XBK2yoXQ5uwrg2259CrNf
	BH3qFxsxC2U8k1XHXNichfBoas30NXMhWX+mNeyun1YC5IgE85Qq1ufPOMIEa2oVyahrR2p6wDO4C
	Sy0F27N8R3h+0QJr0HGjC6Xmk9wTNVrakMUW1NF8B4l351lf2A2oTfqngV5TP7sT/gVo=;
Message-ID: <946a522a-b174-44fe-8a9a-74ade0fdda2c@xen.org>
Date: Thu, 28 Nov 2024 19:08:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/device-tree: Allow region overlapping with
 /memreserve/ ranges
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241114102802.54512-1-luca.fancellu@arm.com>
 <f35997e4-40a7-40c5-9b29-932724e9cac5@xen.org>
In-Reply-To: <f35997e4-40a7-40c5-9b29-932724e9cac5@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/11/2024 10:18, Julien Grall wrote:
> On 14/11/2024 10:28, Luca Fancellu wrote:
>> There are some cases where the device tree exposes a memory range
>> in both /memreserve/ and reserved-memory node, in this case the
>> current code will stop Xen to boot since it will find that the
>> latter range is clashing with the already recorded /memreserve/
>> ranges.
>>
>> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
>> in the /memreserve/ part and even in this case this will prevent
>> Xen to boot since it will see that the module memory range that
>> it is going to add in 'add_boot_module' clashes with a /memreserve/
>> range.
>>
>> When Xen populate the data structure that tracks the memory ranges,
>> it also adds a memory type described in 'enum membank_type', so
>> in order to fix this behavior, allow overlapping with the /memreserve/
>> ranges in the 'check_reserved_regions_overlap' function when a flag
>> is set.
>>
>> In order to implement this solution, there is a distinction between
>> the 'struct membanks *' handled by meminfo_overlap_check(...) that
>> needs to be done, because the static shared memory banks doesn't have
>> a usable bank[].type field and so it can't be accessed, hence now
>> the 'struct membanks_hdr' have a 'enum region_type type' field in order
>> to be able to identify static shared memory banks in 
>> meminfo_overlap_check(...).
>>
>> While there, set a type for the memory recorded using meminfo_add_bank()
>> from efi-boot.h.
>>
>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to 
>> bootinfo.reserved_mem")
>> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> I will give a few days for the others to review and Shawn to comment 
> whether it fixes his issue (I can't remember if it was already done).

This is now committed.

Cheers,

-- 
Julien Grall


