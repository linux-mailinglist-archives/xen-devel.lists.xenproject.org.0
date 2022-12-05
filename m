Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE7B642C77
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 17:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454048.711703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2DwV-0004f8-U9; Mon, 05 Dec 2022 16:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454048.711703; Mon, 05 Dec 2022 16:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2DwV-0004cU-R6; Mon, 05 Dec 2022 16:03:43 +0000
Received: by outflank-mailman (input) for mailman id 454048;
 Mon, 05 Dec 2022 16:03:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AS2=4D=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1p2DwU-0003p9-QG
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 16:03:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 636d0a22-74b6-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 17:03:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5497B81134;
 Mon,  5 Dec 2022 16:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8930C433D6;
 Mon,  5 Dec 2022 16:03:39 +0000 (UTC)
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
X-Inumbo-ID: 636d0a22-74b6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670256220;
	bh=mqFOwbVppYAcW5Cn5xUKN/wnrwuAAExaAVEWq0H9axM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANi23BgakNxd3FkjR7VfG4ohH47l8+R8mpEFenDtWCftg3MQQ6IopoRzje2nL+HiQ
	 W/V3GUTObsYx+ERHGuN5QFLT8PU+TPVzYsCpUcCRWon3OTurNp0CBC//sQKoJd8wn0
	 kpdJ4IXJQ8tNES9c4Tr4Ag8Zvf352rtyo6Fh3oJ0=
Date: Mon, 5 Dec 2022 17:03:37 +0100
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
Subject: Re: [PATCH 5/6] ac97: make remove callback of ac97 driver void
 returned
Message-ID: <Y44WWZW5AK2q9s0q@kroah.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB2323207367F2D39D0D725828CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB2323207367F2D39D0D725828CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>

On Mon, Dec 05, 2022 at 11:36:43PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.
> 
> This change is for ac97 bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
>  drivers/mfd/wm97xx-core.c  | 4 +---
>  include/sound/ac97/codec.h | 6 +++---
>  sound/ac97/bus.c           | 5 ++---
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mfd/wm97xx-core.c b/drivers/mfd/wm97xx-core.c
> index 9a2331eb1bfa..663acbb1854c 100644
> --- a/drivers/mfd/wm97xx-core.c
> +++ b/drivers/mfd/wm97xx-core.c
> @@ -319,13 +319,11 @@ static int wm97xx_ac97_probe(struct ac97_codec_device *adev)
>  	return ret;
>  }
>  
> -static int wm97xx_ac97_remove(struct ac97_codec_device *adev)
> +static void wm97xx_ac97_remove(struct ac97_codec_device *adev)
>  {
>  	struct wm97xx_priv *wm97xx = ac97_get_drvdata(adev);
>  
>  	snd_ac97_compat_release(wm97xx->ac97);
> -
> -	return 0;
>  }
>  
>  static const struct ac97_id wm97xx_ac97_ids[] = {
> diff --git a/include/sound/ac97/codec.h b/include/sound/ac97/codec.h
> index 9792d25fa369..a26e9e0082f6 100644
> --- a/include/sound/ac97/codec.h
> +++ b/include/sound/ac97/codec.h
> @@ -62,9 +62,9 @@ struct ac97_codec_device {
>   */
>  struct ac97_codec_driver {
>  	struct device_driver	driver;
> -	int			(*probe)(struct ac97_codec_device *);
> -	int			(*remove)(struct ac97_codec_device *);
> -	void			(*shutdown)(struct ac97_codec_device *);
> +	int			(*probe)(struct ac97_codec_device *dev);

Why did you change this line?

> +	void			(*remove)(struct ac97_codec_device *dev);
> +	void			(*shutdown)(struct ac97_codec_device *dev);

And this line?

Don't change things that you don't describe in your changelog and that
are not needed for your change.

thanks,

greg k-h

