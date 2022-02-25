Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9964C480D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 15:55:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279170.476747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbzV-0004Ia-FJ; Fri, 25 Feb 2022 14:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279170.476747; Fri, 25 Feb 2022 14:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbzV-0004Fj-CF; Fri, 25 Feb 2022 14:54:41 +0000
Received: by outflank-mailman (input) for mailman id 279170;
 Fri, 25 Feb 2022 14:54:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNbzT-0004Fd-OZ
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 14:54:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9ae8d33-964a-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 15:54:38 +0100 (CET)
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
X-Inumbo-ID: d9ae8d33-964a-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645800878;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IaJt2L4vKz2TOg5dOyMZ7VgsPRoU2r5KtiivYrAd/QY=;
  b=OHd5L1wlC8QXB6wHy5hXJj3/l0sZEquEWuMvdO6BtOo0+je6nisWL5XM
   DYNA72pKX0R9wrEbfGOmqmbif0fP39nT+KLD0jvV4jfMkthkNGMUwnHsP
   vTdz8RUIBHS7yycYgs91McNMIisc6MS//5hirT8mZI/UTjC53crdgMIfV
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64888347
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wpOJKqy3ZWvQLAgsSCp6t+cbxirEfRIJ4+MujC+fZmUNrF6WrkUAz
 DAXDWmBafeLZjDzetpwOtnj/UwE6JHXx4AyGwNrqSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYy24XhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliIOfaAADOb31nacSXkQBPghVepFG9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AO
 5pJOWEzM3wsZTUfFEVQDZckv9vyi1TlVgVqsX6zgK4otj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3ErvDLtTP2XsQVDrLQ3vx3hFyewEQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qg6Zi1qhm1KREQbmAPOHYpZCBC39ns9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZROdb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQI+d3XC3270k5JGQWy2yGsvTKuOGpxZEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPsUuKFbboXk2PRb4M4XRfK4Ey/BX1
 XCzK5vEMJrnIf4/kGreqxk1i9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 SnsChcFkwOk3RUq62yiMxheVV8mZr4nxVpTAMDmFQ/AN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:Y7l/S6/BNp3+5YPZcABuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+MjztCWE7gr5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslrd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64888347"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] build: fix auto defconfig rule
Date: Fri, 25 Feb 2022 14:54:08 +0000
Message-ID: <20220225145409.41323-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We should only run "defconfig" if ".config" is missing. Commit
317c98cb91 have added a dependency on "tools/fixdep", so make would
start runnning "defconfig" also when "tools/fixdep" is newer than
".config" and thus overwrite any changes made by a developer.
Reintroduce intended behavior of the rule to only generate a default
Kconfig when ".config" is missing.

Fixes: 317c98cb91 ("build: hook kconfig into xen build system")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 133b382f86..ed4891daf1 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -243,15 +243,10 @@ ifeq ($(need-config),y)
 # changes are detected.
 -include include/config/auto.conf.cmd
 
-# This allows make to build fixdep before invoking defconfig. We can't use
-# "tools_fixdep" which is a .PHONY target and would force make to call
-# "defconfig" again to update $(KCONFIG_CONFIG).
-tools/fixdep:
-	$(Q)$(MAKE) $(build)=tools tools/fixdep
-
 # Allow people to just run `make` as before and not force them to configure
-$(KCONFIG_CONFIG): tools/fixdep
-	$(Q)$(MAKE) $(build)=tools/kconfig defconfig
+# Only run defconfig if $(KCONFIG_CONFIG) is missing
+$(KCONFIG_CONFIG): tools_fixdep
+	$(if $(wildcard $@), , $(Q)$(MAKE) $(build)=tools/kconfig defconfig)
 
 # The actual configuration files used during the build are stored in
 # include/generated/ and include/config/. Update them if .config is newer than
-- 
Anthony PERARD


