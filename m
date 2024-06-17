Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2272490A4C0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 08:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741756.1148481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5bi-0000Mb-KF; Mon, 17 Jun 2024 06:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741756.1148481; Mon, 17 Jun 2024 06:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5bi-0000Jb-Gu; Mon, 17 Jun 2024 06:12:46 +0000
Received: by outflank-mailman (input) for mailman id 741756;
 Mon, 17 Jun 2024 06:12:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOKI=NT=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sJ5bh-0000JV-UN
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 06:12:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 992bd30a-2c70-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 08:12:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C4E92CE0FD5;
 Mon, 17 Jun 2024 06:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722E5C2BD10;
 Mon, 17 Jun 2024 06:12:32 +0000 (UTC)
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
X-Inumbo-ID: 992bd30a-2c70-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718604757;
	bh=LrLZKWXkRakpWI4/ueXizJXAwKTR991d/slvg583xhg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nFz/S8PqJ0x5s3Ny5I2evBmJDaO2EaUIuiWjAdtRmCQ/A6QpvJbLmjC0Fw7IXR1VT
	 uSNeYADsaTVxJipaBcqAsdKPSVVmorISGDB8ghzkIoBVgWELX0vnHVqN5Xf3bgHIW/
	 Jd7IHk4xFBOBn5HxiZsiAifRO0y8cGSStiGE0NqqwYZj3htvKjZ9JxGjZyZWwJADfE
	 WIUuoyvXMEqafkiqyCnfGPuXY7GxfWhCoyjXAFv1xdeTp+IRRcD16/M5uHMReQAzrM
	 yLcLncP795V2wNVqCHkdUBLru1ejkUmD3WFgvqGfKNm1zjEea2esQdxNT2nTdM/0yi
	 xUG82No+arhQQ==
Message-ID: <e4ce83ca-160f-4dd9-984a-842b6cd2b5c0@kernel.org>
Date: Mon, 17 Jun 2024 15:12:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/26] sd: move zone limits setup out of
 sd_read_block_characteristics
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-4-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240617060532.127975-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/24 15:04, Christoph Hellwig wrote:
> Move a bit of code that sets up the zone flag and the write granularity
> into sd_zbc_read_zones to be with the rest of the zoned limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


