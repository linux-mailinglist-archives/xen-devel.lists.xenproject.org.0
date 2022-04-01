Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF844EF20E
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297464.506754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIYH-0000a6-PB; Fri, 01 Apr 2022 14:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297464.506754; Fri, 01 Apr 2022 14:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIYH-0000Wv-LT; Fri, 01 Apr 2022 14:47:01 +0000
Received: by outflank-mailman (input) for mailman id 297464;
 Fri, 01 Apr 2022 14:47:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDTg=UL=citrix.com=prvs=083321efb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1naIYG-0000Wm-Pw
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:47:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94e5c217-b1ca-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 16:46:59 +0200 (CEST)
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
X-Inumbo-ID: 94e5c217-b1ca-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648824419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=//ZTUcOv7xWewr4kNtLTS/BFWXuZyREyUGYevWICZvM=;
  b=C8GHnIEtE+gEs2Kf+xTRQzm837NdVNkpWuDpRYtRwxaCitrK+WTcGXGO
   xnYtyt81+X5gw4+QR1hUlyhYsjuCBJMdYeTIgki0WeqnIHP3ce6QNkdDF
   3O7CzndutRs4+Z6Rcjh84Cu12pLWkG3GSliC9FoCmZ4eiE9HXOq0NiqUe
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70165387
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:l7e7v6nEbHMJtUBEGi4xVuro5gyWJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOCmGAa6nZZGv8f9p2PI2+pkgF6JPVn94xHQRk+X8zRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW1rV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYVjtxBJGVpPUhfSJbKCBnL5FA4+7lPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGMWMxMU+QPHWjPH8sMZxhwvnwuUX/WBtzsAO6+oM040HMmVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHN6Q0z2e6Vq3m/TC2yj8Xeo6FrS++uR7nV67yWkaCRlQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nNAKHQYWj
 2OYo/3SBgduqa+pT2nM1KjB+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hid21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshTVflhdwTXGY3h+Y1FAd7fb1UwZnY1Q/EcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/MnPN/rUZx7nPW9fTgAahwyRoARCnSWXFXalByCmGbKhzy9+KTSuf9X1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClE4QDt4Ua+AnOtJlk4Mt/09q9okN
 0qVAidwoGcTT1WaQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:yRiGuazG+PbV3w8zBQ6tKrPwIL1zdoMgy1knxilNoHtuA66lfq
 GV7ZcmPHDP6Qr5NEtOpTniAsW9qBHnhPtICOAqVN/INmTbUQOTXeVfBODZowEIdReRygYDvp
 0QFJSWoueAa2RHsQ==
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="70165387"
Date: Fri, 1 Apr 2022 15:42:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2] libxl: Don't segfault on soft-reset failure
Message-ID: <YkcPY8NV0sOFvYUo@perard.uk.xensource.com>
References: <20220401143256.17720-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220401143256.17720-1-jandryuk@gmail.com>

On Fri, Apr 01, 2022 at 10:32:56AM -0400, Jason Andryuk wrote:
> If domain_soft_reset_cb can't rename the save file, it doesn't call
> initiate_domain_create() and calls domcreate_complete().
> 
> Skipping initiate_domain_create() means dcs->console_wait is
> uninitialized and all 0s.
> 
> We have:
>   domcreate_complete()
>     libxl__xswait_stop()
>       libxl__ev_xswatch_deregister().
> 
> The uninitialized slotnum 0 is considered valid (-1 is the invalid
> sentinel), so the NULL pointer path to passed to xs_unwatch() which
> segfaults.
> 
> libxl__ev_xswatch_deregister:watch w=0x12bc250 wpath=(null) token=0/0: deregister slotnum=0
> 
> Move dcs->console_xswait initialization into the callers of
> initiate_domain_create, do_domain_create() and do_domain_soft_reset(),
> so it is initialized along with the other dcs state.
> 
> Fixes: c57e6ebd8c3e ("(lib)xl: soft reset support")
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

