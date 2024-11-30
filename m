Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CDF9DF23B
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2024 18:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846205.1261411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHRHK-0003go-7M; Sat, 30 Nov 2024 17:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846205.1261411; Sat, 30 Nov 2024 17:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHRHK-0003fK-4a; Sat, 30 Nov 2024 17:29:10 +0000
Received: by outflank-mailman (input) for mailman id 846205;
 Sat, 30 Nov 2024 17:29:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tHRHI-0003fE-Hl
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2024 17:29:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tHRHH-00DSlp-34;
 Sat, 30 Nov 2024 17:29:08 +0000
Received: from [2a02:8012:3a1:0:d435:aa99:ecdf:cc2c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tHRHI-005wHV-08;
 Sat, 30 Nov 2024 17:29:08 +0000
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
	bh=Xm/m1HNW4xgr2WptaQMQTFZuOScWp1zEIT9ZTgnRzrw=; b=Rl4D/P/lbQuv/iLjMW6tpy9nGt
	F+spvUgkm1jEa1gxrIdmk7dNoaGPcywXXRWpeZIPY4wmq3e9tBjpMPzo16UvdzR3tR+Q2f7EX2VEp
	SIh4PffiiZcJV3X87+2OXaMVh3fQZtef1SScf+z9AA86PeELEUwxgmtXZxJ0PdcGFGwI=;
Message-ID: <218d57c7-397e-4eeb-9e58-7b3350b11768@xen.org>
Date: Sat, 30 Nov 2024 17:29:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] build: arm64: provide -target and -march if using
 clang
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
 <20241129014850.2852844-4-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241129014850.2852844-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 29/11/2024 01:49, Volodymyr Babchuk wrote:
> Provide -target and -march explicitly when building with clang. This
> makes cross-compilation much easier, because clang accept this
> parameters regardless of host platform. Basically,
> 
>    make XEN_TARGET_ARCH=arm64 clang=y llvm=y
> 
> will behave in the same way if building Xen on x86, or on arm64 or on
> any other platform.
> 
> -march is required because with default value, clang will not
> recognize EL2 registers.

Any chance this is happening because you are using "-target aarch64" 
rather than e.g. "arch64-arm-none-eabi"?

> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   config/arm64.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/config/arm64.mk b/config/arm64.mk
> index c4662f67d0..97eb9a82e7 100644
> --- a/config/arm64.mk
> +++ b/config/arm64.mk
> @@ -5,6 +5,10 @@ CONFIG_XEN_INSTALL_SUFFIX :=
>   
>   CFLAGS += #-marm -march= -mcpu= etc
>   
> +ifeq ($(clang),y)
> +CFLAGS += -target aarch64 -march=armv8-a

AFAIU, -target is the triplet similar to what one would set 
CROSS_COMPILE. If you don't specify some values, then it will assume the 
compiler defaults. I am not sure this is a good idea as this could 
change between compilers. So should we set the triplet properly (e.g. 
arch64-arm-none-eabi) or maybe let the user specify it via CROSS_COMPILE?

Regarding -march=armv8-a, if you want to keep it, then I think it should 
be outside of the 'if' because this could also apply for GCC.

Cheers,

-- 
Julien Grall


