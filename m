Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0550F1A0FB3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 16:55:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLpcR-0002zQ-U8; Tue, 07 Apr 2020 14:54:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A3/I=5X=amazon.com=prvs=3592f0f2d=apanyaki@srs-us1.protection.inumbo.net>)
 id 1jLpay-0002yC-CT
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 14:52:56 +0000
X-Inumbo-ID: 76a93d54-78df-11ea-80e0-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76a93d54-78df-11ea-80e0-12813bfff9fa;
 Tue, 07 Apr 2020 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1586271176; x=1617807176;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=fuZU/PcKM2BThpIUfo8RBS5NjdqgDeyPc6BFhgapiCU=;
 b=HsKEHpLS44NI1eI+UVX+8MfmJ1hOBHaC9yA4XknAuc7uc2DNng0sYboD
 gpOGDhiR8aSx8yprejKt85CMFEagQk7+QmzEGsQQeaS0Rsec4W7MBws4y
 2xllXI97lF0KYn4vzimydOXuHBLvB6EBkNLq+LDMZ5aKGaoW01/XVV/jX E=;
IronPort-SDR: aOF8GNGFw8FJ12itdCObFyLqHsXurAEtRUloY3kX6AteniGjd0hxc58L2YtIl8c2nxViRK4Nxu
 zpwIMMdSBCMg==
X-IronPort-AV: E=Sophos;i="5.72,354,1580774400"; d="scan'208";a="24488295"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 07 Apr 2020 14:52:43 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4DA4A285250; Tue,  7 Apr 2020 14:52:41 +0000 (UTC)
Received: from EX13D08UEB004.ant.amazon.com (10.43.60.142) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 7 Apr 2020 14:52:41 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEB004.ant.amazon.com (10.43.60.142) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 7 Apr 2020 14:52:41 +0000
Received: from dev-dsk-apanyaki-1a-fc7fd022.eu-west-1.amazon.com
 (10.15.114.143) by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Tue, 7 Apr 2020 14:52:41 +0000
Received: by dev-dsk-apanyaki-1a-fc7fd022.eu-west-1.amazon.com (Postfix,
 from userid 9665405)
 id E1BC926074; Tue,  7 Apr 2020 14:52:40 +0000 (UTC)
From: Andrew Panyakin <apanyaki@amazon.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH] libxc/migration: Abort migration on precopy policy request
Date: Tue, 7 Apr 2020 14:52:22 +0000
Message-ID: <eb85d7fee920b54eea3b4c0e77ab40593613ccc4.1586270820.git.apanyaki@amazon.com>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-Mailman-Approved-At: Tue, 07 Apr 2020 14:54:26 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Panyakin <apanyaki@amazon.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

libxc defines XGS_POLICY_ABORT for precopy policy to signal that migration
should be aborted (eg. if the estimated pause time is too huge for the
instance). Default simple precopy policy never returns that, but it could be
overriden with a custom one.

Signed-off-by: Andrew Panyakin <apanyaki@amazon.com>
---
 tools/libxc/xc_sr_save.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/libxc/xc_sr_save.c b/tools/libxc/xc_sr_save.c
index fa736a311f..507274ce22 100644
--- a/tools/libxc/xc_sr_save.c
+++ b/tools/libxc/xc_sr_save.c
@@ -560,6 +560,12 @@ static int send_memory_live(struct xc_sr_context *ctx)
 
     }
 
+    if ( policy_decision == XGS_POLICY_ABORT ) {
+        PERROR("Abort precopy loop");
+        rc = -1;
+        goto out;
+    }
+
  out:
     xc_set_progress_prefix(xch, NULL);
     free(progress_str);
-- 
2.16.6


