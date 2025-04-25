Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6BFA9CA68
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 15:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968092.1357788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8JAC-0007DD-4G; Fri, 25 Apr 2025 13:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968092.1357788; Fri, 25 Apr 2025 13:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8JAC-0007AU-1V; Fri, 25 Apr 2025 13:32:20 +0000
Received: by outflank-mailman (input) for mailman id 968092;
 Fri, 25 Apr 2025 13:32:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u8JAA-0007AO-PU
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 13:32:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u8JAA-003pVS-1Y;
 Fri, 25 Apr 2025 13:32:18 +0000
Received: from [2a02:8012:3a1:0:8daa:3830:53f7:173e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u8JAA-008aeD-0w;
 Fri, 25 Apr 2025 13:32:18 +0000
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
	bh=ABAA1nlxtJTVtzlkmTBlp4NI++vg4QzPrNpno7Ils+0=; b=MOQdJrzu4m2eAdywoHfBCEF33G
	VuRNQ42VgLsYcJMxI297PWcSJvWT2x5FA0NcUBwXHDpJqMzMEe2JQVmlV9ZEVevz7Out/jIR7ALmI
	AA7HeEaZy99LStOy8SEbmlAnGuphGAOIFEE7Ad2Jf8HjhvFVZyuQvmdnV0xhRg9z2ypE=;
Message-ID: <f2a55c19-4a8b-44a3-be9e-bdf3fb554b7d@xen.org>
Date: Fri, 25 Apr 2025 14:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
 <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
 <cebb0020-531f-467c-bc81-54d2ba1aa8e0@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cebb0020-531f-467c-bc81-54d2ba1aa8e0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan

On 25/04/2025 13:00, Ayan Kumar Halder wrote:
>>> +        unsigned int ns:1;     /* Reserved 0 by hardware */
>>> +        unsigned int res0:1;   /* Reserved 0 by hardware */
> Then, we can change this on Arm32 as well.
>>> +        unsigned int limit:26;  /* Limit Address */
>>
>> NIT: Can we align the comments?
> Ack.
>>
>>> +    } reg;
>>> +    uint32_t bits;
>>> +} prlar_t;
>>> +
>>> +/* Protection Region */
>>> +typedef struct {
>>> +    prbar_t prbar;
>>> +    prlar_t prlar;
>>> +    uint64_t p2m_type;          /* Used to store p2m types. */
>>> +} pr_t;
>>
>> This looks to be common with arm64. If so, I would prefer if the 
>> structure is in a common header.
> 
> No, in arm64 this is
> 
> typedef struct {
>       prbar_t prbar;
>       prlar_t prlar;
> } pr_t;
> 
> The reason being Arm64 uses unused bits (ie 'pad') to store the type.

Hmmm... They are bits from the system register (prbar), right? If so, 
you can't use them for storing the p2m_type as AFAICT they are RES0.

You could possibly mask the bits before writing them. But then, it will 
become risky if the fields are defined.

Also, the number of MPU regions is fairly small. So, I don't think it is 
worth it to store p2m_type.

Regardless that, I think it would be better to defer the introduction of 
p2m_type until guest support is added. So it will be easier to 
understand how this is going to be used and the size (for instance, I 
doubt 64-bit is necessary...).

Cheers,

-- 
Julien Grall


