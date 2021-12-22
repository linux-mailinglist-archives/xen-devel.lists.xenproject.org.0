Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCAB47CEF2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 10:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250697.431738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzxjE-0001OB-04; Wed, 22 Dec 2021 09:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250697.431738; Wed, 22 Dec 2021 09:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzxjD-0001Ky-Se; Wed, 22 Dec 2021 09:16:07 +0000
Received: by outflank-mailman (input) for mailman id 250697;
 Wed, 22 Dec 2021 09:16:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mzxjC-0001Ks-CT
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 09:16:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mzxj8-0000Kh-1j; Wed, 22 Dec 2021 09:16:02 +0000
Received: from [54.239.6.186] (helo=[192.168.17.226])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mzxj7-00088M-PS; Wed, 22 Dec 2021 09:16:01 +0000
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
	bh=vTgQ5R40UUgTfTNSU0UXU2rYDWhtKPf1WN1czx89r58=; b=3++HQZ2MeU9C8NndI+YWwLTlYs
	FizeiqSINwTvYMiMLK+7CvtvJRqVUEGMQ3oQ+YqgeKzxKMuU8cUoLxNXBA/Ykf/Ysbq0MktAL3/oS
	nVRGHTEE64DR8v8f9VtUu5wSb5PGxLxRHAniywpWXV+vSbOszwd3ktNKwctggWJ+copY=;
Message-ID: <6aabf7fe-81ea-0fbc-a640-75f9ac59806b@xen.org>
Date: Wed, 22 Dec 2021 10:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/arm: fix the build error for GIC
To: Dongjiu Geng <gengdongjiu1@gmail.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20211222083825.2918045-1-gengdongjiu1@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211222083825.2918045-1-gengdongjiu1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 22/12/2021 09:38, Dongjiu Geng wrote:
> when enable CONFIG_NEW_VGIC in ARM64 QEMU Platform, it will build failed.
> so fix it and make it can select GICV2.

Last time I checked QEMU, it was only able to support GICv3 
virtualization. Has it changed since?

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
>   xen/arch/arm/platforms/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index c93a6b2756..6d3ee99456 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -15,7 +15,6 @@ config ALL_PLAT
>   config QEMU
>   	bool "QEMU aarch virt machine support"
>   	depends on ARM_64
> -	select GICV3

Assuming you can use Xen with GICv2 on QEMU, then this change is OK. But 
we are at risk to expose it again via another platform.

So I think it would be better to also to add a dependency !GICV3 for 
NEW_VGIC.

Cheers,

-- 
Julien Grall

