Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9BE787BE9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 01:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590401.922681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZJcA-0004PI-I0; Thu, 24 Aug 2023 23:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590401.922681; Thu, 24 Aug 2023 23:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZJcA-0004MF-DU; Thu, 24 Aug 2023 23:19:46 +0000
Received: by outflank-mailman (input) for mailman id 590401;
 Thu, 24 Aug 2023 23:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZJc8-0004M8-US
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 23:19:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b43eee87-42d4-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 01:19:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 965C9655FC;
 Thu, 24 Aug 2023 23:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD22C433C8;
 Thu, 24 Aug 2023 23:19:40 +0000 (UTC)
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
X-Inumbo-ID: b43eee87-42d4-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692919181;
	bh=dZ2aZm/LG3V+w/AK9P7Vpz1DPQ/pzXIWPcpWflGeiWk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lwCVPIW7KezVN4s/x5wXMgRBBma2Yr+XBFTaIaEGVMCTlWX9+0sumLkz5JRTGXpUI
	 F5lGGdbF+7/b/pUNWKYNMwXhAm4jQCicli85GFPFaoaEZMMo6+T1ZbjqDyL2i20Xj1
	 hp4e3BcK53+0ySloo0H23bvrjU0/BsoTpmgHI45oectr7OKek+6USHSd4UFUF+rxp3
	 FBlDwL8wgRXjLI1XQqeXsUU9RPZOxH6VMpuV9O+o2qjt34OsIRZ6DhlFvjQ2hGpgz/
	 v9o29PICTR7DDWnHllihft6SrnCkxNEpliHnjis6kRS9xfU2KQU58rngU6Zzs3E7wA
	 H4/tN5EFmII4w==
Date: Thu, 24 Aug 2023 16:19:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [ImageBuilder PATCH] uboot-script-gen: use size from arm64 Image
 header
In-Reply-To: <20230824182233.50760-1-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2308241613060.6458@ubuntu-linux-20-04-desktop>
References: <20230824182233.50760-1-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Aug 2023, Stewart Hildebrand wrote:
> There is a corner case where the filesizes of the xen and Linux kernel images
> are not sufficient. These binaries likely contain .NOLOAD sections, which are
> not accounted in the filesize.
> 
> Check for the presence of an arm64 kernel image header, and get the effective
> image size from the header. Use the effective image size for calculating the
> next load address and for populating the size in the /chosen/dom*/reg property.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
>  scripts/uboot-script-gen | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 9656a458ac00..50fe525e7145 100755
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
> @@ -435,6 +435,17 @@ function add_size()
>  {
>      local filename=$1
>      local size=`stat -L --printf="%s" $filename`
> +
> +    if [ "$(od -j 56 -N 4 -t x4 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')" = "644d5241" ]
> +    then
> +        local size_header=$(od -j 16 -N 8 -t u8 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')
> +
> +        if [ "${size_header}" -gt "${size}" ]
> +        then
> +            size=${size_header}
> +        fi
> +    fi


Thanks Stewart this is great! Can you please add a good in-code comment
to explain what field you are reading of the header exactly and what is
the value 644d5241 you are comparing against?

Also I think it would be easier to read if you used "cut" instead of
awk and split the line a bit more like this:


    # read header field XXX
    local field_xxx =$(od -j 56 -N 4 -t x4 ${filename} | head -n 1 | cut -d " " -f2)
    # comparing against XXX
    if [ $field_xxx = "644d5241" ]
    then
        # read header field "size" which indicates ....
        local size_header=$(od -j 16 -N 8 -t u8 ${filename} | head -n 1 | cut -d " " -f2)

        if [ "${size_header}" -gt "${size}" ]
        then
            size=${size_header}
        fi
    fi


>      memaddr=$(( $memaddr + $size + $offset - 1))
>      memaddr=$(( $memaddr & ~($offset - 1) ))
>      memaddr=`printf "0x%X\n" $memaddr`
> -- 
> 2.42.0
> 

