Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD92EA66379
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 01:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918351.1323050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKaN-0000fh-VS; Tue, 18 Mar 2025 00:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918351.1323050; Tue, 18 Mar 2025 00:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKaN-0000cy-Si; Tue, 18 Mar 2025 00:13:35 +0000
Received: by outflank-mailman (input) for mailman id 918351;
 Tue, 18 Mar 2025 00:13:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tuKaM-0000cq-6w
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 00:13:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d305f0d4-038d-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 01:13:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F2615C5762;
 Tue, 18 Mar 2025 00:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030F0C4CEE3;
 Tue, 18 Mar 2025 00:13:29 +0000 (UTC)
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
X-Inumbo-ID: d305f0d4-038d-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742256810;
	bh=7P+Vt/vYOKqdO0/1MoQUt9WdgDElQAobc48tQyHct5Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O/YHd/OuWJ1aTyBh3Ds/+0OFaDB/paz0haZQMIs8RSVwZJ3ya1T2yQe4yIxxvKec+
	 hGfmiyVrW0e/xj54eN15igmgJAq0TjEkCgmvZHWQTQ1YGjbnuZ4K6q5kPcqJ/YgrgD
	 fSP+ZFA6YJvzpL/qFPKBGpx8HQyvd1Vt0Es/hI9NbfeCn6ikOQuOwCH8gHQiHou5Jf
	 eTttjQpmveLuCbp4iZXEhhBocMzr1S4CwIK5iFFSC0u2t2BCP9R2cFXD3Q4QBSUJF5
	 XPNEkdW5npAgOoEIW00TsKRM0fQGn0EegXWW+vkGsrER8Gx5e5/NZ5dq10/3ySzhoi
	 ehxbPaOzmv7BQ==
Date: Mon, 17 Mar 2025 17:13:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Grygorii Strashko <grygorii_strashko@epam.com>
cc: xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [ImageBuilder][PATCH] uboot-script-gen: add debug option to
 print final dt "chosen" node
In-Reply-To: <0c399cdc-7a89-4482-a7fe-780da9ad6ca2@epam.com>
Message-ID: <alpine.DEB.2.22.394.2503171713220.3477110@ubuntu-linux-20-04-desktop>
References: <0c399cdc-7a89-4482-a7fe-780da9ad6ca2@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Mar 2025, Grygorii Strashko wrote:
> Add debug DBG_FDT_PRINT_CHOSEN config file option which adds
> print of DT "chosen" node at the end of generated U-boot script.
> 
> This is useful for debug and development purposes.
> 
> Example:
>   ...
>   setenv fdt_high 0xffffffffffffffff
>   fdt print /chosen
>   booti 0x43000000 - 0x43200000
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  README.md                | 8 ++++++++
>  scripts/uboot-script-gen | 5 +++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/README.md b/README.md
> index 4ba430ce74c5..5b75018ea956 100644
> --- a/README.md
> +++ b/README.md
> @@ -396,3 +396,11 @@ disk\_image supports these additional parameters on the
> config file:
>  disk_image also generates on the fly a xl config file for each domU and
>  adds them to the dom0 rootfs partition under /etc/xen. It makes it
>  easier to start those domUs from dom0.
> +
> +
> +## Debug
> +
> +This section defines config file debug options
> +
> +- DBG_FDT_PRINT_CHOSEN specifies that U-Boot script command to print DT
> "chosen"
> +  node will be added to the boot script.
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 0607542b1872..74e3b076910c 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1357,6 +1357,11 @@ device_tree_editing $device_tree_addr
>  # disable device tree reloation
>  echo "setenv fdt_high 0xffffffffffffffff" >> $UBOOT_SOURCE
>  +if test "$DBG_FDT_PRINT_CHOSEN"
> +then
> +    echo "fdt print /chosen" >> $UBOOT_SOURCE
> +fi
> +
>  # append extra u-boot commands (fixups) to script before boot command
>  if test "$APPEND_EXTRA_CMDS"
>  then
> -- 
> 2.34.1
> 

