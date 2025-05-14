Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E5DAB6444
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983919.1370094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6WT-0000gc-Eq; Wed, 14 May 2025 07:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983919.1370094; Wed, 14 May 2025 07:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6WT-0000dt-Bz; Wed, 14 May 2025 07:27:25 +0000
Received: by outflank-mailman (input) for mailman id 983919;
 Wed, 14 May 2025 07:27:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uF6WR-0000dm-SE
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:27:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF6WR-008GJc-0A;
 Wed, 14 May 2025 07:27:22 +0000
Received: from [2a02:8012:3a1:0:51a6:3d91:4273:769]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF6WQ-00DHDT-1X;
 Wed, 14 May 2025 07:27:22 +0000
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
	bh=FFgHX7Hxlr6R5EInDXp7psHC0AE2IOCWulPq80+3EhI=; b=5k6nhsMi5n3qPOKbqVRwfX8rGe
	p7sQOZfLCungIVSVNzi7Mg63TscrqjADycBbVcYYOWt18gJP7eaQ3kQwevxVhKoWrXGzMVQSJ8YfZ
	vL1ELNTGgRk9I6AEDbVOpPDG2F6KqqKagdpPKiEKj1GrOXpOx1WSPx/M0+ZW4rwzExxE=;
Message-ID: <15bf8cad-2114-48e4-9b10-4b4a725eea33@xen.org>
Date: Wed, 14 May 2025 08:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/dom0less: move make_chosen_node() to common
 code
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <9c87738225d48bd1ee9bba6e8d4e018dfecabccd.1747145897.git.oleksii.kurochko@gmail.com>
 <f0744def-78f6-42a4-a623-3cdfe6772340@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f0744def-78f6-42a4-a623-3cdfe6772340@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 13/05/2025 15:45, Orzel, Michal wrote:
> 
> 
> On 13/05/2025 16:29, Oleksii Kurochko wrote:
>> The current implementation of make_chosen_node() does not contain any
>> architecture-specific logic. Therefore, move it from arch-specific
>> files to common code.
>>
>> At this stage, there is no need to introduce an arch_make_chosen_node(),
>> as no architecture-specific customization is required.
>>
>> This change avoids duplication and simplifies future maintenance for
>> architectures like RISC-V and ARM.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> [snip]
> 
>> +/*
>> + * This function is used as part of the device tree generation for Dom0
>> + * on ACPI systems, and DomUs started directly from Xen based on device
> Might be worth adding (on Arm) after 'ACPI systems'. Could be done on commit.

Please don't. This will become stale otherwise as soon as RISC-V is 
started to use it. Instead, we should say (on platform where CONFIG_ACPI=y).

Cheers,

-- 
Julien Grall


