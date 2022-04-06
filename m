Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40EC4F66F3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 19:28:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300081.511662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc9SJ-0005ur-SK; Wed, 06 Apr 2022 17:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300081.511662; Wed, 06 Apr 2022 17:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc9SJ-0005rO-Ok; Wed, 06 Apr 2022 17:28:31 +0000
Received: by outflank-mailman (input) for mailman id 300081;
 Wed, 06 Apr 2022 17:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0fM=UQ=gmail.com=konishi.ryusuke@srs-se1.protection.inumbo.net>)
 id 1nc9SH-0005rE-Qw
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 17:28:29 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f90b4dbe-b5ce-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 19:28:28 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id t25so5293726lfg.7
 for <xen-devel@lists.xenproject.org>; Wed, 06 Apr 2022 10:28:28 -0700 (PDT)
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
X-Inumbo-ID: f90b4dbe-b5ce-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WJLYFFwKJzu0AzBejzceyC93Fh4AhvIk3A/MNZXzKIU=;
        b=nHoFYmIVcbUdYBuRBczLdRhO5AcYZ6GHHFtKpS9G1n5vNIpBGLipmKmQ40hQnwfBEK
         9YcCx5HGe8T4NG1UPywpqZKblDsiU8Uam6EvTYaei53mUEV7gX/X6QEIMPDVNdTe1RsC
         lSqUADllCjDlRJ3aqfDHj4gGsZ5WvTndElsOvm3ukXbURNWbOjm9tS3FKy9TW5JIte+s
         iqchodtdlLO+0839AsHapTHL+am4rmkQFqKuweIuQiuTq0iA/dxkHoEkiJl793SmXbAL
         d6FIVbXVTWtg6j4nPkHK8I7vb1+rBuBMN5T4ZVmgoa+qulAgS9/S0AV92hnwAdWJS/in
         gNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WJLYFFwKJzu0AzBejzceyC93Fh4AhvIk3A/MNZXzKIU=;
        b=WXsY2gtasXSiyH4Slf536ZD3xwPlzlB/OCVMMalzpgm0I3chi/LDvekdFmmsZUOQo9
         8ckDZKh4rb16EobtcY8uK9KMA4BbQxRkPqBiWjdnpNhnq0/9Ncr5fgkCkkUb1t9nqcUY
         LZbbAFqb7g70+A1RVNuzN/ASpUCYYW89+EocO97wmONJwENLvHv0I7UHxZ6h+OV2QA8E
         Q+1lDIX3l22Z1Dqgh3GisuFpCcfEE274KL+WCNzP/IOXOc8z4x+rk5O08Xfhdhbxv7ZI
         f8MMQYTItnuazY3x7DvXn0otYXpkeiaQ53jKMReSoFJLKtv6XTWEpUm94uKFYOe5v6BT
         BGlA==
X-Gm-Message-State: AOAM533kkIfxoOj9MVl5O9I02Ea5JMsME5z/bY23ajtkAUlW9YxwpcvO
	EX0A/ZlGgNfQC6HybE1KwDqF4xwZKV2dzZ5YcvQ=
X-Google-Smtp-Source: ABdhPJxvT7YhfWN8QbCVz4oydCsKwT/zbXQ5089WXaSZlqzdjbFflulVc086iBmKtewP4KtbC66vp+jW8qrWjcRFTmg=
X-Received: by 2002:ac2:5f4d:0:b0:43e:da3e:4529 with SMTP id
 13-20020ac25f4d000000b0043eda3e4529mr6768924lfz.627.1649266108188; Wed, 06
 Apr 2022 10:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220406060516.409838-1-hch@lst.de> <20220406060516.409838-24-hch@lst.de>
In-Reply-To: <20220406060516.409838-24-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Thu, 7 Apr 2022 02:28:15 +0900
Message-ID: <CAKFNMokGOma3pvHdEsnsjuKgW+jpYX9zx8fWwJWyeKuCpKz-YQ@mail.gmail.com>
Subject: Re: [PATCH 23/27] block: add a bdev_max_discard_sectors helper
To: Christoph Hellwig <hch@lst.de>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	device-mapper development <dm-devel@redhat.com>, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-block@vger.kernel.org, drbd-dev@lists.linbit.com, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs <linux-nilfs@vger.kernel.org>, ntfs3@lists.linux.dev, 
	ocfs2-devel@oss.oracle.com, Linux MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 6, 2022 at 11:05 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Add a helper to query the number of sectors support per each discard bio
> based on the block device and use this helper to stop various places from
> poking into the request_queue to see if discard is supported and if so how
> much.  This mirrors what is done e.g. for write zeroes as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
...
> diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
> index 16e775bcf4a7c..7d510e4231713 100644
> --- a/drivers/target/target_core_device.c
> +++ b/drivers/target/target_core_device.c
> @@ -829,9 +829,7 @@ struct se_device *target_alloc_device(struct se_hba *hba, const char *name)
>  }
>
>  /*
> - * Check if the underlying struct block_device request_queue supports
> - * the QUEUE_FLAG_DISCARD bit for UNMAP/WRITE_SAME in SCSI + TRIM
> - * in ATA and we need to set TPE=1

> + * Check if the underlying struct block_device request_queue supports disard.
>   */

Here was a typo:

 s/disard/discard/

On Thu, Apr 7, 2022 at 12:19 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> If I'm misreading things, could you please document that
> bdev_max_discard_sectors() != 0 implies that discard is supported?

I got the same impression.   Checking the discard support with
bdev_max_discard_sectors() != 0 seems a bit unclear than before.

Thanks,
Ryusuke Konishi

