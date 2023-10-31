Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABFC7DCDAB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625697.975238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxofD-0001tj-5G; Tue, 31 Oct 2023 13:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625697.975238; Tue, 31 Oct 2023 13:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxofD-0001rP-1Y; Tue, 31 Oct 2023 13:20:11 +0000
Received: by outflank-mailman (input) for mailman id 625697;
 Tue, 31 Oct 2023 13:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8KE=GN=citrix.com=prvs=661c0debb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qxofB-0001bo-RS
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:20:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35ecad8b-77f0-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 14:20:07 +0100 (CET)
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
X-Inumbo-ID: 35ecad8b-77f0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698758407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HDgQZiBDOWeiKil/jzTiLJs8a96nKVOORadMZobuEAk=;
  b=PrVh4nif38Bz7TY/iruczMZiEE1uErthb6k258jCtyhD8MUliGMjHKsk
   K8BT9V9cm95Z7Qy7VqmWAV1wdQ/IzDXUIwATFG0HmaSvHrWqKt6JCEyf0
   DLWQ9VQXizwEkI4aDSOQtOgVaud+AteWH3RWG/s3U0m3JBCYwqGbbwFmX
   A=;
X-CSE-ConnectionGUID: doa3TLBmT+eQnMIwQ1ipjg==
X-CSE-MsgGUID: 4xjpwq9wSqWWRP98Wj+azA==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127580572
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:k7lDg6PK5BLpJIDvrR2Xl8FynXyQoLVcMsEvi/4bfWQNrUojg2QFm
 GsfXziPMvyJM2b1eoh3PIWwoUME6sWHm9IwSwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5QVmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0upwCDpy0
 dYdFHMAVxampv2PmbOjSOY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEOHwwNHwsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4bVGJUNwxnCz
 o7A1zjpAAkFLY2A8iO6zUiU17/wn2DySqtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHr7m9WX+bsLCOoluaOzURLGIETT8JS00C+daLiKE+iAjeCOlqFqGdh8fwXzr3x
 li3QDMW3utJy5RRjuPioAGB3GrESoX1ohAd6gLeBV6BxAZFJ4OcYamJ9mGC7O5CI9PMJrWeh
 0Toi/Ry/chXU8Ddy3bWHbRWdF26z6zbamGC2zaDC7Fkp2z3pSP5FWxFyGsmTHqFJProbtMAj
 KX7kgRL7ZsbB2OwbKl4eOpd4OxxlvC/TLwJuh3OB+eig6Sdlyfdp0mCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1l3BglDuDGs+glUnPPV+iiJm9EOhtDbdzRrlkt/3sTPv9q
 L6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOK0aX/d/L7bZSiI/QTFJNhMk6e95E2CTt/gPx7igE
 7DUchMw9WcTclWecFzbMis4MOKHsFQWhStTABHA9G2AgxALCbtDJo9FLvPboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:kc1VBKBl84ho2V/lHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-Talos-CUID: =?us-ascii?q?9a23=3ApJliEWoBHMTOaGHmgF/xmn/mUcwieybh6F3VHwy?=
 =?us-ascii?q?1MGBMaaKsEF6I+qwxxg=3D=3D?=
X-Talos-MUID: 9a23:eZlXpQRHZYZHTOGARXSwlDN6K945/J+3N383qcRWhMvHPD5ZbmI=
X-IronPort-AV: E=Sophos;i="6.03,265,1694750400"; 
   d="scan'208";a="127580572"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18 1/3] CHANGELOG: Reformat
Date: Tue, 31 Oct 2023 13:19:52 +0000
Message-ID: <20231031131954.3310725-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
References: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Collect all x86 and ARM changes together instead of having them scattered.
Tweak grammar as necessary.

No change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 CHANGELOG.md | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 3ca796969990..edc0d69898ed 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -17,24 +17,27 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    Hotplug" for clarity
 
 ### Added
- - On x86, support for features new in Intel Sapphire Rapids CPUs:
-   - PKS (Protection Key Supervisor) available to HVM/PVH guests.
-   - VM-Notify used by Xen to mitigate certain micro-architectural pipeline
-     livelocks, instead of crashing the entire server.
-   - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
-     wide impact of a guest misusing atomic instructions.
- - xl/libxl can customize SMBIOS strings for HVM guests.
- - Add support for AVX512-FP16 on x86.
- - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
- - On Arm, add suport for Firmware Framework for Arm A-profile (FF-A) Mediator
-   (Tech Preview)
- - Add Intel Hardware P-States (HWP) cpufreq driver.
- - On Arm, experimental support for dynamic addition/removal of Xen device tree
-   nodes using a device tree overlay binary (.dtbo).
+ - On x86:
+   - xl/libxl can customize SMBIOS strings for HVM guests.
+   - Support for enforcing system-wide operation in Data Operand Independent
+     Timing Mode.
+   - Add Intel Hardware P-States (HWP) cpufreq driver.
+   - Support for features new in Intel Sapphire Rapids CPUs:
+     - PKS (Protection Key Supervisor) available to HVM/PVH guests.
+     - VM-Notify used by Xen to mitigate certain micro-architectural pipeline
+       livelocks, instead of crashing the entire server.
+     - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the
+       system wide impact of a guest misusing atomic instructions.
+   - Support for features new in Intel Granite Rapids CPUs:
+     - AVX512-FP16.
+ - On Arm:
+   - Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
+   - Add suport for Firmware Framework for Arm A-profile (FF-A) Mediator (Tech
+     Preview)
+   - Experimental support for dynamic addition/removal of Xen device tree
+     nodes using a device tree overlay binary (.dtbo).
  - Introduce two new hypercalls to map the vCPU runstate and time areas by
    physical rather than linear/virtual addresses.
- - On x86, support for enforcing system-wide operation in Data Operand
-   Independent Timing Mode.
  - The project has now officially adopted 6 directives and 65 rules of MISRA-C.
 
 ### Removed
-- 
2.30.2


