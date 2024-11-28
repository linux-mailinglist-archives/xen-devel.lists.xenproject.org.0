Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDAB9DBC55
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 20:01:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845582.1260939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGjkG-0000Cg-0r; Thu, 28 Nov 2024 19:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845582.1260939; Thu, 28 Nov 2024 19:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGjkF-0000Ah-TG; Thu, 28 Nov 2024 19:00:07 +0000
Received: by outflank-mailman (input) for mailman id 845582;
 Thu, 28 Nov 2024 19:00:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tGjkE-0008RF-60
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 19:00:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGjk7-00A7QU-0b;
 Thu, 28 Nov 2024 18:59:59 +0000
Received: from [2a02:8012:3a1:0:1024:27fc:e73a:2414]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGjk7-00AzBm-0X;
 Thu, 28 Nov 2024 18:59:59 +0000
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
	bh=jz5s7SXvMNZhxMKQuRTeHe1X10q2hV7uaEcJvXZOvEU=; b=5vAAEutLJU4ehI8UgzMLUNayDi
	yCt8pyh7/wPF3yne7jaYfEOKn5LrkXXr61oMK2DblDBFvcA9LysSK65laQfG0199nItT9pPdMrNMq
	Lkm3mXtIrqT4aXhYc3JQ/A8MQVXj3fCxbZyMyBdrIm/6AYw5nqiuSwMU/6/9y6uxsiR8=;
Message-ID: <a5809331-b719-42cd-b68e-60871299e303@xen.org>
Date: Thu, 28 Nov 2024 18:59:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] mm: allow page scrubbing routine(s) to be arch
 controlled
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Bobby Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <49b0a003-3fae-4908-ba63-a1c764293755@suse.com>
 <70389f10-5706-4fb4-a186-984a9fd52d76@xen.org>
 <2d3c14c1-d4e8-41a0-98a7-3da1a3a89e24@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2d3c14c1-d4e8-41a0-98a7-3da1a3a89e24@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/11/2024 08:02, Jan Beulich wrote:
> On 25.11.2024 23:17, Julien Grall wrote:
>>> --- a/xen/arch/arm/include/asm/page.h
>>> +++ b/xen/arch/arm/include/asm/page.h
>>> @@ -144,6 +144,12 @@ extern size_t dcache_line_bytes;
>>>    
>>>    #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
>>>    
>>> +#define clear_page_hot  clear_page
>>> +#define clear_page_cold clear_page
>>> +
>>> +#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
>>> +#define scrub_page_cold      scrub_page_hot
>>
>> This block seems to be common between all the arch but x86. Should we
>> add an header in asm generic?
> 
> I'd say that largely depends on the intentions of Arm, RISC-V, and PPC.
> Personally I've always found it odd that memset() / memcpy() are used for
> page clearing / copying. Surely there are better ways, and pretty certainly
> about every arch also has distinct means to efficiently do "hot" and "cold"
> clearing. Therefore keeping these #define-s in per-arch headers imo serves
> as a reminder that something wants doing about them.

Fair enough. For the code:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


