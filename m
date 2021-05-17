Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36090382847
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 11:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128121.240586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liZX6-00053E-RO; Mon, 17 May 2021 09:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128121.240586; Mon, 17 May 2021 09:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liZX6-00051N-O6; Mon, 17 May 2021 09:27:28 +0000
Received: by outflank-mailman (input) for mailman id 128121;
 Mon, 17 May 2021 09:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liZX5-00051H-2q
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 09:27:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1ad6a74-381c-4322-bc71-74a7ff25a2eb;
 Mon, 17 May 2021 09:27:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36D7DAFF8;
 Mon, 17 May 2021 09:27:24 +0000 (UTC)
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
X-Inumbo-ID: f1ad6a74-381c-4322-bc71-74a7ff25a2eb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621243644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TuSZq57slPhRjEpsOagedplSNHlE1CPas+IHMHEAuA=;
	b=evwleRH3g7PteA9yos1s6bIyXReBgnSIPuZiUso5pI0dPrEph8MBjaVaxcoFsCy1Oh3HJo
	BZMRpgAR+jh6hJkHY18ezsZRPxgysm8gql7H/0lmE0PU8fHBUCHIEwS51PuF/JhD1Z89W2
	u9O7FvGfdXQFKFSbp5w2HfUgw6nzs/0=
Subject: Re: [PATCH] drivers/char: Add USB3 debug capability driver
To: Connor Davis <connojdavis@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <9a6a15ebc538105c83be88883ab3a7125ed52d37.1620776791.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <912fa28c-5cb3-cf40-00db-19423c442da3@suse.com>
Date: Mon, 17 May 2021 11:27:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9a6a15ebc538105c83be88883ab3a7125ed52d37.1620776791.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.05.2021 02:12, Connor Davis wrote:
> Add support for the xHCI debug capability (DbC). The DbC provides
> a SuperSpeed serial link between a debug target running Xen and a
> debug host. To use it you will need a USB3 A/A debug cable plugged into
> a root port on the target machine. Recent kernels report the existence
> of the DbC capability at
> 
>   /sys/kernel/debug/usb/xhci/<seg>:<bus>:<slot>.<func>/reg-ext-dbc:00
> 
> The host machine should have the usb_debug.ko module on the system
> (the cable can be plugged into any port on the host side). After the
> host usb_debug enumerates the DbC, it will create a /dev/ttyUSB<n> file
> that can be used with things like minicom.
> 
> To use the DbC as a console, pass `console=dbgp dbgp=xhci`
> on the xen command line. This will select the first host controller
> found that implements the DbC. Other variations to 'dbgp=' are accepted,
> please see xen-command-line.pandoc for more. Remote GDB is also supported
> with `gdb=dbgp dbgp=xhci`. Note that to see output and/or provide input
> after dom0 starts, DMA remapping of the host controller must be
> disabled.
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
>  MAINTAINERS                       |    6 +
>  docs/misc/xen-command-line.pandoc |   19 +-
>  xen/arch/x86/Kconfig              |    1 -
>  xen/arch/x86/setup.c              |    1 +
>  xen/drivers/char/Kconfig          |   15 +
>  xen/drivers/char/Makefile         |    1 +
>  xen/drivers/char/xhci-dbc.c       | 1122 +++++++++++++++++++++++++++++
>  xen/drivers/char/xhci-dbc.h       |  621 ++++++++++++++++

What is the reason for needing the separate header? Isn't / can't all
logic (be) contained within xhci-dbc.c? If this is because you clone
code from elsewhere (as the initial comment in the files seems to
suggest), it might be a good idea for the description to say so.
Depending on the origin and possible plans to keep out clone in sync
down the road, undoing this separation as well as correction of certain
style issues (which I'm not going to try to spot consistently just yet)
may then not want requesting. Otoh the files look to have been converted
to Xen style, so direct syncing may not be a goal.

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -714,9 +714,26 @@ Available alternatives, with their meaning, are:
>  ### dbgp
>  > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
>  
> -Specify the USB controller to use, either by instance number (when going
> +Specify the EHCI USB controller to use, either by instance number (when going
>  over the PCI busses sequentially) or by PCI device (must be on segment 0).
>  
> +If you have a system with an xHCI USB controller that supports the Debug
> +Capability (DbC), you can use
> +
> +> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
> +
> +To use this, you need a USB3 A/A debugging cable plugged into a SuperSpeed
> +root port on the target machine. Recent kernels expose the existence of the
> +DbC at /sys/kernel/debug/usb/xhci/<seg>:<bus>:<slot>.<func>/reg-ext-dbc:00.
> +Note that to see output and process input after dom0 is started, you need to
> +ensure that the host controller's DMA is not remapped (e.g. with
> +dom0-iommu=passthrough).

This is a relatively bad limitation imo - people would better not get
used to using passthrough mode, and debugging other IOMMU modes (for
Dom0) may then be impossible at all.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -11,7 +11,6 @@ config X86
>  	select HAS_ALTERNATIVE
>  	select HAS_COMPAT
>  	select HAS_CPUFREQ
> -	select HAS_EHCI

Why?

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -63,6 +63,21 @@ config HAS_SCIF
>  config HAS_EHCI
>  	bool
>  	depends on X86
> +        default y if !HAS_XHCI_DBC

Again, way? The two drivers shouldn't be exclusive of one another.

Also please note the mixture of indentation you introduce.

>  	help
>  	  This selects the USB based EHCI debug port to be used as a UART. If
>  	  you have an x86 based system with USB, say Y.
> +
> +config HAS_XHCI_DBC
> +	bool "xHCI Debug Capability driver"

A setting name HAS_* wouldn't normally have a prompt.

> +	depends on X86 && HAS_PCI
> +	help
> +	  This selects the xHCI Debug Capabilty to be used as a UART.
> +
> +config XHCI_FIXMAP_PAGES
> +        int "Number of fixmap entries to allocate for the xHC"
> +	depends on HAS_XHCI_DBC
> +        default 16
> +        help
> +          This should equal the size (in 4K pages) of the first 64-bit
> +          BAR of the host controller in which the DbC is being used.

Again - please use consistent (in itself as well as with the rest of
the file) indentation.

Jan

