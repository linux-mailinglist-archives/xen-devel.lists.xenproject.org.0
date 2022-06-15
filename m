Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5993454D12F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 20:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350286.576581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Y6n-00051C-Vn; Wed, 15 Jun 2022 18:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350286.576581; Wed, 15 Jun 2022 18:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Y6n-0004yV-Sn; Wed, 15 Jun 2022 18:51:17 +0000
Received: by outflank-mailman (input) for mailman id 350286;
 Wed, 15 Jun 2022 18:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2OX=WW=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o1Y6m-0004yP-64
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 18:51:16 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21b87540-ecdc-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 20:51:14 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id 25so17462481edw.8
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jun 2022 11:51:14 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 u26-20020aa7db9a000000b004314bb65e7fsm9907519edt.41.2022.06.15.11.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 11:51:13 -0700 (PDT)
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
X-Inumbo-ID: 21b87540-ecdc-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHxUOy4hYN73AmNz+geJU/BFXvCSUXjGlGFigx0rrgc=;
        b=m65gUB5t5E2F6t+A/usvGDamPbDKNVE1bADjHAJvWgEai4PnCw7cFJ1ZmqcKaYyiEs
         WOAv9zhg/1JT2pLdBCqaaERvA/0/2mwZgiGibZtniHabh89xjwH6cMOinzp3VVN60uqW
         /2AwEiq77nN7U274M52KAsxXTVRFkaaqYZHpP0vtlapR/3guKpztjhgCjeRCKSOQsxVJ
         6g6grUzfblFrLnOse5jXoSnmwyBFbh70ZNg/3Qg/9pDRWTAmMcDqb8FJAX66P4myOleK
         Oh1NGBNTQFVPoF67K111/vGxDuMyhQjc2CJBAQgz5PvdTy44BdDob2n+uQTQ/Z643Wej
         qqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHxUOy4hYN73AmNz+geJU/BFXvCSUXjGlGFigx0rrgc=;
        b=1zzucfcx2PbxLTDcs+CbECXP562i9oyOv4MB5yAp4UFWQdZqzm/5y9MDy1P8u3rIG6
         gkRrpSfUXCZllV1OibXu6kESEpaEj7IisOjjF1H5H1f7FTYSDDBgC3eEVsaULIi4SLKj
         jm9VBBi30bgFjtlrfpPlArDtJ2WWDcyTHA9oq4MRF9YbEFNNuwnxWfCy16p4TALX9P9r
         Zv1XlUBonWVGSmioH8ONt8sWLZ3ckyerNrGjg34Qzue4d4CFTYwpb/jFNQQtzcE4nITZ
         lAwwklRZH16ouIqSMhUJzJ4TF7X6X7sTRqYtOd5UHCGrq515oC/YO+DCDWShCIkXVUgI
         RIMA==
X-Gm-Message-State: AJIora9LVb+a0fyYS17q6DweFyujbNdZGBR1ebs7n/LxypOAHCADrBUY
	P3DUXkL3hRotwRpY8hn2RW93r+QkIzg=
X-Google-Smtp-Source: AGRyM1tY3dMOvP6/At7qoo+/8nOctrrYRwjXXZTNJtf5fFJCUUIaxnsNwRCKkvSHuLvWA1BC0rHV4A==
X-Received: by 2002:a05:6402:177b:b0:433:426d:83ea with SMTP id da27-20020a056402177b00b00433426d83eamr1535611edb.18.1655319073935;
        Wed, 15 Jun 2022 11:51:13 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	viryaos-discuss@lists.sourceforge.net,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [ImageBuilder] [PATCH v2] uboot-script-gen: Add DOMU_STATIC_MEM
Date: Wed, 15 Jun 2022 21:51:00 +0300
Message-Id: <20220615185100.283754-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new config parameter to configure a dom0less VM with static allocation.
DOMU_STATIC_MEM[number]="baseaddr1 size1 ... baseaddrN sizeN"
The parameter specifies the host physical address regions to be statically
allocated to the VM. Each region is defined by its start address and size.

For instance,
DOMU_STATIC_MEM[0]="0x30000000 0x10000000 0x50000000 0x20000000"
indicates that the host memory regions [0x30000000, 0x40000000) and
[0x50000000, 0x70000000) are statically allocated to the first dom0less VM.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Notes:
    v2: in add_device_tree_static_mem(), replace i with val because variable i
        is already in use as an index

 README.md                |  4 ++++
 scripts/uboot-script-gen | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/README.md b/README.md
index 8ce13f0..876e46d 100644
--- a/README.md
+++ b/README.md
@@ -154,6 +154,10 @@ Where:
   automatically at boot as dom0-less guest. It can still be created
   later from Dom0.
 
+- DOMU_STATIC_MEM[number]="baseaddr1 size1 ... baseaddrN sizeN"
+  if specified, indicates the host physical address regions
+  [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
+
 - LINUX is optional but specifies the Linux kernel for when Xen is NOT
   used.  To enable this set any LINUX\_\* variables and do NOT set the
   XEN variable.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 0adf523..3a5f720 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -108,6 +108,22 @@ function add_device_tree_passthrough()
     dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
 }
 
+function add_device_tree_static_mem()
+{
+    local path=$1
+    local regions=$2
+
+    dt_set "$path" "#xen,static-mem-address-cells" "hex" "0x2"
+    dt_set "$path" "#xen,static-mem-size-cells" "hex" "0x2"
+
+    for val in ${regions[@]}
+    do
+	cells+=("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((1 << 32) - 1))))")
+    done
+
+    dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
+}
+
 function xen_device_tree_editing()
 {
     dt_set "/chosen" "#address-cells" "hex" "0x2"
@@ -143,6 +159,10 @@ function xen_device_tree_editing()
         dt_set "/chosen/domU$i" "#size-cells" "hex" "0x2"
         dt_set "/chosen/domU$i" "memory" "int" "0 ${DOMU_MEM[$i]}"
         dt_set "/chosen/domU$i" "cpus" "int" "${DOMU_VCPUS[$i]}"
+	if test "${DOMU_STATIC_MEM[$i]}"
+        then
+	    add_device_tree_static_mem "/chosen/domU$i" "${DOMU_STATIC_MEM[$i]}"
+        fi
         dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
         add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
         if test "${domU_ramdisk_addr[$i]}"
-- 
2.34.1


