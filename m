Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ABA39D3CB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 06:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137432.254991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq6bu-0002B2-PD; Mon, 07 Jun 2021 04:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137432.254991; Mon, 07 Jun 2021 04:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq6bu-00027S-LV; Mon, 07 Jun 2021 04:11:34 +0000
Received: by outflank-mailman (input) for mailman id 137432;
 Sun, 06 Jun 2021 15:59:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5un=LA=infradead.org=geoff@srs-us1.protection.inumbo.net>)
 id 1lpvB7-0001yb-Ic
 for xen-devel@lists.xenproject.org; Sun, 06 Jun 2021 15:59:10 +0000
Received: from desiato.infradead.org (unknown
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6bf7a5a-00e5-4bc6-9aa9-539c8a46ee35;
 Sun, 06 Jun 2021 15:59:07 +0000 (UTC)
Received: from [2602:306:c5a2:a380:d04c:9a1:1990:7d22]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpvAk-0044Sh-0J; Sun, 06 Jun 2021 15:58:53 +0000
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
X-Inumbo-ID: b6bf7a5a-00e5-4bc6-9aa9-539c8a46ee35
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xdRwc0+fblxjQWSVfAPrq01sy/g65/LWQdwS7diPzUY=; b=RvNcIfOg5he7n2s7JHDwQwMsUb
	CcsUaraj9QikvzUVMg5uaZVxCkfUMNQpaQoSlSwpFt8En2sRCM3NnRZMB+TpNhFzfHmMKG/4QmVWD
	gCRylCpd2RxMohedFycN/JmPwi64URVSbmxExLKam6OQFwHVi2N5sD9jwXDe8EtAAA/oB8PR9GaaH
	81bj3Hi0GApRdsWIMvWsT4imii1ALjOAkwG/eKwvQ5JhVh4A9McAwOX5gB0KW+xEHm5Q+zGPNdNaj
	3+RxDUZtyJrK0//PQYuM0gsnGyORNLu/D139Iz76bmVhQgjZJrrEjMdarouhAZYzFh+UMlCC+cVvz
	GBTLTYTQ==;
Subject: Re: [PATCH 10/30] ps3disk: use blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>,
 Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
 Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal"
 <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-11-hch@lst.de>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <c9d63809-a7cc-8907-6065-f14add05a5dc@infradead.org>
Date: Sun, 6 Jun 2021 08:58:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602065345.355274-11-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Christoph,

On 6/1/21 11:53 PM, Christoph Hellwig wrote:
> Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
> allocation.
> 
>  drivers/block/ps3disk.c | 36 ++++++++++++++----------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)

I tested your alloc_disk-part2 branch on PS3, and it seemed to be working OK.

Tested-by: Geoff Levand <geoff@infradead.org>

