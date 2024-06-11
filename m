Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4D99044C3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 21:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738715.1145558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH7Eh-0005aM-GI; Tue, 11 Jun 2024 19:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738715.1145558; Tue, 11 Jun 2024 19:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH7Eh-0005Xz-Dl; Tue, 11 Jun 2024 19:32:51 +0000
Received: by outflank-mailman (input) for mailman id 738715;
 Tue, 11 Jun 2024 19:32:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7IT=NN=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sH7Ef-0005Xb-P8
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 19:32:49 +0000
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 615c8525-2829-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 21:32:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 009.lax.mailroute.net (Postfix) with ESMTP id 4VzJjV1BYPzlgMVP;
 Tue, 11 Jun 2024 19:32:46 +0000 (UTC)
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Y1jELP_gqM3e; Tue, 11 Jun 2024 19:32:38 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4VzJj93JfNzlgMVN;
 Tue, 11 Jun 2024 19:32:29 +0000 (UTC)
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
X-Inumbo-ID: 615c8525-2829-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1718134358; x=1720726359; bh=NinUkL0nGF4zzUpzdC8fXnN/
	I9QzcU4DY70U0/CiXlk=; b=tydEMcbkmjZvUgM3BMYGB8ptZaiX1xSWkqvzlXjS
	N+d6qsqQsAQuVet9UxqHiZLwEopChIDKNIIFy8hqfGJbWbRcsptm4r1eCxxBB7bS
	zJlCWiRgrj9C771wRVNgaqEgeb47b1UPK6RX0EWnJz2fmGzdd9Yle0FBhwOb2shG
	s5V6Vwq4SlacZgToBgTwE4ROC+lC73bVlCAAnBKs9iY/9mXR1a7bE0gFdSzJ8o4Z
	AAmvlaj1apsee5D+9h6qX3hN9wQGqsRU9xb9fn79I+qilXROStdod47NBQuzB6lE
	Cuk8ybjhW1/CdxDOGi4kQk7/IXQCqfKZONnPRP3FnS4gWw==
X-Virus-Scanned: by MailRoute
Message-ID: <69663f60-1d42-4f95-97cc-acb73ed5d7c8@acm.org>
Date: Tue, 11 Jun 2024 12:32:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/26] virtio_blk: remove virtblk_update_cache_mode
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
 <20240611051929.513387-9-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240611051929.513387-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/24 10:19 PM, Christoph Hellwig wrote:
> virtblk_update_cache_mode boils down to a single call to
> blk_queue_write_cache.  Remove it in preparation for moving the cache
> control flags into the queue_limits.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

