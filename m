Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C832767529A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 11:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481656.746700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIojd-0004yy-3f; Fri, 20 Jan 2023 10:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481656.746700; Fri, 20 Jan 2023 10:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIojd-0004wp-0h; Fri, 20 Jan 2023 10:35:01 +0000
Received: by outflank-mailman (input) for mailman id 481656;
 Fri, 20 Jan 2023 10:34:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIoja-0004wj-W6
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 10:34:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIoja-0001zc-Mz; Fri, 20 Jan 2023 10:34:58 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIoja-0007Im-H3; Fri, 20 Jan 2023 10:34:58 +0000
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
	bh=yK9n1ucu2MciRbRuZkmhuzvoqNhvwiLEWBhtIGPI7IA=; b=DnGDT7iBOdaaV6Jc8t0LGZDRV8
	36l/TFKzbJK+c+bGa7Xingd9j2y7d2cZgychVP/1wh8lnJVw2Ua6L/uMOca98JkN7gPX64h6JmERB
	8BxhqnQumxxv2+oX+hBGJxr4iSttzi3iOhRekmsQXhFUxmu3ntypgpDUr4MMxAYMui1k=;
Message-ID: <a4775838-1ef6-d227-5747-d525136d62c5@xen.org>
Date: Fri, 20 Jan 2023 10:34:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for
 address/size
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-6-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117174358.15344-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/01/2023 17:43, Ayan Kumar Halder wrote:
> One should now be able to use 'paddr_t' to represent address and size.
> Consequently, one should use 'PRIpaddr' as a format specifier for paddr_t.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from -
> 
> v1 - 1. Rebased the patch.
> 
>   xen/arch/arm/domain_build.c        |  9 +++++----
>   xen/arch/arm/gic-v3.c              |  2 +-
>   xen/arch/arm/platforms/exynos5.c   | 26 +++++++++++++-------------
>   xen/drivers/char/exynos4210-uart.c |  2 +-
>   xen/drivers/char/ns16550.c         |  8 ++++----
>   xen/drivers/char/omap-uart.c       |  2 +-
>   xen/drivers/char/pl011.c           |  4 ++--
>   xen/drivers/char/scif-uart.c       |  2 +-
>   xen/drivers/passthrough/arm/smmu.c |  6 +++---
>   9 files changed, 31 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 72b9afbb4c..cf8ae37a14 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1666,7 +1666,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>       dt_for_each_device_node( dt_host, np )
>       {
>           unsigned int naddr;
> -        u64 addr, size;
> +        paddr_t addr, size;

Without the next patch, this change is incorrect because 
dt_device_get_address() expects a 64-bit value rather than paddr_t.

So the type change wants to be moved in the next patch. The same goes 
for any variable you modifed in this patch used by dt_device_get_address().

Cheers,

-- 
Julien Grall

