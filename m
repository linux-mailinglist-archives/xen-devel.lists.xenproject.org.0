Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539E79F550
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 01:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601682.937778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgYvd-0008DJ-BZ; Wed, 13 Sep 2023 23:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601682.937778; Wed, 13 Sep 2023 23:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgYvd-0008B3-8g; Wed, 13 Sep 2023 23:05:49 +0000
Received: by outflank-mailman (input) for mailman id 601682;
 Wed, 13 Sep 2023 23:05:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgYvc-0008Ax-Bw
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 23:05:48 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11574924-528a-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 01:05:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 75218CE25B1;
 Wed, 13 Sep 2023 23:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C651C433C8;
 Wed, 13 Sep 2023 23:05:39 +0000 (UTC)
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
X-Inumbo-ID: 11574924-528a-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694646339;
	bh=wgMJFl0NFvdi1JwDdmJ8FjyeeydzTif/nheyHdpZyqw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IZHbhJHdUQ+KgXQh3YfamYhQ738SUakRFsH9nPdNPif2mnrzKPcrgIF7SHLIyLuOk
	 z4cawox4ZKnu4LMRS4ukCuJ6T2MgzZl85I1y+lizGgtHxQoRqYSIkZZaqF9OY0g2y/
	 jfwG+y1ly2GBSM5kXiDnaKF+zsXRopRqpP80920kCHPaVZ7A3rlCMCSoKCHoT4ga6s
	 2nsAIis+jpuC8ypaEzvh5iY5t7JYPS3ztCJ5PTr3DtyZnO1ByvtXcAehOp2ePWuwEV
	 l+sLTd+xpO586cEdbB+I+yzWFkHf5CsYmN8OLiXXvV6s2YZWpV83FmZLVjsyrXqpSA
	 kZrqWrfjs15ow==
Date: Wed, 13 Sep 2023 16:05:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [ImageBuilder PATCH v3] uboot-script-gen: use size from arm64
 Image header
In-Reply-To: <20230913141311.13714-1-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309131605280.2295162@ubuntu-linux-20-04-desktop>
References: <20230913141311.13714-1-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Sep 2023, Stewart Hildebrand wrote:
> There is a corner case where the filesizes of the xen and Linux kernel images
> are not sufficient. These binaries likely contain NOLOAD sections (e.g. bss),
> which are not accounted in the filesize.
> 
> Check for the presence of an arm64 kernel image header, and get the effective
> image size from the header. Use the effective image size for calculating the
> next load address and for populating the size in the /chosen/dom*/reg property.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2->v3:
> * simplify awk parsing
> * add R-b
> 
> v1->v2:
> * add in-code comments
> * use variables more
> ---
>  scripts/uboot-script-gen | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 9656a458ac00..b284887f065e 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -2,7 +2,7 @@
>  
>  offset=$((2*1024*1024))
>  filesize=0
> -prog_req=(mkimage file fdtput mktemp awk)
> +prog_req=(mkimage file fdtput mktemp awk od)
>  
>  function cleanup_and_return_err()
>  {
> @@ -435,6 +435,21 @@ function add_size()
>  {
>      local filename=$1
>      local size=`stat -L --printf="%s" $filename`
> +    # Read arm64 header magic (https://www.kernel.org/doc/Documentation/arm64/booting.txt)
> +    local arm64_header_magic=$(od -j 56 -N 4 -t x4 ${filename} | awk 'NR==1 {print $2}')
> +
> +    # Check for valid arm64 header magic value 0x644d5241
> +    if [ "${arm64_header_magic}" = "644d5241" ]
> +    then
> +        # Read effective size, which may be larger than the filesize due to noload sections, e.g. bss
> +        local arm64_header_size=$(od -j 16 -N 8 -t u8 ${filename} | awk 'NR==1 {print $2}')
> +
> +        if [ "${arm64_header_size}" -gt "${size}" ]
> +        then
> +            size=${arm64_header_size}
> +        fi
> +    fi
> +
>      memaddr=$(( $memaddr + $size + $offset - 1))
>      memaddr=$(( $memaddr & ~($offset - 1) ))
>      memaddr=`printf "0x%X\n" $memaddr`
> -- 
> 2.42.0
> 

