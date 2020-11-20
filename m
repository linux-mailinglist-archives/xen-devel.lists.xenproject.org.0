Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18E42BA346
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 08:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31629.62174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg0w8-0003YC-R7; Fri, 20 Nov 2020 07:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31629.62174; Fri, 20 Nov 2020 07:34:28 +0000
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
	id 1kg0w8-0003Xm-NY; Fri, 20 Nov 2020 07:34:28 +0000
Received: by outflank-mailman (input) for mailman id 31629;
 Fri, 20 Nov 2020 07:34:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kg0w7-0003Xe-9z
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:34:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65a688bc-0eb4-4b8c-96ae-e5078c31160c;
 Fri, 20 Nov 2020 07:34:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2EBBAB3D;
 Fri, 20 Nov 2020 07:34:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kg0w7-0003Xe-9z
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:34:27 +0000
X-Inumbo-ID: 65a688bc-0eb4-4b8c-96ae-e5078c31160c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 65a688bc-0eb4-4b8c-96ae-e5078c31160c;
	Fri, 20 Nov 2020 07:34:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C2EBBAB3D;
	Fri, 20 Nov 2020 07:34:25 +0000 (UTC)
Subject: Re: [PATCH 58/78] init: cleanup match_dev_by_uuid and
 match_dev_by_label
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
 <20201116145809.410558-59-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1742f81b-32e5-4bff-e10c-2c547ee345b6@suse.de>
Date: Fri, 20 Nov 2020 08:34:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-59-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> Avoid a totally pointless goto label, and use the same style of
> comparism for both helpers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   init/do_mounts.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

