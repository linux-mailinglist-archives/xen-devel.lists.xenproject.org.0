Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436619D3017
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 22:40:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840790.1256317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDVxU-0006cz-QT; Tue, 19 Nov 2024 21:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840790.1256317; Tue, 19 Nov 2024 21:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDVxU-0006bW-Np; Tue, 19 Nov 2024 21:40:28 +0000
Received: by outflank-mailman (input) for mailman id 840790;
 Tue, 19 Nov 2024 21:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGE8=SO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDVxT-0006Yk-Ac
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 21:40:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e08a72c0-a6be-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 22:40:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AEAF15C58E0;
 Tue, 19 Nov 2024 21:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE40EC4CECF;
 Tue, 19 Nov 2024 21:40:19 +0000 (UTC)
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
X-Inumbo-ID: e08a72c0-a6be-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6ImUwOGE3MmMwLWE2YmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDUyNDIyLjM4NjYzLCJzZW5kZXIiOiJzc3RhYmVsbGluaUBrZXJuZWwub3JnIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732052420;
	bh=rj2XHGTg6XjXGo+8aPdYHecbgCq2/Q+2IG0qEUSuJyI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IYsdDkznHEcxfVpHiqsnD9OgdJjBdycBy5IdoCvCMKNtBI8GNYMwcBgmxhxnTOMYV
	 QIUJpllWuSsvUFPXbP8bulFc7JZD61fHqtWk/4xk07Lf1G16PEW655m4ilG9yawESy
	 Nj6s+X1NebCjdBIBi/ZKo8rrkGwv7+wplQ3S9vbhrNKkD3WXAoZRmIB1Yljs6HnIDi
	 JXgBXM3YgGgEvA6i8+N/GBEIRPQQ7hQLcTmQH4Mdhu5UF8LE7uEBX87c+Sqz24s7n8
	 1iXt+V8qgdUXfkM0rEmks5I6xyNsC6ox1AAQvvJnxpMkNj/qQRFf8jVOwrGYYcmEYO
	 P+dvXncwdeutA==
Date: Tue, 19 Nov 2024 13:40:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Miccio <luca.miccio@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder] [PATCH V2] UBOOT_SOURCE/SCRIPTS variables must
 always be set
In-Reply-To: <20241119150111.3569267-1-luca.miccio@amd.com>
Message-ID: <alpine.DEB.2.22.394.2411191340110.1160299@ubuntu-linux-20-04-desktop>
References: <20241119150111.3569267-1-luca.miccio@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Nov 2024, Luca Miccio wrote:
> The current README incorrectly omits the need for the UBOOT_SOURCE and
> UBOOT_SCRIPT variables for uboot-script-gen to function properly.
> Moreover, the script silently fails if these variables are not set.
> Return an error if the the UBOOT_SCRIPT variable is not set and
> correct the documentation accordingly.
> 
> Signed-off-by: Luca Miccio <luca.miccio@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  README.md                |  3 ++-
>  scripts/uboot-script-gen | 12 ++++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index 4fcd908..ae2fdfd 100644
> --- a/README.md
> +++ b/README.md
> @@ -272,7 +272,8 @@ Where:
>  
>  - UBOOT_SOURCE and UBOOT_SCRIPT specify the output. They are optional
>    as you can pass -o FILENAME to uboot-script-gen as a command line
> -  parameter
> +  parameter. It has to be set either in the config file or CLI argument
> +  though.
>  
>  - APPEND_EXTRA_CMDS: is optional and specifies the path to a text file
>    containing extra u-boot commands to be added to the boot script before
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index dcf5bdb..fc63702 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1210,6 +1210,18 @@ then
>      UBOOT_SCRIPT="$uboot_out_opt".scr
>      UBOOT_SOURCE="$uboot_out_opt".source
>  fi
> +
> +if test ! "$UBOOT_SOURCE"
> +then
> +    echo "UBOOT_SOURCE not set, either specify it in the config or set it with the -o option"
> +    exit 1
> +fi
> +
> +if test ! "$UBOOT_SCRIPT"
> +then
> +    UBOOT_SCRIPT="${UBOOT_SOURCE%.source}.scr"
> +fi
> +
>  if test "$fit_opt" && ! test "$FIT"
>  then
>      FIT="${UBOOT_SOURCE%.source}.fit"
> -- 
> 2.34.1
> 

