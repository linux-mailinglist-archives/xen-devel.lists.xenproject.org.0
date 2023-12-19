Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F881912B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 21:04:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657193.1025914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFgKA-0006xV-1d; Tue, 19 Dec 2023 20:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657193.1025914; Tue, 19 Dec 2023 20:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFgK9-0006ux-V1; Tue, 19 Dec 2023 20:04:17 +0000
Received: by outflank-mailman (input) for mailman id 657193;
 Tue, 19 Dec 2023 20:04:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6WA=H6=gmail.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rFgK8-0006ur-9q
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 20:04:16 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7d77a87-9ea9-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 21:04:14 +0100 (CET)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-591c3dc7265so2380913eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 12:04:14 -0800 (PST)
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
X-Inumbo-ID: c7d77a87-9ea9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703016253; x=1703621053; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DXg9cDW3JjUVqUpK7rz7cijjR5jU7WBvRbwK6otXN60=;
        b=MRfKh+PVDfpyHjOJFvl/YAApGl54TY7/DtfAD8pcsJNySBaXuyKCv6NfJF9MG0obdF
         B2G4Icnfm5al2mI83E4nWh5A1RrtGieXe0bv4N2/UQWsfbjMvQE/n3rWuvINVunwCDhX
         /5WMcN7wdKMDHjNRtfvKHg3LwPc/pFLTWc9Xo2WiYkI0d83MpS3Dcw56jm4a6u2UGWHD
         rGgzCEgJ5qPgDjQ20IJCnNoLYdE90vhWNai1/CANBn+wi966J30Yq1iN8I63cnO44lQq
         ZW1FuF+4GmecJNuM+ucvCREoPagVggkKZm6TGXqCDs9yIfTiQB3dnjBaOmZBVkMgx/XF
         ESbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703016253; x=1703621053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXg9cDW3JjUVqUpK7rz7cijjR5jU7WBvRbwK6otXN60=;
        b=jH3A3ak6ySROLk02pO//ZgY7Ji9AYj04AlyEZj0Be7P2qp9jH0xZ2VfvvpAZdkdHmR
         IsoMry6wFsXQAUzftulAi5POF3+V9zGuXrFbMkGzv6mi0Ebyd+MsaFCIwsFmDyMK/V6c
         XtmH130dzOBvFoGfS68Jjj6BmowciejyC2RZTwHJaNke0AFtZOpvv1rN/iuSAPUwqxe5
         q2uRQ3sdn5c+hSf/45wYwsSfHi9kZ02wE8sqqgGjoxUgEqJUTpBUJEsb5gtL0+2731sa
         cOG+TxC3MnHp6ZfrCRYjAH5jysxX7VQuZwtsHOjwsp4XMowVSGZO2EzxbWx5THlw0fp5
         dy/Q==
X-Gm-Message-State: AOJu0YyuKuuqdqE4Llh8LNRwFc4aWR3k6MoiOyCM37fCfKSGBZe4THMv
	0ShQWkb4OkiUen5teAfY7KqPFcimHwxRmA6JAfU=
X-Google-Smtp-Source: AGHT+IH0W7Lk4qYidn6qC1RIdBZwtv+70PgF1WA79AneRN/vlKbN6zwwagcHggVHwfD6j079x6f4wqmuhwuohs/5W6Q=
X-Received: by 2002:a05:6820:1c97:b0:58d:ca8b:7a83 with SMTP id
 ct23-20020a0568201c9700b0058dca8b7a83mr14112463oob.5.1703016252874; Tue, 19
 Dec 2023 12:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20231205182011.1976568-1-stefanha@redhat.com> <20231205182011.1976568-7-stefanha@redhat.com>
 <ZYG9orsog3Pm675J@redhat.com>
In-Reply-To: <ZYG9orsog3Pm675J@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 19 Dec 2023 15:04:01 -0500
Message-ID: <CAJSP0QV1MD-U5f1NkgL13CEm6-rCcGGPNhRyE2jwTKz+22rrzA@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] block: remove AioContext locking
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Cleber Rosa <crosa@redhat.com>, 
	Xie Changlong <xiechanglong.d@gmail.com>, Paul Durrant <paul@xen.org>, Ari Sundholm <ari@tuxera.com>, 
	Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Wen Congyang <wencongyang2@huawei.com>, 
	Alberto Garcia <berto@igalia.com>, Anthony Perard <anthony.perard@citrix.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, 
	Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
	Fabiano Rosas <farosas@suse.de>, Hanna Reitz <hreitz@redhat.com>, Zhang Chen <chen.zhang@intel.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Peter Xu <peterx@redhat.com>, 
	Emanuele Giuseppe Esposito <eesposit@redhat.com>, Fam Zheng <fam@euphon.net>, Leonardo Bras <leobras@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 10:59, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 05.12.2023 um 19:20 hat Stefan Hajnoczi geschrieben:
> > This is the big patch that removes
> > aio_context_acquire()/aio_context_release() from the block layer and
> > affected block layer users.
> >
> > There isn't a clean way to split this patch and the reviewers are likely
> > the same group of people, so I decided to do it in one patch.
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> > Reviewed-by: Paul Durrant <paul@xen.org>
>
> > diff --git a/migration/block.c b/migration/block.c
> > index a15f9bddcb..2bcfcbfdf6 100644
> > --- a/migration/block.c
> > +++ b/migration/block.c
> > @@ -313,22 +311,10 @@ static int mig_save_device_bulk(QEMUFile *f, BlkMigDevState *bmds)
> >      block_mig_state.submitted++;
> >      blk_mig_unlock();
> >
> > -    /* We do not know if bs is under the main thread (and thus does
> > -     * not acquire the AioContext when doing AIO) or rather under
> > -     * dataplane.  Thus acquire both the iothread mutex and the
> > -     * AioContext.
> > -     *
> > -     * This is ugly and will disappear when we make bdrv_* thread-safe,
> > -     * without the need to acquire the AioContext.
> > -     */
> > -    qemu_mutex_lock_iothread();
> > -    aio_context_acquire(blk_get_aio_context(bmds->blk));
> >      bdrv_reset_dirty_bitmap(bmds->dirty_bitmap, cur_sector * BDRV_SECTOR_SIZE,
> >                              nr_sectors * BDRV_SECTOR_SIZE);
> >      blk->aiocb = blk_aio_preadv(bb, cur_sector * BDRV_SECTOR_SIZE, &blk->qiov,
> >                                  0, blk_mig_read_cb, blk);
> > -    aio_context_release(blk_get_aio_context(bmds->blk));
> > -    qemu_mutex_unlock_iothread();
> >
> >      bmds->cur_sector = cur_sector + nr_sectors;
> >      return (bmds->cur_sector >= total_sectors);
>
> With this hunk applied, qemu-iotests 183 fails:
>
> (gdb) bt
> #0  0x000055aaa7d47c09 in bdrv_graph_co_rdlock () at ../block/graph-lock.c:176
> #1  0x000055aaa7d3de2e in graph_lockable_auto_lock (x=<optimized out>) at /home/kwolf/source/qemu/include/block/graph-lock.h:215
> #2  blk_co_do_preadv_part (blk=0x7f38a4000f30, offset=0, bytes=1048576, qiov=0x7f38a40250f0, qiov_offset=qiov_offset@entry=0, flags=0) at ../block/block-backend.c:1340
> #3  0x000055aaa7d3e006 in blk_aio_read_entry (opaque=0x7f38a4025140) at ../block/block-backend.c:1620
> #4  0x000055aaa7e7aa5b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177
> #5  0x00007f38d14dbe90 in __start_context () at /lib64/libc.so.6
> #6  0x00007f38b3dfa060 in  ()
> #7  0x0000000000000000 in  ()
>
> qemu_get_current_aio_context() returns NULL now. I don't completely
> understand why it depends on the BQL, but adding the BQL locking back
> fixes it.

Thanks for letting me know. I have reviewed migration/block.c and
agree that taking the BQL is correct.

I have inlined the fix below and will resend this patch.

Stefan
---
diff --git a/migration/block.c b/migration/block.c
index 2bcfcbfdf6..6ec6a1d6e6 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -311,10 +311,17 @@ static int mig_save_device_bulk(QEMUFile *f,
BlkMigDevState *bmds)
     block_mig_state.submitted++;
     blk_mig_unlock();

+    /*
+     * The migration thread does not have an AioContext. Lock the BQL so that
+     * I/O runs in the main loop AioContext (see
+     * qemu_get_current_aio_context()).
+     */
+    qemu_mutex_lock_iothread();
     bdrv_reset_dirty_bitmap(bmds->dirty_bitmap, cur_sector * BDRV_SECTOR_SIZE,
                             nr_sectors * BDRV_SECTOR_SIZE);
     blk->aiocb = blk_aio_preadv(bb, cur_sector * BDRV_SECTOR_SIZE, &blk->qiov,
                                 0, blk_mig_read_cb, blk);
+    qemu_mutex_unlock_iothread();

     bmds->cur_sector = cur_sector + nr_sectors;
     return (bmds->cur_sector >= total_sectors);

