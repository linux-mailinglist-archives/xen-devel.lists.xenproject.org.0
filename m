Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8117CD587
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 09:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618426.962061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt12z-0006tO-JM; Wed, 18 Oct 2023 07:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618426.962061; Wed, 18 Oct 2023 07:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt12z-0006qw-GT; Wed, 18 Oct 2023 07:32:53 +0000
Received: by outflank-mailman (input) for mailman id 618426;
 Wed, 18 Oct 2023 07:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+j9=GA=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1qt12x-0006qq-IW
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 07:32:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89dfa73c-6d88-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 09:32:50 +0200 (CEST)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-3w0JA6f4Nrm9NDEgjEhF5Q-1; Wed, 18 Oct 2023 03:32:45 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-66d75988385so11958646d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Oct 2023 00:32:45 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 qh29-20020a0562144c1d00b0066d1b4ce863sm1166386qvb.31.2023.10.18.00.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 00:32:44 -0700 (PDT)
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
X-Inumbo-ID: 89dfa73c-6d88-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697614368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H9ARuw3ocrq2zuIRYqvsxkWkuBZXz4JrIIs6MzQ7cA8=;
	b=a+V/oXzCMjBbZFhkxP2ewU42nnVWBgzsmWLW9f8tjJK1A6LJLxhwNlSjidEnofrgfDLBeH
	NiHmtysQxZZFLr2WQzR4vqkxot3WPx/8crX3Ai6k4007V9hllu9Jtdo9jH7gJ3YiiVV/ev
	8jBC+ySxEegLp3McgOgf5cM9GmaIfBU=
X-MC-Unique: 3w0JA6f4Nrm9NDEgjEhF5Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697614365; x=1698219165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9ARuw3ocrq2zuIRYqvsxkWkuBZXz4JrIIs6MzQ7cA8=;
        b=BHxzVmgeSiVCIaeWr8SJ5z8wVkr3B189NOYFe8LLH9MSpp5MP/BOJ+iffpoLxsoqdH
         7ADgysJuRRDyaaq/cS8Fs4xG25WE46gihJ1Gk/EUqdTqolUQxFBsMgXel8vI0HhVZqoO
         YIbftrcA2zGbGKFknnNeG2pEBJjSLXX1sMxoBdySMj2jbcNt19STE/k9Jgr98eUCs3Tt
         n6yVDqCcopq5qL//AQJYchl+MyGav2dgW5R3oRZUJ9EVsz8xIwsDK5eBsKv/fxm0hkVv
         4/EAJ1+ogqyEumpq1QLzLn1kEzRqn2Vi2hS3HK1RdXrYF9kfnRL9SEi3akZTQZTPfVYD
         CSvg==
X-Gm-Message-State: AOJu0Yy5fBmq2gxXRh0QFgUUkVyN0MIdcEhAFfX58uNnIbmTu28KIj+b
	Xdmr4nVdDt92caP8MmJvr8exNrDV97qaJHH3vMllYnmSUohjftMs2O7KqkeCpd5p48w2wmAx5PW
	HhVUCgTL+HUcsTenZ6pdF65IV8Sk=
X-Received: by 2002:a05:6214:1c0b:b0:66d:6845:ea2d with SMTP id u11-20020a0562141c0b00b0066d6845ea2dmr5259199qvc.53.1697614365064;
        Wed, 18 Oct 2023 00:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVEqA4xPTiOaWetvvswhtwmlji+EpyS13eyeJ+VOWUsrcyK46S4glHUKGMSbBqRqY7/INBJw==
X-Received: by 2002:a05:6214:1c0b:b0:66d:6845:ea2d with SMTP id u11-20020a0562141c0b00b0066d6845ea2dmr5259182qvc.53.1697614364748;
        Wed, 18 Oct 2023 00:32:44 -0700 (PDT)
Date: Wed, 18 Oct 2023 09:32:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH 11/12] hw/xen: automatically assign device index to
 block devices
Message-ID: <20231018093239.3d525fd8@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231016151909.22133-12-dwmw2@infradead.org>
References: <20231016151909.22133-1-dwmw2@infradead.org>
	<20231016151909.22133-12-dwmw2@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Oct 2023 16:19:08 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> From: David Woodhouse <dwmw@amazon.co.uk>
> 

is this index a user (guest) visible?

> There's no need to force the user to assign a vdev. We can automatically
> assign one, starting at xvda and searching until we find the first disk
> name that's unused.
> 
> This means we can now allow '-drive if=xen,file=xxx' to work without an
> explicit separate -driver argument, just like if=virtio.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  blockdev.c           | 15 ++++++++++++---
>  hw/block/xen-block.c | 25 +++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/blockdev.c b/blockdev.c
> index 325b7a3bef..9dec4c9c74 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -255,13 +255,13 @@ void drive_check_orphaned(void)
>           * Ignore default drives, because we create certain default
>           * drives unconditionally, then leave them unclaimed.  Not the
>           * users fault.
> -         * Ignore IF_VIRTIO, because it gets desugared into -device,
> -         * so we can leave failing to -device.
> +         * Ignore IF_VIRTIO or IF_XEN, because it gets desugared into
> +         * -device, so we can leave failing to -device.
>           * Ignore IF_NONE, because leaving unclaimed IF_NONE remains
>           * available for device_add is a feature.
>           */
>          if (dinfo->is_default || dinfo->type == IF_VIRTIO
> -            || dinfo->type == IF_NONE) {
> +            || dinfo->type == IF_XEN || dinfo->type == IF_NONE) {
>              continue;
>          }
>          if (!blk_get_attached_dev(blk)) {
> @@ -977,6 +977,15 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
>          qemu_opt_set(devopts, "driver", "virtio-blk", &error_abort);
>          qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
>                       &error_abort);
> +    } else if (type == IF_XEN) {
> +        QemuOpts *devopts;
> +        devopts = qemu_opts_create(qemu_find_opts("device"), NULL, 0,
> +                                   &error_abort);
> +        qemu_opt_set(devopts, "driver",
> +                     (media == MEDIA_CDROM) ? "xen-cdrom" : "xen-disk",
> +                     &error_abort);
> +        qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
> +                     &error_abort);
>      }
>  
>      filename = qemu_opt_get(legacy_opts, "file");
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 9262338535..20fa783cbe 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -34,6 +34,31 @@ static char *xen_block_get_name(XenDevice *xendev, Error **errp)
>      XenBlockDevice *blockdev = XEN_BLOCK_DEVICE(xendev);
>      XenBlockVdev *vdev = &blockdev->props.vdev;
>  
> +    if (blockdev->props.vdev.type == XEN_BLOCK_VDEV_TYPE_INVALID) {
> +        char name[11];
> +        int disk = 0;
> +        unsigned long idx;
> +
> +        /* Find an unoccupied device name */
> +        while (disk < (1 << 20)) {
> +            if (disk < (1 << 4)) {
> +                idx = (202 << 8) | (disk << 4);
> +            } else {
> +                idx = (1 << 28) | (disk << 8);
> +            }
> +            snprintf(name, sizeof(name), "%lu", idx);
> +            if (!xen_backend_exists("qdisk", name)) {
> +                vdev->type = XEN_BLOCK_VDEV_TYPE_XVD;
> +                vdev->partition = 0;
> +                vdev->disk = disk;
> +                vdev->number = idx;
> +                return g_strdup(name);
> +            }
> +            disk++;
> +        }
> +        error_setg(errp, "cannot find device vdev for block device");
> +        return NULL;
> +    }
>      return g_strdup_printf("%lu", vdev->number);
>  }
>  


