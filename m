Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53537509DB
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 15:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562510.879218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJa7q-0006wv-LN; Wed, 12 Jul 2023 13:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562510.879218; Wed, 12 Jul 2023 13:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJa7q-0006uY-I5; Wed, 12 Jul 2023 13:43:26 +0000
Received: by outflank-mailman (input) for mailman id 562510;
 Wed, 12 Jul 2023 13:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItXa=C6=ionos.com=haris.iqbal@srs-se1.protection.inumbo.net>)
 id 1qJa3v-00061c-5S
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 13:39:23 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81d5a88e-20b9-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 15:39:21 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso11283283e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 06:39:21 -0700 (PDT)
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
X-Inumbo-ID: 81d5a88e-20b9-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1689169161; x=1691761161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+evqX27DGBiWJkyZnqGeEHQI9QcDiX7JHwbrqFd6EpQ=;
        b=HvU/baPM6sZwTLnq/qfa5rJyKcj7shqfM6D7Yb+G9g3ZYKTi3s0EcBiC7f7tIEjtdm
         QA5axW7VPwPnkXZzytIsv3row1wqxHmeDpHZnctYAtNdrbiFmseznOuEbaqL8+1ZuCdx
         mHq0tH1oyBhuyYi3VnGKgi7s+kfN3fJslBaL8GJuknQcFsq3zqBycULjxCNTh0AQw7xm
         1wOmoQ5WDMp1n00gvCTlg6QVLQFj2LlfqH5fv/sX4+XD5tLQqI3TVk0j8HJlphtzaXvc
         STEw6QCxnVvzKbvtX6kVCmEnTLJyBGmZAtS0H4Rhh3ZkO7nx2ZhYYIcL3MQBWzCiQS8O
         xksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689169161; x=1691761161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+evqX27DGBiWJkyZnqGeEHQI9QcDiX7JHwbrqFd6EpQ=;
        b=geS6+90I6KrXjQsN/Japau4OS8xyxKZ1piUsyRK83R1XK1R5vW4g3n6yXbdKIZ4F8E
         81QnHG5HXj1tvEz/k87la1v7d6hjH9GaQti6fYSxkn58Svda9cHRjCvOooFqqW9uyWXc
         17gduSwkCJh1gqHMHcgYDrFZ7RvkwiiYG2CTe4qpS3g0TA0Iun0gNTtQTDlLRUp4iCiJ
         ecFYrhvTxYUkIISLl73owz/xP08PtZF0gJFK/cAFfxu1qELLm2B4eYEYl+UNldEDcmZQ
         u7h05v2LnHQGortI4U/VNDFdtzviSaD3YEzPrPKmEvQIKYPDqV/0mgBnQfHyO/rjSzyH
         SfZw==
X-Gm-Message-State: ABy/qLYR/xcaLPgEUGbJxugaOhCVFxksiQp0517/j9YHjpGxW9WeuhaM
	n4sdiiU/PCx23kVs9pL0APElp1d55PSw911Ziu/pXA==
X-Google-Smtp-Source: APBJJlEI1gyVFA9e0vzN1OZw8HqZ9LgUDYjdSVkcc/YNKBWyCbO3ruOl1C16YRvIxaIjAxVOOIhj+dxwF3VF9wwHpIo=
X-Received: by 2002:a05:6512:34cd:b0:4fb:82ac:9d23 with SMTP id
 w13-20020a05651234cd00b004fb82ac9d23mr13814794lfr.36.1689169161029; Wed, 12
 Jul 2023 06:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230629165206.383-1-jack@suse.cz> <20230704122224.16257-1-jack@suse.cz>
 <ZKbgAG5OoHVyUKOG@infradead.org>
In-Reply-To: <ZKbgAG5OoHVyUKOG@infradead.org>
From: Haris Iqbal <haris.iqbal@ionos.com>
Date: Wed, 12 Jul 2023 15:39:09 +0200
Message-ID: <CAJpMwyhKW23zEfMcsGrBG6Bq0Md40vZ4qj-PgDkR6KWPv8+7PQ@mail.gmail.com>
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
To: Christoph Hellwig <hch@infradead.org>
Cc: Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
	Alasdair Kergon <agk@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>, dm-devel@redhat.com, 
	drbd-dev@lists.linbit.com, Gao Xiang <xiang@kernel.org>, 
	Jack Wang <jinpu.wang@ionos.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	jfs-discussion@lists.sourceforge.net, Joern Engel <joern@lazybastard.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, Kent Overstreet <kent.overstreet@gmail.com>, 
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org, 
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org, 
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Mike Snitzer <snitzer@kernel.org>, 
	Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com, 
	reiserfs-devel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>, target-devel@vger.kernel.org, 
	Ted Tso <tytso@mit.edu>, Trond Myklebust <trond.myklebust@hammerspace.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000cf1dc906004a5728"

--000000000000cf1dc906004a5728
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2023 at 5:38=E2=80=AFPM Christoph Hellwig <hch@infradead.org=
> wrote:

> On Tue, Jul 04, 2023 at 02:21:28PM +0200, Jan Kara wrote:
> > Create struct bdev_handle that contains all parameters that need to be
> > passed to blkdev_put() and provide blkdev_get_handle_* functions that
> > return this structure instead of plain bdev pointer. This will
> > eventually allow us to pass one more argument to blkdev_put() without
> > too much hassle.
>
> Can we use the opportunity to come up with better names?  blkdev_get_*
> was always a rather horrible naming convention for something that
> ends up calling into ->open.
>
> What about:
>
> struct bdev_handle *bdev_open_by_dev(dev_t dev, blk_mode_t mode, void
> *holder,
>                 const struct blk_holder_ops *hops);
> struct bdev_handle *bdev_open_by_path(dev_t dev, blk_mode_t mode,
>                 void *holder, const struct blk_holder_ops *hops);
> void bdev_release(struct bdev_handle *handle);
>

+1 to this.
Also, if we are removing "handle" from the function, should the name of the
structure it returns also change? Would something like bdev_ctx be better?


>
> ?
>

--000000000000cf1dc906004a5728
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 6, 2023 at 5:38=E2=80=AFP=
M Christoph Hellwig &lt;<a href=3D"mailto:hch@infradead.org">hch@infradead.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Tue, Jul 04, 2023 at 02:21:28PM +0200, Jan Kara wrote:<br>
&gt; Create struct bdev_handle that contains all parameters that need to be=
<br>
&gt; passed to blkdev_put() and provide blkdev_get_handle_* functions that<=
br>
&gt; return this structure instead of plain bdev pointer. This will<br>
&gt; eventually allow us to pass one more argument to blkdev_put() without<=
br>
&gt; too much hassle.<br>
<br>
Can we use the opportunity to come up with better names?=C2=A0 blkdev_get_*=
<br>
was always a rather horrible naming convention for something that<br>
ends up calling into -&gt;open.<br>
<br>
What about:<br>
<br>
struct bdev_handle *bdev_open_by_dev(dev_t dev, blk_mode_t mode, void *hold=
er,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct blk_ho=
lder_ops *hops);<br>
struct bdev_handle *bdev_open_by_path(dev_t dev, blk_mode_t mode,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *holder, const=
 struct blk_holder_ops *hops);<br>
void bdev_release(struct bdev_handle *handle);<br></blockquote><div><br></d=
iv><div>+1 to this.</div><div>Also, if we are removing &quot;handle&quot; f=
rom the function, should the name of the structure it returns also change? =
Would something like bdev_ctx be better?<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
?<br>
</blockquote></div></div>

--000000000000cf1dc906004a5728--

