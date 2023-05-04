Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D36F7801
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 23:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530151.825578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugSE-00029f-0v; Thu, 04 May 2023 21:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530151.825578; Thu, 04 May 2023 21:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugSD-00027A-U9; Thu, 04 May 2023 21:25:33 +0000
Received: by outflank-mailman (input) for mailman id 530151;
 Thu, 04 May 2023 21:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6+xu=AZ=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1pugSC-000274-CE
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 21:25:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32193822-eac2-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 23:25:31 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-0JHXhtIDOzGjIqozYKIm0A-1; Thu, 04 May 2023 17:25:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB301185A78B;
 Thu,  4 May 2023 21:25:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EA6640C2064;
 Thu,  4 May 2023 21:25:18 +0000 (UTC)
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
X-Inumbo-ID: 32193822-eac2-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683235530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EXBTvckOEwAXoXWbpnPFajVuZsPXxwBJqTqoZHV9JvQ=;
	b=V2u7aBfrIH5B/lud3IMRO5flv/4nzzzBj6wm+PNJR0HVqdcYOyOxZnUltN/AFkx8SiZCeG
	VDAwJHC8aYJ6rnAkEOm1N56ay9LYPtIh3jkUuKhTm5DoA9zl6tB3teyVVKfPJCM0iIMPr3
	JR5HPy+kg2Lws21G5Mpgg/UNQYzYRp4=
X-MC-Unique: 0JHXhtIDOzGjIqozYKIm0A-1
Date: Thu, 4 May 2023 23:25:17 +0200
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
	Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 18/20] virtio-scsi: implement
 BlockDevOps->drained_begin()
Message-ID: <ZFQivbkVPcX3nECA@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-19-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-19-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> The virtio-scsi Host Bus Adapter provides access to devices on a SCSI
> bus. Those SCSI devices typically have a BlockBackend. When the
> BlockBackend enters a drained section, the SCSI device must temporarily
> stop submitting new I/O requests.
> 
> Implement this behavior by temporarily stopping virtio-scsi virtqueue
> processing when one of the SCSI devices enters a drained section. The
> new scsi_device_drained_begin() API allows scsi-disk to message the
> virtio-scsi HBA.
> 
> scsi_device_drained_begin() uses a drain counter so that multiple SCSI
> devices can have overlapping drained sections. The HBA only sees one
> pair of .drained_begin/end() calls.
> 
> After this commit, virtio-scsi no longer depends on hw/virtio's
> ioeventfd aio_set_event_notifier(is_external=true). This commit is a
> step towards removing the aio_disable_external() API.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

> @@ -206,9 +208,11 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
>      }
>      s->dataplane_stopping = true;
>  
> -    aio_context_acquire(s->ctx);
> -    aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
> -    aio_context_release(s->ctx);
> +    if (s->bus.drain_count == 0) {
> +        aio_context_acquire(s->ctx);
> +        aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
> +        aio_context_release(s->ctx);
> +    }

Same question as for virtio-blk: We lose processing the virtqueue one
last time during drain. Is it okay, and if so, why do we need it outside
of drain?

Kevin


