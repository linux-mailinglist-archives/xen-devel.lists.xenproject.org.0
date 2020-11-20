Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BC92BA366
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 08:35:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31634.62186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg0xF-0003h7-61; Fri, 20 Nov 2020 07:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31634.62186; Fri, 20 Nov 2020 07:35:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg0xF-0003gi-2d; Fri, 20 Nov 2020 07:35:37 +0000
Received: by outflank-mailman (input) for mailman id 31634;
 Fri, 20 Nov 2020 07:35:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kg0xE-0003gb-4m
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:35:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73902ba2-db38-4ab9-9522-1e2dd30dddb2;
 Fri, 20 Nov 2020 07:35:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7837DAB3D;
 Fri, 20 Nov 2020 07:35:34 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kg0xE-0003gb-4m
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:35:36 +0000
X-Inumbo-ID: 73902ba2-db38-4ab9-9522-1e2dd30dddb2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 73902ba2-db38-4ab9-9522-1e2dd30dddb2;
	Fri, 20 Nov 2020 07:35:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7837DAB3D;
	Fri, 20 Nov 2020 07:35:34 +0000 (UTC)
Subject: Re: [PATCH 59/78] mtip32xx: remove the call to fsync_bdev on removal
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20201116145809.410558-1-hch@lst.de>
 <20201116145809.410558-60-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <5ee8dd18-f420-280c-84b9-78b70f528e26@suse.de>
Date: Fri, 20 Nov 2020 08:35:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-60-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> del_gendisk already calls fsync_bdev for every partition, no need
> to do this twice.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/block/mtip32xx/mtip32xx.c | 15 ---------------
>   drivers/block/mtip32xx/mtip32xx.h |  2 --
>   2 files changed, 17 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

