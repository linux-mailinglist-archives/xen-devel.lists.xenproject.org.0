Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CA0853996
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 19:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680131.1058031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZxGt-0006z4-SF; Tue, 13 Feb 2024 18:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680131.1058031; Tue, 13 Feb 2024 18:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZxGt-0006wo-Pb; Tue, 13 Feb 2024 18:12:43 +0000
Received: by outflank-mailman (input) for mailman id 680131;
 Tue, 13 Feb 2024 18:12:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rZxGs-0006wi-P6
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 18:12:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZxGs-0005By-Ez; Tue, 13 Feb 2024 18:12:42 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZxGs-00033G-9Z; Tue, 13 Feb 2024 18:12:42 +0000
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
	bh=LKJro8zqBQJ4q5uU55hTVf+fEuQUlrtlmKmeOYT/kX8=; b=psr2WBKRe/nS73rUEJzGNt4yuR
	Wa+kVCkw+K/87353qkBHejRkxiS7y510Q/U7752bwRgXuBRS7NPU5m1zmtDVUlhSDGwCLUviRhUtN
	tnP00N4Ptz42NU5HfYRcSf64wTtQHyJttfhWv7IWxBKBpRguCzqweE4yO2xffdqDdRug=;
Message-ID: <cd2091d2-ac71-4d6f-a9a2-e7444889af69@xen.org>
Date: Tue, 13 Feb 2024 18:12:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] xen/arm: switch Arm to use asm-generic/device.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
 <ae256e804cbfd3c5d17ef9d17f100ebbf17c48fc.1707499278.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ae256e804cbfd3c5d17ef9d17f100ebbf17c48fc.1707499278.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 09/02/2024 18:00, Oleksii Kurochko wrote:
> The following changes were done as a result of switching to
> asm-generic/device.h:
>   * DEVICE_GIC was renamed to DEVICE_INTERRUPT_CONTROLLER according
>     to definition of enum device_class in asm-generic/device.h.
>   * acpi-related things in Arm code were guarded by #ifdef CONFIG_ACPI
>     as struct acpi_device_desc was guarded in asm-generic, also functions
>     acpi_device_init() was guarded too as they are using structure
>     acpi_device_desc inside.
>   * drop arm/include/asm/device.h and update arm/include/asm/Makefile
>     to use asm-generic/device.h instead.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V8:
>   - update the commit message
> ---
> Changes in V7:
>   - newly introduced patch which is based on the previous version of the patch:
>       [PATCH v6 9/9] xen/asm-generic: introduce generic device.h
> ---
>   xen/arch/arm/device.c             |   5 ++
>   xen/arch/arm/domain_build.c       |   2 +-
>   xen/arch/arm/gic-v2.c             |   4 +-
>   xen/arch/arm/gic-v3.c             |   6 +-
>   xen/arch/arm/gic.c                |   4 +-
>   xen/arch/arm/include/asm/Makefile |   1 +
>   xen/arch/arm/include/asm/device.h | 124 ------------------------------
>   7 files changed, 14 insertions(+), 132 deletions(-)
>   delete mode 100644 xen/arch/arm/include/asm/device.h
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 1f631d3274..3e02cff008 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -16,7 +16,10 @@
>   #include <xen/lib.h>
>   
>   extern const struct device_desc _sdevice[], _edevice[];
> +
> +#ifdef CONFIG_ACPI
>   extern const struct acpi_device_desc _asdevice[], _aedevice[];
> +#endif

Can you also update the linker script to protect the following code? I.e

#ifdef CONFIG_ACPI
   . = ALIGN(8);
   .adev.info : {
       _asdevice = .;
       *(.adev.info)
       _aedevice = .;
   } :text
#endif

With this change:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

