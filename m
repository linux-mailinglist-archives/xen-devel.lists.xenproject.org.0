Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB24F58D6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 11:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299737.510931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1nE-0006CF-9t; Wed, 06 Apr 2022 09:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299737.510931; Wed, 06 Apr 2022 09:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1nE-00069z-6V; Wed, 06 Apr 2022 09:17:36 +0000
Received: by outflank-mailman (input) for mailman id 299737;
 Wed, 06 Apr 2022 08:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bahK=UQ=opensource.wdc.com=prvs=0880ca2a2=damien.lemoal@srs-se1.protection.inumbo.net>)
 id 1nc1PE-0001DU-Nx
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 08:52:49 +0000
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec36459d-b586-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 10:52:45 +0200 (CEST)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 16:52:42 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 01:24:14 -0700
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 01:52:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYJDp38s7z1SVp4
 for <xen-devel@lists.xenproject.org>; Wed,  6 Apr 2022 01:52:42 -0700 (PDT)
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id afeRwg43Rmk2 for <xen-devel@lists.xenproject.org>;
 Wed,  6 Apr 2022 01:52:41 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYJDg4WyPz1Rvlx;
 Wed,  6 Apr 2022 01:52:35 -0700 (PDT)
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
X-Inumbo-ID: ec36459d-b586-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649235165; x=1680771165;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LFM3dJ4XtmmQmpjm/ADKwYliPf/iPacGMSt9/3x5IFU=;
  b=To2eUsYgSjtDKL6zkmIlY7240wBKe0iYsCwy244hJP+Nx48QdTRKAG5L
   m9yi8n9Vtge2WwIRlF/EU/tVZd04noO4D87Lz7PjmZJdBzX7X0JvhNEOE
   EgMzfx4Sw9VO3KZpeqy4Mqk1eBOUzoNBuErJPzJ2sSTAwOlYOl8Angwmd
   3JiQjnOHmH9hdGlZxdTXVk4BkWLM20hVu8+Cijwme1w5MgSf4edBcfJ0a
   x9z3kcfDHm+mn2TxvqQmXkbr3DWYYheTvYAsSZzXsXduw+zmoeSJWR5da
   xMbuMfvnay8NapXqswklXe70Y/p2tMhg9j7z2INfHsErVfM4dWcGlIoPH
   g==;
X-IronPort-AV: E=Sophos;i="5.90,239,1643644800"; 
   d="scan'208";a="309182688"
IronPort-SDR: lGT9/VEI4pUcLf5qk9m6R7vaS3dsKaEeOhk0aElos1OnfZ4eCV2Mewoh5mWVOxiabUCxlkpIrJ
 i5Hg6059tt4xBV5hn0EQCfq9EwzcjBUD2bHQrfw/ZCBJ4WklJEX3o5bQELyarhFj88IB6cLHfp
 RqlIwS0IoGYWOZh5SvzvywConV2n0380LD7FEY1wmLYWYn+XFMpbdJsXFKOFrQ2OmIALopXPK4
 ureIrTKERbeHqJEPLclsXMlClgWXPGAyIZQ8PdaUKp+uoBpWObgqkBMiUzSbNrpjKjwa3gP0fa
 NBtDoxzIR8lhMIeQkUqYSEst
IronPort-SDR: /dFAJZKbp71So4RxLkGMSmVi+hD6lLeKyv2tOnheSp+mXDVkTeeyg/Ghik+iD15anKtFuxH9GG
 0XVlrNL4QmX3jWbS1yyjOVRRye8u6kwbKjY8pNd/q7vZ6Bhvcmh/xGvmKy40Et9KcI9sHmK8qF
 sqABY2VkYJw9VISXgdMYnD3Q8+EUb4axtY6g9s0ec64kVPICbyFMkUVe3cVlC0nKvv+TcHNyN2
 jMA6MYLJgKs54mqXgiYwyoEw9ASNazIjYgyaTtoveznL5ipeumi8eSnjob/s2d3Q/ksXukd9oB
 EO4=
WDCIronportException: Internal
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1649235161; x=1651827162; bh=LFM3dJ4XtmmQmpjm/ADKwYliPf/iPacGMSt
	9/3x5IFU=; b=qvkCgjbtXOykeK3hzZNeB4nFZLJBLeVyzVQiFxPBd+c54HMRQrR
	r3mHxfVWNdkNw5DIJA4fgfkXPh93epK0mDoQ3kgu2fpFkbSa8brjeKFgTDNdjUXK
	QEdaChXXlXS0VTxT7h9gL19ju3gtHs6R6Mypq0Cc5OI+h1pEURz6XYf1UQ1mcqds
	uMy2QNMB1cQhY28LO46skbuCxOrF4i88P2mQlM7t3vtuiUBfVFmxO2ZMvku2/0fT
	GRED3B4iBwE6imVQ9DU7YD88eHs1K7YN6+E1hQRftlmDiNgCGpghEuxtQnop4vN/
	eOwwsoVyhIxEYaxD0ZFdcLlRFvL5b8ALceg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Message-ID: <ea3d14cb-00ea-8d7b-4615-9347fdd7aa27@opensource.wdc.com>
Date: Wed, 6 Apr 2022 17:52:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 14/27] block: add a bdev_max_zone_append_sectors helper
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-15-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220406060516.409838-15-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/22 15:05, Christoph Hellwig wrote:
> Add a helper to check the max supported sectors for zone append based on
> the block_device instead of having to poke into the block layer internal
> request_queue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/target/zns.c | 3 +--
>   fs/zonefs/super.c         | 3 +--
>   include/linux/blkdev.h    | 6 ++++++
>   3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
> index e34718b095504..82b61acf7a72b 100644
> --- a/drivers/nvme/target/zns.c
> +++ b/drivers/nvme/target/zns.c
> @@ -34,8 +34,7 @@ static int validate_conv_zones_cb(struct blk_zone *z,
>   
>   bool nvmet_bdev_zns_enable(struct nvmet_ns *ns)
>   {
> -	struct request_queue *q = ns->bdev->bd_disk->queue;
> -	u8 zasl = nvmet_zasl(queue_max_zone_append_sectors(q));
> +	u8 zasl = nvmet_zasl(bdev_max_zone_append_sectors(ns->bdev));
>   	struct gendisk *bd_disk = ns->bdev->bd_disk;
>   	int ret;
>   
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 3614c7834007d..7a63807b736c4 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -678,13 +678,12 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
>   	struct inode *inode = file_inode(iocb->ki_filp);
>   	struct zonefs_inode_info *zi = ZONEFS_I(inode);
>   	struct block_device *bdev = inode->i_sb->s_bdev;
> -	unsigned int max;
> +	unsigned int max = bdev_max_zone_append_sectors(bdev);
>   	struct bio *bio;
>   	ssize_t size;
>   	int nr_pages;
>   	ssize_t ret;
>   
> -	max = queue_max_zone_append_sectors(bdev_get_queue(bdev));
>   	max = ALIGN_DOWN(max << SECTOR_SHIFT, inode->i_sb->s_blocksize);
>   	iov_iter_truncate(from, max);
>   
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index a433798c3343e..f8c50b77543eb 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1188,6 +1188,12 @@ static inline unsigned int queue_max_zone_append_sectors(const struct request_qu
>   	return min(l->max_zone_append_sectors, l->max_sectors);
>   }
>   
> +static inline unsigned int
> +bdev_max_zone_append_sectors(struct block_device *bdev)
> +{
> +	return queue_max_zone_append_sectors(bdev_get_queue(bdev));
> +}
> +
>   static inline unsigned queue_logical_block_size(const struct request_queue *q)
>   {
>   	int retval = 512;

Looks good.

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

