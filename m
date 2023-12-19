Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A40818BB5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 16:59:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657003.1025585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcUX-0000RF-9U; Tue, 19 Dec 2023 15:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657003.1025585; Tue, 19 Dec 2023 15:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcUX-0000Nt-6Q; Tue, 19 Dec 2023 15:58:45 +0000
Received: by outflank-mailman (input) for mailman id 657003;
 Tue, 19 Dec 2023 15:58:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dspo=H6=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rFcUV-0000Nn-6U
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 15:58:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a8fa805-9e87-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 16:58:42 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-cHhYhpcWNo24o_j-pPdaXw-1; Tue,
 19 Dec 2023 10:58:34 -0500
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14BC63833354;
 Tue, 19 Dec 2023 15:58:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68C43492BF0;
 Tue, 19 Dec 2023 15:58:27 +0000 (UTC)
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
X-Inumbo-ID: 7a8fa805-9e87-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703001520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SPIlk2eJxTfq//Ywc/9wCHLMmNMOKaq1o79CCvNfbmo=;
	b=iKTE6veYpRJpaj7UAJL15KDupEwO/9VaeNUKzv6bL2/PKFNJzBbq+X88UJtDRa4kaU68iL
	N0TXt8a8lLIQnYqRIQfZSlch2l70KUz0H+Hj0r9J+I6O47JEykOqVnyETkYJ2wo3e+kmVU
	27oTkvRdVdRinwAG32Rxm40RlmdxGlU=
X-MC-Unique: cHhYhpcWNo24o_j-pPdaXw-1
Date: Tue, 19 Dec 2023 16:58:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Cleber Rosa <crosa@redhat.com>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Paul Durrant <paul@xen.org>, Ari Sundholm <ari@tuxera.com>,
	Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
	Wen Congyang <wencongyang2@huawei.com>,
	Alberto Garcia <berto@igalia.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
	Fabiano Rosas <farosas@suse.de>, Hanna Reitz <hreitz@redhat.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Peter Xu <peterx@redhat.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	Fam Zheng <fam@euphon.net>, Leonardo Bras <leobras@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Li Zhijian <lizhijian@fujitsu.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 06/14] block: remove AioContext locking
Message-ID: <ZYG9orsog3Pm675J@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
 <20231205182011.1976568-7-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205182011.1976568-7-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Am 05.12.2023 um 19:20 hat Stefan Hajnoczi geschrieben:
> This is the big patch that removes
> aio_context_acquire()/aio_context_release() from the block layer and
> affected block layer users.
> 
> There isn't a clean way to split this patch and the reviewers are likely
> the same group of people, so I decided to do it in one patch.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

> diff --git a/migration/block.c b/migration/block.c
> index a15f9bddcb..2bcfcbfdf6 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -313,22 +311,10 @@ static int mig_save_device_bulk(QEMUFile *f, BlkMigDevState *bmds)
>      block_mig_state.submitted++;
>      blk_mig_unlock();
>  
> -    /* We do not know if bs is under the main thread (and thus does
> -     * not acquire the AioContext when doing AIO) or rather under
> -     * dataplane.  Thus acquire both the iothread mutex and the
> -     * AioContext.
> -     *
> -     * This is ugly and will disappear when we make bdrv_* thread-safe,
> -     * without the need to acquire the AioContext.
> -     */
> -    qemu_mutex_lock_iothread();
> -    aio_context_acquire(blk_get_aio_context(bmds->blk));
>      bdrv_reset_dirty_bitmap(bmds->dirty_bitmap, cur_sector * BDRV_SECTOR_SIZE,
>                              nr_sectors * BDRV_SECTOR_SIZE);
>      blk->aiocb = blk_aio_preadv(bb, cur_sector * BDRV_SECTOR_SIZE, &blk->qiov,
>                                  0, blk_mig_read_cb, blk);
> -    aio_context_release(blk_get_aio_context(bmds->blk));
> -    qemu_mutex_unlock_iothread();
>  
>      bmds->cur_sector = cur_sector + nr_sectors;
>      return (bmds->cur_sector >= total_sectors);

With this hunk applied, qemu-iotests 183 fails:

(gdb) bt
#0  0x000055aaa7d47c09 in bdrv_graph_co_rdlock () at ../block/graph-lock.c:176
#1  0x000055aaa7d3de2e in graph_lockable_auto_lock (x=<optimized out>) at /home/kwolf/source/qemu/include/block/graph-lock.h:215
#2  blk_co_do_preadv_part (blk=0x7f38a4000f30, offset=0, bytes=1048576, qiov=0x7f38a40250f0, qiov_offset=qiov_offset@entry=0, flags=0) at ../block/block-backend.c:1340
#3  0x000055aaa7d3e006 in blk_aio_read_entry (opaque=0x7f38a4025140) at ../block/block-backend.c:1620
#4  0x000055aaa7e7aa5b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177
#5  0x00007f38d14dbe90 in __start_context () at /lib64/libc.so.6
#6  0x00007f38b3dfa060 in  ()
#7  0x0000000000000000 in  ()

qemu_get_current_aio_context() returns NULL now. I don't completely
understand why it depends on the BQL, but adding the BQL locking back
fixes it.

Kevin


