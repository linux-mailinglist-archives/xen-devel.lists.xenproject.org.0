Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087EA493D40
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 16:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258881.446355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nACxW-0002uY-C2; Wed, 19 Jan 2022 15:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258881.446355; Wed, 19 Jan 2022 15:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nACxW-0002sL-7l; Wed, 19 Jan 2022 15:33:14 +0000
Received: by outflank-mailman (input) for mailman id 258881;
 Wed, 19 Jan 2022 15:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd5e=SD=ionos.com=jinpu.wang@srs-se1.protection.inumbo.net>)
 id 1nACxU-0002sF-To
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 15:33:12 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b8f90c0-793d-11ec-bc18-3156f6d857e4;
 Wed, 19 Jan 2022 16:33:11 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id p12so13780498edq.9
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jan 2022 07:33:10 -0800 (PST)
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
X-Inumbo-ID: 1b8f90c0-793d-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ls4oJs6fjZ2al5mHDHmAP430pKGIHTChze7QOzvid0=;
        b=RkLog8m2MYBMRLjnz/lmwOPkWvyatJOpnc2C+SFqCB8A5+CgOtZNqgIcBiMLkIoMyh
         gEr8s1UGmpgpAGNwUfZNYyRI9qEflB+nBcS9X+xsueK5rC4Ez4sCexRGgPhN4+3TFriB
         ojHLQx/So9q0DEpS6wCB+RQONR2hQN+ZDAFsafTmgU6TGyrFxA/6lV1xY4IJet52lmjl
         bSyn079RsjIcJeBi+nhFSujNuqtCPXIfKFb/dYwAiTdrCxy5wjkDmXd+/ZabmuFSO4A1
         5WQvp91C0WXDM8k7HDlkHelCzGm9OlpjE9UBZJN4WZKlgYFI7B59vtkfpfd/tSS650gp
         aHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ls4oJs6fjZ2al5mHDHmAP430pKGIHTChze7QOzvid0=;
        b=x2iOIzhaTgVhLpYHnSK4u8S0tabiH+6TDtM33gx080Iw8DwmF2SkQRJdXFIEHXnAux
         N1/C5ruYvgiWb/BLkb1cNmCqOM5caC764L1Q8LKorhxJT2ZQ0+yvDlWm8ZUoypAkPk8a
         pe+kP5+MERbyV1t3LYFAwkrhMsJwtP5u6yNYfZToO5TZYzdJdcspSfutVXbQtsVCwbNb
         Hq/su9A/YO5hxjlfEK9XCZvuIAgWj3OfqdamuiS7Bo+suH/0C9cWsGdySO0YCNgcEKet
         IEiTouyAut7NX36E5p8UTIOJYAx459vtZ9fmDcq1YxbDluA5ZpvtQMVKTaVsfu6G3Mxw
         MmfQ==
X-Gm-Message-State: AOAM530MVwJCOGs5JM+p9B0gXutJ9i7Wow5xQ508Xcmo4pa6UhHPBEN5
	lKLQcr/Mi7FBi0UIhsdMW3tv8+jIwV0+8Y0dHPr+qQ==
X-Google-Smtp-Source: ABdhPJxQu27Nzc9iLtmZju+JlEp2t2xBOVP/vALHsIADO5/2M/D93HCsSqLZHtj0tHiYz0k26Hu4vZztU4HAIUpxob0=
X-Received: by 2002:a05:6402:195:: with SMTP id r21mr30344219edv.174.1642606389887;
 Wed, 19 Jan 2022 07:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20220118071952.1243143-1-hch@lst.de> <20220118071952.1243143-12-hch@lst.de>
In-Reply-To: <20220118071952.1243143-12-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 19 Jan 2022 16:32:58 +0100
Message-ID: <CAMGffE=gbN_oxdvzBdX66CaEPKQr6oc1TS1mf8GVz39e5Jme7Q@mail.gmail.com>
Subject: Re: [PATCH 11/19] rnbd-src: remove struct rnbd_dev_blk_io
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

On Tue, Jan 18, 2022 at 8:20 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Only the priv field of rnbd_dev_blk_io is used, so store the value of
> that in bio->bi_private directly and remove the entire bio_set overhead.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
there is one typo in the subject line, should be rnbd-srv.
> ---
>  drivers/block/rnbd/rnbd-srv-dev.c |  4 +---
>  drivers/block/rnbd/rnbd-srv-dev.h | 13 ++-----------
>  drivers/block/rnbd/rnbd-srv.c     | 30 +++++-------------------------
>  drivers/block/rnbd/rnbd-srv.h     |  1 -
>  4 files changed, 8 insertions(+), 40 deletions(-)
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
> index 65c670e96075b..b1ac1414b56d5 100644
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
> @@ -152,20 +149,16 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
>         priv->sess_dev = sess_dev;
>         priv->id = id;
>
> -       bio = bio_alloc_bioset(GFP_KERNEL, 1, sess_dev->rnbd_dev->ibd_bio_set);
> +       bio = bio_alloc(GFP_KERNEL, 1);
>         if (bio_add_page(bio, virt_to_page(data), datalen,
>                         offset_in_page(data))) {
>                 rnbd_srv_err(sess_dev, "Failed to map data to bio\n");
>                 err = -EINVAL;
> -               goto sess_dev_put;
> +               goto bio_put;
ok, bio_put is used here, I think it's better the move to patch 10.
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
> @@ -180,7 +173,6 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
>
>  bio_put:
>         bio_put(bio);
> -sess_dev_put:
>         rnbd_put_sess_dev(sess_dev);
>  err:
>         kfree(priv);
> @@ -261,7 +253,6 @@ static void destroy_sess(struct rnbd_srv_session *srv_sess)
>
>  out:
>         xa_destroy(&srv_sess->index_idr);
> -       bioset_exit(&srv_sess->sess_bio_set);
>
>         pr_info("RTRS Session %s disconnected\n", srv_sess->sessname);
>
> @@ -290,16 +281,6 @@ static int create_sess(struct rtrs_srv_sess *rtrs)
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
> @@ -748,8 +729,7 @@ static int process_msg_open(struct rnbd_srv_session *srv_sess,
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
with it fixed,  the patch looks good to me.

Thanks!

