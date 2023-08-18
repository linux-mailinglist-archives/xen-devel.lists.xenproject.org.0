Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54026780EEB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 17:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586389.917615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1Ee-0000Bq-42; Fri, 18 Aug 2023 15:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586389.917615; Fri, 18 Aug 2023 15:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1Ed-00009W-WA; Fri, 18 Aug 2023 15:17:59 +0000
Received: by outflank-mailman (input) for mailman id 586389;
 Fri, 18 Aug 2023 15:17:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tvj9=ED=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1qX1Ec-00009Q-K5
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 15:17:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 687faa61-3dda-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 17:17:57 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-5-27UoemOiOs2Fduap4kdQ-1; Fri, 18 Aug 2023 11:17:51 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20E303C0FCB2;
 Fri, 18 Aug 2023 15:17:50 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B651F492C13;
 Fri, 18 Aug 2023 15:17:48 +0000 (UTC)
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
X-Inumbo-ID: 687faa61-3dda-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692371875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YU3tvQdVlHQciX3Nq3RK032672rmTsk7259azx2Vokk=;
	b=EckkSJN8Y0N5fiP6mXKYJJSHsFBupQz5nCcuaCydDXbvJRBZCdmlwxN7Bx8GJ7n3sntW64
	rz8V9OB4ePgHtGEwdJexTuZoDQ0nzCEzl9DEKmhJDPtCDNSbTTTgjvGxuqPjSXM+oJ59kc
	eS2w1sPhwGHN6NmF4pO4SHrSB9YB9Yk=
X-MC-Unique: 5-27UoemOiOs2Fduap4kdQ-1
Date: Fri, 18 Aug 2023 10:17:46 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
	Fam Zheng <fam@euphon.net>, xen-devel@lists.xenproject.org, 
	Anthony Perard <anthony.perard@citrix.com>, Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Julia Suvorova <jusual@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Ilya Maximets <i.maximets@ovn.org>
Subject: Re: [PATCH v2 3/4] virtio: use defer_call() in virtio_irqfd_notify()
Message-ID: <jvjrraxyqppcijrfrrkjycmel6yynie2ovymz6rukgrmppjbnf@l77gohyzccin>
References: <20230817155847.3605115-1-stefanha@redhat.com>
 <20230817155847.3605115-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817155847.3605115-4-stefanha@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

On Thu, Aug 17, 2023 at 11:58:46AM -0400, Stefan Hajnoczi wrote:
> virtio-blk and virtio-scsi invoke virtio_irqfd_notify() to send Used
> Buffer Notifications from an IOThread. This involves an eventfd
> write(2) syscall. Calling this repeatedly when completing multiple I/O
> requests in a row is wasteful.
> 
> Use the defer_call() API to batch together virtio_irqfd_notify() calls
> made during thread pool (aio=threads), Linux AIO (aio=native), and
> io_uring (aio=io_uring) completion processing.
> 
> Behavior is unchanged for emulated devices that do not use
> defer_call_begin()/defer_call_end() since defer_call() immediately
> invokes the callback when called outside a
> defer_call_begin()/defer_call_end() region.
> 
> fio rw=randread bs=4k iodepth=64 numjobs=8 IOPS increases by ~9% with a
> single IOThread and 8 vCPUs. iodepth=1 decreases by ~1% but this could
> be noise. Detailed performance data and configuration specifics are
> available here:
> https://gitlab.com/stefanha/virt-playbooks/-/tree/blk_io_plug-irqfd
> 
> This duplicates the BH that virtio-blk uses for batching. The next
> commit will remove it.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/io_uring.c   |  6 ++++++
>  block/linux-aio.c  |  4 ++++
>  hw/virtio/virtio.c | 11 ++++++++++-
>  util/thread-pool.c |  5 +++++
>  4 files changed, 25 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


