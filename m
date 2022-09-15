Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C45B9CA6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 16:11:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407414.649934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpaE-0007nn-41; Thu, 15 Sep 2022 14:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407414.649934; Thu, 15 Sep 2022 14:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpaE-0007ly-0z; Thu, 15 Sep 2022 14:11:14 +0000
Received: by outflank-mailman (input) for mailman id 407414;
 Thu, 15 Sep 2022 14:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IiOX=ZS=citrix.com=prvs=2502044d7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oYpaC-0007Wm-5e
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 14:11:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cf3d91d-3500-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 16:11:07 +0200 (CEST)
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
X-Inumbo-ID: 3cf3d91d-3500-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663251067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jFF9lcmlFyPX/dnwX68oXyE9c54ljx1Iupap8m0/STI=;
  b=bNzGHToGJFtS+Y9YF6w3MDbBkwBrdg7Fd59D0EFjoboQk/O6ZZotWPKu
   FFfRxNB2CoW40RMNTsSUW0VKSF6YUuwonSnt2/Cl2InkDjGlF2pyTWwGy
   wW8Tigtvi6oXcCK2l9AUFzIGKrGmhTwGF+rcVNX9M27Fc05wewIi/OYZo
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80582908
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zRx7LKtbBs0CWtyrqgjHa0js6OfnVD5eMUV32f8akzHdYApBsoF/q
 tZmKW6PPa3bM2bwc9glYdiw8BlXvMTWzdZnT1dr/CthFXlG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4W5A5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05Fa0EubwsUFMVz
 99CNgsddyHet/rn+q3uH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3FYIKIKobbHZU9ckCwm
 G+b+HakCx8gENG9kzm7107vgd/kpHauMG4VPOLhraM76LGJ/UQRFRkXWF2TsfS/zEmkVLp3K
 lMW0jojq7Ao806mRcW7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBeeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sEQgJbjVZNB1fdyhf/eLzubBuvgqedMk2RcZZkebJ9SHML
 yGi9XZg3O1O15ZWic1X7nic3Wvy+8Ghohodo1yOAzn7tl4RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43Nzgbb1HRcNJG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/EsOtLpVplznPi4fTgAahwzRoMXCqWdiSfdpH0+DaJu9zqFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9ogPUsQ7nlnnQvuqWXTlUvPPUy2OCHIEt/o8TKmMogE0U9ziFyMr
 ooAZ5LRlU83vS+XSnC/zLP/5GsidRATba0aYeQNL4Zv/iIO9LkdNsLs
IronPort-HdrOrdr: A9a23:MW6VCK7AoH57SbtfTAPXwM7XdLJyesId70hD6qhwISY6TiW9rb
 HLoB19726StN9xYgBEpTnuAsS9qB/nmaKdpLNhW4tKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFeaTN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.93,318,1654574400"; 
   d="scan'208";a="80582908"
Date: Thu, 15 Sep 2022 15:10:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>,
	"Julien Grall" <julien@xen.org>
Subject: Re: [PATCH] libvirt: disable Werror for non-libvirt flights
Message-ID: <YyMyc0O9N9l1NzEZ@perard.uk.xensource.com>
References: <20220913100328.27771-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220913100328.27771-1-roger.pau@citrix.com>

On Tue, Sep 13, 2022 at 12:03:28PM +0200, Roger Pau Monne wrote:
> Current usage of Werror=switch-enum by default for libvirt builds out
> of the git tree causes issues when new items are added to libxl public
> API enums if those are used in a switch statement in libvirt code.
> This leads to libvirt build failures for seemingly unrelated libxl
> changes.
> 
> In order to prevent those errors from blocking the push gate, disable
> Werror for libvirt builds when not in a libvirt specific flight.
> 
> The errors will be reported on the libvirt flight, and block the
> pushes there.  So the author of the changes in libxl is still expected
> to send a fix to libvirt code.  This is no ideal, but the other option
> is to just disable Werror for all libvirt builds and let libvirt
> developers fix the breakage when they notice it.
> 
> runvar differences for a xen-unstable flight are:
> 
> --- /dev/fd/63  2022-09-13 09:53:58.044441678 +0000
> +++ /dev/fd/62  2022-09-13 09:53:58.044441678 +0000
> @@ -574,6 +574,10 @@
>  test-xtf-amd64-amd64-3                                arch                            amd64
>  test-xtf-amd64-amd64-4                                arch                            amd64
>  test-xtf-amd64-amd64-5                                arch                            amd64
> +build-amd64-libvirt                                   autogen_options                 --disable-werror
> +build-arm64-libvirt                                   autogen_options                 --disable-werror
> +build-armhf-libvirt                                   autogen_options                 --disable-werror
> +build-i386-libvirt                                    autogen_options                 --disable-werror
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    bios                            seabios
>  test-amd64-amd64-qemuu-nested-amd                     bios                            seabios
>  test-amd64-amd64-qemuu-nested-intel                   bios                            seabios
> @@ -1217,6 +1221,10 @@
>  build-arm64-libvirt                                   make_njobs                      1
>  build-armhf-libvirt                                   make_njobs                      1
>  build-i386-libvirt                                    make_njobs                      1
> +build-amd64-libvirt                                   meson_options                   -Dgit_werror=disabled
> +build-arm64-libvirt                                   meson_options                   -Dgit_werror=disabled
> +build-armhf-libvirt                                   meson_options                   -Dgit_werror=disabled
> +build-i386-libvirt                                    meson_options                   -Dgit_werror=disabled
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict recipe_dmrestrict               true
>  test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict  recipe_dmrestrict               true
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict recipe_nomigrate                true

For "osstest" flight or "xen-unstable-smoke" flight, we would have the
same difference, right?

The only branch with no change would be libvirt, right?

> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I'm unsure whether we want o disable Werror even for libvirt flights,
> but this seems more conservative.
> 
> This does at least unblock the libvirt builds for both the
> xen-unstable and the libvirt flights.
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Julien Grall <julien@xen.org>
> ---
>  mfi-common       | 2 +-
>  ts-libvirt-build | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/mfi-common b/mfi-common
> index 59e712f4..450229e9 100644
> --- a/mfi-common
> +++ b/mfi-common
> @@ -459,7 +459,7 @@ create_build_jobs () {
>      libvirt_build_runvars=''
>      case "$branch" in
>      libvirt*) ;;
> -    *)        libvirt_build_runvars+=" make_njobs=1";;
> +    *)        libvirt_build_runvars+=" make_njobs=1 meson_options=-Dgit_werror=disabled autogen_options=--disable-werror";;

For meson, I think '-Dwerror=false' would be enough, instead of the
unusual 'git_werror' configuration.

But, we might not need to disable all errors, for meson we can have:
    -Dc_args='-Wno-error=switch -Wno-error=switch-enum'

But disabling werror is fine too, as less likely to be an issue later.

Both 'werror' and 'c_args' seems to be meson built-in options rather
than options implemented for only libvirt.
    https://mesonbuild.com/Builtin-options.html
While 'git_werror' is libvirt only.


Thanks,

-- 
Anthony PERARD

