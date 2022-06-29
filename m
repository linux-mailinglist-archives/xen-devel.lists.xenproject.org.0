Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D2C55F263
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 02:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357440.585979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6LZ9-0006j9-1H; Wed, 29 Jun 2022 00:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357440.585979; Wed, 29 Jun 2022 00:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6LZ8-0006gY-Tu; Wed, 29 Jun 2022 00:28:22 +0000
Received: by outflank-mailman (input) for mailman id 357440;
 Wed, 29 Jun 2022 00:28:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6LZ7-0006Vw-R8
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 00:28:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60668675-f742-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 02:28:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30174B8210D;
 Wed, 29 Jun 2022 00:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D816C341C8;
 Wed, 29 Jun 2022 00:28:17 +0000 (UTC)
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
X-Inumbo-ID: 60668675-f742-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656462497;
	bh=gdo1im7jZVNUXLq9t5pb61VNaHlbtkv2qPlgFzG1R+U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NO+Ynh4PoaP70HZhaSJ4fsXVbxPDkiinnev8bSlPeDd4VX4qFPASd/DarmQwMKGKb
	 YT0e6Ppymv/sND8LbFRUrowuEf7dQiOdCjImO/v2rWmk1xYe+TyqrMpotr1zCRnpax
	 WkgJTkHotFUXJJS+kclcCaDKuvRXXVV1kUHAHkHYUJRQooHY6AaK599nPzJr0cwbCA
	 Rd1PMEaWTWph4qRNmzFn8WKEysENAoFZ5pXby5zRON3PkS4YdenZa4KaFHzdAISl1D
	 mZZvJuAIWuwVMjUlhZUU2/mlcP9n3OU9t+cza7L3GMCHOSqSNw3j1mL+il6HqWqAto
	 Tg0+kTdkAeG5g==
Date: Tue, 28 Jun 2022 17:28:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    viryaos-discuss@lists.sourceforge.net
Subject: Re: [PATCH 2/2] uboot-script-gen: do not enable direct mapping by
 default
In-Reply-To: <20220626184536.666647-2-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206281727080.4389@ubuntu-linux-20-04-desktop>
References: <20220626184536.666647-1-burzalodowa@gmail.com> <20220626184536.666647-2-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 26 Jun 2022, Xenia Ragiadakou wrote:
> To be inline with XEN, do not enable direct mapping automatically for all
> statically allocated domains.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Actually I don't know about this one. I think it is OK that ImageBuilder
defaults are different from Xen defaults. This is a case where I think
it would be good to enable DOMU_DIRECT_MAP by default when
DOMU_STATIC_MEM is specified.


> ---
>  README.md                | 4 ++--
>  scripts/uboot-script-gen | 8 ++------
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/README.md b/README.md
> index cb15ca5..03e437b 100644
> --- a/README.md
> +++ b/README.md
> @@ -169,8 +169,8 @@ Where:
>    if specified, indicates the host physical address regions
>    [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
>  
> -- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
> -  If set to 1, the VM is direct mapped. The default is 1.
> +- DOMU_DIRECT_MAP[number] if set to 1, enables direct mapping.
> +  By default, direct mapping is disabled.
>    This is only applicable when DOMU_STATIC_MEM is specified.
>  
>  - LINUX is optional but specifies the Linux kernel for when Xen is NOT
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 085e29f..66ce6f7 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -52,7 +52,7 @@ function dt_set()
>              echo "fdt set $path $var $array" >> $UBOOT_SOURCE
>          elif test $data_type = "bool"
>          then
> -            if test "$data" -eq 1
> +            if test "$data" == "1"
>              then
>                  echo "fdt set $path $var" >> $UBOOT_SOURCE
>              fi
> @@ -74,7 +74,7 @@ function dt_set()
>              fdtput $FDTEDIT -p -t s $path $var $data
>          elif test $data_type = "bool"
>          then
> -            if test "$data" -eq 1
> +            if test "$data" == "1"
>              then
>                  fdtput $FDTEDIT -p $path $var
>              fi
> @@ -491,10 +491,6 @@ function xen_config()
>          then
>              DOMU_CMD[$i]="console=ttyAMA0"
>          fi
> -        if test -z "${DOMU_DIRECT_MAP[$i]}"
> -        then
> -             DOMU_DIRECT_MAP[$i]=1
> -        fi
>          i=$(( $i + 1 ))
>      done
>  }
> -- 
> 2.34.1
> 

