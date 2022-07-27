Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C335833F1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 22:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376452.609227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGnLO-0004oT-7N; Wed, 27 Jul 2022 20:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376452.609227; Wed, 27 Jul 2022 20:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGnLO-0004m7-3l; Wed, 27 Jul 2022 20:09:22 +0000
Received: by outflank-mailman (input) for mailman id 376452;
 Wed, 27 Jul 2022 20:09:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oGnLM-0004m1-Jr
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 20:09:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fee93fc6-0de7-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 22:09:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F33BA61ABC;
 Wed, 27 Jul 2022 20:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92DFC433D6;
 Wed, 27 Jul 2022 20:09:16 +0000 (UTC)
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
X-Inumbo-ID: fee93fc6-0de7-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658952557;
	bh=+ziZoc0NaaHvSKuewK1m2bfgZ3HyLK9FPgHIebUFAZk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Op9zKx5e8VhHEHYUT0RrxT006ZDrDc+8EY9qPleaiYPN5wCKNLB0Tf+OphapU06Pu
	 9HVnBrCQTWjXAn5PAiR4GgCXZzxaZBVnA73kmquJkTymAiMdAky6Wj6R17AYjMxkWC
	 SBxAzf0jRESCjAgrWctHm/fl1mNUjMEvntzHI7BkGOtPCSzptaBO2xQs7Ff4E8E0NS
	 qZYbsaT6cFXft4PpvtiTWkjIMKLDhyaB5VCz9/cCMCnLhLcfbrMLW2MCwOdPDDWZhI
	 Fl4E2leMLZuFurgOxq/3IX4xJ+jzZVsujX8c0MvmBJmhTt/05EqpZMjFwjA8ANtcZg
	 9p3NJCefNBibg==
Date: Wed, 27 Jul 2022 13:09:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, viryaos-discuss@lists.sourceforge.net, 
    sstabellini@kernel.org, Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: Re: [ImageBuilder][PATCH v3 2/3] uboot-script-gen: Enable appending
 extra commands to boot script
In-Reply-To: <20220713163044.3541661-3-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2207271308570.4648@ubuntu-linux-20-04-desktop>
References: <20220713163044.3541661-1-andrei.cherechesu@oss.nxp.com> <20220713163044.3541661-3-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Jul 2022, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Added the parsing for APPEND_EXTRA_CMDS variable, which enables the
> user to specify the path to a text file that contains, on each line,
> u-boot commands that will be added to the generated script as
> "fixups", before the boot command.
> 
> The file specified by the APPEND_EXTRA_CMDS variable parameter will be
> copied as-is in the generated script.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  README.md                |  5 +++++
>  scripts/uboot-script-gen | 11 +++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/README.md b/README.md
> index cb15ca5..3566a6d 100644
> --- a/README.md
> +++ b/README.md
> @@ -64,6 +64,7 @@ BOOT_AUX_FILE[1]="uboot.cfg"
>  
>  UBOOT_SOURCE="boot.source"
>  UBOOT_SCRIPT="boot.scr"
> +APPEND_EXTRA_CMDS="extra.txt"
>  FDTEDIT="imagebuilder.dtb"
>  FIT="boot.fit"
>  FIT_ENC_KEY_DIR="dir/key"
> @@ -197,6 +198,10 @@ Where:
>    as you can pass -o FILENAME to uboot-script-gen as a command line
>    parameter
>  
> +- APPEND_EXTRA_CMDS: is optional and specifies the path to a text file
> +  containing extra u-boot commands to be added to the boot script before
> +  the boot command. Useful for running custom fixup commands.
> +
>  - FDTEDIT is an optional and is off by default.  Specifies the output
>    modified dtb, used for reference and fdt_std.
>  
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index f8d2fb0..f72551a 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -416,6 +416,10 @@ function check_file_type()
>      elif [ "$type" = "Device Tree Blob" ]
>      then
>          type="Device Tree Blob\|data"
> +
> +    elif [ "$type" = "text" ]
> +    then
> +        type="ASCII text"
>      fi
>  
>      file -L $filename | grep "$type" &> /dev/null
> @@ -1238,6 +1242,13 @@ device_tree_editing $device_tree_addr
>  # disable device tree reloation
>  echo "setenv fdt_high 0xffffffffffffffff" >> $UBOOT_SOURCE
>  
> +# append extra u-boot commands (fixups) to script before boot command
> +if test "$APPEND_EXTRA_CMDS"
> +then
> +    check_file_type "$APPEND_EXTRA_CMDS" "text"
> +    cat $APPEND_EXTRA_CMDS >> $UBOOT_SOURCE
> +fi
> +
>  if test "$dynamic_loading_opt"
>  then
>      echo "$BOOT_CMD \${host_kernel_addr} - \${host_fdt_addr}" >> $UBOOT_SOURCE
> -- 
> 2.35.1
> 

