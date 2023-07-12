Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F659750D97
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 18:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562668.879416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJcMa-0006qA-Pm; Wed, 12 Jul 2023 16:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562668.879416; Wed, 12 Jul 2023 16:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJcMa-0006mp-Me; Wed, 12 Jul 2023 16:06:48 +0000
Received: by outflank-mailman (input) for mailman id 562668;
 Wed, 12 Jul 2023 16:06:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItXa=C6=ionos.com=haris.iqbal@srs-se1.protection.inumbo.net>)
 id 1qJcMZ-0006ll-KA
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 16:06:47 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19fe2b7f-20ce-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 18:06:46 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so11538963e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 09:06:46 -0700 (PDT)
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
X-Inumbo-ID: 19fe2b7f-20ce-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1689178006; x=1691770006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8X6ArMXh62A5UxRR3ZN+q1CvObhoeb8ltfmXU1xj+zw=;
        b=V0Mwyzpfv5NHo344FebMkemb4OkDhqesSJzk3oLJrC1sXingJzi/DqoHJPX3cM7/kU
         /daZbGumusx7p3ETz9bL+dV7+a249DzrdJ5ucaxUqFs1cH4q4UNK1aBbCP0kRMVezgvK
         Gb0u18D1omT5qk875/bvJSIuyWWXlLKu5WnA0OT929rTcOY7rHqZVsWOvIcdQTq+Q4TI
         Xty8IQiQ2uEFjkBqRHhjaYUeIIjdk3TlKuW6ZBNL29/kZI8LKdOXvAAi+FiRNxSMUXsG
         92h/diWQ5jGfG/Pc/9JTOLcLZ2bS8Hyd3sIfxIs/rFITeR6YjIQmonhcUevYE5m/zN7s
         SmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178006; x=1691770006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8X6ArMXh62A5UxRR3ZN+q1CvObhoeb8ltfmXU1xj+zw=;
        b=FB1WVJXBRL2sl5sZSMSlbgE4YLaTyCZUVmudqTwIRU4ag86+E8fIQO/LSHT5ibk9My
         5YInqv5vIS1I/DkIZAltbWNpyKnpYiMRjW5wa3zyosnIIGi0G/G8bVOP1c3XGleEfBV2
         U/HGd4MNTr0hKdKW1vDst3E4ULVID9zfVdoS+GO8Nd6G8KoiUBMe60+7lFaNHzw1QGTT
         QY2lqqp5q8yGA3zV1qe9HZ50VZ2gCE+m9QsDd5xrqV6hwSloNnbgq5pts3TfjtZHjzBb
         P9gfI3zuck72sVA/2EouPjOBDjxQaLQjVrDkWI3HXHwvAEubTyfvFeBO6EYRgqPX7jBF
         aLew==
X-Gm-Message-State: ABy/qLZDCJcqNgV1jI5oPbLfyhbzI60WoiAgep/yoyk5HX6EO56KlKCf
	1Of3TOTpnq9JHfCDjQusg4gmXs2qtuD9FvMrrmbbGA==
X-Google-Smtp-Source: APBJJlHjPtNIqZNhhKZT3JSG1orBAozCwd3+TwwvFjulJuToD7D5iIrA7grwKZQU8Z67qc0UJ0oDxWof6WbkdfMRi3A=
X-Received: by 2002:ac2:5b1d:0:b0:4fb:7a90:1abe with SMTP id
 v29-20020ac25b1d000000b004fb7a901abemr15797051lfn.49.1689178006211; Wed, 12
 Jul 2023 09:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230629165206.383-1-jack@suse.cz> <20230704122224.16257-1-jack@suse.cz>
 <ZKbgAG5OoHVyUKOG@infradead.org>
In-Reply-To: <ZKbgAG5OoHVyUKOG@infradead.org>
From: Haris Iqbal <haris.iqbal@ionos.com>
Date: Wed, 12 Jul 2023 18:06:35 +0200
Message-ID: <CAJpMwyiUcw+mH0sZa8f8UJsaSZ7NSE65s2gZDEia+pASyP_gJQ@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2023 at 5:38=E2=80=AFPM Christoph Hellwig <hch@infradead.org=
> wrote:
>
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
> struct bdev_handle *bdev_open_by_dev(dev_t dev, blk_mode_t mode, void *ho=
lder,
>                 const struct blk_holder_ops *hops);
> struct bdev_handle *bdev_open_by_path(dev_t dev, blk_mode_t mode,
>                 void *holder, const struct blk_holder_ops *hops);
> void bdev_release(struct bdev_handle *handle);

+1 to this.
Also, if we are removing "handle" from the function, should the name
of the structure it returns also change? Would something like bdev_ctx
be better?

(Apologies for the previous non-plaintext email)

>
> ?

