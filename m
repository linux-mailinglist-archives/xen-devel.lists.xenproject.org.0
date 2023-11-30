Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318AC7FFD8F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 22:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645149.1007067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8odT-0000oF-83; Thu, 30 Nov 2023 21:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645149.1007067; Thu, 30 Nov 2023 21:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8odT-0000l8-4f; Thu, 30 Nov 2023 21:31:51 +0000
Received: by outflank-mailman (input) for mailman id 645149;
 Thu, 30 Nov 2023 21:31:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Itg=HL=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1r8odS-0000l0-0i
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 21:31:50 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddb36d0f-8fc7-11ee-98e5-6d05b1d4d9a1;
 Thu, 30 Nov 2023 22:31:48 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-q1IMUd4SMcOPNw2L8mcRsA-1; Thu, 30 Nov 2023 16:31:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7125824021;
 Thu, 30 Nov 2023 21:31:42 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 540E81C060AE;
 Thu, 30 Nov 2023 21:31:39 +0000 (UTC)
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
X-Inumbo-ID: ddb36d0f-8fc7-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701379907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/gvXfT47TeQd2gZo/6v34/l0zAaPUjzItBRjKteQxw=;
	b=TV5tquf6ZoXo207BFz4Qjby+yJn1Pui7Fn+5mVyAkydC0XR6b50/L4K5hYVjEyKZBdzg/p
	+SOeyhAzELkQZvW4djNpkROmaqchvCUDIhIC2gtFNT6Y3tLVRH3hCSMwaCOmYSPzolaRO7
	rRKTvdyDVRGWem/CvUUBFFiANoeVMFo=
X-MC-Unique: q1IMUd4SMcOPNw2L8mcRsA-1
Date: Thu, 30 Nov 2023 15:31:37 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alberto Garcia <berto@igalia.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
	John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Wen Congyang <wencongyang2@huawei.com>, qemu-block@nongnu.org, xen-devel@lists.xenproject.org, 
	Coiby Xu <Coiby.Xu@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Xie Changlong <xiechanglong.d@gmail.com>, Ari Sundholm <ari@tuxera.com>, 
	Li Zhijian <lizhijian@fujitsu.com>, Cleber Rosa <crosa@redhat.com>, 
	Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Zhang Chen <chen.zhang@intel.com>, Peter Xu <peterx@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Leonardo Bras <leobras@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Fam Zheng <fam@euphon.net>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH 05/12] block: remove AioContext locking
Message-ID: <haqk3uaxn25it4myxsockwyqxarroyqpzpticpxfdzld4qwewh@edcz4bipmqlw>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-6-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129195553.942921-6-stefanha@redhat.com>
User-Agent: NeoMutt/20231103
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

On Wed, Nov 29, 2023 at 02:55:46PM -0500, Stefan Hajnoczi wrote:
> This is the big patch that removes
> aio_context_acquire()/aio_context_release() from the block layer and
> affected block layer users.
> 
> There isn't a clean way to split this patch and the reviewers are likely
> the same group of people, so I decided to do it in one patch.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---

> +++ b/block.c
> @@ -7585,29 +7433,12 @@ void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx)
>  
>  void coroutine_fn bdrv_co_lock(BlockDriverState *bs)
>  {
> -    AioContext *ctx = bdrv_get_aio_context(bs);
> -
> -    /* In the main thread, bs->aio_context won't change concurrently */
> -    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
> -
> -    /*
> -     * We're in coroutine context, so we already hold the lock of the main
> -     * loop AioContext. Don't lock it twice to avoid deadlocks.
> -     */
> -    assert(qemu_in_coroutine());

Is this assertion worth keeping in the short term?...

> -    if (ctx != qemu_get_aio_context()) {
> -        aio_context_acquire(ctx);
> -    }
> +    /* TODO removed in next patch */
>  }

...I guess I'll see in the next patch.

>  
>  void coroutine_fn bdrv_co_unlock(BlockDriverState *bs)
>  {
> -    AioContext *ctx = bdrv_get_aio_context(bs);
> -
> -    assert(qemu_in_coroutine());
> -    if (ctx != qemu_get_aio_context()) {
> -        aio_context_release(ctx);
> -    }
> +    /* TODO removed in next patch */
>  }

Same comment.

> +++ b/blockdev.c
> @@ -1395,7 +1352,6 @@ static void external_snapshot_action(TransactionAction *action,
>      /* File name of the new image (for 'blockdev-snapshot-sync') */
>      const char *new_image_file;
>      ExternalSnapshotState *state = g_new0(ExternalSnapshotState, 1);
> -    AioContext *aio_context;
>      uint64_t perm, shared;
>  
>      /* TODO We'll eventually have to take a writer lock in this function */

I'm guessing removal of the locking gets us one step closer to
implementing this TODO at a later time?  Or is it now a stale comment?
Either way, it doesn't affect this patch.

> +++ b/migration/block.c
> @@ -270,7 +270,6 @@ static int mig_save_device_bulk(QEMUFile *f, BlkMigDevState *bmds)
>  
>      if (bmds->shared_base) {
>          qemu_mutex_lock_iothread();
> -        aio_context_acquire(blk_get_aio_context(bb));
...
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

Will conflict, but with trivial resolution, with your other thread
renaming things to qemu_bql_lock().


> +++ b/tests/unit/test-blockjob.c

> -static void test_complete_in_standby(void)
> -{

> @@ -531,13 +402,5 @@ int main(int argc, char **argv)
>      g_test_add_func("/blockjob/cancel/standby", test_cancel_standby);
>      g_test_add_func("/blockjob/cancel/pending", test_cancel_pending);
>      g_test_add_func("/blockjob/cancel/concluded", test_cancel_concluded);
> -
> -    /*
> -     * This test is flaky and sometimes fails in CI and otherwise:
> -     * don't run unless user opts in via environment variable.
> -     */
> -    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
> -        g_test_add_func("/blockjob/complete_in_standby", test_complete_in_standby);
> -    }

Looks like you ripped out this entire test, because it is no longer
viable.  I might have mentioned it in the commit message, or squashed
the removal of this test into the earlier 02/12 patch.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


