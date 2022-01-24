Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0900149951A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 22:08:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259986.448893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC6Yy-0002ks-3V; Mon, 24 Jan 2022 21:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259986.448893; Mon, 24 Jan 2022 21:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC6Yx-0002he-Va; Mon, 24 Jan 2022 21:07:43 +0000
Received: by outflank-mailman (input) for mailman id 259986;
 Mon, 24 Jan 2022 21:07:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=97vV=SI=ionos.com=jinpu.wang@srs-se1.protection.inumbo.net>)
 id 1nC6Yw-0002hY-7z
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 21:07:42 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a916061c-7d59-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 22:07:40 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id a8so24906153ejc.8
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jan 2022 13:07:38 -0800 (PST)
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
X-Inumbo-ID: a916061c-7d59-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ePWzg4KksjRUDSjqr+o9tEK0DbR7L8NzVM+5lIUlDPo=;
        b=UryOzKtTd2BAlxPDRNgCwCESf13lD5IW6bNOSpBDepFbuH7r9fjbsT6cE5x5Ghft6m
         mvPNVWtkz01mVJrSqeC/gB7JTH8T6qFvFS/VnIIFZHW5/gP/sOhhcnNoyYhFzrPdUaVF
         FvDL8M4vNuURIqj/n/AdjkvXl39lYlpRohMIl+wO54x442N5Kx3ijGlQ972NHhWQkaPM
         2PB2Ht3BymPWofX9NOCMsDhYcC+73YD1E+ldRp1Zbpzgc9ITLFFrLh5PDvAi6v8hFREw
         ZBIZaScnPoiVR8zI3lCx6RkrB7DD23Vmu/ZR3nC2SK8GmSX6IQ39leUg3dHZiL44CE+y
         QY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ePWzg4KksjRUDSjqr+o9tEK0DbR7L8NzVM+5lIUlDPo=;
        b=19MaSm+TYqDi7zSnb84t3QupfjbHvZs1ANvkG2t3fcdTdpc7Fyw5Vt5t+kTKVq4rlg
         LMEXInPmfNURuGOHMM0KxnTOwhTtaIKT/SmhptMklo0OXVRvcsGVO8plx4rN/XkEzQUZ
         GYbK0jv5lDhk0mPNjiKXW7mxScVrItHO03tl26MEYECAx1MC8TmUzSMUlgv8Ng2rc6fB
         gIUthLirk1sIP63KBAlpIraloiex6LTA6y/7+P0UCVQffRhETCGJVS9SPETFm20mf+BI
         +SL9IsJsnFtvLTz9bCLj15Z70rtvZY8Rmf4yNYBaLAHJeTSAwPM7eCJBsVxRlD2TVvaw
         0c3g==
X-Gm-Message-State: AOAM531R+wMXFccMV08Y2Gq+6AKARYILmFT0S5mExDqqEikd7hROuhcB
	KcoxpGSHaiETZYnCuvuy/4FPn0PSO1MowPLKWb0y4w==
X-Google-Smtp-Source: ABdhPJxclIDTBsv4yYQkMf2IKJZoaAKnmKikCbThIVE5NKI9QkHybFZsTLU/0wfsssiMKHH11b6mrHEUsG/59h5Yi1w=
X-Received: by 2002:a17:907:1c23:: with SMTP id nc35mr11335786ejc.624.1643058458017;
 Mon, 24 Jan 2022 13:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20220124091107.642561-1-hch@lst.de> <20220124091107.642561-12-hch@lst.de>
In-Reply-To: <20220124091107.642561-12-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Mon, 24 Jan 2022 22:07:26 +0100
Message-ID: <CAMGffEknV3j8nm__Bc_q7QUra+MV2kj-CMcq8O2ZdEK+B3om_Q@mail.gmail.com>
Subject: Re: [PATCH 11/19] rnbd-srv: remove struct rnbd_dev_blk_io
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, 
	Mike Snitzer <snitzer@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Md . Haris Iqbal" <haris.iqbal@ionos.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.co>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, 
	linux-block@vger.kernel.org, dm-devel@redhat.com, 
	linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev, 
	xen-devel@lists.xenproject.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 24, 2022 at 10:11 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Only the priv field of rnbd_dev_blk_io is used, so store the value of
> that in bio->bi_private directly and remove the entire bio_set overhead.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jack Wang <jinpu.wang@ionos.com>
Thanks!
> ---
>  drivers/block/rnbd/rnbd-srv-dev.c |  4 +---
>  drivers/block/rnbd/rnbd-srv-dev.h | 13 ++-----------
>  drivers/block/rnbd/rnbd-srv.c     | 27 ++++-----------------------
>  drivers/block/rnbd/rnbd-srv.h     |  1 -
>  4 files changed, 7 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-srv-dev.c b/drivers/block/rnbd/rnbd-srv-dev.c
> index 98d3e591a0885..c5d0a03911659 100644
> --- a/drivers/block/rnbd/rnbd-srv-dev.c
> +++ b/drivers/block/rnbd/rnbd-srv-dev.c
> @@ -12,8 +12,7 @@
>  #include "rnbd-srv-dev.h"
>  #include "rnbd-log.h"
>
> -struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
> -                              struct bio_set *bs)
> +struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags)
>  {
>         struct rnbd_dev *dev;
>         int ret;
> @@ -30,7 +29,6 @@ struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
>
>         dev->blk_open_flags = flags;
>         bdevname(dev->bdev, dev->name);
> -       dev->ibd_bio_set = bs;
>
>         return dev;
>
> diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
> index 1a14ece0be726..2c3df02b5e8ec 100644
> --- a/drivers/block/rnbd/rnbd-srv-dev.h
> +++ b/drivers/block/rnbd/rnbd-srv-dev.h
> @@ -14,25 +14,16 @@
>
>  struct rnbd_dev {
>         struct block_device     *bdev;
> -       struct bio_set          *ibd_bio_set;
>         fmode_t                 blk_open_flags;
>         char                    name[BDEVNAME_SIZE];
>  };
>
> -struct rnbd_dev_blk_io {
> -       struct rnbd_dev *dev;
> -       void             *priv;
> -       /* have to be last member for front_pad usage of bioset_init */
> -       struct bio      bio;
> -};
> -
>  /**
>   * rnbd_dev_open() - Open a device
> + * @path:      path to open
>   * @flags:     open flags
> - * @bs:                bio_set to use during block io,
>   */
> -struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
> -                              struct bio_set *bs);
> +struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags);
>
>  /**
>   * rnbd_dev_close() - Close a device
> diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
> index 6d228af1dcc35..ff9b389976078 100644
> --- a/drivers/block/rnbd/rnbd-srv.c
> +++ b/drivers/block/rnbd/rnbd-srv.c
> @@ -116,9 +116,7 @@ rnbd_get_sess_dev(int dev_id, struct rnbd_srv_session *srv_sess)
>
>  static void rnbd_dev_bi_end_io(struct bio *bio)
>  {
> -       struct rnbd_dev_blk_io *io = bio->bi_private;
> -
> -       rnbd_endio(io->priv, blk_status_to_errno(bio->bi_status));
> +       rnbd_endio(bio->bi_private, blk_status_to_errno(bio->bi_status));
>         bio_put(bio);
>  }
>
> @@ -131,7 +129,6 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
>         struct rnbd_srv_sess_dev *sess_dev;
>         u32 dev_id;
>         int err;
> -       struct rnbd_dev_blk_io *io;
>         struct bio *bio;
>         short prio;
>
> @@ -152,7 +149,7 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
>         priv->sess_dev = sess_dev;
>         priv->id = id;
>
> -       bio = bio_alloc_bioset(GFP_KERNEL, 1, sess_dev->rnbd_dev->ibd_bio_set);
> +       bio = bio_alloc(GFP_KERNEL, 1);
>         if (bio_add_page(bio, virt_to_page(data), datalen,
>                         offset_in_page(data)) != datalen) {
>                 rnbd_srv_err(sess_dev, "Failed to map data to bio\n");
> @@ -160,12 +157,8 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
>                 goto bio_put;
>         }
>
> -       io = container_of(bio, struct rnbd_dev_blk_io, bio);
> -       io->dev = sess_dev->rnbd_dev;
> -       io->priv = priv;
> -
>         bio->bi_end_io = rnbd_dev_bi_end_io;
> -       bio->bi_private = io;
> +       bio->bi_private = priv;
>         bio->bi_opf = rnbd_to_bio_flags(le32_to_cpu(msg->rw));
>         bio->bi_iter.bi_sector = le64_to_cpu(msg->sector);
>         bio->bi_iter.bi_size = le32_to_cpu(msg->bi_size);
> @@ -260,7 +253,6 @@ static void destroy_sess(struct rnbd_srv_session *srv_sess)
>
>  out:
>         xa_destroy(&srv_sess->index_idr);
> -       bioset_exit(&srv_sess->sess_bio_set);
>
>         pr_info("RTRS Session %s disconnected\n", srv_sess->sessname);
>
> @@ -289,16 +281,6 @@ static int create_sess(struct rtrs_srv_sess *rtrs)
>                 return -ENOMEM;
>
>         srv_sess->queue_depth = rtrs_srv_get_queue_depth(rtrs);
> -       err = bioset_init(&srv_sess->sess_bio_set, srv_sess->queue_depth,
> -                         offsetof(struct rnbd_dev_blk_io, bio),
> -                         BIOSET_NEED_BVECS);
> -       if (err) {
> -               pr_err("Allocating srv_session for path %s failed\n",
> -                      pathname);
> -               kfree(srv_sess);
> -               return err;
> -       }
> -
>         xa_init_flags(&srv_sess->index_idr, XA_FLAGS_ALLOC);
>         INIT_LIST_HEAD(&srv_sess->sess_dev_list);
>         mutex_init(&srv_sess->lock);
> @@ -747,8 +729,7 @@ static int process_msg_open(struct rnbd_srv_session *srv_sess,
>                 goto reject;
>         }
>
> -       rnbd_dev = rnbd_dev_open(full_path, open_flags,
> -                                &srv_sess->sess_bio_set);
> +       rnbd_dev = rnbd_dev_open(full_path, open_flags);
>         if (IS_ERR(rnbd_dev)) {
>                 pr_err("Opening device '%s' on session %s failed, failed to open the block device, err: %ld\n",
>                        full_path, srv_sess->sessname, PTR_ERR(rnbd_dev));
> diff --git a/drivers/block/rnbd/rnbd-srv.h b/drivers/block/rnbd/rnbd-srv.h
> index e5604bce123ab..be2ae486d407e 100644
> --- a/drivers/block/rnbd/rnbd-srv.h
> +++ b/drivers/block/rnbd/rnbd-srv.h
> @@ -23,7 +23,6 @@ struct rnbd_srv_session {
>         struct rtrs_srv_sess    *rtrs;
>         char                    sessname[NAME_MAX];
>         int                     queue_depth;
> -       struct bio_set          sess_bio_set;
>
>         struct xarray           index_idr;
>         /* List of struct rnbd_srv_sess_dev */
> --
> 2.30.2
>

