Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99FD7FD480
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 11:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643805.1004326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8I08-0008Ji-Sk; Wed, 29 Nov 2023 10:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643805.1004326; Wed, 29 Nov 2023 10:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8I08-0008Hm-Po; Wed, 29 Nov 2023 10:41:04 +0000
Received: by outflank-mailman (input) for mailman id 643805;
 Wed, 29 Nov 2023 10:41:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8I07-0008Hg-RN
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 10:41:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8I07-00082Y-BU; Wed, 29 Nov 2023 10:41:03 +0000
Received: from 82-132-247-131.dab.02.net ([82.132.247.131] helo=[172.20.10.4])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8I06-0003yP-Pa; Wed, 29 Nov 2023 10:41:03 +0000
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
	bh=zTuxU2BTYD2ZPGuk6SHejp/yFOYgNJ30zSBxI4czA3k=; b=AImkq/1DBbC6OLKFi7qfCz8fpO
	GfKYhAzgqUoYh8nQmPFhAKhNfbnDAQPQlr9oLtlbvj9cDHfE5U7UYaD/LlGC9P88s+uIycx920T56
	veXWv5iQEyXA161FpSbBhHhCGDRRLtz/6lGgx/EyA2CjOtoGFUxplcWSiaClATX2X8Pw=;
Message-ID: <cce32468-bd4e-4695-a291-af2ec5309310@xen.org>
Date: Wed, 29 Nov 2023 11:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm64: Move print_reg macro to asm/arm64/macros.h
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>
References: <20231129090645.26137-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231129090645.26137-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/11/2023 10:06, Michal Orzel wrote:
> Macro print_reg is used to print a value of a register passed as an
> argument. While today it is only used from within the common head.S,
> in the future we might want to make use of it from other files, just
> like PRINT(). It also serves as a great aid when debugging.
> 
> Expose print_reg macro by moving it to asm/arm64/macros.h and:
>   - rename putn to asm_putn to denote the usage from assembly only,
>   - use ENTRY() for asm_putn to make it globally visible.
> 
> This way the behavior will be consistent with what we already do on arm32.
> 
> Take the opportunity to get rid of unneeded stubs for early_puts,
> init_uart and putn since the calls to them are already protected by
> respective #ifdef CONFIG_EARLY_PRINTK.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

This is now committed.

Cheers,

-- 
Julien Grall

