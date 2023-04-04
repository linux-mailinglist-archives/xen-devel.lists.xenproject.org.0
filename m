Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6A46D6592
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517896.803862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhoV-0004tL-Qa; Tue, 04 Apr 2023 14:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517896.803862; Tue, 04 Apr 2023 14:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhoV-0004qr-Nw; Tue, 04 Apr 2023 14:39:11 +0000
Received: by outflank-mailman (input) for mailman id 517896;
 Tue, 04 Apr 2023 14:39:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yeB/=73=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pjhoT-0004ql-R9
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:39:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7395241e-d2f6-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 16:39:07 +0200 (CEST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-xE8BrNmlOl6tBKmvK2zYKA-1; Tue, 04 Apr 2023 10:39:01 -0400
Received: by mail-ed1-f72.google.com with SMTP id
 u30-20020a50c05e000000b0050299de3f82so10600187edd.10
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 07:39:00 -0700 (PDT)
Received: from redhat.com ([2.52.129.179]) by smtp.gmail.com with ESMTPSA id
 qb34-20020a1709077ea200b00948f41af90dsm1279385ejc.166.2023.04.04.07.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:38:58 -0700 (PDT)
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
X-Inumbo-ID: 7395241e-d2f6-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680619145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gmO97gAtFYtTbL1S42EXHY21vUfwD059Jzy3RrPu67Q=;
	b=OLssQaPUVXUA7egJ0iGuWBP6qQM3xoGARTMGd3rCRS680yEngVP32ZecArHyEvgWf6zaF+
	kBAYqg4xSKAxIKEXPc2u6woo9ZYLw5c55F9NBm0B9oHNYxycwxA9rQJJbp3PxWM2aFnF9K
	sTooll9I02HKZa8hHz30DKNXBg665go=
X-MC-Unique: xE8BrNmlOl6tBKmvK2zYKA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680619139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmO97gAtFYtTbL1S42EXHY21vUfwD059Jzy3RrPu67Q=;
        b=xQEKz8jFgBHwGUR34x2bS03+RoDawniika7996cref7EL2jkqSGgyrFd9nwCRrzCFi
         xcV5Grx9G8IlTtS4xWZ8rT3W6ACvlzwP1nuMrvqQioQvD6yt3dYL5qcFzZQUrhhTk/8q
         JewYbLBfXrBPFwMV/qGZZSKzrQtwo260QQZu0SvK5knf0iBe7ySgd7G+9QJ2iD1gjS5V
         VCzV4i0DJyN1y5H2pSAR+8HoQRcveTKtSZo3uQdAKwH/mizm2assmehx9ftj26yJFsO2
         ezWpbPxxcVMW+u7PWKrL1uybF7z6FXheN1hXuzolIPT8buJt7WcQzE5KPxmSB5KUZkRN
         NanQ==
X-Gm-Message-State: AAQBX9fV7Zss8zShF+5tcyTPjr27O7G3T1WrPzuACVVKveEJimPhABm6
	5jpCJFXSJ0O6sN3zW9z0NqorNqfT5C//iMCGNnxE7KvegB5mnDmgcZpZiqyY7L396dirD0+b313
	Ii42yyVNmu1+z8ggJ384hpGzKwSc=
X-Received: by 2002:aa7:cfd5:0:b0:4fa:c17d:8fdd with SMTP id r21-20020aa7cfd5000000b004fac17d8fddmr2323120edy.34.1680619139637;
        Tue, 04 Apr 2023 07:38:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bi2S3wGdfV0YoNjlWz9akfgA+degJejYBD5zzJwJg5OHp4hxP/MX7u3WDswchOrfTPlv4XoQ==
X-Received: by 2002:aa7:cfd5:0:b0:4fa:c17d:8fdd with SMTP id r21-20020aa7cfd5000000b004fac17d8fddmr2323108edy.34.1680619139386;
        Tue, 04 Apr 2023 07:38:59 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:38:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Fam Zheng <fam@euphon.net>, David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>, Juan Quintela <quintela@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, eesposit@redhat.com,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 01/13] virtio-scsi: avoid race between unplug and
 transport event
Message-ID: <20230404103838-mutt-send-email-mst@kernel.org>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230403183004.347205-2-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 03, 2023 at 02:29:52PM -0400, Stefan Hajnoczi wrote:
> Only report a transport reset event to the guest after the SCSIDevice
> has been unrealized by qdev_simple_device_unplug_cb().
> 
> qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized field
> to false so that scsi_device_find/get() no longer see it.
> 
> scsi_target_emulate_report_luns() also needs to be updated to filter out
> SCSIDevices that are unrealized.
> 
> These changes ensure that the guest driver does not see the SCSIDevice
> that's being unplugged if it responds very quickly to the transport
> reset event.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Feel free to merge.

> ---
>  hw/scsi/scsi-bus.c    |  3 ++-
>  hw/scsi/virtio-scsi.c | 18 +++++++++---------
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index c97176110c..f9bd064833 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -487,7 +487,8 @@ static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
>              DeviceState *qdev = kid->child;
>              SCSIDevice *dev = SCSI_DEVICE(qdev);
>  
> -            if (dev->channel == channel && dev->id == id && dev->lun != 0) {
> +            if (dev->channel == channel && dev->id == id && dev->lun != 0 &&
> +                qatomic_load_acquire(&dev->qdev.realized)) {
>                  store_lun(tmp, dev->lun);
>                  g_byte_array_append(buf, tmp, 8);
>                  len += 8;
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 612c525d9d..000961446c 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -1063,15 +1063,6 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>      SCSIDevice *sd = SCSI_DEVICE(dev);
>      AioContext *ctx = s->ctx ?: qemu_get_aio_context();
>  
> -    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
> -        virtio_scsi_acquire(s);
> -        virtio_scsi_push_event(s, sd,
> -                               VIRTIO_SCSI_T_TRANSPORT_RESET,
> -                               VIRTIO_SCSI_EVT_RESET_REMOVED);
> -        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
> -        virtio_scsi_release(s);
> -    }
> -
>      aio_disable_external(ctx);
>      qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
>      aio_enable_external(ctx);
> @@ -1082,6 +1073,15 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>          blk_set_aio_context(sd->conf.blk, qemu_get_aio_context(), NULL);
>          virtio_scsi_release(s);
>      }
> +
> +    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
> +        virtio_scsi_acquire(s);
> +        virtio_scsi_push_event(s, sd,
> +                               VIRTIO_SCSI_T_TRANSPORT_RESET,
> +                               VIRTIO_SCSI_EVT_RESET_REMOVED);
> +        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
> +        virtio_scsi_release(s);
> +    }
>  }
>  
>  static struct SCSIBusInfo virtio_scsi_scsi_info = {
> -- 
> 2.39.2


