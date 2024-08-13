Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326094FB53
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 03:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775835.1186044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgdx-0005KY-Er; Tue, 13 Aug 2024 01:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775835.1186044; Tue, 13 Aug 2024 01:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgdx-0005Ip-Be; Tue, 13 Aug 2024 01:48:13 +0000
Received: by outflank-mailman (input) for mailman id 775835;
 Tue, 13 Aug 2024 01:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgOn=PM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sdgdv-0004Ab-RQ
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 01:48:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 184f2c65-5916-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 03:48:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E3D6261522;
 Tue, 13 Aug 2024 01:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A4DC4AF0D;
 Tue, 13 Aug 2024 01:48:08 +0000 (UTC)
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
X-Inumbo-ID: 184f2c65-5916-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513689;
	bh=LynzrHYz8D0kw2B04lBsBEFfNJwdRhtojW0Yvbjp3qQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XbvMesIUTszXI/eTME4zydA6roCrVH5Fapt4+25OQsRQ219lE794BCMnotWSbFhOK
	 5cKSJXzO0+g2gdHeBImOFjuvw7YSYyVtAUY/yvQ7+/CpdBCF1Xh94kXaTkpVIQXd/L
	 iUqvp27U17axV7oY2jir3sHaRbIRBNLkTdiC3APYuY3CcvInex14A/tNkQOf0s+JXb
	 euhC0w0OGzQ13OenNlNURydVn8W7vDouK5q3UEvRqimvhxKnUQwRI5EoQc8ZuFew5m
	 OYQ4j173cIZiyd8I9bNU23aKetIiDls47NgFs7bBipAdmto/SG7f4lVxX+JN5OswtR
	 jKB1CC7LfiqaA==
Date: Mon, 12 Aug 2024 18:48:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 07/10] hw/arm: xenpvh: Reverse virtio-mmio creation
 order
In-Reply-To: <20240812130606.90410-8-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121813200.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-8-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> We've been creating the virtio-mmio devices in forwards order
> but since the qbus lists prepend (rather than append) entries,
> the virtio busses end up with decreasing base address order.
> 
> Xen enables virtio-mmio nodes in forwards order so there's been
> a missmatch. So far, we've been working around this with an
> out-of-tree patch to Xen.
> 
> This reverses the order making sure the virtio busses end up
> ordered with increasing base addresses avoiding the need to
> patch Xen.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-pvh-common.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> index 0d368398d0..69a2dbdb6d 100644
> --- a/hw/xen/xen-pvh-common.c
> +++ b/hw/xen/xen-pvh-common.c
> @@ -73,7 +73,18 @@ static void xen_create_virtio_mmio_devices(XenPVHCommonState *s)
>  {
>      int i;
>  
> -    for (i = 0; i < s->cfg.virtio_mmio_num; i++) {
> +    /*
> +     * We create the transports in reverse order. Since qbus_realize()
> +     * prepends (not appends) new child buses, the decrementing loop below will
> +     * create a list of virtio-mmio buses with increasing base addresses.
> +     *
> +     * When a -device option is processed from the command line,
> +     * qbus_find_recursive() picks the next free virtio-mmio bus in forwards
> +     * order.
> +     *
> +     * This is what the Xen tools expect.
> +     */
> +    for (i = s->cfg.virtio_mmio_num - 1; i >= 0; i--) {
>          hwaddr base = s->cfg.virtio_mmio.base + i * s->cfg.virtio_mmio.size;
>          qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
>                                           s->cfg.virtio_mmio_irq_base + i);
> -- 
> 2.43.0
> 

