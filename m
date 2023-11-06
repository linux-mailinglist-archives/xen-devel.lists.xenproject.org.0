Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1F27E2AAC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 18:09:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628224.979438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0355-00081W-SZ; Mon, 06 Nov 2023 17:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628224.979438; Mon, 06 Nov 2023 17:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0355-0007zo-Px; Mon, 06 Nov 2023 17:08:07 +0000
Received: by outflank-mailman (input) for mailman id 628224;
 Mon, 06 Nov 2023 17:08:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0354-0007zh-FB
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 17:08:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0354-0007Gq-22; Mon, 06 Nov 2023 17:08:06 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.14.214]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0353-0002IH-Rl; Mon, 06 Nov 2023 17:08:05 +0000
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
	bh=3hpd9zPnm6XprtG0Ez6b9BbuPXzY0XN/8DYrhp8JOFU=; b=ftFVql0Fh8hl9ikwJTwWwYnw2S
	2CsJHu2/njV6U+lW9tZsiZKGDgrMlkD0sya6sfxsXSbkW15ketmJEuxwTskme0Dz9ZrLXOcAUHMwn
	ROVL+Zyltw5h2ZhvmPML8k+kCFtGbSBjQEBHwIM9p9czvHUNZcxSvwiFA8YSVlTO65O8=;
Message-ID: <9de0ddc1-9932-430d-bb46-9aab86ddc0b4@xen.org>
Date: Mon, 6 Nov 2023 17:08:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm32: head: Introduce
 enable_{boot,secondary}_cpu_mm()
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@arm.com,
 henry.wang@arm.com, Volodymyr_Babchuk@epam.com
References: <20231103173436.3912488-1-ayan.kumar.halder@amd.com>
 <20231103173436.3912488-2-ayan.kumar.halder@amd.com>
 <98557d2a-234b-4031-a812-174c31892d52@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <98557d2a-234b-4031-a812-174c31892d52@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/11/2023 06:46, Michal Orzel wrote:
> On 03/11/2023 18:34, Ayan Kumar Halder wrote:
>> +/*
>> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
>> + * The function will return to the virtual address provided in LR (e.g. the
>> + * runtime mapping).
>> + *
>> + * Inputs:
>> + *   lr : Virtual address to return to.
>> + *
>> + * Clobbers r0 - r6
>> + */
>> +enable_boot_cpu_mm:
>> +        mov   r6, lr
>> +
>> +        bl    create_page_tables
>> +
>> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
>> +        mov_w lr, 1f
>> +        b     enable_mmu
>> +1:
>> +        /* Return to the virtual address requested by the caller. */
> I find this comment a bit misleading as it reads as if this instruction was causing a return.

For the arm64 side, we have the comment on top of the branch 
instruction. I would suggest the following:

"
Prepare the fixmap. The function will return to the virtual address 
requested by the caller.
"

> 
> Apart from that, this change LGTM. Depending on the order of other arm32 head.S patches:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal

-- 
Julien Grall

