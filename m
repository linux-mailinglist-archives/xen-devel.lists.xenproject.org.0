Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2A553F5C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 02:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353402.580333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3nz7-0000UY-59; Wed, 22 Jun 2022 00:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353402.580333; Wed, 22 Jun 2022 00:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3nz7-0000SN-23; Wed, 22 Jun 2022 00:12:41 +0000
Received: by outflank-mailman (input) for mailman id 353402;
 Wed, 22 Jun 2022 00:12:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/BDV=W5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o3nz5-0000SH-Pz
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 00:12:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05a6349d-f1c0-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 02:12:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB13B61779;
 Wed, 22 Jun 2022 00:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240A8C3411C;
 Wed, 22 Jun 2022 00:12:36 +0000 (UTC)
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
X-Inumbo-ID: 05a6349d-f1c0-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655856756;
	bh=mBFskbB8TiU8xRYMwmKbJYtZ2QdaEzC4sErsujEwie4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W49BTjBttx7UO+01zUGRyTTU2BTAWpT26I7y4hUORosHG6ejNqM5hEAzFpHs7LOFy
	 oTZ5mFJPIhK6L1UndGNCPQuLZkrQUXkMLI8R1mIodhwqa7nptIHUU6/+llXJDhvht9
	 kpT0j8pnx4z4b+YX856iku18ftUqdMIU1DxNSZPBPtxEHeQWJqEUfjGQAVVUG1aGn9
	 Sy9GEXiiLOUAi4F4NMaJzPxTPsEj5SGGrkTufbf8+wK7XGTaVOIk1jse8OCpq3as8V
	 o9C8jzQv8cl3uuAkYLWNlSlZ/kx0XSBcVcKIZErfkf7Nbwtavpq39QRKJMK400/E2Q
	 G1uVZwvWTAEfA==
Date: Tue, 21 Jun 2022 17:12:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    viryaos-discuss@lists.sourceforge.net
Subject: Re: [ImageBuilder] [PATCH 2/2] uboot-script-gen: Enable direct
 mapping of statically allocated memory
In-Reply-To: <20220619124316.378365-2-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206211712260.788376@ubuntu-linux-20-04-desktop>
References: <20220619124316.378365-1-burzalodowa@gmail.com> <20220619124316.378365-2-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 19 Jun 2022, Xenia Ragiadakou wrote:
> Direct mapping for dom0less VMs is disabled by default in XEN and can be
> enabled through the 'direct-map' property.
> Add a new config parameter DOMU_DIRECT_MAP to be able to enable or disable
> direct mapping, i.e set to 1 for enabling and to 0 for disabling.
> This parameter is optional. Direct mapping is enabled by default for all
> dom0less VMs with static allocation.
> 
> The property 'direct-map' is a boolean property. Boolean properties are true
> if present and false if missing.
> Add a new data_type 'bool' in function dt_set() to setup a boolean property.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  README.md                |  4 ++++
>  scripts/uboot-script-gen | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/README.md b/README.md
> index c52e4b9..17ff206 100644
> --- a/README.md
> +++ b/README.md
> @@ -168,6 +168,10 @@ Where:
>    if specified, indicates the host physical address regions
>    [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
>  
> +- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
> +  If set to 1, the VM is direct mapped. The default is 1.
> +  This is only applicable when DOMU_STATIC_MEM is specified.
> +
>  - LINUX is optional but specifies the Linux kernel for when Xen is NOT
>    used.  To enable this set any LINUX\_\* variables and do NOT set the
>    XEN variable.
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index bdc8a6b..e85c6ec 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -27,6 +27,7 @@ function dt_mknode()
>  #   hex
>  #   str
>  #   str_a
> +#   bool
>  function dt_set()
>  {
>      local path=$1
> @@ -49,6 +50,12 @@ function dt_set()
>                  array+=" \"$element\""
>              done
>              echo "fdt set $path $var $array" >> $UBOOT_SOURCE
> +        elif test $data_type = "bool"
> +        then
> +            if test "$data" -eq 1
> +            then
> +                echo "fdt set $path $var" >> $UBOOT_SOURCE
> +            fi
>          else
>              echo "fdt set $path $var \"$data\"" >> $UBOOT_SOURCE
>          fi
> @@ -65,6 +72,12 @@ function dt_set()
>          elif test $data_type = "str_a"
>          then
>              fdtput $FDTEDIT -p -t s $path $var $data
> +        elif test $data_type = "bool"
> +        then
> +            if test "$data" -eq 1
> +            then
> +                fdtput $FDTEDIT -p $path $var
> +            fi
>          else
>              fdtput $FDTEDIT -p -t s $path $var "$data"
>          fi
> @@ -206,6 +219,7 @@ function xen_device_tree_editing()
>          if test "${DOMU_STATIC_MEM[$i]}"
>          then
>              add_device_tree_static_mem "/chosen/domU$i" "${DOMU_STATIC_MEM[$i]}"
> +            dt_set "/chosen/domU$i" "direct-map" "bool" "${DOMU_DIRECT_MAP[$i]}"
>          fi
>          dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
>          if test "$DOM0_KERNEL"
> @@ -470,6 +484,10 @@ function xen_config()
>          then
>              DOMU_CMD[$i]="console=ttyAMA0"
>          fi
> +        if test -z "${DOMU_DIRECT_MAP[$i]}"
> +        then
> +             DOMU_DIRECT_MAP[$i]=1
> +        fi
>          i=$(( $i + 1 ))
>      done
>  }
> -- 
> 2.34.1
> 

