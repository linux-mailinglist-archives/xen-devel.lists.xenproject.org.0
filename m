Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8596FCE44
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 21:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532462.828701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSgY-0008BZ-9x; Tue, 09 May 2023 19:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532462.828701; Tue, 09 May 2023 19:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSgY-00088v-6o; Tue, 09 May 2023 19:07:42 +0000
Received: by outflank-mailman (input) for mailman id 532462;
 Tue, 09 May 2023 19:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i4ct=A6=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1pwSgW-00088p-Ci
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 19:07:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2a87f95-ee9c-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 21:07:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-B9dAK25vNzSSerVDhtPZ3A-1; Tue, 09 May 2023 15:07:32 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C0DE872011;
 Tue,  9 May 2023 19:07:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C565640C6E67;
 Tue,  9 May 2023 19:07:24 +0000 (UTC)
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
X-Inumbo-ID: c2a87f95-ee9c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683659256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3tJ3xOkIIK9sjNiEc9UslJdWtKHgMpCwgj/6/bqEnvw=;
	b=dO7BhPExgWVSedrdEDDS0Yo9SP/3abgm/piFKl4HpwT7OswgDHiGJYIMhFkUVHYncWwMrb
	MG6vzm6KFRzt2HAOtkx8KUE5NGszaXCmwn15PpUXphNJfDgWCTz4RnaIeIbPgOLTmBHnL5
	bYYSGP5vlc6TwCnFl6EYmJwsWeToMUM=
X-MC-Unique: B9dAK25vNzSSerVDhtPZ3A-1
Date: Tue, 9 May 2023 21:07:23 +0200
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
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v5 00/21] block: remove aio_disable_external() API
Message-ID: <ZFqZ6zUS9QOEXxhz@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

Am 04.05.2023 um 21:53 hat Stefan Hajnoczi geschrieben:
> v5:
> - Use atomic accesses for in_flight counter in vhost-user-server.c [Kevin]
> - Stash SCSIDevice id/lun values for VIRTIO_SCSI_T_TRANSPORT_RESET event
>   before unrealizing the SCSIDevice [Kevin]
> - Keep vhost-user-blk export .detach() callback so ctx is set to NULL [Kevin]
> - Narrow BdrvChildClass and BlockDriver drained_{begin/end/poll} callbacks from
>   IO_OR_GS_CODE() to GLOBAL_STATE_CODE() [Kevin]
> - Include Kevin's "block: Fix use after free in blockdev_mark_auto_del()" to
>   fix a latent bug that was exposed by this series
> 
> v4:
> - Remove external_disable_cnt variable [Philippe]
> - Add Patch 1 to fix assertion failure in .drained_end() -> blk_get_aio_context()
> v3:
> - Resend full patch series. v2 was sent in the middle of a git rebase and was
>   missing patches. [Eric]
> - Apply Reviewed-by tags.
> v2:
> - Do not rely on BlockBackend request queuing, implement .drained_begin/end()
>   instead in xen-block, virtio-blk, and virtio-scsi [Paolo]
> - Add qdev_is_realized() API [Philippe]
> - Add patch to avoid AioContext lock around blk_exp_ref/unref() [Paolo]
> - Add patch to call .drained_begin/end() from main loop thread to simplify
>   callback implementations
> 
> The aio_disable_external() API temporarily suspends file descriptor monitoring
> in the event loop. The block layer uses this to prevent new I/O requests being
> submitted from the guest and elsewhere between bdrv_drained_begin() and
> bdrv_drained_end().
> 
> While the block layer still needs to prevent new I/O requests in drained
> sections, the aio_disable_external() API can be replaced with
> .drained_begin/end/poll() callbacks that have been added to BdrvChildClass and
> BlockDevOps.
> 
> This newer .bdrained_begin/end/poll() approach is attractive because it works
> without specifying a specific AioContext. The block layer is moving towards
> multi-queue and that means multiple AioContexts may be processing I/O
> simultaneously.
> 
> The aio_disable_external() was always somewhat hacky. It suspends all file
> descriptors that were registered with is_external=true, even if they have
> nothing to do with the BlockDriverState graph nodes that are being drained.
> It's better to solve a block layer problem in the block layer than to have an
> odd event loop API solution.
> 
> The approach in this patch series is to implement BlockDevOps
> .drained_begin/end() callbacks that temporarily stop file descriptor handlers.
> This ensures that new I/O requests are not submitted in drained sections.

Patches 2-16: Reviewed-by: Kevin Wolf <kwolf@redhat.com>


