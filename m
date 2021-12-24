Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD28E47EF26
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 14:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251370.432666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0kZv-00021f-SS; Fri, 24 Dec 2021 13:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251370.432666; Fri, 24 Dec 2021 13:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0kZv-0001yy-PQ; Fri, 24 Dec 2021 13:25:47 +0000
Received: by outflank-mailman (input) for mailman id 251370;
 Fri, 24 Dec 2021 13:25:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n0kZv-0001ys-7Y
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 13:25:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n0kZs-0002Wi-OH; Fri, 24 Dec 2021 13:25:44 +0000
Received: from lfbn-ren-1-1977-131.w90-59.abo.wanadoo.fr ([90.59.184.131]
 helo=[192.168.1.19]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n0kZs-0004Ie-GS; Fri, 24 Dec 2021 13:25:44 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=Tc31zzAVRD/enlNNySasUJXFSHzjRoHay+n1Uj2InDA=; b=6QPX/GT9wXsFjo18Sbv3roj5QZ
	sVOOZfRK73G2CDBqjxfOTPTw+NHCR5dpKtYwyTJIFh/vXdFBaDH2bl94UCeY2/jrBQYB4kqBiviLr
	fE2KpbStD96qynacez1b9ZyZue3SEPcwVDYKFxQttowm5s9OkpcCu4baeFHjDcCzch9M=;
Message-ID: <22172c85-b024-a28a-e351-82038cf0efa1@xen.org>
Date: Fri, 24 Dec 2021 14:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v2] xen/arm: fix the build error for GIC on ARM64 QEMU
 Platform
To: Dongjiu Geng <gengdongjiu1@gmail.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20211224122451.1210382-1-gengdongjiu1@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211224122451.1210382-1-gengdongjiu1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/12/2021 13:24, Dongjiu Geng wrote:
> when enable CONFIG_NEW_VGIC in ARM64 QEMU Platform, it will build failed.
> so fix it and make it can select GICV2.

As I said in v1, last time I checked QEMU was only able to support 
virtualization with GICv3. This is why we added a depends on.

If you want to remove it, then I think you ought to explain in the 
commit message why this is fine. A pointer to the commit or a QEMU 
version used would be useful.

> 
> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> ---
> $ make dist-xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j10
> make -C xen install
> make[1]: Entering directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> make -f /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig/Makefile.kconfig ARCH=arm64 SRCARCH=arm HOSTCC="gcc" HOSTCXX="g++" syncconfig
> make[2]: Entering directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> gcc -Wp,-MD,tools/kconfig/.conf.o.d      -c -o tools/kconfig/conf.o tools/kconfig/conf.c
> gcc -Wp,-MD,tools/kconfig/.confdata.o.d      -c -o tools/kconfig/confdata.o tools/kconfig/confdata.c
> gcc -Wp,-MD,tools/kconfig/.expr.o.d      -c -o tools/kconfig/expr.o tools/kconfig/expr.c
> flex -otools/kconfig/lexer.lex.c -L tools/kconfig/lexer.l
> bison -o tools/kconfig/parser.tab.c --defines=tools/kconfig/parser.tab.h -t -l tools/kconfig/parser.y
> gcc -Wp,-MD,tools/kconfig/.preprocess.o.d      -c -o tools/kconfig/preprocess.o tools/kconfig/preprocess.c
> gcc -Wp,-MD,tools/kconfig/.symbol.o.d      -c -o tools/kconfig/symbol.o tools/kconfig/symbol.c
> gcc -Wp,-MD,tools/kconfig/.lexer.lex.o.d     -I /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/lexer.lex.o tools/kconfig/lexer.lex.c
> gcc -Wp,-MD,tools/kconfig/.parser.tab.o.d     -I /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/parser.tab.o tools/kconfig/parser.tab.c
> gcc  -o tools/kconfig/conf tools/kconfig/conf.o tools/kconfig/confdata.o tools/kconfig/expr.o tools/kconfig/lexer.lex.o tools/kconfig/parser.tab.o tools/kconfig/preprocess.o tools/kconfig/symbol.o
> tools/kconfig/conf  --syncconfig Kconfig
> 
> WARNING: unmet direct dependencies detected for GICV3
>    Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
>    Selected by [y]:
>    - QEMU [=y] && <choice> && ARM_64 [=y]
> 
> WARNING: unmet direct dependencies detected for GICV3
>    Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
>    Selected by [y]:
>    - QEMU [=y] && <choice> && ARM_64 [=y]
> 
> WARNING: unmet direct dependencies detected for GICV3
>    Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
>    Selected by [y]:
>    - QEMU [=y] && <choice> && ARM_64 [=y]
> make[2]: Leaving directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> make -f Rules.mk _install
> make[2]: Entering directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> ---
>   xen/arch/arm/Kconfig           | 5 +++--
>   xen/arch/arm/platforms/Kconfig | 1 -
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..373c698018 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig

The change in arch/arm/Kconfig is not really related to this patch. 
Technically the part in platforms/Kconfig is sufficient. I still think 
the change is good to have but it should be in a separate patch.

> @@ -35,7 +35,7 @@ config ACPI
>   
>   config GICV3
>   	bool "GICv3 driver"
> -	depends on ARM_64 && !NEW_VGIC
> +	depends on ARM_64
>   	default y
>   	---help---
>   
> @@ -44,13 +44,14 @@ config GICV3
>   
>   config HAS_ITS
>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
> -        depends on GICV3 && !NEW_VGIC
> +        depends on GICV3
>   
>   config HVM
>           def_bool y
>   
>   config NEW_VGIC
>   	bool "Use new VGIC implementation"
> +	depends on !GICV3
>   	---help---
>   
>   	This is an alternative implementation of the ARM GIC interrupt
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index c93a6b2756..6d3ee99456 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -15,7 +15,6 @@ config ALL_PLAT
>   config QEMU
>   	bool "QEMU aarch virt machine support"
>   	depends on ARM_64
> -	select GICV3
>   	select HAS_PL011
>   	---help---
>   	Enable all the required drivers for QEMU aarch64 virt emulated

Cheers,

-- 
Julien Grall

