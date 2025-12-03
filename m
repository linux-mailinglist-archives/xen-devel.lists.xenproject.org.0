Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA2CA0ED3
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 19:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177051.1501470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQrVg-0002RN-Fe; Wed, 03 Dec 2025 18:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177051.1501470; Wed, 03 Dec 2025 18:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQrVg-0002P2-Cj; Wed, 03 Dec 2025 18:23:28 +0000
Received: by outflank-mailman (input) for mailman id 1177051;
 Wed, 03 Dec 2025 18:23:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vQrVe-0002Ow-DI
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 18:23:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQrVb-004xbh-2T;
 Wed, 03 Dec 2025 18:23:23 +0000
Received: from [2a00:23ee:1580:641d:ccf6:de01:f285:957c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQrVb-00Gcq4-00;
 Wed, 03 Dec 2025 18:23:23 +0000
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
	bh=UowNLDN+RQcruj2tQG2ifBBZ0VgZXhQoJXcFL7XZWrU=; b=jmhDttSIRDHlJCoWYzdxiORrMR
	qZe5WwBRHD3Do6GuFDkFWM7EoeZPlQ/EMiAUOkbaES92MNp6a1NRWsZuP1ZFI4m6ihym4WQjDZkKC
	WVQPdOxdAlpgvIDzy+aiTfSWOjIyKNk4EkPSIHZJ8onGBavOQ/cR8N+XX5OITrvHAHQo=;
Message-ID: <f081cd84-a626-4b02-8c8b-6c0c0b723b84@xen.org>
Date: Wed, 3 Dec 2025 18:23:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Drop ThumbEE support
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Hans van Kranenburg <hans@knorrie.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <JBeulich@suse.com>,
 Maximilian Engelhardt <maxi@daemonizer.de>
References: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 03/12/2025 17:16, Andrew Cooper wrote:
> It was reported that Xen no longer builds on Debian Trixie:
> 
>    Assembler messages:
>    {standard input}:474: Error: unknown or missing system register name at operand 1 -- `msr TEECR32_EL1,x0'
>    {standard input}:480: Error: unknown or missing system register name at operand 1 -- `msr TEEHBR32_EL1,x0'
>    {standard input}:488: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEECR32_EL1'
>    {standard input}:494: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEEHBR32_EL1'
>    make[5]: *** [Rules.mk:249: arch/arm/domain.o] Error 1
> 
> This turns out to be an intentional change in bintuils.  ThumbEE was dropped

typo: s/binuils/binutils/

> from the architecture and doesn't exist in v8 (i.e. AArch64).
> 
> Xen supports v7+virt extentions so in principle we could #ifdef CONFIG_ARM_32

typo: s/extentions/extensions/

> to keep it working, but there was apparently no use of ThumbEE outside of demo
> code, so simply drop it.

I am in favor of dropping support for ThumbEE for guest. But I am not 
sure I understand this comment. Are you saying there are no processors 
supporting ThumbEE where Xen would run? Asking because below, you are 
removing code to context switch the ThumbEE registers. But I don't see 
any code that would ensure the registers are trapping (i.e. HSTR.TEE is 
set). So wouldn't this result to a cross-VM leak on those processors?

If we really don't want to support CPU where ThumbEE is available, then 
we should check that "cpu_has_thumbee" is 0.

Cheers,

-- 
Julien Grall


