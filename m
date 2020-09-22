Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E774273FF2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 12:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKfuX-00021O-Sg; Tue, 22 Sep 2020 10:52:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKfuW-00021J-KZ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 10:52:36 +0000
X-Inumbo-ID: a7972d5d-168f-432e-b27b-5e49e6d4f801
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7972d5d-168f-432e-b27b-5e49e6d4f801;
 Tue, 22 Sep 2020 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600771954; x=1632307954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aiJBVDikZ4ujUlt8UYpyM0mSMq9hUSVyyV0F7i7fx80=;
 b=XamNyr8kirR6iRmOpDlpWgrcFl7B/x7UkmVcjA0oyazYxUqMIciuOfeZ
 Bs3JnbSod+IecvhCEfhS9DLDQ91YuUAeH7r8pmsiWQ0K4+sTIKtd2QTkn
 atqJCEH4/c0W/MAzqr0UNK/ii3ZnvBOSA/1pci/HuAqip1IE2HU8dV/2d w=;
X-IronPort-AV: E=Sophos;i="5.77,290,1596499200"; d="scan'208";a="55547558"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 22 Sep 2020 10:52:34 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id CB54FA05DE; Tue, 22 Sep 2020 10:52:31 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.35) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 10:52:26 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] xen-blk(back|front): Let users disable persistent
 grants
Date: Tue, 22 Sep 2020 12:52:06 +0200
Message-ID: <20200922105209.5284-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.162.35]
X-ClientProxiedBy: EX13D14UWB003.ant.amazon.com (10.43.161.162) To
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

    $ git clone git://github.com/sjp38/linux -b pgrants_disable_v2

The web is also available:
https://github.com/sjp38/linux/tree/pgrants_disable_v2

Patch History
=============

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

 .../ABI/testing/sysfs-driver-xen-blkback      |  9 ++++++
 .../ABI/testing/sysfs-driver-xen-blkfront     | 11 +++++++-
 drivers/block/xen-blkback/xenbus.c            | 28 ++++++++++++++-----
 drivers/block/xen-blkfront.c                  | 28 +++++++++++++------
 4 files changed, 60 insertions(+), 16 deletions(-)

-- 
2.17.1


