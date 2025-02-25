Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B805A445EA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 17:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895906.1304587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmxj3-0006DT-T5; Tue, 25 Feb 2025 16:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895906.1304587; Tue, 25 Feb 2025 16:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmxj3-0006BJ-QL; Tue, 25 Feb 2025 16:24:05 +0000
Received: by outflank-mailman (input) for mailman id 895906;
 Tue, 25 Feb 2025 16:24:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tmxj2-0006BD-4X
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 16:24:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tmxj1-004j3W-32;
 Tue, 25 Feb 2025 16:24:03 +0000
Received: from [2a02:8012:3a1:0:789b:6f8:a632:2adb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tmxj1-003pzF-1h;
 Tue, 25 Feb 2025 16:24:03 +0000
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
	bh=9184fGoZerNLkiGtJau/EC1CFY1l8JFVk3jxpdVcTAY=; b=2wTJZiEc1LaWU6eoXVL0aE4DGq
	XBioIRtgXpmyu7ur2ONxrBl1fRohQUB5m96Cw7qD7it+VcucFhlb+a7GlviJEsbYB8oZzPt9q3lLk
	E5O6Y1hzoEaPG1AbzPWnFzoVzE/idwX6jngtUyiWem8/HqYU0tTT3VHgl8i1piu8Z6n8=;
Message-ID: <d032a1fc-0ba7-4d6c-8731-dc829f469dfc@xen.org>
Date: Tue, 25 Feb 2025 16:24:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/arm: mpu: Enclose access to MMU specific
 registers under CONFIG_MMU (arm32)
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-3-ayan.kumar.halder@amd.com>
 <0C7E90FC-B76E-4293-A716-1C74B1F89DA5@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0C7E90FC-B76E-4293-A716-1C74B1F89DA5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/02/2025 14:48, Luca Fancellu wrote:
>> On 4 Feb 2025, at 19:23, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> All the EL2 MMU specific registers in head.S are enclosed within CONFIG_MMU.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> xen/arch/arm/arm32/head.S | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 4ff5c220bc..1d0f84b18f 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -224,6 +224,7 @@ cpu_init_done:
>>          mcr   CP32(r0, HMAIR0)
>>          mcr   CP32(r1, HMAIR1)
>>
>> +#ifdef CONFIG_MMU
>>          /*
>>           * Set up the HTCR:
>>           * PT walks use Inner-Shareable accesses,
>> @@ -232,6 +233,7 @@ cpu_init_done:
>>           */
>>          mov_w r0, (TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
>>          mcr   CP32(r0, HTCR)
>> +#endif
> 
> I was wondering if here it was better, for readability, to have this part defined in the arm32/mmu/head.S and
> arm32/mpu/head.S could have implemented a stub, maybe the maintainer could help with that.

The current logic is a bit odd because the MM specific registers are 
initialized in two different places (cpu_init and enable_mmu).

It would be better if we have a single place. So I would move setting 
HTCR (and event HMAIR{0,1} even if it means duplication) to enable_mmu.

The same would apply for arm64.

Cheers,

-- 
Julien Grall


