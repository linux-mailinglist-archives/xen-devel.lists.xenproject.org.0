Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239184EF1E1
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297458.506743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naITu-0008IL-3p; Fri, 01 Apr 2022 14:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297458.506743; Fri, 01 Apr 2022 14:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naITu-0008GW-0T; Fri, 01 Apr 2022 14:42:30 +0000
Received: by outflank-mailman (input) for mailman id 297458;
 Fri, 01 Apr 2022 14:42:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDTg=UL=citrix.com=prvs=083321efb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1naITs-0008GQ-O4
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:42:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2aee657-b1c9-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 16:42:27 +0200 (CEST)
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
X-Inumbo-ID: f2aee657-b1c9-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648824147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwNyhfj/vNkzAhd56p+n597OxA11saZSTSIpegr04c4=;
  b=EffSmDAq2zQvNZdNzIFY6jxXfk7k+DeoUG0nckAJbykL5oRokfuGmtxf
   z1drJgsfrRnDgqXPL5TyRAzZX86Xn5dPD1C4j0dYf8bCG0qloce6G2za4
   mq/aNU1+bKL653GA2Xy7E3V3dbWQ/1fVCI9rG50WDRuhD2GHHut6Qjb9Z
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70164878
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rNtOIa8HIY/oPp27JNJZDrUDl36TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mYaUGuFb/6MYWv9LdtzOoXk9R9Qu5LSx9AySQZkpC48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YDgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZugEQQPFI7LoacySUFGVDtmNrZhu5aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 JJAN2Y/M0SojxtnNHcLVq8st8CTlifbbm0FjQ6Ig6QH7D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkYO8aY0iGt6W+3i6nEmiaTcIAbErGi5+NpqFKWz20XThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPIJTbd8slvUjPOJvUDJXQDoUwKtdvQhpJc1YxYJ0
 WbKsMmxG3t1qLaObjG0o+L8QSyJBQAZKmoLZCkhRAQD4sX+rIxbsi8jXuqPA4bu0ISrRGiYL
 ySi6XFn2u5N1ZJjO7CTpwivvt66mnTeoufZDC3zV3nt0A52bZXNi2eAuQmCtqYowGp0ozC8U
 Jk4dyq2sbhm4XKlznXlrAAx8FeBvant3Nr02wIHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX2PfAqOdjpWpV3kMAM8OgJsNiOMbKihbArKWe6ENxGPxbMjwgBbmBy+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbYfFI8QTtxWqKJqV7jEqQ895loei7z1
 inVcidlJJDX3BUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:MGkL564ovvBwJiBIxQPXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="70164878"
Date: Fri, 1 Apr 2022 15:41:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2] libxl: Re-scope qmp_proxy_spawn.ao usage
Message-ID: <YkcO/2CQWEOH9ZWD@perard.uk.xensource.com>
References: <20220401143310.17743-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220401143310.17743-1-jandryuk@gmail.com>

On Fri, Apr 01, 2022 at 10:33:10AM -0400, Jason Andryuk wrote:
> I've observed this failed assertion:
> libxl_event.c:2057: libxl__ao_inprogress_gc: Assertion `ao' failed.
> 
> AFAICT, this is happening in qmp_proxy_spawn_outcome where
> sdss->qmp_proxy_spawn.ao is NULL.
> 
> The out label of spawn_stub_launch_dm() calls qmp_proxy_spawn_outcome(),
> but it is only in the success path that sdss->qmp_proxy_spawn.ao gets
> set to the current ao.
> 
> qmp_proxy_spawn_outcome() should instead use sdss->dm.spawn.ao, which is
> the already in-use ao when spawn_stub_launch_dm() is called.  The same
> is true for spawn_qmp_proxy().
> 
> With this, move sdss->qmp_proxy_spawn.ao initialization to
> spawn_qmp_proxy() since its use is for libxl__spawn_spawn() and it can
> be initialized along with the rest of sdss->qmp_proxy_spawn.
> 
> Fixes: 83c845033dc8 ("libxl: use vchan for QMP access with Linux stubdomain")
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

