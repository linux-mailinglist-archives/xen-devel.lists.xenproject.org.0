Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6169A6C4B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 16:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823578.1237601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tVb-00047X-L3; Mon, 21 Oct 2024 14:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823578.1237601; Mon, 21 Oct 2024 14:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tVb-00045F-HA; Mon, 21 Oct 2024 14:35:47 +0000
Received: by outflank-mailman (input) for mailman id 823578;
 Mon, 21 Oct 2024 14:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2tVa-0003qm-Si
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 14:35:46 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0fb9749-8fb9-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 16:35:44 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a99fa009adcso251164566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 07:35:44 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b1d8sm1999394a12.72.2024.10.21.07.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 07:35:42 -0700 (PDT)
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
X-Inumbo-ID: c0fb9749-8fb9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729521343; x=1730126143; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPCHulRaSrD9EnHHmG1DTpUULk+3NsrkYOUB7K+zHIQ=;
        b=nnsgEdalGKTRAagQOv+viymd557Ppeaqi5QrtObVJoOSasuKqFqOlwAod7DFROc2uR
         lnaWXXEPab/sTgy0FdfUPW+G8vRgcBRCPzqRN7KLvd0ONZEgK0JIgl6Gz2mkvnmXasv7
         gHfuCgSVO4e1EwG4NzMNwkllInuOO+eKbujXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521343; x=1730126143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPCHulRaSrD9EnHHmG1DTpUULk+3NsrkYOUB7K+zHIQ=;
        b=VrnqZjiB8YahuPatTHWaB8z/pm29rFMCShhiXpnM50H0judhdLZZVMt55Ntrt3YMeq
         WKQH7o38mNFYNvlUYAdls0tM0sQEG0MiG6fEdxXE+1xb4fqzC1GXfmYb0ImeOIpkgkkd
         qRcTZDdLx87mchPG5yof4JrZKCweeUQry/eMU3giTPL4fAmT+2INGVEbLLZXpA2G67Om
         JpPK2UEuziWtPjH48eyo7i5Kbr1P2yZiFXHD0TMbadjVsZk4/DAddd7FGYgi9MwRQWFy
         JKoaNvQWHu/D9ehj+XUnRdl/dBZSXfWWlV19W6Xo9qeCVEj0zyblzRuOqgiW7zw+uC67
         VpDA==
X-Gm-Message-State: AOJu0YyrIpnpVK7a6fnAPgvYiOVOKVLBjBpUKn91rgynudIwGVNw0BsO
	1VR1/dWY4BE8wd2DaM8PqQxSXojsSkrwHOkr0dhMxV7smd8atG5JlAcUvub/dDMua9XB4AU69k4
	g
X-Google-Smtp-Source: AGHT+IF/YKBje1/sjQyLcv3cwySNfu272LXfSKucSlUmr6D4l1TBu+bJ4V3sTFepZXPB8g7FfCCWKQ==
X-Received: by 2002:a05:6402:5412:b0:5cb:6841:ede5 with SMTP id 4fb4d7f45d1cf-5cb6841ee4emr7993078a12.28.1729521343064;
        Mon, 21 Oct 2024 07:35:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 1/3] CI: Minor cleanup to qubes-x86-64.sh
Date: Mon, 21 Oct 2024 15:35:37 +0100
Message-Id: <20241021143539.3898995-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241021143539.3898995-1-andrew.cooper3@citrix.com>
References: <20241021143539.3898995-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * List all the test_variants and summerise what's going on
 * Use case rather than an if/else chain for $test_variant
 * Fix indentation inside the case block

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
---
 automation/scripts/qubes-x86-64.sh | 84 ++++++++++++++++++------------
 1 file changed, 50 insertions(+), 34 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index bfa60c912a64..306304e9219f 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -2,6 +2,13 @@
 
 set -ex
 
+# One of:
+#  - ""             PV dom0,  PVH domU
+#  - dom0pvh        PVH dom0, PVH domU
+#  - dom0pvh-hvm    PVH dom0, HVM domU
+#  - pci-hvm        PV dom0,  HVM domU + PCI Passthrough
+#  - pci-pv         PV dom0,  PV domU + PCI Passthrough
+#  - s3             PV dom0,  S3 suspend/resume
 test_variant=$1
 
 ### defaults
@@ -19,17 +26,18 @@ vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
 
-### test: smoke test & smoke test PVH & smoke test HVM
-if [ -z "${test_variant}" ] || [ "${test_variant}" = "dom0pvh" ] || [ "${test_variant}" = "dom0pvh-hvm" ]; then
-    passed="ping test passed"
-    domU_check="
+case "${test_variant}" in
+    ### test: smoke test & smoke test PVH & smoke test HVM
+    ""|"dom0pvh"|"dom0pvh-hvm")
+        passed="ping test passed"
+        domU_check="
 ifconfig eth0 192.168.0.2
 until ping -c 10 192.168.0.1; do
     sleep 1
 done
 echo \"${passed}\"
 "
-    dom0_check="
+        dom0_check="
 set +x
 until grep -q \"${passed}\" /var/log/xen/console/guest-domU.log; do
     sleep 1
@@ -37,12 +45,12 @@ done
 set -x
 echo \"${passed}\"
 "
-if [ "${test_variant}" = "dom0pvh" ] || [ "${test_variant}" = "dom0pvh-hvm" ]; then
-    extra_xen_opts="dom0=pvh"
-fi
+        if [ "${test_variant}" = "dom0pvh" ] || [ "${test_variant}" = "dom0pvh-hvm" ]; then
+            extra_xen_opts="dom0=pvh"
+        fi
 
-if [ "${test_variant}" = "dom0pvh-hvm" ]; then
-    domU_config='
+        if [ "${test_variant}" = "dom0pvh-hvm" ]; then
+            domU_config='
 type = "hvm"
 name = "domU"
 kernel = "/boot/vmlinuz"
@@ -52,17 +60,18 @@ memory = 512
 vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
-fi
-
-### test: S3
-elif [ "${test_variant}" = "s3" ]; then
-    passed="suspend test passed"
-    wait_and_wakeup="started, suspending"
-    domU_check="
+        fi
+        ;;
+
+    ### test: S3
+    "s3")
+        passed="suspend test passed"
+        wait_and_wakeup="started, suspending"
+        domU_check="
 ifconfig eth0 192.168.0.2
 echo domU started
 "
-    dom0_check="
+        dom0_check="
 until grep 'domU started' /var/log/xen/console/guest-domU.log; do
     sleep 1
 done
@@ -79,19 +88,20 @@ xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
 ping -c 10 192.168.0.2 || exit 1
 echo \"${passed}\"
 "
+        ;;
 
-### test: pci-pv, pci-hvm
-elif [ "${test_variant}" = "pci-pv" ] || [ "${test_variant}" = "pci-hvm" ]; then
+    ### test: pci-pv, pci-hvm
+    "pci-pv"|"pci-hvm")
 
-    if [ -z "$PCIDEV" ]; then
-        echo "Please set 'PCIDEV' variable with BDF of test network adapter" >&2
-        echo "Optionally set also 'PCIDEV_INTR' to 'MSI' or 'MSI-X'" >&2
-        exit 1
-    fi
+        if [ -z "$PCIDEV" ]; then
+            echo "Please set 'PCIDEV' variable with BDF of test network adapter" >&2
+            echo "Optionally set also 'PCIDEV_INTR' to 'MSI' or 'MSI-X'" >&2
+            exit 1
+        fi
 
-    passed="pci test passed"
+        passed="pci test passed"
 
-    domU_config='
+        domU_config='
 type = "'${test_variant#pci-}'"
 name = "domU"
 kernel = "/boot/vmlinuz"
@@ -104,7 +114,7 @@ pci = [ "'$PCIDEV',seize=1" ]
 on_reboot = "destroy"
 '
 
-    domU_check="
+        domU_check="
 set -x -e
 interface=eth0
 ip link set \"\$interface\" up
@@ -115,22 +125,28 @@ echo domU started
 pcidevice=\$(basename \$(readlink /sys/class/net/\$interface/device))
 lspci -vs \$pcidevice
 "
-    if [ -n "$PCIDEV_INTR" ]; then
-        domU_check="$domU_check
+        if [ -n "$PCIDEV_INTR" ]; then
+            domU_check="$domU_check
 lspci -vs \$pcidevice | fgrep '$PCIDEV_INTR: Enable+'
 "
-    fi
-    domU_check="$domU_check
+        fi
+        domU_check="$domU_check
 echo \"${passed}\"
 "
 
-    dom0_check="
+        dom0_check="
 tail -F /var/log/xen/qemu-dm-domU.log &
 until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.log; do
     sleep 1
 done
 "
-fi
+        ;;
+
+    *)
+        echo "Unrecognised test_variant '${test_variant}'" >&2
+        exit 1
+        ;;
+esac
 
 # DomU
 mkdir -p rootfs
-- 
2.39.5


