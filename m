Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D62AF199
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 14:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24747.52145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcpqI-0008IR-90; Wed, 11 Nov 2020 13:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24747.52145; Wed, 11 Nov 2020 13:07:18 +0000
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
	id 1kcpqI-0008I1-5i; Wed, 11 Nov 2020 13:07:18 +0000
Received: by outflank-mailman (input) for mailman id 24747;
 Wed, 11 Nov 2020 13:07:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Mnv=ER=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kcpqG-0008Hv-S6
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:07:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e955726d-4b3e-459d-917f-8f9d0f91a727;
 Wed, 11 Nov 2020 13:07:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68451AD77;
 Wed, 11 Nov 2020 13:07:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8Mnv=ER=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kcpqG-0008Hv-S6
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:07:16 +0000
X-Inumbo-ID: e955726d-4b3e-459d-917f-8f9d0f91a727
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e955726d-4b3e-459d-917f-8f9d0f91a727;
	Wed, 11 Nov 2020 13:07:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 68451AD77;
	Wed, 11 Nov 2020 13:07:14 +0000 (UTC)
Subject: Re: [PATCH 04/24] sd: update the bdev size in sd_revalidate_disk
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
References: <20201111082658.3401686-1-hch@lst.de>
 <20201111082658.3401686-5-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <59f175cf-4a67-7ebc-6f72-cfd28fafa2a9@suse.de>
Date: Wed, 11 Nov 2020 14:07:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111082658.3401686-5-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/11/20 9:26 AM, Christoph Hellwig wrote:
> This avoids the extra call to revalidate_disk_size in sd_rescan and
> is otherwise a no-op because the size did not change, or we are in
> the probe path.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---
>   drivers/scsi/sd.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers.

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

