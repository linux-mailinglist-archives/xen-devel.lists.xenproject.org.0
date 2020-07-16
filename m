Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F9222375
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 15:05:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw3ZJ-0003tg-QF; Thu, 16 Jul 2020 13:04:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNdb=A3=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1jw3ZJ-0003tb-0q
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 13:04:57 +0000
X-Inumbo-ID: f1503728-c764-11ea-bca7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f1503728-c764-11ea-bca7-bc764e2007e4;
 Thu, 16 Jul 2020 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594904694;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=az+FmhN9pIiPX+LZPos7raST+pyWDt55nirXChkVUsk=;
 b=fYZRw1uTWVebuDFBB7Wgt42/fQ8ZYH6ftBBY4EOrMiDqmKan6D7JJws4OxtDguqM9hgJzd
 Che/A6edVbJurCconjDuXvK32+BxHiDoYtTYhsaeJrrPhVsAw7M2DJRWAXlWWv4dKCpvjf
 /vJzXlwL6UHt0+hq0oN29BP7DzxBjUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-wJh8r9ASND-BW_uZ_7uN3Q-1; Thu, 16 Jul 2020 09:04:49 -0400
X-MC-Unique: wJh8r9ASND-BW_uZ_7uN3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB15107ACCA;
 Thu, 16 Jul 2020 13:04:47 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99B3D6FEF4;
 Thu, 16 Jul 2020 13:04:43 +0000 (UTC)
Date: Thu, 16 Jul 2020 14:04:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH-for-5.2 v2 2/2] block/block-backend: Let
 blk_attach_dev() provide helpful error
Message-ID: <20200716130440.GT227735@redhat.com>
References: <20200716123704.6557-1-f4bug@amsat.org>
 <20200716123704.6557-3-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200716123704.6557-3-f4bug@amsat.org>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 16, 2020 at 02:37:04PM +0200, Philippe Mathieu-Daudé wrote:
> Let blk_attach_dev() take an Error* object to return helpful
> information. Adapt the callers.
> 
>   $ qemu-system-arm -M n800
>   qemu-system-arm: sd_init failed: cannot attach blk 'sd0' to device 'sd-card'
>   blk 'sd0' is already attached by device 'omap2-mmc'
>   Drive 'sd0' is already in use because it has been automatically connected to another device
>   (do you need 'if=none' in the drive options?)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Rebased after 668f62ec62 ("error: Eliminate error_propagate()")
> ---
>  include/sysemu/block-backend.h   |  2 +-
>  block/block-backend.c            | 11 ++++++++++-
>  hw/block/fdc.c                   |  4 +---
>  hw/block/swim.c                  |  4 +---
>  hw/block/xen-block.c             |  5 +++--
>  hw/core/qdev-properties-system.c | 16 +++++++++-------
>  hw/ide/qdev.c                    |  4 +---
>  hw/scsi/scsi-disk.c              |  4 +---
>  8 files changed, 27 insertions(+), 23 deletions(-)
> 
> diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
> index 8203d7f6f9..118fbad0b4 100644
> --- a/include/sysemu/block-backend.h
> +++ b/include/sysemu/block-backend.h
> @@ -113,7 +113,7 @@ BlockDeviceIoStatus blk_iostatus(const BlockBackend *blk);
>  void blk_iostatus_disable(BlockBackend *blk);
>  void blk_iostatus_reset(BlockBackend *blk);
>  void blk_iostatus_set_err(BlockBackend *blk, int error);
> -int blk_attach_dev(BlockBackend *blk, DeviceState *dev);
> +int blk_attach_dev(BlockBackend *blk, DeviceState *dev, Error **errp);
>  void blk_detach_dev(BlockBackend *blk, DeviceState *dev);
>  DeviceState *blk_get_attached_dev(BlockBackend *blk);
>  char *blk_get_attached_dev_id(BlockBackend *blk);
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 63ff940ef9..b7be0a4619 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -884,12 +884,21 @@ void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
>  
>  /*
>   * Attach device model @dev to @blk.
> + *
> + * @blk: Block backend
> + * @dev: Device to attach the block backend to
> + * @errp: pointer to NULL initialized error object
> + *
>   * Return 0 on success, -EBUSY when a device model is attached already.
>   */
> -int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
> +int blk_attach_dev(BlockBackend *blk, DeviceState *dev, Error **errp)
>  {
>      trace_blk_attach_dev(blk_name(blk), object_get_typename(OBJECT(dev)));
>      if (blk->dev) {
> +        error_setg(errp, "cannot attach blk '%s' to device '%s'",
> +                   blk_name(blk), object_get_typename(OBJECT(dev)));
> +        error_append_hint(errp, "blk '%s' is already attached by device '%s'\n",
> +                          blk_name(blk), object_get_typename(OBJECT(blk->dev)));

I would have a preference for expanding the main error message and not
using a hint.  Any hint is completely thrown away when using QMP :-(


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


