Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8CA27440B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:19:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKj8g-0003U4-E3; Tue, 22 Sep 2020 14:19:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKj8e-0003Ru-7k
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:19:24 +0000
X-Inumbo-ID: edb3353e-5ccd-4989-b7a4-9de620a21be2
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edb3353e-5ccd-4989-b7a4-9de620a21be2;
 Tue, 22 Sep 2020 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600784359; x=1632320359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OBQsZyJBuiCetLUlZLSO8CKNXhhvxT++kw73YrVj7g0=;
 b=eSzwF5Y5Qd0gYCwQqJ1ErVWP1mgfIh7cmeXjITq46JveSJt9N4ko9ihe
 BBgT/Nq1B3E07GeEZq0JyBXjdlmB7yGjack/UnFdnhys1dX8Aj0iqbaUY
 2vp7ZdlHQBJlr6GJsieYY2j6GD/eJk7iUmvOiW5YSGKKSThh1he4o4SOY Q=;
X-IronPort-AV: E=Sophos;i="5.77,291,1596499200"; d="scan'208";a="70117511"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 22 Sep 2020 14:16:13 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id DB8BCA215B; Tue, 22 Sep 2020 14:16:12 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.137) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 14:16:06 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] xen-blk(back|front): Let users disable persistent
 grants
Date: Tue, 22 Sep 2020 16:15:46 +0200
Message-ID: <20200922141549.26154-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.137]
X-ClientProxiedBy: EX13D12UWC001.ant.amazon.com (10.43.162.78) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: SeongJae Park <sjpark@amazon.de>

Persistent grants feature provides high scalability.  On some small
systems, however, it could incur data copy overheads[1] and thus it is
required to be disabled.  But, there is no option to disable it.  For
the reason, this commit adds module parameters for disabling of the
feature.

[1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability

Baseline and Complete Git Trees
===============================

The patches are based on the v5.9-rc6.  You can also clone the complete
git tree:

    $ git clone git://github.com/sjp38/linux -b pgrants_disable_v3

The web is also available:
https://github.com/sjp38/linux/tree/pgrants_disable_v3

Patch History
=============

Changes from v2
(https://lore.kernel.org/linux-block/20200922105209.5284-1-sjpark@amazon.com/)
- Avoid race conditions (Roger Pau Monné)

Changes from v1
(https://lore.kernel.org/linux-block/20200922070125.27251-1-sjpark@amazon.com/)
- use 'bool' parameter type (Jürgen Groß)
- Let blkfront can also disable the feature from its side
  (Roger Pau Monné)
- Avoid unnecessary xenbus_printf (Roger Pau Monné)
- Update frontend parameter doc


SeongJae Park (3):
  xen-blkback: add a parameter for disabling of persistent grants
  xen-blkfront: add a parameter for disabling of persistent grants
  xen-blkfront: Apply changed parameter name to the document

 .../ABI/testing/sysfs-driver-xen-blkback      |  9 ++++++++
 .../ABI/testing/sysfs-driver-xen-blkfront     | 11 +++++++++-
 drivers/block/xen-blkback/xenbus.c            | 22 ++++++++++++++-----
 drivers/block/xen-blkfront.c                  | 20 ++++++++++++-----
 4 files changed, 50 insertions(+), 12 deletions(-)

-- 
2.17.1


