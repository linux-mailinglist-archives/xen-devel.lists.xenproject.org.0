Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D413642C85
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 17:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454073.711724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2E1I-00066e-Mt; Mon, 05 Dec 2022 16:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454073.711724; Mon, 05 Dec 2022 16:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2E1I-00063g-KD; Mon, 05 Dec 2022 16:08:40 +0000
Received: by outflank-mailman (input) for mailman id 454073;
 Mon, 05 Dec 2022 16:08:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AS2=4D=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1p2E1H-0005vJ-5V
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 16:08:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1361097d-74b7-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 17:08:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3C01611D6;
 Mon,  5 Dec 2022 16:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7ED3C433D6;
 Mon,  5 Dec 2022 16:08:35 +0000 (UTC)
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
X-Inumbo-ID: 1361097d-74b7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670256516;
	bh=2zTjxGImNhiKZkQVLYwU+D7sO9c/DELnBsQOLmxj5RM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1aBQ5PwG5R+hRKkkXrH8ZTKVgOxRxmB/P6l1a7WOnp6bg1x+OclpQCfQnhw/5RV9
	 VWi7ElCSsHDX/U7BRQ1/TnpM9vFr8hQGRZDE9i4Y2GO9/XQcyWYoAD1bZDv9jDw4w5
	 KgmnSDvMOM5qBG6N1xQJdeSmTODNmVm+4pNvzk5Y=
Date: Mon, 5 Dec 2022 17:08:33 +0100
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
Subject: Re: [PATCH 2/6] macio: Make remove callback of macio driver void
 returned
Message-ID: <Y44XgS8nHgcJjQCL@kroah.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>

On Mon, Dec 05, 2022 at 11:36:40PM +0800, Dawei Li wrote:
> Commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.
> 
> This change is for macio bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
>  arch/powerpc/include/asm/macio.h                | 12 ++++++------
>  drivers/ata/pata_macio.c                        |  4 +---
>  drivers/macintosh/rack-meter.c                  |  4 +---
>  drivers/net/ethernet/apple/bmac.c               |  4 +---
>  drivers/net/ethernet/apple/mace.c               |  4 +---
>  drivers/net/wireless/intersil/orinoco/airport.c |  4 +---
>  drivers/scsi/mac53c94.c                         |  5 +----
>  drivers/scsi/mesh.c                             |  5 +----
>  drivers/tty/serial/pmac_zilog.c                 |  7 ++-----
>  sound/aoa/soundbus/i2sbus/core.c                |  4 +---
>  10 files changed, 16 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/macio.h b/arch/powerpc/include/asm/macio.h
> index ff5fd82d9ff0..f641c730c3b7 100644
> --- a/arch/powerpc/include/asm/macio.h
> +++ b/arch/powerpc/include/asm/macio.h
> @@ -124,15 +124,15 @@ static inline struct pci_dev *macio_get_pci_dev(struct macio_dev *mdev)
>   */
>  struct macio_driver
>  {
> -	int	(*probe)(struct macio_dev* dev, const struct of_device_id *match);
> -	int	(*remove)(struct macio_dev* dev);
> +	int	(*probe)(struct macio_dev *dev, const struct of_device_id *match);
> +	void	(*remove)(struct macio_dev *dev);

Again, you are changing lines you do not need to here.

thanks,

greg k-h

