Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5E084E4B8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678319.1055452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6y5-0001yQ-NK; Thu, 08 Feb 2024 16:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678319.1055452; Thu, 08 Feb 2024 16:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6y5-0001vk-KL; Thu, 08 Feb 2024 16:09:41 +0000
Received: by outflank-mailman (input) for mailman id 678319;
 Thu, 08 Feb 2024 16:09:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rY6y4-0001vc-JA
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:09:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rY6y4-00022Q-4V; Thu, 08 Feb 2024 16:09:40 +0000
Received: from [15.248.3.89] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rY6y3-0008QW-Uc; Thu, 08 Feb 2024 16:09:40 +0000
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
	bh=XcSRXHG2iHvCB7O/0OiQDuFBEQj38vp3DT4FIDVeE08=; b=cYl0bq7sJt1by007uENchK5p2T
	wtbH9cNvKkHtiGhvobq81Qf7jWwGVMsHB423VBYHXdIZ2NZsyn/75cBGhQQw7221uoiq73+vHCTOY
	iGrlMOaubZAGA8vEsiiyNx/6vZU6jx2utBRk6cA9WtjLvozGUm/C6H9AXCgOJp/n058M=;
Message-ID: <28dff183-bc8a-4c59-bd4a-75abba8858b8@xen.org>
Date: Thu, 8 Feb 2024 16:09:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix UBSAN failure in start_xen()
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240208104339.37826-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240208104339.37826-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 08/02/2024 10:43, Michal Orzel wrote:
> When running Xen on arm32, in scenario where Xen is loaded at an address
> such as boot_phys_offset >= 2GB, UBSAN reports the following:
> 
> (XEN) UBSAN: Undefined behaviour in arch/arm/setup.c:739:58
> (XEN) pointer operation underflowed 00200000 to 86800000
> (XEN) Xen WARN at common/ubsan/ubsan.c:172
> (XEN) ----[ Xen-4.19-unstable  arm32  debug=y ubsan=y  Not tainted ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<0031b4c0>] ubsan.c#ubsan_epilogue+0x18/0xf0 (PC)
> (XEN)    [<0031d134>] __ubsan_handle_pointer_overflow+0xb8/0xd4 (LR)
> (XEN)    [<0031d134>] __ubsan_handle_pointer_overflow+0xb8/0xd4
> (XEN)    [<004d15a8>] start_xen+0xe0/0xbe0
> (XEN)    [<0020007c>] head.o#primary_switched+0x4/0x30
> 
> The failure is reported for the following line:
> (paddr_t)(uintptr_t)(_start + boot_phys_offset)
> 
> This occurs because the compiler treats (ptr + size) with size bigger than
> PTRDIFF_MAX as undefined behavior. To address this, switch to macro
> virt_to_maddr(), given the future plans to eliminate boot_phys_offset.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7e28f62d09f1..424744ad5e1a 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -736,7 +736,7 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>   
>       /* Register Xen's load address as a boot module. */
>       xen_bootmodule = add_boot_module(BOOTMOD_XEN,
> -                             (paddr_t)(uintptr_t)(_start + boot_phys_offset),
> +                             virt_to_maddr(_start),

The two lines can now be merged. So I have done it while committing.

Also, Stefano, I think this wants to be backported.

Cheers,

-- 
Julien Grall

