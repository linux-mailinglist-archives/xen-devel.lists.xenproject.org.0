Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A82553F5B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 02:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353394.580323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3nvp-0007Xe-MA; Wed, 22 Jun 2022 00:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353394.580323; Wed, 22 Jun 2022 00:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3nvp-0007UZ-IK; Wed, 22 Jun 2022 00:09:17 +0000
Received: by outflank-mailman (input) for mailman id 353394;
 Wed, 22 Jun 2022 00:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/BDV=W5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o3nvo-0007UT-7a
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 00:09:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c4ac433-f1bf-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 02:09:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15941617B7;
 Wed, 22 Jun 2022 00:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D857C3411C;
 Wed, 22 Jun 2022 00:09:12 +0000 (UTC)
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
X-Inumbo-ID: 8c4ac433-f1bf-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655856552;
	bh=jaHk90M96jXcHuKs9BQl+3bER0XQNMlvET5rYb7Ihnc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VDTSPG5+RA40IDGhckWyUmcEqRBwmcMaGTwHYLhYLqREKHfYaTsGnZ5WOsm3BSY5B
	 kKGXvitclxZpz1iUtF3cy/J12OYEzpbzEFvcOjkDl9vM1wRWToeAGAdGXRrANgyyiZ
	 VZhpgIzQ8tEhSW3arIwPRpxqZ494G01fJl2o5wHO3p94BCwKWWc6lesHrFRsgcDlp/
	 T5MT2CKBzGKXXG0p0C/SEx9ysk8hmGdthf2hjjHc7QLa1/fyUMAZZK169E8LHLn9mM
	 JKTuFBW76Vaj/gnSl1aY93GrZdxLgecU2bvpRuvrm+BwosVWo+a7QszCdlbdv1ukDi
	 vqqmk/HB3O54w==
Date: Tue, 21 Jun 2022 17:09:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    viryaos-discuss@lists.sourceforge.net
Subject: Re: [ImageBuilder] [PATCH 1/2] uboot-script-gen: Skip dom0 instead
 of exiting if DOM0_KERNEL is not set
In-Reply-To: <20220619124316.378365-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206211709020.788376@ubuntu-linux-20-04-desktop>
References: <20220619124316.378365-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 19 Jun 2022, Xenia Ragiadakou wrote:
> When the parameter DOM0_KERNEL is not specified and NUM_DOMUS is not 0,
> instead of failing the script, just skip any dom0 specific setup.
> This way the script can be used to boot XEN in dom0less mode.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  scripts/uboot-script-gen | 60 ++++++++++++++++++++++++++++------------
>  1 file changed, 43 insertions(+), 17 deletions(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 455b4c0..bdc8a6b 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -168,10 +168,15 @@ function xen_device_tree_editing()
>      dt_set "/chosen" "#address-cells" "hex" "0x2"
>      dt_set "/chosen" "#size-cells" "hex" "0x2"
>      dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
> -    dt_mknode "/chosen" "dom0"
> -    dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
> -    dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 $(printf "0x%x" $dom0_kernel_size)"
> -    dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
> +
> +    if test "$DOM0_KERNEL"
> +    then
> +        dt_mknode "/chosen" "dom0"
> +        dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
> +        dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 $(printf "0x%x" $dom0_kernel_size)"
> +        dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
> +    fi
> +
>      if test "$DOM0_RAMDISK" && test $ramdisk_addr != "-"
>      then
>          dt_mknode "/chosen" "dom0-ramdisk"
> @@ -203,7 +208,10 @@ function xen_device_tree_editing()
>              add_device_tree_static_mem "/chosen/domU$i" "${DOMU_STATIC_MEM[$i]}"
>          fi
>          dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
> -        dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
> +        if test "$DOM0_KERNEL"
> +        then
> +            dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
> +        fi
>  
>          if test "${DOMU_COLORS[$i]}"
>          then
> @@ -433,6 +441,19 @@ function xen_config()
>              DOM0_CMD="$DOM0_CMD root=$root_dev"
>          fi
>      fi
> +    if test -z "$DOM0_KERNEL"
> +    then
> +        if test "$NUM_DOMUS" -eq "0"
> +        then
> +            echo "Neither dom0 or domUs are specified, exiting."
> +            exit 1
> +        fi
> +        echo "Dom0 kernel is not specified, continue with dom0less setup."
> +        unset DOM0_RAMDISK
> +        # Remove dom0 specific parameters from the XEN command line.
> +        local params=($XEN_CMD)
> +        XEN_CMD="${params[@]/dom0*/}"
> +    fi
>      i=0
>      while test $i -lt $NUM_DOMUS
>      do
> @@ -490,11 +511,13 @@ generate_uboot_images()
>  
>  xen_file_loading()
>  {
> -    check_compressed_file_type $DOM0_KERNEL "executable"
> -    dom0_kernel_addr=$memaddr
> -    load_file $DOM0_KERNEL "dom0_linux"
> -    dom0_kernel_size=$filesize
> -
> +    if test "$DOM0_KERNEL"
> +    then
> +        check_compressed_file_type $DOM0_KERNEL "executable"
> +        dom0_kernel_addr=$memaddr
> +        load_file $DOM0_KERNEL "dom0_linux"
> +        dom0_kernel_size=$filesize
> +    fi
>      if test "$DOM0_RAMDISK"
>      then
>          check_compressed_file_type $DOM0_RAMDISK "cpio archive"
> @@ -597,14 +620,16 @@ bitstream_load_and_config()
>  
>  create_its_file_xen()
>  {
> -    if test "$ramdisk_addr" != "-"
> +    if test "$DOM0_KERNEL"
>      then
> -        load_files="\"dom0_linux\", \"dom0_ramdisk\""
> -    else
> -        load_files="\"dom0_linux\""
> -    fi
> -    # xen below
> -    cat >> "$its_file" <<- EOF
> +        if test "$ramdisk_addr" != "-"
> +        then
> +            load_files="\"dom0_linux\", \"dom0_ramdisk\""
> +        else
> +            load_files="\"dom0_linux\""
> +        fi
> +        # xen below
> +        cat >> "$its_file" <<- EOF
>          dom0_linux {
>              description = "dom0 linux kernel binary";
>              data = /incbin/("$DOM0_KERNEL");
> @@ -616,6 +641,7 @@ create_its_file_xen()
>              $fit_algo
>          };
>  	EOF
> +    fi
>      # domUs
>      i=0
>      while test $i -lt $NUM_DOMUS
> -- 
> 2.34.1
> 

