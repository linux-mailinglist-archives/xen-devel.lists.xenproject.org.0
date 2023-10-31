Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D56A7DD13F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 17:10:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625932.975727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrJS-0001kB-4g; Tue, 31 Oct 2023 16:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625932.975727; Tue, 31 Oct 2023 16:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrJS-0001gl-24; Tue, 31 Oct 2023 16:09:54 +0000
Received: by outflank-mailman (input) for mailman id 625932;
 Tue, 31 Oct 2023 16:09:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Me/8=GN=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1qxrJQ-0001fV-L8
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 16:09:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaf94ee3-7807-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 17:09:50 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-K2e19MGeOEeTSKsd9E5sqA-1; Tue,
 31 Oct 2023 12:09:46 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32BAC3C1CC3E;
 Tue, 31 Oct 2023 16:09:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0F5E492BE0;
 Tue, 31 Oct 2023 16:09:26 +0000 (UTC)
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
X-Inumbo-ID: eaf94ee3-7807-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698768589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmtecgNkHEkOuim3O1U2WKCrXJxkP4+J705ylKkl8Uc=;
	b=cJHfXEGmkbdElrTEUvhu+ZX7Q7OGFBxourJKQx3PpcPpYBVdyS1ufOMrj1J/jaWqEw/dS/
	PWmh5LtqY22ajqCic/RXjO2z99X79xqpfZfPCJ8U8QujMMgs/R1Dwtre1vZItS5RL3pwlC
	x/DfL/heIeLYk/upr2K6heyY2zYUiL0=
X-MC-Unique: K2e19MGeOEeTSKsd9E5sqA-1
Date: Tue, 31 Oct 2023 17:09:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Ilya Maximets <i.maximets@ovn.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
	Julia Suvorova <jusual@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 0/4] virtio-blk: use blk_io_plug_call() instead of
 notification BH
Message-ID: <ZUEmtRCe0uIQmVRP@redhat.com>
References: <20230913200045.1024233-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913200045.1024233-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Am 13.09.2023 um 22:00 hat Stefan Hajnoczi geschrieben:
> v3:
> - Add comment pointing to API documentation in .c file [Philippe]
> - Add virtio_notify_irqfd_deferred_fn trace event [Ilya]
> - Remove outdated #include [Ilya]
> v2:
> - Rename blk_io_plug() to defer_call() and move it to util/ so the net
>   subsystem can use it [Ilya]
> - Add defer_call_begin()/end() to thread_pool_completion_bh() to match Linux
>   AIO and io_uring completion batching
> 
> Replace the seldom-used virtio-blk notification BH mechanism with
> blk_io_plug(). This is part of an effort to enable the multi-queue block layer
> in virtio-blk. The notification BH was not multi-queue friendly.
> 
> The blk_io_plug() mechanism improves fio rw=randread bs=4k iodepth=64 numjobs=8
> IOPS by ~9% with a single IOThread and 8 vCPUs (this is not even a multi-queue
> block layer configuration) compared to no completion batching. iodepth=1
> decreases by ~1% but this could be noise. Benchmark details are available here:
> https://gitlab.com/stefanha/virt-playbooks/-/tree/blk_io_plug-irqfd

Thanks, applied to the block branch.

Kevin


