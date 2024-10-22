Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0897F9AA2D0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 15:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824161.1238242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Ehs-0007Es-HS; Tue, 22 Oct 2024 13:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824161.1238242; Tue, 22 Oct 2024 13:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Ehs-0007Cp-ET; Tue, 22 Oct 2024 13:13:52 +0000
Received: by outflank-mailman (input) for mailman id 824161;
 Tue, 22 Oct 2024 13:13:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t3Ehr-0007Cj-47
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 13:13:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t3Ehq-0003hL-SF; Tue, 22 Oct 2024 13:13:50 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t3Ehq-0001FD-Gy; Tue, 22 Oct 2024 13:13:50 +0000
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
	bh=9Yui1Qzv9Jxy1memHOnnDaMKzPMThV6ntmpVrrYPXg8=; b=tqZI7/pzeWabxqcjuduyLbQQoC
	/XI+X34a/8qqfFSSuhwv06vNkPLKCmLC2epRLsl9eialdKG5v12svCsUgmsN7dxp1PATKgsWEykdY
	ALu/qRIpVAv9c1zBSqyWZVrWirJf2Mr+GU6oCBq7JaNQjPEoOayf3EItYN8s17RfFCyM=;
Message-ID: <5b8d5c3e-3c52-4b3b-b63f-c89a58f40f10@xen.org>
Date: Tue, 22 Oct 2024 14:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
 <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
 <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
 <A302D615-E25E-46DE-A4CA-4FF911293D83@arm.com>
 <d1e8decf-3c63-41fe-a6e3-f880b984dda4@xen.org>
 <61C13F4F-24D2-4B6D-9216-813EDEED4865@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <61C13F4F-24D2-4B6D-9216-813EDEED4865@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/10/2024 10:56, Luca Fancellu wrote:
> 
> 
>> On 22 Oct 2024, at 10:47, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 22/10/2024 10:41, Luca Fancellu wrote:
>>>> On 21 Oct 2024, at 17:27, Julien Grall <julien@xen.org> wrote:
>>> 2) dsb+isb barrier after enabling the MPU, since we are enabling the MPU but also because we are disabling the background region
>>
>> TBH, I don't understand this one. Why would disabling the background region requires a dsb + isb? Do you have any pointer in the Armv8-R specification?
> 
> I’m afraid this is only my deduction, Section C1.4 of the Arm® Architecture Reference Manual Supplement Armv8, for R-profile AArch64 architecture,
> (DDI 0600B.a) explains what is the background region, it says it implements physical address range(s), so when we disable it, we would like any data
> access to complete before changing this implementation defined range with the ranges defined by us tweaking PRBAR/PRLAR, am I right?

My mental model for the ordering is similar to a TLB flush which is:
    1/ dsb nsh
    2/ tlbi
    3/ dsb nsh
    4/ isb

Enabling the MPU is effectively 2. AFAIK, 1 is only necessary to ensure 
the update to the page-tables. But it is not a requirement to ensure any 
data access are completed (otherwise, we would have needed a dsb sy 
because we don't know how far the access are going...).

Cheers,

-- 
Julien Grall


