Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8181B9EB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 15:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658981.1028394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGKRq-0001d5-Hb; Thu, 21 Dec 2023 14:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658981.1028394; Thu, 21 Dec 2023 14:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGKRq-0001Zs-Dp; Thu, 21 Dec 2023 14:54:54 +0000
Received: by outflank-mailman (input) for mailman id 658981;
 Thu, 21 Dec 2023 14:54:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YhLu=IA=gmail.com=konishi.ryusuke@srs-se1.protection.inumbo.net>)
 id 1rGKRo-0001Yl-BC
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 14:54:52 +0000
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [2607:f8b0:4864:20::e33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2a49b59-a010-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 15:54:48 +0100 (CET)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-462e70f1c20so193787137.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 06:54:48 -0800 (PST)
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
X-Inumbo-ID: e2a49b59-a010-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703170487; x=1703775287; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pURYtu0NLCnQlpjaLQBb3A9CXAcN65Ivjf7L8viYZIQ=;
        b=M9a1P2PcDWlg0cz4MBH4F8veXXiTczyBJI5GStuSrDK1k+QKKf4a9uIHikAyHe5ICz
         QpIFfKVP5FeD4BhsAUCVjnmU9Em43OGgav6eRvR/lSkdMQPuqYU0sVaj1ZKhteLUfvmi
         PQICm8pBkUM2fj4K78LAC1WjWhjf1Aek1a1MjOWWLmGU3wLZWGCzZkvfYFO6lGjXsuRK
         ckpiNv8sOrHJMGJt+eVOqtVx5J7zojBUI0TyVSJGYm46n3F+FzMLJY+gzLT2JbdokTEA
         w1yJdAZ8jwUE+RJ6mzUgWr0gz7icDCJwicAm8xDldqPuv5Enb86hxci/zjdE1d1B22Ny
         0j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703170487; x=1703775287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pURYtu0NLCnQlpjaLQBb3A9CXAcN65Ivjf7L8viYZIQ=;
        b=fBc7uVnL3dE+FJzeoA63eOnzhm7v/7Ijda8z4aatGeGQh/LMzRJFPQiS1Re1P94OvL
         8wGSQxIggFqL7sFkB5LMgUfTlIS1BqDltBn/ppmC2rkOYGDI+a4uiOW6LXk6C4RRJCz6
         ek0BhvNsfV8WFF0Y2KRU0b9iDR2Eot6rhYh0Xq/v0/J5/VJbl4+BoaCo9zVYsDU18SBZ
         946IB3a7WI0R3zs3MEusR6ZgZZL9fOkiLPG11AskQ2emVP0JqoKX6sULBzaqJwEO9teX
         sU58EeUlBczOh5ewhOnKyYQFwFy65WDKmSvUUK6SwnvfeKyv4mSGOSmQ2YeWSgy1+kGC
         RKxg==
X-Gm-Message-State: AOJu0YwmtKLht9YjAL0T2dZf2Ku3dAB3jw+IqZktbYLyef6cx3sJt+Iw
	6b8PwskJoRSIHIGWIKcJuFcYCyLrNiAMI3BAR9g=
X-Google-Smtp-Source: AGHT+IFN1NuYgs8WiPh35+AiECRKwSlqz0ZEDe3FqBLZ5rzeC9cKopqWDVql1xxie4BTiSGNKZ2Qkn8RU8vM8AW8lKI=
X-Received: by 2002:a05:6102:2c19:b0:466:a0dd:4b2 with SMTP id
 ie25-20020a0561022c1900b00466a0dd04b2mr1276429vsb.51.1703170487175; Thu, 21
 Dec 2023 06:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com> <20231221085839.1768763-1-yukuai1@huaweicloud.com>
In-Reply-To: <20231221085839.1768763-1-yukuai1@huaweicloud.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Thu, 21 Dec 2023 23:54:30 +0900
Message-ID: <CAKFNMo=TuhzyEs_NEOdYgJz+UVizU6Ojx4ZKXowDaux3kKddUQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 for-6.8/block 12/17] nilfs2: use bdev api in nilfs_attach_log_writer()
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de, 
	kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com, 
	josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, 
	tytso@mit.edu, adilger.kernel@dilger.ca, jack@suse.com, willy@infradead.org, 
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com, 
	yangerkun@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 6:00=E2=80=AFPM Yu Kuai wrote:
>
> From: Yu Kuai <yukuai3@huawei.com>
>
> Avoid to access bd_inode directly, prepare to remove bd_inode from
> block_device.
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  fs/nilfs2/segment.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
> index 55e31cc903d1..a1130e384937 100644
> --- a/fs/nilfs2/segment.c
> +++ b/fs/nilfs2/segment.c
> @@ -2823,7 +2823,7 @@ int nilfs_attach_log_writer(struct super_block *sb,=
 struct nilfs_root *root)
>         if (!nilfs->ns_writer)
>                 return -ENOMEM;
>
> -       inode_attach_wb(nilfs->ns_bdev->bd_inode, NULL);
> +       bdev_attach_wb(nilfs->ns_bdev);
>
>         err =3D nilfs_segctor_start_thread(nilfs->ns_writer);
>         if (unlikely(err))
> --
> 2.39.2
>

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi

