Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCAF275146
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 08:19:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKy7R-00070n-DH; Wed, 23 Sep 2020 06:19:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0zQO=DA=amazon.com=prvs=5281df109=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKy7Q-00070i-Ao
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 06:19:08 +0000
X-Inumbo-ID: c72d138c-31dd-4152-8458-9d1cf4bce7ec
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c72d138c-31dd-4152-8458-9d1cf4bce7ec;
 Wed, 23 Sep 2020 06:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600841947; x=1632377947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hhec5BYj6RypLE3xumu+lmtnfCoV4fVGGtCtUQZxGR8=;
 b=mrhkeExxT6f1G1EdeNyOUezHVTAFBy7jslRDHxS9yg+BoJUM83r7ZanV
 4yGOo6lB/8PzZdMcth/uDxqajCw6tQSltNF5SNVtA/LSBcssIYJB2tu7h
 dzEhCLpfMji7XLUaYYa2J0uk22Le8bq+S5bp1lNsdismYpR09l4KEgvbL E=;
X-IronPort-AV: E=Sophos;i="5.77,293,1596499200"; d="scan'208";a="57152334"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 23 Sep 2020 06:19:06 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1BB94A1C8B; Wed, 23 Sep 2020 06:19:03 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.85) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 23 Sep 2020 06:18:57 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/3] xen-blk(back|front): Let users disable persistent
 grants
Date: Wed, 23 Sep 2020 08:18:38 +0200
Message-ID: <20200923061841.20531-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.162.85]
X-ClientProxiedBy: EX13D10UWB001.ant.amazon.com (10.43.161.111) To
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

    $ git clone git://github.com/sjp38/linux -b pgrants_disable_v4

The web is also available:
https://github.com/sjp38/linux/tree/pgrants_disable_v4

Patch History
=============

Changes from v3
(https://lore.kernel.org/xen-devel/20200922141549.26154-2-sjpark@amazon.com/)
- Remove unnecessary ternary operation (Jürgen Groß)
- Add 'Reviewed-by: Juergen Gross <jgross@suse.com>' and
  'Acked-by: Roger Pau Monné <roger.pau@citrix.com>'

Changes from v2
(https://lore.kernel.org/linux-block/20200922105209.5284-1-sjpark@amazon.com/)
- Avoid a race condition (Roger Pau Monné)

Because the option value is written twice, there could be a race if the
user change the value meanwhile.  This version fixes the problem by
reading the value once when each (front|back)end is created.

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


