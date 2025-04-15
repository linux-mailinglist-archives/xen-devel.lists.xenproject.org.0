Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED00A8A037
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:55:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954005.1348369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gkC-0007iU-M9; Tue, 15 Apr 2025 13:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954005.1348369; Tue, 15 Apr 2025 13:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gkC-0007gV-IS; Tue, 15 Apr 2025 13:54:32 +0000
Received: by outflank-mailman (input) for mailman id 954005;
 Tue, 15 Apr 2025 13:54:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWT/=XB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4gkB-0007gM-2A
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:54:31 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2678a836-1a01-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 15:54:29 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso37980875e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 06:54:29 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075a593sm212688205e9.25.2025.04.15.06.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 06:54:28 -0700 (PDT)
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
X-Inumbo-ID: 2678a836-1a01-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744725268; x=1745330068; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NbSJKpjEs6yA5iy1ajG0aDkhz1q+SFhBT+q+STK8kOQ=;
        b=htfVc+IAQG/ORaQF6CfbEZlEjjHSAIlPX5ScJyZNqd31EWeQ4st4UYfjhrB9WmWPYk
         7DUQKb1sq4ZK8tcVktN+iG2rqD22MSBl8KIFm+tl0MZJMd2Pe82lY71ROW+MQsUD8InO
         yhzQqCHojM5ed1gPhYqxzS9s/WYJuT1bPmwq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725268; x=1745330068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbSJKpjEs6yA5iy1ajG0aDkhz1q+SFhBT+q+STK8kOQ=;
        b=sanCOOhnGHOe9K2MUBvkvvN3dn/xNkIxNTHF65MHzzSP5L9Hjes/598vqC+SEdvjVo
         FdSAYEVXU7GvbEgKsb2YwoSBg8kM1EaNCx6pPV0mzMzY+g2Kiz1l7YE6MujFFxBqPAKm
         Wo+Mlk15IYNy7jjPtWGn5VgewXB4K+dGa58BnasZJTDBQ7ibGIoy5vHSabYHPv7xNCmu
         s9JhO/kFCAlGPI3902vDrMzyc5qW26pgDH3FGR6tt8eMgPcGfWJuF77IzDx0HURuiDzX
         C4pWvmm3TGhxwDmHA34QaDtfhFevtdXs69rVy0eMnHyQAKp3UjZocp9Bgx03cPrCOh30
         1BQQ==
X-Gm-Message-State: AOJu0YyjkMqXfthBltT6+HQuKD7pYK3PYBV5vJZNZ52YU2dj2Ml80uA1
	uF+yCsWGrD2yeGLAFbzYcwNNbFgsXdfGYkDfmlhjYobv6zV0+EKLkNLgKmENlOfVSN4p7BKXQnE
	ZCOs=
X-Gm-Gg: ASbGncuIsHK2cvToLM+JNwT3vdbcwPKWdzWqV2srzLiAs2+W00j3h+fOREfMqodH76X
	D9XhPeN0G8qwaJ7tWWdMEGo+KdGxCeMEuz3sPX3IrF3OKgYO2mRduZeqj07r/pWGHePdFMmlw6d
	ocrxk0xuWOI3x16XX2sY/luldstzoqTQoxH1hvk4NiqSTJHSqswlhIMvJAXAioZAUY9BtZLSOk9
	99fvylxMtEVGrd+mMX/E5bwpIZBR+FwT2OrKMavpOX7MF+ieWfnxUBy7XRhBKEGZ3TbY+0qiTWO
	IoH227AKyMPJCfLp8lrY8v4SdOcRN0EaYcTsmDK5+Ecm/sM550e0JZanqXdm6SEsI6h+zZpGrKG
	k+k6xLMdDMYcR5A==
X-Google-Smtp-Source: AGHT+IE8/RScaL/EftS9Q6Q6v11DPuJxKEGpO5WMIzIZ/JwQNdItKJw2u0Jk7oslqqp8dFGnL76beg==
X-Received: by 2002:a05:600c:3486:b0:43b:c305:3954 with SMTP id 5b1f17b1804b1-43f998a893amr37639015e9.8.1744725268513;
        Tue, 15 Apr 2025 06:54:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] CI: Build with --prefix=/usr rather than setting LD_LIBRARY_PATH
Date: Tue, 15 Apr 2025 14:54:26 +0100
Message-Id: <20250415135426.2442073-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This also moves executables too.  I'm not sure why xilinx-smoke-dom0-x86_64.sh
was overriding PATH too, as /usr/local is clearly in PATH for all other tests,
but drop that too.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1769687343
---
 automation/scripts/build                          | 2 +-
 automation/scripts/qemu-alpine-x86_64.sh          | 1 -
 automation/scripts/qemu-smoke-dom0-arm64.sh       | 1 -
 automation/scripts/qemu-smoke-dom0less-arm64.sh   | 3 +--
 automation/scripts/qubes-x86-64.sh                | 1 -
 automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 3 ---
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 3 +--
 7 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 51effec81ddd..a348c781d1f2 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -67,7 +67,7 @@ elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     collect_xen_artefacts
 else
     # Full build.  Figure out our ./configure options
-    cfgargs=()
+    cfgargs=("--prefix=/usr")
     cfgargs+=("--enable-docs")
 
     # booleans for which compiler is in use
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index fe86caa39304..746e70483d2c 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -49,7 +49,6 @@ echo "#!/bin/bash
 
 set -x
 
-export LD_LIBRARY_PATH=/usr/local/lib
 bash /etc/init.d/xencommons start
 
 xl list
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 61dd24b9abef..d6f6b7488018 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -46,7 +46,6 @@ extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
 " > root/domU.cfg
 echo "#!/bin/bash
 
-export LD_LIBRARY_PATH=/usr/local/lib
 bash /etc/init.d/xencommons start
 
 xl list
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 58f11dd31038..e7a3e670d033 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -125,10 +125,9 @@ mkdir -p etc/local.d
 
 echo "#!/bin/bash
 
-export LD_LIBRARY_PATH=/usr/local/lib
 bash /etc/init.d/xencommons start
 
-/usr/local/lib/xen/bin/init-dom0less
+/usr/lib/xen/bin/init-dom0less
 
 brctl addbr xenbr0
 brctl addif xenbr0 eth0
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 1f90e7002c73..bfdd2ceb99ba 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -201,7 +201,6 @@ cp -a ../automation/scripts/run-tools-tests tests/
 
 echo "#!/bin/bash
 
-export LD_LIBRARY_PATH=/usr/local/lib
 bash /etc/init.d/xencommons start
 
 brctl addbr xenbr0
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 5bb44188dc3d..8f02fa73bd06 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -92,8 +92,6 @@ cd rootfs
 mkdir -p etc/local.d
 echo "#!/bin/sh
 set -x
-export LD_LIBRARY_PATH=/usr/local/lib
-PATH=/usr/local/bin:/usr/local/sbin:\$PATH
 ${DOMU_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
@@ -119,7 +117,6 @@ cd rootfs
 mkdir -p boot etc/local.d etc/xen etc/default
 echo "#!/bin/bash
 set -x
-export LD_LIBRARY_PATH=/usr/local/lib
 bash /etc/init.d/xencommons start
 ${DOM0_CMD}
 " > etc/local.d/xen.start
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 59f3fe7edb3e..293232eebfe7 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -64,10 +64,9 @@ cd rootfs
 mkdir -p etc/local.d
 echo "#!/bin/bash
 
-export LD_LIBRARY_PATH=/usr/local/lib
 bash /etc/init.d/xencommons start
 
-/usr/local/lib/xen/bin/init-dom0less
+/usr/lib/xen/bin/init-dom0less
 
 ${dom0_check}
 " > etc/local.d/xen.start
-- 
2.39.5


