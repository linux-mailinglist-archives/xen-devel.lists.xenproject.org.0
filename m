Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF335F723B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 02:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417309.661970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogb9m-0005dk-8w; Fri, 07 Oct 2022 00:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417309.661970; Fri, 07 Oct 2022 00:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogb9m-0005b7-4v; Fri, 07 Oct 2022 00:24:02 +0000
Received: by outflank-mailman (input) for mailman id 417309;
 Fri, 07 Oct 2022 00:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwH6=2I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogb9l-0005a1-1d
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 00:24:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54fb0d29-45d6-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 02:23:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D90D61921;
 Fri,  7 Oct 2022 00:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C89C433D6;
 Fri,  7 Oct 2022 00:23:55 +0000 (UTC)
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
X-Inumbo-ID: 54fb0d29-45d6-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665102235;
	bh=wNxxAaNgmv1Yy2qhYYPm61z1GMJgbu+XBvZGxaEoE4U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kVleMf6zL6f1pwxe3/B2+3DcPTeU3X6a/wIGPDmirHr2H5djKLv8hAP3MT3r/KeNf
	 7Iu7krEgUK6RMUuh3oPWvGrQoXgT2rnlUWnpQAmGvFOxkLRwSVN/czsbTqpoRF0O8Z
	 EhEIImTKy/roVmqFiE6fJZ3RGfNgwaNLXYa5++bk1MZjcXL6OwB6vcyL9bgQ9OR1pb
	 jikOOGFNJiMQPE/gzN5LBfzAc3yW4s/F6xrNdBGknOVcyIGL7sELIUIkqRrD2ePMEO
	 21i9P/Q+7ae1hDCMjXB6nym3qwmuxGJYwmp8gX7d/2w0uCx0MaycdEKFVKwMoN3klc
	 qldIYJvaWDb5g==
Date: Thu, 6 Oct 2022 17:23:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
cc: Juergen Gross <jgross@suse.com>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] xen/virtio: use dom0 as default backend for
 CONFIG_XEN_VIRTIO_FORCE_GRANT
In-Reply-To: <36b69e76-a26e-f7e5-998a-8345034cec20@epam.com>
Message-ID: <alpine.DEB.2.22.394.2210061723410.3690179@ubuntu-linux-20-04-desktop>
References: <20221006071500.15689-1-jgross@suse.com> <20221006071500.15689-3-jgross@suse.com> <36b69e76-a26e-f7e5-998a-8345034cec20@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Oct 2022, Oleksandr Tyshchenko wrote:
> On 06.10.22 10:14, Juergen Gross wrote:
> 
> Hello Juergen
> 
> > With CONFIG_XEN_VIRTIO_FORCE_GRANT set the default backend domid to 0,
> > enabling to use xen_grant_dma_ops for those devices.
> >
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > ---
> >   drivers/xen/grant-dma-ops.c | 3 +++
> >   1 file changed, 3 insertions(+)
> 
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> > index f29759d5301f..a00112235877 100644
> > --- a/drivers/xen/grant-dma-ops.c
> > +++ b/drivers/xen/grant-dma-ops.c
> > @@ -349,6 +349,9 @@ void xen_grant_setup_dma_ops(struct device *dev)
> >   	if (dev->of_node) {
> >   		if (xen_dt_grant_setup_dma_ops(dev, data))
> >   			goto err;
> > +	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT)) {
> > +		dev_info(dev, "Using dom0 as backend\n");
> > +		data->backend_domid = 0;
> >   	} else {
> >   		/* XXX ACPI device unsupported for now */
> >   		goto err;
> 
> -- 
> Regards,
> 
> Oleksandr Tyshchenko
> 

