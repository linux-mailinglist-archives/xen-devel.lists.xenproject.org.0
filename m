Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434E447E9C9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 01:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251182.432457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0Y8e-0006WC-2G; Fri, 24 Dec 2021 00:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251182.432457; Fri, 24 Dec 2021 00:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0Y8d-0006Ty-VC; Fri, 24 Dec 2021 00:08:47 +0000
Received: by outflank-mailman (input) for mailman id 251182;
 Fri, 24 Dec 2021 00:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lMa=RJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n0Y8b-0006Tc-IN
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 00:08:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a646161f-644d-11ec-9e60-abaf8a552007;
 Fri, 24 Dec 2021 01:08:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 61870CE20D6;
 Fri, 24 Dec 2021 00:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288ADC36AE9;
 Fri, 24 Dec 2021 00:08:35 +0000 (UTC)
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
X-Inumbo-ID: a646161f-644d-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640304515;
	bh=tqXkHtPuzTg0lveZkEER0yZRBAcxzhJxp7nd6Zz8io4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c5On+GfXvNx7TTwufTDCOpb9LqyF/qAFjLIbZdu1qpo9ShNJknUjx2sp8cB9FyxHk
	 G9QVmWEJ2tD/sy17Vi3RChB+9hRemSUYIu9FmiiMiQwAh3NKvu3Gx6xvlVMVgZR4bb
	 s27bKQILGL5ZgjUr7Sq2b1y7W9ZRn6aTIAA6NJqlrxqDeRUWssjh/u1AfV0+hoDhAM
	 eVxCBa8zx0FME7PWyOhYJ5Fk/87z1I9WV9SjbNaYJlI/3j3ZGIJyOtBvtSDGXJdkw8
	 OQxOEhKVkvF0ftGpzojkn5QFHVPrFe/9HO5Hxsm+It1yq/sKGs0zHMIYnYmIuzw138
	 nKPEp7CV7wJkQ==
Date: Thu, 23 Dec 2021 16:08:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Dongjiu Geng <gengdongjiu1@gmail.com>, sstabellini@kernel.org, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/arm: fix the build error for GIC
In-Reply-To: <6aabf7fe-81ea-0fbc-a640-75f9ac59806b@xen.org>
Message-ID: <alpine.DEB.2.22.394.2112231606420.2060010@ubuntu-linux-20-04-desktop>
References: <20211222083825.2918045-1-gengdongjiu1@gmail.com> <6aabf7fe-81ea-0fbc-a640-75f9ac59806b@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Dec 2021, Julien Grall wrote:
> Hello,
> 
> On 22/12/2021 09:38, Dongjiu Geng wrote:
> > when enable CONFIG_NEW_VGIC in ARM64 QEMU Platform, it will build failed.
> > so fix it and make it can select GICV2.
> 
> Last time I checked QEMU, it was only able to support GICv3 virtualization.
> Has it changed since?
> 
> > 
> > Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > ---
> > $ make dist-xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j10
> > make -C xen install
> > make[1]: Entering directory
> > '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> > make -f
> > /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig/Makefile.kconfig
> > ARCH=arm64 SRCARCH=arm HOSTCC="gcc" HOSTCXX="g++" syncconfig
> > make[2]: Entering directory
> > '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> > gcc -Wp,-MD,tools/kconfig/.conf.o.d      -c -o tools/kconfig/conf.o
> > tools/kconfig/conf.c
> > gcc -Wp,-MD,tools/kconfig/.confdata.o.d      -c -o tools/kconfig/confdata.o
> > tools/kconfig/confdata.c
> > gcc -Wp,-MD,tools/kconfig/.expr.o.d      -c -o tools/kconfig/expr.o
> > tools/kconfig/expr.c
> > flex -otools/kconfig/lexer.lex.c -L tools/kconfig/lexer.l
> > bison -o tools/kconfig/parser.tab.c --defines=tools/kconfig/parser.tab.h -t
> > -l tools/kconfig/parser.y
> > gcc -Wp,-MD,tools/kconfig/.preprocess.o.d      -c -o
> > tools/kconfig/preprocess.o tools/kconfig/preprocess.c
> > gcc -Wp,-MD,tools/kconfig/.symbol.o.d      -c -o tools/kconfig/symbol.o
> > tools/kconfig/symbol.c
> > gcc -Wp,-MD,tools/kconfig/.lexer.lex.o.d     -I
> > /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o
> > tools/kconfig/lexer.lex.o tools/kconfig/lexer.lex.c
> > gcc -Wp,-MD,tools/kconfig/.parser.tab.o.d     -I
> > /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o
> > tools/kconfig/parser.tab.o tools/kconfig/parser.tab.c
> > gcc  -o tools/kconfig/conf tools/kconfig/conf.o tools/kconfig/confdata.o
> > tools/kconfig/expr.o tools/kconfig/lexer.lex.o tools/kconfig/parser.tab.o
> > tools/kconfig/preprocess.o tools/kconfig/symbol.o
> > tools/kconfig/conf  --syncconfig Kconfig
> > 
> > WARNING: unmet direct dependencies detected for GICV3
> >    Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
> >    Selected by [y]:
> >    - QEMU [=y] && <choice> && ARM_64 [=y]
> > 
> > WARNING: unmet direct dependencies detected for GICV3
> >    Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
> >    Selected by [y]:
> >    - QEMU [=y] && <choice> && ARM_64 [=y]
> > 
> > WARNING: unmet direct dependencies detected for GICV3
> >    Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
> >    Selected by [y]:
> >    - QEMU [=y] && <choice> && ARM_64 [=y]
> > make[2]: Leaving directory
> > '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> > make -f Rules.mk _install
> > make[2]: Entering directory
> > '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> > ---
> >   xen/arch/arm/platforms/Kconfig | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> > index c93a6b2756..6d3ee99456 100644
> > --- a/xen/arch/arm/platforms/Kconfig
> > +++ b/xen/arch/arm/platforms/Kconfig
> > @@ -15,7 +15,6 @@ config ALL_PLAT
> >   config QEMU
> >   	bool "QEMU aarch virt machine support"
> >   	depends on ARM_64
> > -	select GICV3
> 
> Assuming you can use Xen with GICv2 on QEMU, then this change is OK. But we
> are at risk to expose it again via another platform.
> 
> So I think it would be better to also to add a dependency !GICV3 for NEW_VGIC.

I agree. I gave it a try and turns out it is not possible to simply add:

depends on !GICV3

under NEW_VGIC because there is already a !NEW_VGIC under GICV3.
Apparently it creates a circular dependency. Instead, I did the
following and it looks like it is behaving the way we want.


diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..373c698018 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -35,7 +35,7 @@ config ACPI
 
 config GICV3
 	bool "GICv3 driver"
-	depends on ARM_64 && !NEW_VGIC
+	depends on ARM_64
 	default y
 	---help---
 
@@ -44,13 +44,14 @@ config GICV3
 
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
-        depends on GICV3 && !NEW_VGIC
+        depends on GICV3
 
 config HVM
         def_bool y
 
 config NEW_VGIC
 	bool "Use new VGIC implementation"
+	depends on !GICV3
 	---help---
 
 	This is an alternative implementation of the ARM GIC interrupt

