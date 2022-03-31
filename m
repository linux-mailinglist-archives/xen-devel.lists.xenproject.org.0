Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96894EDB76
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 16:10:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296994.505751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvV3-0004Cq-7z; Thu, 31 Mar 2022 14:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296994.505751; Thu, 31 Mar 2022 14:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvV3-0004Al-3q; Thu, 31 Mar 2022 14:10:09 +0000
Received: by outflank-mailman (input) for mailman id 296994;
 Thu, 31 Mar 2022 14:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCIW=UK=citrix.com=prvs=082fe6e5b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nZvV1-00046P-QE
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 14:10:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42ae0267-b0fc-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 16:10:05 +0200 (CEST)
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
X-Inumbo-ID: 42ae0267-b0fc-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648735805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1vWiFKuWCdwcit+SekdnZEsS+P2nCjXP2p2BwVRhN7U=;
  b=cIRLI0FBkqR0Erjl6r+9cGCe1qp3BGjaUkKYlaPBbbwmaaPM0m4YlJvd
   rl+uh0olVPD5LT3lTjyW18r/ZASsqprbrmhGC/W6xvY2phEJJnmiLmpYZ
   DK1YDmA6NEav+foZdBG7DvQenzpAQsWghYhmRF3+G/2aZpYATiHDQ+3GR
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67097998
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:J+py2KmgcmBg7tjyDec5Ob7o5gyWJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWzyBMv2DZmP3f48nPti0p0lQv5PUnNJlTFRtrnozFSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWFrV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSDcRYKSdpf4hQlpSNyFAA715/oTtGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNmI+M0WRM3WjPH83S4gVn8P5tEWjWDdEs2+y/7Eo5FHcmVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHN6Q0z2e6Vq3m/TC2yj8Xeo6FrS++uR7nV67yWkaCRlQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nM4GfWIjh
 2KTo8KqDxhvjoOFdnSm3I7B+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hid21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshTVflhdwTXGY3h+Y1FAd7falUwZnY1Q/EcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/MnPdzsVJpwkPe9fTgAahwyRoAUCnSWXFXalByCmGbKhzy9+KTSuf9X1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClE4QDt4Ua+AnOtJlk4Mt/09q9okN
 0qVAidwoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:Q7cbHagdoPNcZ3AE4gF5dCyaLnBQXrkji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx9ZJhNo7q90cq7IE80i6Qb3WB5B97LYOCMggeVxe9Zg7ff/w==
X-IronPort-AV: E=Sophos;i="5.90,225,1643691600"; 
   d="scan'208";a="67097998"
Date: Thu, 31 Mar 2022 15:10:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH] libxl: Don't segfault on soft-reset failure
Message-ID: <YkW2OGC5T4pE7lGW@perard.uk.xensource.com>
References: <20220330181727.30303-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220330181727.30303-1-jandryuk@gmail.com>

On Wed, Mar 30, 2022 at 02:17:27PM -0400, Jason Andryuk wrote:
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 15ed021f41..631caa416d 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1970,7 +1970,8 @@ static void domcreate_complete(libxl__egc *egc,
>      libxl_domain_config *const d_config = dcs->guest_config;
>      libxl_domain_config *d_config_saved = &dcs->guest_config_saved;
>  
> -    libxl__xswait_stop(gc, &dcs->console_xswait);
> +    if (dcs->console_xswait.path)
> +        libxl__xswait_stop(gc, &dcs->console_xswait);

libxl__xswait_stop() needs to be called here. It's a function that can
be called several time without ill effect, as long as `console_xswait`
is initialised properly (by calling libxl__xswait_init() like you did
below.

>      libxl__domain_build_state_dispose(&dcs->build_state);
>  
> @@ -2176,6 +2177,10 @@ static int do_domain_soft_reset(libxl_ctx *ctx,
>                                aop_console_how);
>      cdcs->domid_out = &domid_out;
>  
> +    /* Initialize in case we end up in domcreate_complete without calling
> +     * initiate_domain_create. */

That comment isn't needed. This is just part of the initialisation of
`cdcs->dcs`.

> +    libxl__xswait_init(&cdcs->dcs.console_xswait);
> +
>      dom_path = libxl__xs_get_dompath(gc, domid);
>      if (!dom_path) {
>          LOGD(ERROR, domid, "failed to read domain path");


As part of the patch, could you also move the libxl__xswait_init() call
in initiate_domain_create() to do_domain_create()? That would avoid
`console_xswait` been initialised twice, and do_domain_create() is the
function that initialise `dcs` before calling initiate_domain_create().

Thanks,

-- 
Anthony PERARD

