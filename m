Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1243954C346
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 10:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349736.575883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1O96-0002fY-VA; Wed, 15 Jun 2022 08:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349736.575883; Wed, 15 Jun 2022 08:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1O96-0002cf-Ri; Wed, 15 Jun 2022 08:13:00 +0000
Received: by outflank-mailman (input) for mailman id 349736;
 Wed, 15 Jun 2022 08:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2OX=WW=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o1O95-0002cT-6M
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 08:12:59 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f70c6348-ec82-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 10:12:57 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id o10so14965880edi.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jun 2022 01:12:57 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 z18-20020a170906241200b006f3ef214da8sm6124795eja.14.2022.06.15.01.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 01:12:56 -0700 (PDT)
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
X-Inumbo-ID: f70c6348-ec82-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qZx1eac9zJFtkpBOL0VACeWr3XxYdRwbIQQabdvDnyo=;
        b=jkJnDqzOBowvYli23CnBz+0iOmpMkPqEWw+pAhFH+3W9CeKVoqKQLl1a28o2D3M4xn
         6YkFVsJyIsG0mHPLIw/jCczXepoiB11KPp8Ny70MxmW3Z0Vg540YsFx+TT01hytmfb2Q
         nbjOd4Sxp0DzpJUt+qWY0J5s+PzSqZYKQZ+GqIwAfy8fAR6FL9tjjvFU/TcK+/s0ekdO
         qS2jjqTvJ9Nsy6RAgxNLepdgpgUd8vZ916tP1LI/040Uec5fytVB6aqnj0DVOiheuPYD
         lyFDFVzG92rcUYN10+KvL4mXt/PQ1+uXreB1Ct9xcKobqXUbRK9XALBh2wHRFnKKoMIG
         2aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qZx1eac9zJFtkpBOL0VACeWr3XxYdRwbIQQabdvDnyo=;
        b=vRUT6I+0QyByHo2ztrYAsy+QPH9L6TnSRXtZzPjyS/Jn0HFXmwGcng0uDy5F60G0Pg
         5+vrQbsbR4WNEmYc+3hC7T+TcbHJMxQ9TjogRhdALDkyjvKDmji4X+kD0vy4IEtT8NLF
         vdF9ui/LmVMQVzfMxCFVfcx9niSdXsIoUbR8sHVgMYwa0SdSDem1arXAuoZBwB9Fk+DC
         7iQo/qTMlvdNiDpVw4sOFiedlv/3jwD4AzrAcDHrohNzBGHXWBZf7A0pu+k3mLuTXaYJ
         JguXAYSl6m8uH/Tl8bCShVWgGU/apXDhNm1ekBijRw1yFbX720COFl0nCKGoLF8McL9B
         PZ+w==
X-Gm-Message-State: AOAM530yGiohqkGAUClNvZzojkfzS1MmZgsStqEHYxPyoXXBjUUpvMp4
	IPM/CvA91AgtuuQQUXmyXVdgL5lyVzM=
X-Google-Smtp-Source: ABdhPJx1G5RQ6gn7JvD2P49knD+LlprnBa7U2Dexg1Q6tcxycWberFZMIphpKfRXpl97wyE/2g+izA==
X-Received: by 2002:a05:6402:84c:b0:430:aae2:6dd8 with SMTP id b12-20020a056402084c00b00430aae26dd8mr11250123edz.31.1655280777082;
        Wed, 15 Jun 2022 01:12:57 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	viryaos-discuss@lists.sourceforge.net,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [ImageBuilder] [PATCH] uboot-script-gen: Add DOMU_STATIC_MEM
Date: Wed, 15 Jun 2022 11:11:27 +0300
Message-Id: <20220615081127.274712-1-burzalodowa@gmail.com>
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
index 0adf523..bb2ee2d 100755
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
+    for i in ${regions[@]}
+    do
+	cells+=("$(printf "0x%x 0x%x" $(($i >> 32)) $(($i & ((1 << 32) - 1))))")
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


