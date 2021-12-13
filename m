Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6E64736B8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 22:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246320.424794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwtBF-0001oJ-5I; Mon, 13 Dec 2021 21:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246320.424794; Mon, 13 Dec 2021 21:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwtBF-0001mV-1R; Mon, 13 Dec 2021 21:48:21 +0000
Received: by outflank-mailman (input) for mailman id 246320;
 Mon, 13 Dec 2021 21:48:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6XJ=Q6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mwtBD-0001mP-N0
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 21:48:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61fec5b5-5c5e-11ec-85d3-df6b77346a89;
 Mon, 13 Dec 2021 22:48:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63AE3B816AF;
 Mon, 13 Dec 2021 21:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56E7C34601;
 Mon, 13 Dec 2021 21:48:12 +0000 (UTC)
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
X-Inumbo-ID: 61fec5b5-5c5e-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639432093;
	bh=1cnD1O/VeCmLflBUi0Sr2SSNlLd75eWhRz2JHZl5nqM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ujjSIJgFSS0OVfXxRZZXuxP1RuaL20zq9LnbVVxJ9WZDn/LlHyuWiaLwb/xpLjeML
	 ii03J+FhQmtEu2N1Fur5O8A6LlyhLG+uKVHYLxoegjhAVLryWSMOHnYwIdDYkcQfST
	 jA311eD09dv2qCXDOnji6uie2AXLBnjGsWlamP2Apra4aYtXOFeyxX2HaZpMTeYk2Y
	 OdQIHVYhc+9teab4Xs6NkXq3YAJf8+BYqWo9dEr1kXU52Novur48ZooMgVrIpduc4S
	 sot8iG8uk42TKjNesvLDoERIb+nKFRCRUSAvXDYTpiZK68Wdefze4zw46MHczTY+Z/
	 lghRAP3jw7QMg==
Date: Mon, 13 Dec 2021 13:48:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] arm/efi: Handle Xen bootargs from both xen.cfg and
 DT
In-Reply-To: <20211213114854.25632-1-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2112131347300.3376@ubuntu-linux-20-04-desktop>
References: <20211213114854.25632-1-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Dec 2021, Luca Fancellu wrote:
> Currently the Xen UEFI stub can accept Xen boot arguments from
> the Xen configuration file using the "options=" keyword, but also
> directly from the device tree specifying xen,xen-bootargs
> property.
> 
> When the configuration file is used, device tree boot arguments
> are ignored and overwritten even if the keyword "options=" is
> not used.
> 
> This patch handle this case, so if the Xen configuration file is not
> specifying boot arguments, the device tree boot arguments will be
> used, if they are present.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2 changes:
>  - Changed logic, now xen cfg bootarg value has precedence over DT
> ---
>  docs/misc/efi.pandoc        |  4 ++++
>  xen/arch/arm/efi/efi-boot.h | 15 +++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index abafb3452758..71fdc316b67b 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -249,6 +249,10 @@ UEFI stub for module loading.
>  When adding DomU modules to device tree, also add the property
>  xen,uefi-cfg-load under chosen for Xen to load the Xen config file.
>  Otherwise, Xen will skip the config file and rely on device tree alone.
> +When using the Xen configuration file in conjunction with the device tree, you
> +can specify the Xen boot arguments in the configuration file with the "options="
> +keyword or in the device tree with the "xen,xen-bootargs" property, but be
> +aware that the Xen configuration file value has a precedence over the DT value.
>  
>  Example 1 of how to boot a true dom0less configuration:
>  
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 4fb345f225c8..ae8627134e5a 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -503,11 +503,26 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>  
>      if ( cfgfile_options )
>      {
> +        PrintMessage(L"Using bootargs from Xen configuration file.");
>          prop_len += snprintf(buf + prop_len,
>                                 EFI_PAGE_SIZE - prop_len, " %s", cfgfile_options);
>          if ( prop_len >= EFI_PAGE_SIZE )
>              blexit(L"FDT string overflow");
>      }
> +    else
> +    {
> +        /* Get xen,xen-bootargs in /chosen if it is specified */
> +        const char *dt_bootargs_prop = fdt_getprop(fdt, chosen,
> +                                                   "xen,xen-bootargs", NULL);
> +        if ( dt_bootargs_prop )
> +        {
> +            PrintMessage(L"Using bootargs from device tree.");
> +            prop_len += snprintf(buf + prop_len, EFI_PAGE_SIZE - prop_len,
> +                                 " %s", dt_bootargs_prop);
> +            if ( prop_len >= EFI_PAGE_SIZE )
> +                blexit(L"FDT string overflow");
> +        }
> +    }
>  
>      if ( cmdline_options )
>      {
> -- 
> 2.17.1
> 

