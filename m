Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F27642C81
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 17:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454067.711714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2E0e-0005bY-E7; Mon, 05 Dec 2022 16:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454067.711714; Mon, 05 Dec 2022 16:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2E0e-0005YX-BG; Mon, 05 Dec 2022 16:08:00 +0000
Received: by outflank-mailman (input) for mailman id 454067;
 Mon, 05 Dec 2022 16:07:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AS2=4D=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1p2E0d-0005YE-4j
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 16:07:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb3dff52-74b6-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 17:07:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02AC9611B3;
 Mon,  5 Dec 2022 16:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA843C433D6;
 Mon,  5 Dec 2022 16:07:54 +0000 (UTC)
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
X-Inumbo-ID: fb3dff52-74b6-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670256475;
	bh=Eu6yRxptwIjp+jobzTRehJVPk3s3l2rtPAWW3JDKriU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGQk9MFX4LB7qvP2B2anJGqE6Z6d0L46ICiQtdTZRCj2bbx+sL1Qj6lDYAd796T73
	 krThdNV5BAuOVBcjlWHfKp1kVWotWO8++wS4g8SLIq/MBzEqMQLv0PWpHmDlNEYi2z
	 li2DvIFUErFDJ0iS5DzLus0ZVrozvfh9M06QC2jc=
Date: Mon, 5 Dec 2022 17:07:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dawei Li <set_pte_at@outlook.com>
Cc: johannes@sipsolutions.net, robert.jarzmik@free.fr, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	roger.pau@citrix.com, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] soundbus: make remove callback of soundbus driver
 void returned
Message-ID: <Y44XWIqnKwE7ntPL@kroah.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB2323BBFCE929111043E60D3BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB2323BBFCE929111043E60D3BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>

On Mon, Dec 05, 2022 at 11:36:44PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.
> 
> This change is for soundbus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
>  sound/aoa/fabrics/layout.c    | 3 +--
>  sound/aoa/soundbus/soundbus.h | 6 +++---
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
> index ec4ef18555bc..850dc8c53e9b 100644
> --- a/sound/aoa/fabrics/layout.c
> +++ b/sound/aoa/fabrics/layout.c
> @@ -1094,7 +1094,7 @@ static int aoa_fabric_layout_probe(struct soundbus_dev *sdev)
>  	return -ENODEV;
>  }
>  
> -static int aoa_fabric_layout_remove(struct soundbus_dev *sdev)
> +static void aoa_fabric_layout_remove(struct soundbus_dev *sdev)
>  {
>  	struct layout_dev *ldev = dev_get_drvdata(&sdev->ofdev.dev);
>  	int i;
> @@ -1123,7 +1123,6 @@ static int aoa_fabric_layout_remove(struct soundbus_dev *sdev)
>  	kfree(ldev);
>  	sdev->pcmid = -1;
>  	sdev->pcmname = NULL;
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/sound/aoa/soundbus/soundbus.h b/sound/aoa/soundbus/soundbus.h
> index 3a99c1f1a3ca..230dfa1ba270 100644
> --- a/sound/aoa/soundbus/soundbus.h
> +++ b/sound/aoa/soundbus/soundbus.h
> @@ -184,10 +184,10 @@ struct soundbus_driver {
>  
>  	/* we don't implement any matching at all */
>  
> -	int	(*probe)(struct soundbus_dev* dev);
> -	int	(*remove)(struct soundbus_dev* dev);
> +	int	(*probe)(struct soundbus_dev *dev);

Why change this line too?

thanks,

greg k-h

