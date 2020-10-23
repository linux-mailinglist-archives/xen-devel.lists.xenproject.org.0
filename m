Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D503E296A4B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 09:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10741.28644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVrQa-0006kw-Nm; Fri, 23 Oct 2020 07:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10741.28644; Fri, 23 Oct 2020 07:23:56 +0000
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
	id 1kVrQa-0006kX-Ka; Fri, 23 Oct 2020 07:23:56 +0000
Received: by outflank-mailman (input) for mailman id 10741;
 Fri, 23 Oct 2020 07:23:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVrQZ-0006jo-5U
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 07:23:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3572783e-1b9d-4ce2-b6d9-c24579dccee8;
 Fri, 23 Oct 2020 07:23:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 303B9ACC4;
 Fri, 23 Oct 2020 07:23:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVrQZ-0006jo-5U
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 07:23:55 +0000
X-Inumbo-ID: 3572783e-1b9d-4ce2-b6d9-c24579dccee8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3572783e-1b9d-4ce2-b6d9-c24579dccee8;
	Fri, 23 Oct 2020 07:23:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603437833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XKi9lIqkUcYox5yJhEdLIRNbCvTjIhSfcdCdbLv9Dxs=;
	b=F3++9Q6CAXssj7ySAz86mgcxN2wY4jEUZHrE9a6jLaZc/pkcomxYxeVhpdyhZlqGQDT6X/
	7tE2xEngsLZibVmfPPX01Ou+ytTqW1U7u+BfPUd72WbJTHMLIxrNmhWaSj54vaCG7i6hV7
	6ykzzRAFTNZPiBruXQ9VEl10J9gfTa4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 303B9ACC4;
	Fri, 23 Oct 2020 07:23:53 +0000 (UTC)
Subject: Re: [PATCH] xen/arm: ACPI: Remove EXPERT dependancy, default on for
 ARM64
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201022014310.GA70872@mattapan.m5p.com>
 <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org>
 <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
 <20201023033506.GC83870@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9b6138a-e42c-a8d8-e07f-243ac6bc8d23@suse.com>
Date: Fri, 23 Oct 2020 09:23:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201023033506.GC83870@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.10.2020 05:35, Elliott Mitchell wrote:
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

The "if" is pointless with the "depends on".

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
> +

We have an abstraction for such warnings, causing them to appear
later in the boot process and then consistently all in one place
(both increasing, as we believe, the chances of being noticed):
warning_add(). There's a delay accompanied with this, so I think
you will want to also have a command line option allowing to
silence this warning. "acpi=on" or "acpi=force", as available on
x86 and (possibly wrongly right now) not documented as
x86-specific, may be (re-)usable, i.e. to avoid having to
introduce some entirely new option.

Also a few formal nits: The subject tag should have been [PATCH v2],
there should have been a short revision log outside of the commit
message area, and new patch versione would better start their own
new threads than being in-reply-to the earlier version's one.

Jan

