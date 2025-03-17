Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC08DA652B6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916991.1321995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBJV-0000Zz-Jb; Mon, 17 Mar 2025 14:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916991.1321995; Mon, 17 Mar 2025 14:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBJV-0000YH-FO; Mon, 17 Mar 2025 14:19:33 +0000
Received: by outflank-mailman (input) for mailman id 916991;
 Mon, 17 Mar 2025 14:19:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Mnh=WE=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1tuBJT-0008Sp-SQ
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:19:31 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d73bfa29-033a-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 15:19:30 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30bf8632052so47881531fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:19:30 -0700 (PDT)
Received: from epuakyiw0a98.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f117161sm15918751fa.53.2025.03.17.07.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 07:19:27 -0700 (PDT)
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
X-Inumbo-ID: d73bfa29-033a-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742221169; x=1742825969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzB3jATjEnhV6LFXt11FmavWel6P/yF1jEFe4PRinoM=;
        b=I4qIX3TJTF/N+iaAjTjRb+XdZ2k2DxhHtCFcEDeCnLNRwgUaF6i00h6yFRLfYDkQXH
         mSK04FLNXWgxIXE0o0mgdnxzCV4SeAGNYGMf+rTB6UTmWcYskXo246CvPcOgcWlxs10A
         U9NJpH+vhKuIZj6E6s3iWsEBbniG+pmSUXrbeAYH87UcghHn3dhB0/FT59fs+zivLJXr
         9U6qAUZjXetJWz3khOP7THmVr2NAv668snLo7DVMoOwbH8pgQSoSKWfiNeU/xF0Qaxfr
         d5UWGjQXbMKClesauwEvHrvw7xEc30pX7e2ZCDM0ne/a9f8St4u0uT7DvgNr50VRvD4t
         8gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742221169; x=1742825969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzB3jATjEnhV6LFXt11FmavWel6P/yF1jEFe4PRinoM=;
        b=wPpw6P+24pXM0XuNOIOfKyEtKR7PJD0rErkdezAflfJOxM2D3lkv5E3EoQJrj4NO8m
         whiNyzeCK/V8U1GWLe8n0GeBa+of68Ot8QuDTVcasDiSA6/QIrcwtJXEyzh9iOxF0+Bl
         gseHjtHiJK44vyCiAK8Y/UPnsefJ3vFJxuvXML2DxtRMBvLBPhKNclYijwo7tyjg2vku
         vHa9WdJQmD2J6DR7WXaxVRpv2D+LdvnyiRcI+Qu/BviIzI4S4NHEOJ3aHiveTQW6TtKo
         yuG34giVboz9s1YcZI/8GDLTv03ce9tQBzBQLMrvJQjVqQ/CTOik7uCqjS4Dy1SQLRBJ
         8yfA==
X-Gm-Message-State: AOJu0YyrWRApyya9FwmLC2q80iICdBdxTBlM2MkJ+EAU0p3TZNSS5Ppd
	Z2q8eZ6b35jUrKfDgQGYY/VY0hrnyNsdnYvuZnxFTBqZ4YQTiLZ6uEUR5w==
X-Gm-Gg: ASbGncsHqIbHLoGIKQn+D1Mm6PJURjJqta9X9oCAzVLJMgJ6R6KOKU94Fpdly++360u
	DEgQl/XQlo2bKdBLwku0/JOscs+TMIwFA+OqL0k6UQG70wKNb8ciAhNaycub5ePelVmvLGdftfM
	Eg4prAl/2m06mEaeQedugWtXMjM5KhxD2FKKEyZxPCBa3v1SrAUgSC8RKMpaQEmS18oNV+7O9xx
	rKlyt6oDgUS5I1H0tM6mAQ1stgGQbEydhABYuBVwIJgiVdnrKRgrWTgPrWf6o2Ac8kpft4VM9vT
	JZyTo8JSTNCsJgRcl3kCzagwZNO+aKCCxkFHJ1oQHltUaN5UzgbtJTHKJgUseoFTsyzhlEfZmP/
	pnj9JmQgzU8aTG+KYKryaXVoNhUk=
X-Google-Smtp-Source: AGHT+IGsMLXXLaFP5CxLb9s4NNu11bmx9lMx6D2Z2BC+TXaN4v729+Aiyhy5ilNoGXqD/W9HkgA+NQ==
X-Received: by 2002:a05:651c:2127:b0:30b:b184:a904 with SMTP id 38308e7fff4ca-30c4a75e6eamr83592971fa.4.1742221168950;
        Mon, 17 Mar 2025 07:19:28 -0700 (PDT)
From: gragst.linux@gmail.com
X-Google-Original-From: grygorii_strashko@epam.com
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [ImageBuilder][PATCH] uboot-script-gen: add ability to cfg vcpu hard affinity
Date: Mon, 17 Mar 2025 16:19:09 +0200
Message-Id: <20250317141909.2502496-1-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add DOMU_VCPU_HARD_AFFINITY[number,vcpu] configuration file string option
specifying the hard affinity configuration for the VM vCPU(vcpu) in DT.

The format is a comma-separated list of pCPUs or ranges of pCPUs. Ranges
are hyphen-separated intervals (such as 0-4) and are inclusive on both
sides. The numbers refer to logical pCPU ids.

For example:
DOMU_VCPUS[0]="2"
DOMU_VCPU_HARD_AFFINITY[0,0]="1"

will be reflected in domU0/vcpu0 DT node with "hard-affinity" set:
vcpu0 {
	hard-affinity = "1";
	id = <0x00000000>;
	compatible = "xen,vcpu";
};

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 README.md                | 11 +++++++++++
 scripts/uboot-script-gen |  4 ++++
 scripts/xen_dt_domu      | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 scripts/xen_dt_domu

diff --git a/README.md b/README.md
index 5b75018ea956..262022c665be 100644
--- a/README.md
+++ b/README.md
@@ -186,6 +186,17 @@ Where:
 
 - DOMU_VCPUS[number] is the number of vcpus for the VM, default 1
 
+- DOMU_VCPU_HARD_AFFINITY[number,vcpu] optional, is the A string
+  specifying the hard affinity configuration for the VM vCPU(vcpu):
+  a comma-separated list of pCPUs or ranges of pCPUs is used.
+  Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive
+  on both sides. The numbers refer to logical pCPU ids. Below is an example:
+```
+      DOMU_VCPUS[number]=2
+      DOMU_VCPU_HARD_AFFINITY[number,0]="0-2"
+      DOMU_VCPU_HARD_AFFINITY[number,1]="3"
+```
+
 - DOMU_COLORS[number] specifies the colors (cache coloring) to be used
   for the domain and is in the format startcolor-endcolor
 
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 74e3b076910c..9229f9af567b 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -392,6 +392,8 @@ function xen_device_tree_editing()
             dt_set "/chosen/domU$i" "colors" "hex" "$(printf "0x%x" $bitcolors)"
         fi
 
+        xen_dt_domu_add_vcpu_nodes "/chosen/domU$i" $i ${DOMU_VCPUS[$i]}
+
         add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
         if test "${domU_ramdisk_addr[$i]}"
         then
@@ -1164,10 +1166,12 @@ fi
 
 check_depends
 
+declare -A DOMU_VCPU_HARD_AFFINITY
 source "$cfg_file"
 
 SCRIPT_PATH=$(dirname "$0")
 source "$SCRIPT_PATH/common"
+source "$SCRIPT_PATH/xen_dt_domu"
 
 # command line overrides
 LOAD_CMD=${load_opt:-$LOAD_CMD}
diff --git a/scripts/xen_dt_domu b/scripts/xen_dt_domu
new file mode 100644
index 000000000000..e1cb2376c37e
--- /dev/null
+++ b/scripts/xen_dt_domu
@@ -0,0 +1,39 @@
+#!/bin/bash
+
+# uses:
+# DOMU_VCPU_HARD_AFFINITY
+function xen_dt_domu_add_vcpu_nodes()
+{
+    # $1 - dt path
+    local path=$1
+    # $2 - domain number
+    local dom_num=$2
+    # $3 - number of vcpus for the domain
+    local vcpus=$3
+    local hard_affinity=""
+    local gen_vcpu=""
+
+    for (( vcpu=0; vcpu<${vcpus}; vcpu++ ))
+    do
+        gen_vcpu=""
+        if test "${DOMU_VCPU_HARD_AFFINITY[$dom_num,$vcpu]}"
+        then
+            hard_affinity=${DOMU_VCPU_HARD_AFFINITY[$dom_num,$vcpu]}
+            gen_vcpu="1"
+        fi
+
+        if test -z $gen_vcpu
+        then
+            continue
+        fi
+
+        dt_mknode "${path}" "vcpu$vcpu"
+        dt_set "${path}/vcpu$vcpu" "compatible" "str_a" "xen,vcpu"
+        dt_set "${path}/vcpu$vcpu" "id" "int"  "$vcpu"
+
+        if test -n $hard_affinity
+        then
+            dt_set "${path}/vcpu$vcpu" "hard-affinity" "str" "$hard_affinity"
+        fi
+    done
+}
-- 
2.34.1


