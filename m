Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329F26BBAF8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 18:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510167.787412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcV0b-00015g-Io; Wed, 15 Mar 2023 17:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510167.787412; Wed, 15 Mar 2023 17:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcV0b-00012e-FN; Wed, 15 Mar 2023 17:33:53 +0000
Received: by outflank-mailman (input) for mailman id 510167;
 Wed, 15 Mar 2023 17:33:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hb+5=7H=citrix.com=prvs=431796acb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pcV0a-00012Y-4E
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 17:33:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8abd92a5-c357-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 18:33:49 +0100 (CET)
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
X-Inumbo-ID: 8abd92a5-c357-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678901629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S+9AoZtjBs9mdfdZCkDKido9mDt9LmcGV0qZ/71ZwSg=;
  b=IwYW2vXnvxPcamhVyyHeGMVeGA7jw9XrLesuNBv7KwkqO82buVkHdu2F
   LgpHRI1SJOKSCN9Ap8gsRpc17hcc8QIrvHqROlKLC9buKBui0Q6TCbmal
   BB16Ue0pzTxHeWXjRAwCR9YUc8WeXpmOK3OeLqBYGMU/IYP+3CYHpnDDz
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101407120
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8CJRlaNgMoVLI7DvrR2Sl8FynXyQoLVcMsEvi/4bfWQNrUpx0TECy
 WJOWG2Oaf+PMGr2c48kO4m39UIAv5/cnIdrGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vZeGFxCy
 uZCEm8cRUm7tseO+5SVFMA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXSHJkNwR/C/
 goq+Uz7CCk7Luay7Qba63+ziOqTv2DaaqQNQejQGvlC3wTImz175ActfVm0u/6ikWalRslSb
 UcT/0IGr6E0+Fa6U9rVUBixoXrCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht8ztLSxitvuSU3313r6MoCm7IyQ9MW4IbihCRgwAi+QPu6lq0EiJFIw6Vvfo0JusQ2qYL
 y22QDYWl5wKsMI0zf+BokHs2gqdg6DyaCBrz1CCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQQ3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI552pUQDPY6/PhwxUjapSskZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlCge9yl3lnnTuMH/gXKihLNpLPDEN5tJ9faAfeBgzHxPrsTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW03wYwALcmu8aR/L7fTSjeK7Ul9U5c9N5t9Id0690mU/8+Ul
 kyAtrhwkgCm3CeXclvSMhiOqtrHBP5CkJ7yBgR0VX7A5pTpSd3HAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:X14NOa7EYLK7JTFkEwPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="101407120"
Date: Wed, 15 Mar 2023 17:33:41 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: Jason Andryuk <jandryuk@gmail.com>, <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] libxl: Fix libxl__device_pci_reset error messages
Message-ID: <33249448-f7d3-431a-91a8-5bc0657f0285@perard>
References: <20230313195755.35949-1-jandryuk@gmail.com>
 <f867a789-7559-3a93-08fe-56b59432140d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f867a789-7559-3a93-08fe-56b59432140d@suse.com>

On Tue, Mar 14, 2023 at 04:12:03PM +0100, Juergen Gross wrote:
> On 13.03.23 20:57, Jason Andryuk wrote:
> > Don't use the LOG*D macros.  They expect a domid, but "domain" here is
> > the PCI domain.  Hence it is inappropriate for this use.
> > 
> > Make the write error messages uniform with LOGE.  errno has the
> > interesting information while rc is just -1.  Drop printing rc and use
> > LOGE to print errno as text.
> > 
> > The interesting part of a failed write to do_flr is that PCI BDF, so
> > print that.
> > 
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

