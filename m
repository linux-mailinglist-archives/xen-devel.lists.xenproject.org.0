Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E0278819B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590623.923030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRsN-0000WO-0w; Fri, 25 Aug 2023 08:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590623.923030; Fri, 25 Aug 2023 08:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRsM-0000UQ-UB; Fri, 25 Aug 2023 08:09:02 +0000
Received: by outflank-mailman (input) for mailman id 590623;
 Fri, 25 Aug 2023 08:09:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZRsM-0000UJ-0J
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:09:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZRsL-0004hX-HF; Fri, 25 Aug 2023 08:09:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZRsL-0005Wd-CH; Fri, 25 Aug 2023 08:09:01 +0000
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
	bh=VcW9Y6nYLPyfEiNtS91SPBgNeX6ChFtrIvsmgaE58gs=; b=ruEce1ypeLcmRuosFA64mvPtjb
	3Zt3D4KOY0+O8yqwmObr0KXIYjgQSwP//Uwy1ug4uKEApqI2TCSyKBLhwZo4OQWB6t/+jX1LSaTQy
	KE7JenJ2ifr2qrGdnRO2CfNUYMd5H68uGOaUw8f/FvBL5uDVE2qNsn4kWU8SR/+JFXF4=;
Message-ID: <27de10c0-07f2-4e2f-900f-e563e9b07d9a@xen.org>
Date: Fri, 25 Aug 2023 09:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 10/19] xen/iommu: protect iommu_add_dt_device()
 with dtdevs_lock
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 sstabellini@kernel.org, jbeulich@suse.com
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-11-vikram.garhwal@amd.com>
 <62c19920-cfe4-405d-9294-7ed426b3a99f@xen.org> <ZOgxwG_0kfhDPFZl@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZOgxwG_0kfhDPFZl@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/08/2023 05:44, Vikram Garhwal wrote:
> Hi Julien,
> On Tue, Aug 22, 2023 at 08:47:10PM +0100, Julien Grall wrote:
>> Hi Vikram,
>>
>> On 19/08/2023 01:28, Vikram Garhwal wrote:
>>> Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access
>>> to add/remove/assign/deassign.
>>> With addition of dynamic programming feature(follow-up patches in this series),
>>
>> Typo: missing space before '('.
>>
>>> this function can be concurrently access by pci device assign/deassign and also
>>
>> I couldn't find any use of this function in the PCI code. So are you talking
>> about not yet upstreamed patches?
> So, this assign and deassign is also used by pci-assignable-add from xl which
> "Make a device assignable for pci-passthru"

Hmmm... But this is not something we currently support on Arm and in 
fact this is not plumbed. So please remove any reference to PCI because 
this is misleading.

Cheers,

-- 
Julien Grall

