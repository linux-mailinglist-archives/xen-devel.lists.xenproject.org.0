Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DB54931C4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 01:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258686.445817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9yit-0001El-Rd; Wed, 19 Jan 2022 00:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258686.445817; Wed, 19 Jan 2022 00:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9yit-0001Bw-OL; Wed, 19 Jan 2022 00:21:11 +0000
Received: by outflank-mailman (input) for mailman id 258686;
 Wed, 19 Jan 2022 00:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd5e=SD=ionos.com=jinpu.wang@srs-se1.protection.inumbo.net>)
 id 1n9yir-0001Bq-QB
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 00:21:09 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b133e5f8-78bd-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 01:21:06 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id f21so2848831eds.11
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jan 2022 16:21:06 -0800 (PST)
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
X-Inumbo-ID: b133e5f8-78bd-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bmeqfE1RuOXde41Zr3CQ/9tcb+03J/6w+lG9hJ7A4Ho=;
        b=Ybqt4L8XARDalF5U3jxiomW7vn0XAjkMf9MRDY2CLKnxrl9ZFVPOy45252iZ/ahaBE
         Uul8Do3DwK3+IhjDQEsQqZ25qhbKav+CsP+D/VRz8S/JP1MCrWjpPNAT2T6HpwQO2Kaj
         U+mXSh1wrYynaFmrl3R954SKWovO2KgQQwMuFgk3bN6254exjP5wW45dCjMVUb5YwN8a
         VxuJ4073q87irF35SwVs1OSriqyn3iO2/rrlt98SROIN6upeJLmrkKzh1HvDiSu1wNK0
         Osy4+7YgQ8hN9QPHR4VjTrEWqZipRE0LQfv8aN/2JjfC3ryAYgT+7fuyuH/QIVRL+JSD
         L94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bmeqfE1RuOXde41Zr3CQ/9tcb+03J/6w+lG9hJ7A4Ho=;
        b=UCY7W8G32ubZEXALLFqQMTdD9FZBtnxPbfFCPIH0xYqIBWFGc876vdXz/daw6pd7iB
         KIIJoZyNINipxTtebkz+Jcz9g8u+AjNpsSR1JOGjwvn9DdAK6YlVc1hjtCJqmK40h/IB
         T9IR0mCH3hYr/NbmyZadvI54LghlYL4pcBa27KsJ/x1WRU6fvegEGwn6JNY733PYaU8M
         6hFp7K0Vb5wdlYioAe1PoGvqp9Sj2l/m3XBwys47xsfUj7FD8FzQFQAxvgnck5WrDL4v
         gx3cA44mrpfpNEEz5dhkfdlofS6kUEbp2z0PKoYZuG79p99JC6mIiO4NUTzkYT0knHw/
         +7gg==
X-Gm-Message-State: AOAM532xjds6vOpJQkeeQvwE89/oILXHC07vT/NkgY/yN4pmWBrzWELV
	bnJd9fHi7mvzkwNtNFV+2EoXi0E6qUTypMmefc+y2g==
X-Google-Smtp-Source: ABdhPJzX/FVgzC0EPKMvsUUn84DEffG26tohBKCZtOfTfxVCmLokcVuYpKW6O9EGM43LUqr04D+DAH09ngv7yEmd1xc=
X-Received: by 2002:a05:6402:14f:: with SMTP id s15mr27553335edu.118.1642551665549;
 Tue, 18 Jan 2022 16:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20220118071952.1243143-1-hch@lst.de> <20220118071952.1243143-11-hch@lst.de>
In-Reply-To: <20220118071952.1243143-11-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 19 Jan 2022 01:20:54 +0100
Message-ID: <CAMGffEmFZB1PPE09bfxQjKw-tJhdprEkF-OWrVF4Kjsf1OwQ_g@mail.gmail.com>
Subject: Re: [PATCH 10/19] rnbd-srv: simplify bio mapping in process_rdma
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

Hi Christoph,

Thanks for the patch.

On Tue, Jan 18, 2022 at 8:20 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The memory mapped in process_rdma is contiguous, so there is no need
> to loop over bio_add_page.  Remove rnbd_bio_map_kern and just open code
> the bio allocation and mapping in the caller.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rnbd/rnbd-srv-dev.c | 57 -------------------------------
>  drivers/block/rnbd/rnbd-srv-dev.h |  5 ---
>  drivers/block/rnbd/rnbd-srv.c     | 20 ++++++++---
>  3 files changed, 15 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-srv-dev.c b/drivers/block/rnbd/rnbd-srv-dev.c
> index b241a099aeae2..98d3e591a0885 100644
> --- a/drivers/block/rnbd/rnbd-srv-dev.c
> +++ b/drivers/block/rnbd/rnbd-srv-dev.c
> @@ -44,60 +44,3 @@ void rnbd_dev_close(struct rnbd_dev *dev)
>         blkdev_put(dev->bdev, dev->blk_open_flags);
>         kfree(dev);
>  }
> -
> -void rnbd_dev_bi_end_io(struct bio *bio)
> -{
> -       struct rnbd_dev_blk_io *io = bio->bi_private;
> -
> -       rnbd_endio(io->priv, blk_status_to_errno(bio->bi_status));
> -       bio_put(bio);
> -}
> -
> -/**
> - *     rnbd_bio_map_kern       -       map kernel address into bio
> - *     @data: pointer to buffer to map
> - *     @bs: bio_set to use.
> - *     @len: length in bytes
> - *     @gfp_mask: allocation flags for bio allocation
> - *
> - *     Map the kernel address into a bio suitable for io to a block
> - *     device. Returns an error pointer in case of error.
> - */
> -struct bio *rnbd_bio_map_kern(void *data, struct bio_set *bs,
> -                             unsigned int len, gfp_t gfp_mask)
> -{
> -       unsigned long kaddr = (unsigned long)data;
> -       unsigned long end = (kaddr + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> -       unsigned long start = kaddr >> PAGE_SHIFT;
> -       const int nr_pages = end - start;
> -       int offset, i;
> -       struct bio *bio;
> -
> -       bio = bio_alloc_bioset(gfp_mask, nr_pages, bs);
> -       if (!bio)
> -               return ERR_PTR(-ENOMEM);
> -
> -       offset = offset_in_page(kaddr);
> -       for (i = 0; i < nr_pages; i++) {
> -               unsigned int bytes = PAGE_SIZE - offset;
> -
> -               if (len <= 0)
> -                       break;
> -
> -               if (bytes > len)
> -                       bytes = len;
> -
> -               if (bio_add_page(bio, virt_to_page(data), bytes,
> -                                   offset) < bytes) {
> -                       /* we don't support partial mappings */
> -                       bio_put(bio);
> -                       return ERR_PTR(-EINVAL);
> -               }
> -
> -               data += bytes;
> -               len -= bytes;
> -               offset = 0;
> -       }
> -
> -       return bio;
> -}
> diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
> index 0eb23850afb95..1a14ece0be726 100644
> --- a/drivers/block/rnbd/rnbd-srv-dev.h
> +++ b/drivers/block/rnbd/rnbd-srv-dev.h
> @@ -41,11 +41,6 @@ void rnbd_dev_close(struct rnbd_dev *dev);
>
>  void rnbd_endio(void *priv, int error);
>
> -void rnbd_dev_bi_end_io(struct bio *bio);
> -
> -struct bio *rnbd_bio_map_kern(void *data, struct bio_set *bs,
> -                             unsigned int len, gfp_t gfp_mask);
> -
>  static inline int rnbd_dev_get_max_segs(const struct rnbd_dev *dev)
>  {
>         return queue_max_segments(bdev_get_queue(dev->bdev));
> diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
> index 1ee808fc600cf..65c670e96075b 100644
> --- a/drivers/block/rnbd/rnbd-srv.c
> +++ b/drivers/block/rnbd/rnbd-srv.c
> @@ -114,6 +114,14 @@ rnbd_get_sess_dev(int dev_id, struct rnbd_srv_session *srv_sess)
>         return sess_dev;
>  }
>
> +static void rnbd_dev_bi_end_io(struct bio *bio)
> +{
> +       struct rnbd_dev_blk_io *io = bio->bi_private;
> +
> +       rnbd_endio(io->priv, blk_status_to_errno(bio->bi_status));
> +       bio_put(bio);
> +}
> +
>  static int process_rdma(struct rnbd_srv_session *srv_sess,
>                         struct rtrs_srv_op *id, void *data, u32 datalen,
>                         const void *usr, size_t usrlen)
> @@ -144,11 +152,11 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
>         priv->sess_dev = sess_dev;
>         priv->id = id;
>
> -       /* Generate bio with pages pointing to the rdma buffer */
> -       bio = rnbd_bio_map_kern(data, sess_dev->rnbd_dev->ibd_bio_set, datalen, GFP_KERNEL);
> -       if (IS_ERR(bio)) {
> -               err = PTR_ERR(bio);
> -               rnbd_srv_err(sess_dev, "Failed to generate bio, err: %d\n", err);
> +       bio = bio_alloc_bioset(GFP_KERNEL, 1, sess_dev->rnbd_dev->ibd_bio_set);
> +       if (bio_add_page(bio, virt_to_page(data), datalen,
> +                       offset_in_page(data))) {
this changes lead to IO error all the time, because bio_add_page return len.
We need  if (bio_add_page(bio, virt_to_page(data), datalen,
                     offset_in_page(data)) < datalen)

Thanks!
> +               rnbd_srv_err(sess_dev, "Failed to map data to bio\n");
> +               err = -EINVAL;
>                 goto sess_dev_put;
>         }
>
> @@ -170,6 +178,8 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
>
>         return 0;
>
> +bio_put:
> +       bio_put(bio);
>  sess_dev_put:
>         rnbd_put_sess_dev(sess_dev);
>  err:
> --
> 2.30.2
>

