Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395F88600F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 18:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696564.1087592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMYq-0002MW-Sc; Thu, 21 Mar 2024 17:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696564.1087592; Thu, 21 Mar 2024 17:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMYq-0002Kq-Pb; Thu, 21 Mar 2024 17:50:40 +0000
Received: by outflank-mailman (input) for mailman id 696564;
 Thu, 21 Mar 2024 17:50:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rnMYp-0002Kk-Pf
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 17:50:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMYp-00071p-8N; Thu, 21 Mar 2024 17:50:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMYp-0007wq-3T; Thu, 21 Mar 2024 17:50:39 +0000
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
	bh=1P3zCLTH2yN7EEJFWC9YGchWlVxdbo5LrNJcFyJFkKM=; b=ou4tTPW9hIbinF+nIdZds4EEWD
	96ysr73OQOYlfenbJ6n8CULfLQQpXxCTWKKdPIS9WL6wBLVX77K3gEe6jYTc8vdXSmauBscUSKE+Z
	1gl5/TM3FFtR3RRcI8mpZxzGJ0BokZDMTfjqngtVghfWuCFi2P0D7qrln1b4h4q9Rli8=;
Message-ID: <6069d3de-b298-46e6-a64b-895df3ea037b@xen.org>
Date: Thu, 21 Mar 2024 17:50:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] xen/common: Move Arm's bootfdt.c to common
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <908ea2d9bccf0b3455119cfd9af0597aee005fe8.1710443965.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <908ea2d9bccf0b3455119cfd9af0597aee005fe8.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 14/03/2024 22:15, Shawn Anastasio wrote:
> Move Arm's bootfdt.c to xen/common so that it can be used by other
> device tree architectures like PPC and RISCV.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Acked-by: Julien Grall <julien@xen.org>
> ---
> Changes in v2:
>    - Drop #if defined(CONFIG_ARM_EFI) now that efi_enabled is stubbed
> 
>   MAINTAINERS                                    | 1 +
>   xen/arch/arm/Makefile                          | 1 -
>   xen/common/device-tree/Makefile                | 1 +
>   xen/{arch/arm => common/device-tree}/bootfdt.c | 0
>   4 files changed, 2 insertions(+), 1 deletion(-)
>   rename xen/{arch/arm => common/device-tree}/bootfdt.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e85fbe6737..20fdec9ffa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -251,6 +251,7 @@ S:	Supported
>   L:	xen-devel@lists.xenproject.org
>   F:	docs/misc/arm/
>   F:	xen/arch/arm/
> +F:	xen/common/device-tree/bootfdt.c
>   F:	xen/drivers/char/arm-uart.c
>   F:	xen/drivers/char/cadence-uart.c
>   F:	xen/drivers/char/exynos4210-uart.c
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 7b1350e2ef..9e1548378c 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -10,7 +10,6 @@ obj-$(CONFIG_TEE) += tee/
>   obj-$(CONFIG_HAS_VPCI) += vpci.o
> 
>   obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
> -obj-y += bootfdt.init.o
>   obj-y += cpuerrata.o
>   obj-y += cpufeature.o
>   obj-y += decode.o
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index c97b2bd88c..fa5beafd65 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1 +1,2 @@
> +obj-y += bootfdt.init.o
>   obj-y += bootinfo.o

Looking at the names, it is not entirely clear what would be the 
differences between bootfdt and bootinfo. Should they just be one file?

> diff --git a/xen/arch/arm/bootfdt.c b/xen/common/device-tree/bootfdt.c
> similarity index 100%
> rename from xen/arch/arm/bootfdt.c
> rename to xen/common/device-tree/bootfdt.c
> --
> 2.30.2
> 

Cheers,

-- 
Julien Grall

