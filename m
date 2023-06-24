Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D5773C738
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 09:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554497.865755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCxK4-0002d0-CY; Sat, 24 Jun 2023 07:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554497.865755; Sat, 24 Jun 2023 07:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCxK4-0002aC-9T; Sat, 24 Jun 2023 07:04:40 +0000
Received: by outflank-mailman (input) for mailman id 554497;
 Sat, 24 Jun 2023 07:04:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qCxK2-0002a4-3n
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 07:04:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCxK1-0008K2-GV; Sat, 24 Jun 2023 07:04:37 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCxK1-0007j3-Ag; Sat, 24 Jun 2023 07:04:37 +0000
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
	bh=6lR3WVXVkcnuiS+RQoCH1ZO+PGBPPkSnnfnKsHGt2lg=; b=bejnP3DoQd+zi9EqSBzL98jKq1
	Qs/fTH2EeuozLGDKQ00d4XJRtuFExgak7KQpgrJ6R8bKRq0SMLYbEysKH2qV3ulk+Ei8WlVM0w0Ou
	9Mt4nqr7FgoYiPW42caeNGHJph3NgyCJgNPU14gGAYV1e0SEXxNJLPKWWKoj/wdzjc10=;
Message-ID: <b0f1a006-7be6-2df8-8859-e9d7927a35c9@xen.org>
Date: Sat, 24 Jun 2023 08:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52
 processor
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230620151736.3720850-1-ayan.kumar.halder@amd.com>
 <d92e26fb-86d4-1681-0d10-be6c2e2cc846@xen.org>
 <d7701ff7-4cee-800a-69c9-deb8560804d3@amd.com>
 <3b7f584e-700e-4598-f36e-51a96140323e@xen.org>
 <bdaa74a7-8707-62a0-fcc9-24f80772a104@amd.com>
 <030fc5e8-8293-2306-06eb-9275c2a2c9e5@xen.org>
 <c7ca9356-ffd7-8fdf-3a69-5267f2957815@amd.com>
 <2fbf6885-5bb8-4b49-522d-eb265349d4b7@xen.org>
 <75008370-7141-757c-0768-14b654724f07@amd.com>
 <ba33a5ea-aa6c-2b93-b10f-28a89cd402c4@xen.org>
In-Reply-To: <ba33a5ea-aa6c-2b93-b10f-28a89cd402c4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 23/06/2023 22:26, Julien Grall wrote:
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -322,7 +322,7 @@ cpu_init:
>>           PRINT("- Setting up control registers -\r\n")
>>
>>           mov   r5, lr                       /* r5 := return address */
>> -
>> +#ifndef CONFIG_ARM_NO_PROC_INIT
>>           /* Get processor specific proc info into r1 */
>>           bl    __lookup_processor_type
>>           teq   r1, #0
>> @@ -337,7 +337,7 @@ cpu_init:
>>           ldr   r1, [r1, #PROCINFO_cpu_init]  /* r1 := vaddr(init 
>> func) */
>>           adr   lr, cpu_init_done             /* Save return address */
>>           add   pc, r1, r10                   /* Call paddr(init func) */
>> -
>> +#endif
> 
> I think it would be best if you just #ifdef the fail below. So if the 
> config selected, then you will still be able to have a Xen that can boot 
> Cortex-A15 or a core that don't need _init.
> 
> Note that for now, we should only select this new config for Armv8-R 
> because there are some work to confirm it would be safe for us to boot 
> Xen 32-bit Arm on any CPUs. I vaguely remember that we were making some 
> assumptions on the cache type in the past. But maybe we other check in 
> place to check such assumption.
> 
> If this can be confirm (I am not ask you to do it, but you can) then we 
> could even get rid of the #ifdef.

I had a look through the code. We have a check in the 32-bit version of 
setup_mm() for the instruction cache type. So I think it would be OK to 
relax the check in head.S.

Bertrand, Stefano, what do you think?

Cheers,

-- 
Julien Grall

