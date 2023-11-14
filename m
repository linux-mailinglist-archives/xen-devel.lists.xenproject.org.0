Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734447EB946
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 23:24:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633353.988071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31p8-0004r4-40; Tue, 14 Nov 2023 22:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633353.988071; Tue, 14 Nov 2023 22:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31p8-0004oX-1K; Tue, 14 Nov 2023 22:23:58 +0000
Received: by outflank-mailman (input) for mailman id 633353;
 Tue, 14 Nov 2023 22:23:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r31p6-0004oR-IK
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 22:23:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ec4a44d-833c-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 23:23:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0054D61435;
 Tue, 14 Nov 2023 22:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2865DC433C7;
 Tue, 14 Nov 2023 22:23:53 +0000 (UTC)
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
X-Inumbo-ID: 7ec4a44d-833c-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700000633;
	bh=nXRLSfWFZT8IFeImbnS0Gj+Wpndo9fMxe4tRFlFpURs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uaG8SDWBNIdnKi6Hyiyn9M/+FRCnF+B4gkTPwCZJF7YfrwoYefKxqnT5FNqTAjuJ7
	 gvLSHTAKRJutx8KcU2Q5dEH3OnJLtGpZ3RTp6QYmgQzdAyw9/7Q+bNvEEViSIrzgQJ
	 TbbW9bSRCNH8FEGSdfjGuuW5onqIIpA9Fe22pSbxxSdE7KLeF9AbOvNS3bEw3tQHCQ
	 G0eXkpeMWV/dIUn2Or5It7VXhTMVigKPA8PFzXOu2fAmcsb4U6mTGj3fZ85ybBeTMW
	 5HEYqCh3HYD+klJ1gZ6pAJAEQ/aOilHld+SLA/MhKqXLzLJFTIDq4h4G+4RnLEdXb4
	 HyIrzVEKnH7vQ==
Date: Tue, 14 Nov 2023 14:23:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder] Add 'bootz' to a list of supported boot
 commands
In-Reply-To: <20231114151535.53409-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2311141423450.160649@ubuntu-linux-20-04-desktop>
References: <20231114151535.53409-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Nov 2023, Michal Orzel wrote:
> At the moment, in order to boot 32-bit images, we need to set BOOT_CMD
> to 'bootm' which results in adding a u-boot header on top of an image.
> Add 'bootz' to a list of supported boot commands, so that we can skip
> this extra step. In most cases, specifying 'bootm' should only be needed
> for images without Linux kernel Image/zImage header. Otherwise, we can
> use 'booti'/'bootz'.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  README.md                | 4 ++--
>  scripts/uboot-script-gen | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/README.md b/README.md
> index fe5d2052cc69..3b4b16f1f7e4 100644
> --- a/README.md
> +++ b/README.md
> @@ -80,8 +80,8 @@ Where:
>    though.
>  
>  - BOOT_CMD specifies the u-boot command used to boot the binaries.
> -  By default, it is 'booti'. The acceptable values are 'booti', 'bootm'
> -  and 'bootefi' and 'none'. If the value is 'none', the BOOT_CMD is not
> +  By default, it is 'booti'. The acceptable values are 'booti', 'bootm',
> +  'bootz' and 'bootefi' and 'none'. If the value is 'none', the BOOT_CMD is not
>    added to the boot script, and the addresses for the Xen binary and the
>    DTB are stored in 'host_kernel_addr' and 'host_fdt_addr' u-boot
>    env variables respectively, to be used manually when booting.
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 6e52da5e2aca..9e3d86e4743a 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1041,7 +1041,7 @@ function check_depends()
>  
>  function check_boot_cmd()
>  {
> -    if ! [[ " bootm booti bootefi none " =~ " ${BOOT_CMD}" ]]
> +    if ! [[ " bootm booti bootz bootefi none " =~ " ${BOOT_CMD}" ]]
>      then
>          echo "\"BOOT_CMD=$BOOT_CMD\" is not valid"
>          exit 1
> -- 
> 2.25.1
> 

