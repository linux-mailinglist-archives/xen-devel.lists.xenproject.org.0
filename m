Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A36229AF1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 17:05:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyGIH-000307-5h; Wed, 22 Jul 2020 15:04:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhkO=BB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyGIF-000302-I8
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 15:04:27 +0000
X-Inumbo-ID: a21124d4-cc2c-11ea-8671-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a21124d4-cc2c-11ea-8671-bc764e2007e4;
 Wed, 22 Jul 2020 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595430266;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AAYgqcoBKRpjicWNLL2x+rmBBqlt7sp1c23H5SA5FRk=;
 b=f2M26DEInanHhYAt3ubGTjox4TUTONeQ0pSNgd1K5UMBt1HaOG1E+dqw
 MM34vZ74lD915uMU1ddOy/aFlwpZwiOi3inplUJgp0PVPyhUrvpRziZLh
 BsNyfV8d038P9XZge/E4UGRi54wCDv/u9n9hhDGJh3yVkad/WbWDjGoGz U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QBJIqwwCAVxw12ZjB8qq92pHnmk5JxWTpQj34ml8uEHJVbUTebKP6FIEjDzyDHTc5XYf12bxsc
 L/9WK684fTimt3fuRogTaVFvwjdzDJeZUKYLY1JoyNNz5zQ3nAuwzHQ/D06Kkk33FBPCHqUjYy
 h2EB9umLWtYRjwRZFRmzCdOKsDw68QoBwi6eTuRKw1zBJg1qFd7JcQZkLb1ub5jeBBFoMVcbzX
 kvVFQ0+e0nwctdF3tXYfCJbzKJyZhSlQ6rpemWFDQM/+HoSKviN99+1dq8pZQMcUAQvgX6nDYi
 VuQ=
X-SBRS: 2.7
X-MesageID: 22950706
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,383,1589256000"; d="scan'208";a="22950706"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [osstest PATCH] dom0pvh: assign 1GB of memory to PVH dom0
Date: Wed, 22 Jul 2020 17:04:16 +0200
Message-ID: <20200722150416.36426-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Current tests use 512MB of memory for dom0, but that's too low for a
PVH dom0 on some hosts and will cause errors because memory is
ballooned out in order to obtain physical memory ranges to map foreign
pages.

Using ballooned out pages for foreign mappings also doesn't seem to
work properly with the current Linux kernel version, so increase the
memory assigned to dom0 to 1GB for PVH dom0 tests. We should see about
reverting this when using ballooned pages is fixed.

The runvar diff is:

+test-amd64-amd64-dom0pvh-xl-amd   dom0_mem 1024
+test-amd64-amd64-dom0pvh-xl-intel dom0_mem 1024

I've done a repro of the failed test on elbling0 with dom0_mem set to
1GB and it seems to prevent the issue, the flight is 152111.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 make-flight | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/make-flight b/make-flight
index b8942c1c..85559c68 100755
--- a/make-flight
+++ b/make-flight
@@ -903,7 +903,7 @@ test_matrix_do_one () {
       job_create_test test-$xenarch$kern-$dom0arch-dom0pvh-xl-$cpuvendor \
                 test-debian xl $xenarch $dom0arch $debian_runvars \
                 all_hostflags=$most_hostflags,hvm-$cpuvendor,iommu \
-                xen_boot_append='dom0=pvh,verbose'
+                xen_boot_append='dom0=pvh,verbose' dom0_mem=1024
 
     done
 
-- 
2.27.0


