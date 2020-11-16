Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD89E2B46C0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 15:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28007.56618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kefyG-0007DB-3y; Mon, 16 Nov 2020 14:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28007.56618; Mon, 16 Nov 2020 14:59:08 +0000
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
	id 1kefyF-0007CT-Vn; Mon, 16 Nov 2020 14:59:07 +0000
Received: by outflank-mailman (input) for mailman id 28007;
 Mon, 16 Nov 2020 14:59:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kefyE-0006ni-07
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 14:59:06 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0e63f5c-7dce-4c65-82c8-47305c904e09;
 Mon, 16 Nov 2020 14:58:36 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefxK-0003iO-GD; Mon, 16 Nov 2020 14:58:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kefyE-0006ni-07
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 14:59:06 +0000
X-Inumbo-ID: e0e63f5c-7dce-4c65-82c8-47305c904e09
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e0e63f5c-7dce-4c65-82c8-47305c904e09;
	Mon, 16 Nov 2020 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dr8Nr8dbB7J11PqXo+7/b7tximxSHcvF1HcCKGt1IiI=; b=TpTZ5F4/AmdsxM2Cu94cy7eEas
	3X7DT8n5Y9HTYUNPKGh1eqWOrzm0xYcV10TWm7qZ2DAYxl9FZdzB5TSQwbJco0DGEH8GHNaKj4/uO
	UapJemi5kTz7ILke6BFMPk1Qp+enisOjgnM5WI66jPW/Vmd0viYdg1qSGiqiQimTL89OKOdtd5INW
	I0maxo/xPZ0nKatsoAF7NrHgoNRWlnrSm1gKMxhQmVA8vJCsPu08PgWB0cu99api4IM/dOgYmUa59
	BLoaxWXKPrvz0+ejgB6cVN2tLjQDwxy7EgSet0pUC1cws2cyKk57iZ+SQrQfZqgWnLnZ1UKD1blpx
	ffC4VyOw==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxK-0003iO-GD; Mon, 16 Nov 2020 14:58:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: cleanup updating the size of block devices v3
Date: Mon, 16 Nov 2020 15:56:51 +0100
Message-Id: <20201116145809.410558-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Hi Jens,

this series builds on top of the work that went into the last merge window,
and make sure we have a single coherent interfac for updating the size of a
block device.

Changes since v2:
 - rebased to the set_capacity_revalidate_and_notify in mainline
 - keep the loop_set_size function
 - fix two mixed up acks
 
Changes since v1:
 - minor spelling fixes


