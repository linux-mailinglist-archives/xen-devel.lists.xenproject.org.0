Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E55A6FCE15
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 20:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532457.828691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSUm-0006Z7-8w; Tue, 09 May 2023 18:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532457.828691; Tue, 09 May 2023 18:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSUm-0006Wt-5p; Tue, 09 May 2023 18:55:32 +0000
Received: by outflank-mailman (input) for mailman id 532457;
 Tue, 09 May 2023 18:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i4ct=A6=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1pwSUk-0006Wj-9V
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 18:55:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10881ce9-ee9b-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 20:55:29 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-hns5wC0vOUi9L7gWVTn1Ow-1; Tue, 09 May 2023 14:55:21 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4CC2811E7C;
 Tue,  9 May 2023 18:55:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34EDC492B00;
 Tue,  9 May 2023 18:55:16 +0000 (UTC)
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
X-Inumbo-ID: 10881ce9-ee9b-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683658528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4IcDDuIOaLXI9DAvceuatjdKsKxdhTRUwJDbKrSPK+8=;
	b=cVm5IPHZ9zfSUzvLTAnc3nRSJ46HzZwOY23l70Bodl/CeednPytYyKsF86y+BIsfjj1Axp
	M7WpacPKGpvQba4FBQ16jUF58yBqSg1M5AUh8JhhzMPtoYtKbELvYeU5qCLQjKbkTs+tnZ
	SkvflBg5vHCHMkRizq+do6hlEANa0kM=
X-MC-Unique: hns5wC0vOUi9L7gWVTn1Ow-1
Date: Tue, 9 May 2023 20:55:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
	eesposit@redhat.com, Juan Quintela <quintela@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Zhengui Li <lizhengui@huawei.com>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v5 05/21] virtio-scsi: stop using aio_disable_external()
 during unplug
Message-ID: <ZFqXEihzG18me26X@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
 <20230504195327.695107-6-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504195327.695107-6-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

Am 04.05.2023 um 21:53 hat Stefan Hajnoczi geschrieben:
> This patch is part of an effort to remove the aio_disable_external()
> API because it does not fit in a multi-queue block layer world where
> many AioContexts may be submitting requests to the same disk.
> 
> The SCSI emulation code is already in good shape to stop using
> aio_disable_external(). It was only used by commit 9c5aad84da1c
> ("virtio-scsi: fixed virtio_scsi_ctx_check failed when detaching scsi
> disk") to ensure that virtio_scsi_hotunplug() works while the guest
> driver is submitting I/O.
> 
> Ensure virtio_scsi_hotunplug() is safe as follows:
> 
> 1. qdev_simple_device_unplug_cb() -> qdev_unrealize() ->
>    device_set_realized() calls qatomic_set(&dev->realized, false) so
>    that future scsi_device_get() calls return NULL because they exclude
>    SCSIDevices with realized=false.
> 
>    That means virtio-scsi will reject new I/O requests to this
>    SCSIDevice with VIRTIO_SCSI_S_BAD_TARGET even while
>    virtio_scsi_hotunplug() is still executing. We are protected against
>    new requests!
> 
> 2. scsi_device_unrealize() already contains a call to

I think you mean scsi_qdev_unrealize(). Can be fixed while applying.

>    scsi_device_purge_requests() so that in-flight requests are cancelled
>    synchronously. This ensures that no in-flight requests remain once
>    qdev_simple_device_unplug_cb() returns.
> 
> Thanks to these two conditions we don't need aio_disable_external()
> anymore.
> 
> Cc: Zhengui Li <lizhengui@huawei.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Kevin


