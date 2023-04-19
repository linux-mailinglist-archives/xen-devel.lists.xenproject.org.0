Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCB36E817D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 20:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523751.814102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCuT-0005yZ-1I; Wed, 19 Apr 2023 18:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523751.814102; Wed, 19 Apr 2023 18:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCuS-0005vp-Tz; Wed, 19 Apr 2023 18:52:04 +0000
Received: by outflank-mailman (input) for mailman id 523751;
 Wed, 19 Apr 2023 18:52:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v8Um=AK=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1ppCuR-0005vj-M7
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 18:52:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4401538b-dee3-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 20:52:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-ozoFPFQuMuWMzNh6HcmPCA-1; Wed, 19 Apr 2023 14:51:56 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DF4F3C0E464;
 Wed, 19 Apr 2023 18:51:55 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF8F492B04;
 Wed, 19 Apr 2023 18:51:49 +0000 (UTC)
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
X-Inumbo-ID: 4401538b-dee3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681930319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hS4DWN2qmeP36WD9ZHX7mMIPBRS78Jiokpqf6BGkG+4=;
	b=dXRxY4Yi13jI6j59NoYgQPW1RJ68o0DGcD64mqkHH+UrvZhSoB0VX41gwTFfHlSJ+/iaBY
	ISAXbpuuAQPChLzYv1FVCCOy+9FhWm/xqoTTOf8++Vky0tPBwSjttiGLj4CYl8/NMxxu6+
	m8K/hEvynw7CbeIIQDiL9+MYeCztmF4=
X-MC-Unique: ozoFPFQuMuWMzNh6HcmPCA-1
Date: Wed, 19 Apr 2023 13:51:48 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>, Paul Durrant <paul@xen.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Kevin Wolf <kwolf@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org, qemu-block@nongnu.org, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Peter Lieven <pl@kamp.de>, eesposit@redhat.com, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>, 
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 16/16] virtio: make it possible to detach host
 notifier from any thread
Message-ID: <msjl3ep44f2dxpno7xw3zxjrkuh5iegyieszertt6ppkhpk62q@xxi7a5shhkc2>
References: <20230419172817.272758-1-stefanha@redhat.com>
 <20230419172817.272758-17-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419172817.272758-17-stefanha@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

On Wed, Apr 19, 2023 at 01:28:17PM -0400, Stefan Hajnoczi wrote:
> virtio_queue_aio_detach_host_notifier() does two things:
> 1. It removes the fd handler from the event loop.
> 2. It processes the virtqueue one last time.
> 
> The first step can be peformed by any thread and without taking the
> AioContext lock.
> 
> The second step may need the AioContext lock (depending on the device
> implementation) and runs in the thread where request processing takes
> place. virtio-blk and virtio-scsi therefore call
> virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
> AioContext
> 
> Scheduling a BH is undesirable for .drained_begin() functions. The next
> patch will introduce a .drained_begin() function that needs to call
> virtio_queue_aio_detach_host_notifier().
> 
> Move the virtqueue processing out to the callers of
> virtio_queue_aio_detach_host_notifier() so that the function can be
> called from any thread. This is in preparation for the next patch.
>

This mentions a next patch, but is 16/16 in the series.  Am I missing
something?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


