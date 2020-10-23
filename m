Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0E7297585
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 19:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11290.29909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW0XQ-0006u6-7c; Fri, 23 Oct 2020 17:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11290.29909; Fri, 23 Oct 2020 17:07:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW0XQ-0006th-4F; Fri, 23 Oct 2020 17:07:36 +0000
Received: by outflank-mailman (input) for mailman id 11290;
 Fri, 23 Oct 2020 17:07:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3H45=D6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kW0XP-0006tc-73
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 17:07:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11bd47f6-078b-4fab-8ea8-9540902e1f68;
 Fri, 23 Oct 2020 17:07:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CCBD2087D;
 Fri, 23 Oct 2020 17:07:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3H45=D6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kW0XP-0006tc-73
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 17:07:35 +0000
X-Inumbo-ID: 11bd47f6-078b-4fab-8ea8-9540902e1f68
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 11bd47f6-078b-4fab-8ea8-9540902e1f68;
	Fri, 23 Oct 2020 17:07:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4CCBD2087D;
	Fri, 23 Oct 2020 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603472853;
	bh=VJWSCbydwWntfptwMJaoHDDXL2wUeScfu8+vf3MpODo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CU1gdFjydIM8guFmBjVEVmIjRfVmd0EvO94eNtigdvemOEkLiRmixiH9N5kyUL/Cs
	 3XEDnpPfBbx2tBWxZe70uu9uH/h342WZp0JK3bkQ8FOKpuzAXU3Th6P+ImtG1MZEVu
	 OvV794Zy3TA14GfVxgY4E7DK5fNp6wY31wKDfYH4=
Date: Fri, 23 Oct 2020 10:07:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: ACPI: Remove EXPERT dependancy, default on for
 ARM64
In-Reply-To: <20201023033506.GC83870@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.21.2010231002300.12247@sstabellini-ThinkPad-T480s>
References: <20201022014310.GA70872@mattapan.m5p.com> <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org> <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s> <20201023033506.GC83870@mattapan.m5p.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Oct 2020, Elliott Mitchell wrote:
> Linux requires UEFI support to be enabled on ARM64 devices.  While many
> ARM64 devices lack ACPI, the writing seems to be on the wall of UEFI/ACPI
> potentially taking over.  Some common devices may require ACPI table
> support to boot.

Let's not make guesses on the direction of the industry in a commit
message :-)

The following would suffice:

Some common ARM64 devices require ACPI to boot (no device tree is
available).


> For devices which can boot in either mode, continue defaulting to
> device-tree.  Add warnings about using ACPI advising users of present
> situation.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> Okay, hopefully this is okay.  Warning in Kconfig, warning on boot.
> Perhaps "default y if ARM_64" is redundant, yet if someone tries to make
> it possible to boot aarch32 on a ACPI machine...
> 
> I also want a date in the message.  Theory is this won't be there
> forever, so a date is essential.
> ---
>  xen/arch/arm/Kconfig     | 7 ++++++-
>  xen/arch/arm/acpi/boot.c | 9 +++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 2777388265..29624d03fa 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -32,13 +32,18 @@ menu "Architecture Features"
>  source "arch/Kconfig"
>  
>  config ACPI
> -	bool "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
> +	bool "ACPI (Advanced Configuration and Power Interface) Support"
>  	depends on ARM_64
> +	default y if ARM_64

I am not so sure about the "default y" for the reason that the option is
not technically "supported", so it is probably best to take the default
line out. Otherwise we end up with a default "unsupported" kconfig which
is not great.


>  	---help---
>  
>  	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>  	  an alternative to device tree on ARM64.
>  
> +	  Note this is presently EXPERIMENTAL.  If a given device has both
> +	  device-tree and ACPI support, it is presently (October 2020)
> +	  recommended to boot using the device-tree.

Please remove the date from the message. We'll update as needed in the
future. The following works:

 Note this is presently EXPERIMENTAL.  If a given device has both
 device-tree and ACPI support, it is recommended to boot using the
 device-tree.


>  config GICV3
>  	bool "GICv3 driver"
>  	depends on ARM_64 && !NEW_VGIC
> diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
> index 30e4bd1bc5..c0e8f85325 100644
> --- a/xen/arch/arm/acpi/boot.c
> +++ b/xen/arch/arm/acpi/boot.c
> @@ -254,6 +254,15 @@ int __init acpi_boot_table_init(void)
>                                     dt_scan_depth1_nodes, NULL) )
>          goto disable;
>  
> +    printk("\n"
> +"*************************************************************************\n"
> +"*    WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING    *\n"
> +"*                                                                       *\n"
> +"* Xen-ARM ACPI support is EXPERIMENTAL.  It is presently (October 2020) *\n"
> +"* recommended you boot your system in device-tree mode if you can.      *\n"
> +"*************************************************************************\n"
> +            "\n");

Please use warning_add and remove the date from the message.


>      /*
>       * ACPI is disabled at this point. Enable it in order to parse
>       * the ACPI tables.
> -- 
> 2.20.1
> 
> 
> -- 
> (\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
> 
> 

