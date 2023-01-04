Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF38165CB43
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470819.730453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsKg-0003CX-EB; Wed, 04 Jan 2023 01:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470819.730453; Wed, 04 Jan 2023 01:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsKg-00039w-9x; Wed, 04 Jan 2023 01:12:42 +0000
Received: by outflank-mailman (input) for mailman id 470819;
 Wed, 04 Jan 2023 01:12:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pCsKe-00039m-8w
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:12:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0e52d7e-8bcc-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 02:12:39 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83D96614CC;
 Wed,  4 Jan 2023 01:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0DDC433D2;
 Wed,  4 Jan 2023 01:12:35 +0000 (UTC)
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
X-Inumbo-ID: e0e52d7e-8bcc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672794756;
	bh=M7neBu1eufP02ijEEgXFLm7XN0usVpAGztqI1Ji4c3Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LY/KgCgyzX1J4lo2GPH8cS2Ty9MqIQoh7vcOUKeNTeT0RxiDvEogMGgEbpkx2tQUD
	 FX+Ni/hOZn75YWWabLrPHDJdNVzwqy8k7qhJWrWB1MYt+T8zAHhHqdBmCU7gW0iP1T
	 LvrZ+0cPv2quN87jSPmS0aYflozp2J8ZcyuH73PwBC2Uf7nU6jtCOegf/B6ulHf5/m
	 mHWCUsHUVUT6TMUPjfRGR15XCD9TY3el++YbBqykb4gBAd6Tk06AwFqsaPXlt8KtFX
	 1oNijbnaK3HIC3BPOOCEFsjNcs+eKbS4YZBlXy1jtcUTf7LXyLGR2egJsiGj+DrQYO
	 0uYti9QbJne4A==
Date: Tue, 3 Jan 2023 17:12:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 3/6] CI: Only calculate ./configure args if needed
In-Reply-To: <20221230003848.3241-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2301031712270.4079@ubuntu-linux-20-04-desktop>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com> <20221230003848.3241-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Dec 2022, Andrew Cooper wrote:
> This is purely code motion of the cfgargs construction, into the case where it
> is used.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/scripts/build | 63 ++++++++++++++++++++++++------------------------
>  1 file changed, 31 insertions(+), 32 deletions(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 8dee1cbbc251..f2301d08789d 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -39,37 +39,6 @@ if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
>      hypervisor_only="y"
>  fi
>  
> -# build up our configure options
> -cfgargs=()
> -cfgargs+=("--enable-docs")
> -
> -if [[ "${CC}" == "clang"* ]]; then
> -    # SeaBIOS cannot be built with clang
> -    cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
> -    # iPXE cannot be built with clang
> -    cfgargs+=("--with-system-ipxe=/usr/lib/ipxe/ipxe.pxe")
> -    # newlib cannot be built with clang so we cannot build stubdoms
> -    cfgargs+=("--disable-stubdom")
> -fi
> -
> -if ! test -z "$(ldd /bin/ls|grep musl|head -1)"; then
> -    # disable --disable-werror for QEMUU when building with MUSL
> -    cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
> -    # SeaBIOS doesn't build on MUSL systems
> -    cfgargs+=("--with-system-seabios=/bin/false")
> -fi
> -
> -# Qemu requires Python 3.5 or later, and ninja
> -if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))" \
> -        || ! type ninja; then
> -    cfgargs+=("--with-system-qemu=/bin/false")
> -fi
> -
> -# SeaBIOS requires GCC 4.6 or later
> -if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
> -    cfgargs+=("--with-system-seabios=/bin/false")
> -fi
> -
>  # Directory for the artefacts to be dumped into
>  mkdir binaries
>  
> @@ -80,7 +49,37 @@ if [[ "${hypervisor_only}" == "y" ]]; then
>      # Preserve artefacts
>      cp xen/xen binaries/xen
>  else
> -    # Full build
> +    # Full build.  Figure out our ./configure options
> +    cfgargs=()
> +    cfgargs+=("--enable-docs")
> +
> +    if [[ "${CC}" == "clang"* ]]; then
> +        # SeaBIOS cannot be built with clang
> +        cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
> +        # iPXE cannot be built with clang
> +        cfgargs+=("--with-system-ipxe=/usr/lib/ipxe/ipxe.pxe")
> +        # newlib cannot be built with clang so we cannot build stubdoms
> +        cfgargs+=("--disable-stubdom")
> +    fi
> +
> +    if  ! test -z "$(ldd /bin/ls|grep musl|head -1)"; then
> +        # disable --disable-werror for QEMUU when building with MUSL
> +        cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
> +        # SeaBIOS doesn't build on MUSL systems
> +        cfgargs+=("--with-system-seabios=/bin/false")
> +    fi
> +
> +    # Qemu requires Python 3.5 or later, and ninja
> +    if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))" \
> +            || ! type ninja; then
> +        cfgargs+=("--with-system-qemu=/bin/false")
> +    fi
> +
> +    # SeaBIOS requires GCC 4.6 or later
> +    if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
> +        cfgargs+=("--with-system-seabios=/bin/false")
> +    fi
> +
>      ./configure "${cfgargs[@]}"
>      make -j$(nproc) dist
>  
> -- 
> 2.11.0
> 

