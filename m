Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0459C734F30
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 11:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550897.860113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBAtQ-0008HZ-Hg; Mon, 19 Jun 2023 09:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550897.860113; Mon, 19 Jun 2023 09:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBAtQ-0008EH-Ek; Mon, 19 Jun 2023 09:09:48 +0000
Received: by outflank-mailman (input) for mailman id 550897;
 Mon, 19 Jun 2023 09:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G7/N=CH=citrix.com=prvs=52734159b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qBAtP-0008EB-5F
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 09:09:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0630f5db-0e81-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 11:09:43 +0200 (CEST)
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
X-Inumbo-ID: 0630f5db-0e81-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687165784;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QRMYHt/3CWBEZ6GpVJ9aX3neuXst+3n1CH30y1LUl0I=;
  b=SsJj8CvayBqClOqr2yJEJCoiErEVPDQqGHC7BK4DRjOTprRJ5ArjWTOs
   9X676ytu1q+xERSkb5mJ5cjSlPr/Nhzu/lYywFA38EqZh0AXBYpP5kbfD
   O68pws+Z0sRVNrDCY5AeYby+Tsu4HTdicGNt8G0Len6oHPAack6FJMGTU
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113186527
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:O+O2bKDu9UR+TxVW/yfjw5YqxClBgxIJ4kV8jS/XYbTApDohg2YPy
 2IcXT+BPfyLNGSge9p/aIXnpEsH68KEzNJqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1B7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwob5aQk1T7
 t8kMg9dfkqDhryomqn8Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XRHJULwxzHz
 o7A11/QO0oebNme8AKU3UiStu6SpAn+eKtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaPtwQQXNd4GOQg5AaAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRSXKa9ECzHsO3O9HXrZHZTdDVZDcMZcecby4K7jcIfkwnscsxcQL7vjtyrB2vrh
 C/f+UDSmI4vYd43O7STpA6X3Gv098OVEmbZ9S2MADv7s1oRiJqNItXxtAOFtasowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWN4umsWyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4S6D6mPN4sUOMchHONiwM2JTRTJt10BbWB2yf1vU
 XtlWZvE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz+uYdykEW9EO9fWHPXN7BR0U9xiFmNm
 zqpH5fQmko3vSyXSnW/zLP/2nhTfCRgX8Cs+pEHHgNBSyI/cFwc5zbq6etJU+RYc259z48kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:/Wy/m68jieudbZmyanxuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-Talos-CUID: =?us-ascii?q?9a23=3AXySLNGrb/Kyxu75MSsXQ6ZnmUZt9Xz7x0WzzH1W?=
 =?us-ascii?q?HWXYzSLzLVwWLv7wxxg=3D=3D?=
X-Talos-MUID: 9a23:3hj13wZFgYoVs+BTjBbV3zU6McZR27WBMn49kMg/kcykHHkl
X-IronPort-AV: E=Sophos;i="6.00,254,1681185600"; 
   d="scan'208";a="113186527"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation: Disable QEMU build with Clang older than 10.0
Date: Mon, 19 Jun 2023 10:09:32 +0100
Message-ID: <20230619090932.47957-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since QEMU commit 74a1b256d775 ("configure: Bump minimum Clang version
to 10.0"), or QEMU v8.0, Clang 10.0 is now the minimum to build QEMU.

QEMU 8.0 fails to build on Ubuntu Bionic.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    I've tested that change here, with QEMU v8.0.2:
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/902576734

 automation/scripts/build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/build b/automation/scripts/build
index 38c48ae6d8..b4edcf010e 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -78,7 +78,9 @@ else
     fi
 
     # Qemu requires Python 3.5 or later, and ninja
+    # and Clang 10 or later
     if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))" \
+            || [[ "$cc_is_clang" == y && "$cc_ver" -lt 0x0a0000 ]] \
             || ! type ninja; then
         cfgargs+=("--with-system-qemu=/bin/false")
     fi
-- 
Anthony PERARD


