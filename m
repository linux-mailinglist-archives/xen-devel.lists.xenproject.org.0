Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B79044FD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 21:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738730.1145589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH7J2-00079u-Bz; Tue, 11 Jun 2024 19:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738730.1145589; Tue, 11 Jun 2024 19:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH7J2-00078P-99; Tue, 11 Jun 2024 19:37:20 +0000
Received: by outflank-mailman (input) for mailman id 738730;
 Tue, 11 Jun 2024 19:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7IT=NN=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sH7J0-00078F-Sb
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 19:37:18 +0000
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01f8ffc0-282a-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 21:37:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 009.lax.mailroute.net (Postfix) with ESMTP id 4VzJpg3N77zlgMVP;
 Tue, 11 Jun 2024 19:37:15 +0000 (UTC)
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id I78Iw22WN8VT; Tue, 11 Jun 2024 19:37:06 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4VzJpL0wGgzlgMVN;
 Tue, 11 Jun 2024 19:36:57 +0000 (UTC)
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
X-Inumbo-ID: 01f8ffc0-282a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1718134626; x=1720726627; bh=nxeAEPoRIF1w17Vf6H50avwR
	d47tQeq24V55mlSo6Fo=; b=n4YdDdBfOscNrfscK2NP2xV4LYi1o1AdP30LHl21
	+IbqLgtMyNqee6SbzA50sLVTZE0Ji6k+2w0WLmPh57DienJvg5IuAQuKYp0InUsK
	R6rrYr54yHJbztT/cndM4ZANOd0BSHTpKcctiVeFtmZFjzrLeHPbM9VtSJmKwf7X
	Af8olT+2oDMLUTt1MIpMS3WiRglrB6WCMiAEgpmD+A4upmkHshWHc+3fJHBYgE5i
	tD5snqlsdZGaJP09e2u2aXuuDiqbxQTmEF2zfjaEm7Jr+gWSnF6gfshEHOyMC1oC
	wY6QiEq3x8Ed+pcVJd6N4WwEZhVXh/S1bVC6eE1yI7Gx6w==
X-Virus-Scanned: by MailRoute
Message-ID: <1f7c1123-0f80-42a4-8252-c082ded33ca6@acm.org>
Date: Tue, 11 Jun 2024 12:36:55 -0700
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
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240611051929.513387-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/24 10:19 PM, Christoph Hellwig wrote:
> queue_attr_store updates attributes used to control generating I/O, and
> can cause malformed bios if changed with I/O in flight.  Freeze the queue
> in common code instead of adding it to almost every attribute.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

