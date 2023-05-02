Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E86F46FC
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 17:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528726.822238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrp1-00054i-0D; Tue, 02 May 2023 15:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528726.822238; Tue, 02 May 2023 15:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrp0-00051M-Th; Tue, 02 May 2023 15:21:42 +0000
Received: by outflank-mailman (input) for mailman id 528726;
 Tue, 02 May 2023 15:21:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dv4+=AX=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1ptroy-00051B-LR
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 15:21:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078a6cf0-e8fd-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 17:21:38 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-js-j9vUPNr-JzXSEn51u-w-1; Tue, 02 May 2023 11:21:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC73E18E5312;
 Tue,  2 May 2023 15:19:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7EB52026D25;
 Tue,  2 May 2023 15:19:47 +0000 (UTC)
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
X-Inumbo-ID: 078a6cf0-e8fd-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683040896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O1kjfWbyj3zykPV4mxkot03UoMaYj696sk4Wl0CL1mY=;
	b=ZV0qWZFJvlO+3fqr3yJoSQXriwtRM7ZEl7fCXgrvSyXGOxM3d5zz7QshoCBqzlVSlPhtUn
	LnXCLR0lLfTNCXchNpIH4/j7NMAlfhuCymLiy1UmRIo48lSmZIchjJID4628wtsS1SwtNU
	jQHtkZSWdk2UZghJmRuJzlkU6f6IH54=
X-MC-Unique: js-j9vUPNr-JzXSEn51u-w-1
Date: Tue, 2 May 2023 17:19:46 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v4 03/20] virtio-scsi: avoid race between unplug and
 transport event
Message-ID: <ZFEqEkG4ktn9bBFN@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-4-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

Am 25.04.2023 um 19:26 hat Stefan Hajnoczi geschrieben:
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
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

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

s, sd and s->bus are all unrealized at this point, whereas before this
patch they were still realized. I couldn't find any practical problem
with it, but it made me nervous enough that I thought I should comment
on it at least.

Should we maybe have documentation on these functions that says that
they accept unrealized objects as their parameters?

Kevin


