Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEAE4EDA76
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 15:25:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296975.505706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZunB-0005t3-0C; Thu, 31 Mar 2022 13:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296975.505706; Thu, 31 Mar 2022 13:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZunA-0005qG-TM; Thu, 31 Mar 2022 13:24:48 +0000
Received: by outflank-mailman (input) for mailman id 296975;
 Thu, 31 Mar 2022 13:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCIW=UK=citrix.com=prvs=082fe6e5b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nZun9-0005qA-9C
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 13:24:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecf01376-b0f5-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 15:24:45 +0200 (CEST)
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
X-Inumbo-ID: ecf01376-b0f5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648733085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQulKZTWMZELazLtrjVa3DwFfZYZqSsQ+MHJzvBmwrQ=;
  b=LHQT1yOWLvc4f5D60tviSbfoU04BguYTcdow6DO9KVreYfoA79TZ2haj
   J7E4UasVgSYDmCvbWp304BeZvy+lJ9+HU9T8pTuEcQ5y8pkUXYefo8RR/
   OVYYW23ry0kr8PP+FsqAoNbpkeCtAviaQEnLZCoGOLTU+pi/qwlXLBXnX
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67558051
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q9PQiq+aMee80dONO17aDrUDln6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TZMWzjUPP+PZGKhKtBxOY/g8R9Uv5bVxtI2T1Nlri88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oPgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnd+TExUuZ7/dovxedihpFGZDAvB2+7CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZVENGo3MU2ojxtnNAw8Bcs+ouKShELvSQRfmneo+ql02j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkYO8aY0iGt6W+3i6nEmiaTcIAbErGi5+NpqFKWz20XThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPIJTbd8slvUjPOJvUDJXQDoUwKtdvRll5UkQmU4x
 2WR3PbYNDsojYLIeXGSo+L8QSyJBQAZKmoLZCkhRAQD4sX+rIxbsi8jXuqPA4bu0ISrRGiYL
 ySi6XFn2u5N1ZJjO7CTpwivvt66mnTeoufZDC3zV3nt0A52bZXNi2eAuQmCtqYowGp0ozC8U
 Jk4dyq2sbhm4XKlznXlrAAx8FeBvazt3Nr02wIHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX2PfEpPt3vUZl1kMAM8OgJsNiONLKihbArKWe6ENxGPxbMjwgBbmBy+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbYfFI8QTtxWqKJqV7jEqQ895loei7z1
 inVcidlJJDX3yWvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:7v3Pn68zyj8JP5m6glFuk+DaI+orL9Y04lQ7vn2YSXRuE/Bws/
 re+8jztCWE7Ar5N0tNpTntAsa9qDbnhPhICOoqTNKftWvdyQiVxehZhOOIqVDd8m/Fh4xgPM
 9bAtFD4bbLbWSS4/yV3DWF
X-IronPort-AV: E=Sophos;i="5.90,225,1643691600"; 
   d="scan'208";a="67558051"
Date: Thu, 31 Mar 2022 14:24:26 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH] libxl: Always set ao for qmp_proxy_spawn_outcome
Message-ID: <YkWrim6+yw3LBzPn@perard.uk.xensource.com>
References: <20220330181658.30209-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220330181658.30209-1-jandryuk@gmail.com>

On Wed, Mar 30, 2022 at 02:16:58PM -0400, Jason Andryuk wrote:
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 9a8ddbe188..59a8dcf3a9 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2468,6 +2468,9 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
>      uint32_t dm_domid = sdss->pvqemu.guest_domid;
>      int need_qemu;
>  
> +    /* Set for out label through qmp_proxy_spawn_outcome(). */
> +    sdss->qmp_proxy_spawn.ao = ao;

I don't think that's correct. I feels like `sdss->qmp_proxy_spawn`
doesn't need to be initialised before calling spawn_qmp_proxy().

Also `qmp_proxy_spawn.ao` only need to be set before calling
libxl__spawn_spawn(), so at the same time as the rest of the
initialisation of `qmp_proxy_spawn` in spawn_qmp_proxy().


Next, about the uninitialized `ao` field:
- qmp_proxy_spawn_outcome() shouldn't use `qmp_proxy_spawn.ao`, but
  instead it should use the one available in `sdss`, that is
  `sdss->dm.spawn.ao` (The one that libxl__spawn_stub_dm() or
  spawn_stub_launch_dm() is using).
- And spawn_qmp_proxy() should also use `sdss->dm.spawn.ao` for
  STATE_AO_GC() as I don't think spawn_qmp_proxy() can expect
  `qmp_proxy_spawn` to be initialised as that's the function that
  initialise it.


Thanks,

-- 
Anthony PERARD

