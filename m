Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFD99033BF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 09:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737941.1144465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvzg-00034O-UZ; Tue, 11 Jun 2024 07:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737941.1144465; Tue, 11 Jun 2024 07:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvzg-00032L-RZ; Tue, 11 Jun 2024 07:32:36 +0000
Received: by outflank-mailman (input) for mailman id 737941;
 Tue, 11 Jun 2024 07:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGvzf-00032F-K6
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 07:32:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3dc4308-27c4-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 09:32:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32D5260C47;
 Tue, 11 Jun 2024 07:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0F2C2BD10;
 Tue, 11 Jun 2024 07:32:27 +0000 (UTC)
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
X-Inumbo-ID: c3dc4308-27c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718091151;
	bh=AF+zG6ZFufj7ktoeAMS7+47wp+ON6l7hR24Gr5fCwt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SPZjzavtcTKyCdC4WGEmHFxtV9LSffVVHpZkghrgh94KIDRkU8Rgia29Z6gttxoe9
	 zOX7C6t8muRYmEJZDxtGZLcKQdFby+uhJ+qwHFKzMHofsRuUcCtmhO2REjHrW7IVjC
	 7C0j0tRe+awY6OwUGv767JT4KMLbYhYrBxC1MF4vQdaDAWH1YkqCVa5cS1IpTDl7jQ
	 DwpBzOgI8vuLSRr2nP+6MuC1MYxBAnJs8yxlw2hav/xabgNZGi1G1i8tZ6aqMjzXS4
	 h+CSlB5tmAFTFG1Iuv9NHsTDXLnN731DIz3tGAdH8iuIjAV/89MvaPrp5ZojK8LhAf
	 PBu9mWf+fZU2w==
Message-ID: <77ea357f-f73f-4524-8995-ed204d5f3431@kernel.org>
Date: Tue, 11 Jun 2024 16:32:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/26] block: freeze the queue in queue_attr_store
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
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-12-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> queue_attr_store updates attributes used to control generating I/O, and
> can cause malformed bios if changed with I/O in flight.  Freeze the queue
> in common code instead of adding it to almost every attribute.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


