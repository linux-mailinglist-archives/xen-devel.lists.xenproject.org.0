Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA6C7F221E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 01:27:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637416.993185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5EbX-0000rb-15; Tue, 21 Nov 2023 00:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637416.993185; Tue, 21 Nov 2023 00:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5EbW-0000p0-Ua; Tue, 21 Nov 2023 00:27:02 +0000
Received: by outflank-mailman (input) for mailman id 637416;
 Tue, 21 Nov 2023 00:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5EbV-0000ou-Mf
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 00:27:01 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id add21521-8804-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 01:26:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 235A4CE135B;
 Tue, 21 Nov 2023 00:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38F8C433C7;
 Tue, 21 Nov 2023 00:26:51 +0000 (UTC)
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
X-Inumbo-ID: add21521-8804-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700526412;
	bh=RYq+DMRFtOrBP75j2yVKChP2f+fOdENmpakXTodpx2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YVdUA2tWjndnC/dmrxrZFInD6VjQzYWCpbOB8EcdAoqXLxE/COxbTbWceLRvmhjZJ
	 9wbTiEosiXyhePPNfeJ3fG8eb62UqBeRsQ96Me3E/sfL2/4dR4pQQv5YeuDzPpJTsP
	 pk6yEL5soEds1/dy1T+fQTCKLRjGid1KRzXG9uvdKMoJ0QL+/WwYMiIts0kDu+hQR6
	 7DnXA+b79nuxjRSU0sywOO+jniW8W4UMXc8Jp722AFxRYbDYkL/0oBLVUL+Yw/EAIq
	 7VAZaFME8IGnaqJekvN4WlZvVHuVKhWIL7sXlvQOtD6Oyvvc1sUPdPiTHJznzQU8O3
	 W8YdmxXbWr3Qg==
Date: Mon, 20 Nov 2023 16:26:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder] uboot-script-gen: use size from arm32 zImage
 header
In-Reply-To: <20231120151315.92119-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2311201626440.773207@ubuntu-linux-20-04-desktop>
References: <20231120151315.92119-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Nov 2023, Michal Orzel wrote:
> Take an example from commit 8bf401c99035 ("uboot-script-gen: use size from
> arm64 Image header") and add support for calculating the effective image
> size from arm32 zImage header.
> 
> Introduce get_image_size() function and use it to to probe the supported
> header magic values and to retrieve the effective image size. Use this
> value in add_size(), whenever it's bigger than the one obtained using
> 'stat -L'.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This patch together with 'bootz' support will allow us to enable testing Xen
> on arm{32,64} in gitlab CI with UBSAN enabled.
> ---
>  scripts/uboot-script-gen | 38 ++++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 9e3d86e4743a..078a667c61ab 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -431,23 +431,41 @@ function device_tree_editing()
>      fi
>  }
>  
> -function add_size()
> +# Read effective image size from a header, which may be larger than the filesize
> +# due to noload sections, e.g. bss.
> +function get_image_size()
>  {
> -    local filename=$1
> -    local size=`stat -L --printf="%s" $filename`
> +    local image=$1
> +    local effective_size=0
>      # Read arm64 header magic (https://www.kernel.org/doc/Documentation/arm64/booting.txt)
> -    local arm64_header_magic=$(od -j 56 -N 4 -t x4 ${filename} | awk 'NR==1 {print $2}')
> +    local arm64_header_magic=$(od -j 56 -N 4 -t x4 ${image} | awk 'NR==1 {print $2}')
> +    # Read arm32 header magic (http://www.simtec.co.uk/products/SWLINUX/files/booting_article.html)
> +    local arm32_header_magic=$(od -j 36 -N 4 -t x4 ${image} | awk 'NR==1 {print $2}')
>  
>      # Check for valid arm64 header magic value 0x644d5241
>      if [ "${arm64_header_magic}" = "644d5241" ]
>      then
> -        # Read effective size, which may be larger than the filesize due to noload sections, e.g. bss
> -        local arm64_header_size=$(od -j 16 -N 8 -t u8 ${filename} | awk 'NR==1 {print $2}')
> +        effective_size=$(od -j 16 -N 8 -t u8 ${image} | awk 'NR==1 {print $2}')
> +    # Check for valid arm32 header magic value 0x016f2818
> +    elif [ "${arm32_header_magic}" = "016f2818" ]
> +    then
> +        local start=$(od -j 40 -N 4 -t u4 ${image} | awk 'NR==1 {print $2}')
> +        local end=$(od -j 44 -N 4 -t u4 ${image} | awk 'NR==1 {print $2}')
> +        effective_size=$(( end - start ))
> +    fi
>  
> -        if [ "${arm64_header_size}" -gt "${size}" ]
> -        then
> -            size=${arm64_header_size}
> -        fi
> +    printf "%u" $effective_size
> +}
> +
> +function add_size()
> +{
> +    local filename=$1
> +    local size=`stat -L --printf="%s" $filename`
> +    local image_size=`get_image_size $filename`
> +
> +    if [ "${image_size}" -gt "${size}" ]
> +    then
> +        size=${image_size}
>      fi
>  
>      memaddr=$(( $memaddr + $size + $offset - 1))
> -- 
> 2.25.1
> 

