Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB96593DA
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 01:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469768.729243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QW-0004gD-NR; Fri, 30 Dec 2022 00:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469768.729243; Fri, 30 Dec 2022 00:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QW-0004cy-I2; Fri, 30 Dec 2022 00:39:12 +0000
Received: by outflank-mailman (input) for mailman id 469768;
 Fri, 30 Dec 2022 00:39:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dJX=44=citrix.com=prvs=35664f79d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pB3QU-0002si-3V
 for xen-devel@lists.xenproject.org; Fri, 30 Dec 2022 00:39:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e4a6674-87da-11ed-91b6-6bf2151ebd3b;
 Fri, 30 Dec 2022 01:39:08 +0100 (CET)
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
X-Inumbo-ID: 5e4a6674-87da-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672360748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=aKBSwtrERlqBbqeZ2HPJFw1NuINA10Vqqd2ET7c3vXU=;
  b=fgvlXL5U14S7BcM5AqAA+dn3U5jK6YqZizM6NCOH8vP7tJfMjJCCoUvw
   /x0k/u5KvczWWfKLERmxyH0adizFXFpfDWNTTDiZJ8nMsb4nfCYnX7FAr
   pXUe0yxBnt9C30jjz4jW9xSSxpZAyGX+/OpSWm8A5Xz3HLXBVL3aSCWHe
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93013913
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d2vpd6q3hVBABqR93SnWUaJyJPNeBmLUZRIvgKrLsJaIsI4StFCzt
 garIBmGM/mCamb1eY8kbYW0oU4Pv5fQn4UxTAdu/H8zECwbpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzShNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADkKahSMvbiq+bD4b9Zxnv4pb/jhHpxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw9
 zmepj+oW0py2Nq3+wKs/zGMvM/2pCLdW4gPV5Sjq99jqQjGroAUIEJPDgbqyRWjsWa7WtlfI
 khS/TA8oKwa/UmnCNL6WnWQp3qJvQUdWpxTDvc94wGOzYLb5g+YAi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9JmYYaSgJZQAM+dXkrcc4iRenZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj6kmg1QmZ2XT2/MGPF1NroFWMNo640u9nTIeiY4in0wLH1PQDCbmEVmOL/
 0kOudfLuYjiEqqxvCCKRewMGpSg6PCELCDQjDZTInUxy9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Cc/rCsLvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBcmB2ysnT2
 r/BK65A6Er27ow5pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlns/nf+1WFr
 YcFZpDiJ/BjvArWO3O/zGLuBQpScShT6W7e8KS7idJv0iI5QTp8Wpc9MJsqepB/nrQ9q9okC
 kqVAxcCoHKm3C2vFOl/Qiw7AF8Zdcol/C1T0O1FFQrA5kXPlq71vfpCKcpvLeJPGS4K5accc
 sTpsv6oWpxnIgkrMRxEMPERcKQKmMyXuD+z
IronPort-HdrOrdr: A9a23:zATn666erD3MrE5NVgPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.96,285,1665460800"; 
   d="scan'208";a="93013913"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/6] CI: Drop automation/configs/
Date: Fri, 30 Dec 2022 00:38:43 +0000
Message-ID: <20221230003848.3241-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221230003848.3241-1-andrew.cooper3@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Having 3 extra hypervisor builds on the end of a full build is deeply
confusing to debug if one of them fails, because the .config file presented in
the artefacts is not the one which caused a build failure.  Also, the log
tends to be truncated in the UI.

PV-only is tested as part of PV-Shim in a full build anyway, so doesn't need
repeating.  HVM-only and neither will come up frequently in randconfig, so
drop all the logic here to simplify things.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/configs/x86/hvm_only_config  |  3 ---
 automation/configs/x86/no_hvm_pv_config |  3 ---
 automation/configs/x86/pv_only_config   |  3 ---
 automation/scripts/build                | 21 ---------------------
 4 files changed, 30 deletions(-)
 delete mode 100644 automation/configs/x86/hvm_only_config
 delete mode 100644 automation/configs/x86/no_hvm_pv_config
 delete mode 100644 automation/configs/x86/pv_only_config

diff --git a/automation/configs/x86/hvm_only_config b/automation/configs/x86/hvm_only_config
deleted file mode 100644
index 9efbddd5353b..000000000000
--- a/automation/configs/x86/hvm_only_config
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_HVM=y
-# CONFIG_PV is not set
-# CONFIG_DEBUG is not set
diff --git a/automation/configs/x86/no_hvm_pv_config b/automation/configs/x86/no_hvm_pv_config
deleted file mode 100644
index 0bf6a8e46818..000000000000
--- a/automation/configs/x86/no_hvm_pv_config
+++ /dev/null
@@ -1,3 +0,0 @@
-# CONFIG_HVM is not set
-# CONFIG_PV is not set
-# CONFIG_DEBUG is not set
diff --git a/automation/configs/x86/pv_only_config b/automation/configs/x86/pv_only_config
deleted file mode 100644
index e9d8b4a7c753..000000000000
--- a/automation/configs/x86/pv_only_config
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_PV=y
-# CONFIG_HVM is not set
-# CONFIG_DEBUG is not set
diff --git a/automation/scripts/build b/automation/scripts/build
index a5934190634b..5dafa72ba540 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -85,24 +85,3 @@ if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
         cp -r dist binaries/
     fi
 fi
-
-if [[ "${hypervisor_only}" == "y" ]]; then
-    # If we are build testing a specific Kconfig exit now, there's no point in
-    # testing all the possible configs.
-    exit 0
-fi
-
-# Build all the configs we care about
-case ${XEN_TARGET_ARCH} in
-    x86_64) arch=x86 ;;
-    *) exit 0 ;;
-esac
-
-cfg_dir="automation/configs/${arch}"
-for cfg in `ls ${cfg_dir}`; do
-    echo "Building $cfg"
-    make -j$(nproc) -C xen clean
-    rm -f xen/.config
-    make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} defconfig
-    make -j$(nproc) -C xen
-done
-- 
2.11.0


