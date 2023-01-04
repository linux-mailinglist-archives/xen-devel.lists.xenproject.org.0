Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A982C65CB53
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470850.730497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsSj-0006Uf-4A; Wed, 04 Jan 2023 01:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470850.730497; Wed, 04 Jan 2023 01:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsSj-0006RK-1H; Wed, 04 Jan 2023 01:21:01 +0000
Received: by outflank-mailman (input) for mailman id 470850;
 Wed, 04 Jan 2023 01:20:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pCsSh-0006RC-6v
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:20:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09a78602-8bce-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 02:20:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96701614F9;
 Wed,  4 Jan 2023 01:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DC1C433D2;
 Wed,  4 Jan 2023 01:20:53 +0000 (UTC)
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
X-Inumbo-ID: 09a78602-8bce-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672795255;
	bh=1BW4Ls3PHmwwNSiG3AJmJkC7DqZ5ixj1dctuN6FJe6A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W2CTHzPLrV5O04ASlyt0KThzyjd9P8cwZF+/2X7KOfjTR0/rJbCAOh0Qo8D0oz6XM
	 00F2Rr0xUSCBEhGj32m4+mH6LELAW4USYcFNzoTn+29d3L+bDuGuOQT9THdRygFAxh
	 tiO+SyVMTs1GLceBJhxlSEIjBsTs16ZJhUk2lpufB/DwGSllL73HcvEtqATXywUmiE
	 yaOT5jkhbxsnvoox4uHcVgsA2HMc/IMp1EBtAp1xHtjwJzKVN1keWcE5TTN8Fe7wB3
	 BLWou4RAzthN7oUj7YySAHFDysvggg4g1pTu8bSBVkv8KXNIzXpWr6JkoDmXt8KUXF
	 Ag6NDqNLoh8Bg==
Date: Tue, 3 Jan 2023 17:20:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 5/6] CI: Fix build script when CROSS_COMPILE is in use
In-Reply-To: <20221230003848.3241-6-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2301031720400.4079@ubuntu-linux-20-04-desktop>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com> <20221230003848.3241-6-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Dec 2022, Andrew Cooper wrote:
> Some testcases use a cross compiler.  Presently it's only arm32 and due to
> previous cleanup the only thing which is now wrong is printing the compiler
> version at the start of day.
> 
> Construct $cc to match what `make` will eventually choose given CROSS_COMPILE,
> taking care not to modify $CC.  Use $cc throughout the rest of the script.
> 
> Also correct the compiler detection logic.  Plain "gcc" was wrong, and
> "clang"* was a bodge highlighting the issue, but neither survive the
> CROSS_COMPILE correction.  Instead, construct cc_is_{gcc,clang} booleans like
> we do elsewhere in the build system, by querying the --version text for gcc or
> clang.
> 
> While making this change, adjust cc_ver to be calculated once at the same time
> as cc_is_* are calculated.
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
>  automation/scripts/build | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 4c6d1f3b70bc..206312ecc7d0 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -2,13 +2,12 @@
>  
>  test -f /etc/os-release && cat "$_"
>  
> -$CC --version
> +# Construct $cc such that it matches what `make` will chose when taking
> +# CROSS_COMPILE into account.  Do not modify $CC directly, as that will cause
> +# `make` to double-account CROSS_COMPILE.
> +cc="${CROSS_COMPILE}${CC}"
>  
> -# Express the compiler version as an integer.  e.g. GCC 4.9.2 => 0x040902
> -cc-ver()
> -{
> -    $CC -dumpversion | awk -F. '{ printf "0x%02x%02x%02x", $1, $2, $3 }'
> -}
> +$cc --version
>  
>  # random config or default config
>  if [[ "${RANDCONFIG}" == "y" ]]; then
> @@ -50,7 +49,14 @@ else
>      cfgargs=()
>      cfgargs+=("--enable-docs")
>  
> -    if [[ "${CC}" == "clang"* ]]; then
> +    # booleans for which compiler is in use
> +    cc_is_gcc="$($cc --version | grep -q gcc && echo "y" || :)"
> +    cc_is_clang="$($cc --version | grep -q clang && echo "y" || :)"
> +
> +    # The compiler version as an integer.  e.g. GCC 4.9.2 => 0x040902
> +    cc_ver="$($cc -dumpversion | awk -F. '{ printf "0x%02x%02x%02x", $1, $2, $3 }')"
> +
> +    if [[ "${cc_is_clang}" == "y" ]]; then
>          # SeaBIOS cannot be built with clang
>          cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
>          # iPXE cannot be built with clang
> @@ -73,7 +79,7 @@ else
>      fi
>  
>      # SeaBIOS requires GCC 4.6 or later
> -    if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
> +    if [[ "${cc_is_gcc}" == "y" && "${cc_ver}" -lt 0x040600 ]]; then
>          cfgargs+=("--with-system-seabios=/bin/false")
>      fi
>  
> -- 
> 2.11.0
> 

