Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F3B550AA1
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jun 2022 14:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352154.578882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2uHA-0001gJ-24; Sun, 19 Jun 2022 12:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352154.578882; Sun, 19 Jun 2022 12:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2uH9-0001de-VA; Sun, 19 Jun 2022 12:43:35 +0000
Received: by outflank-mailman (input) for mailman id 352154;
 Sun, 19 Jun 2022 12:43:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWMG=W2=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o2uH7-0001dY-RU
 for xen-devel@lists.xenproject.org; Sun, 19 Jun 2022 12:43:33 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3521fb-efcd-11ec-bd2d-47488cf2e6aa;
 Sun, 19 Jun 2022 14:43:32 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id h23so16360810ejj.12
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jun 2022 05:43:32 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 b9-20020a17090630c900b006feba31171bsm4602659ejb.11.2022.06.19.05.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 05:43:31 -0700 (PDT)
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
X-Inumbo-ID: 6d3521fb-efcd-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CS7wHEgbN/XsLDJgzi/19eu8SiPOp/J5RpTdMpBDJdA=;
        b=EMNeEY8rLc23qGQmjjJ5BFqADCmKnTpLa0xdCmjd2B9L6SzxRTpAQsdrXg1kkh3WBv
         ZzZ7tG+llGz+MW1n2v239yLazmVz8/bTrGudujcq0h1udjl1SE9MRyD16hDBgV4hl9m9
         R7j2NVu3/k5394K0h3xYgp8J129j1wM0a1QnQf/jDGl2nhUkkYfXpNZa9+/nI0OvV8Jo
         MpeAnZFohq2noOd+zTdciwXnMqxw7hV+v+H/PPRoYYZ3Z1yfJaw7jMG6vYF7eyIZ/UUe
         8jaBAmAIYIQPHFxAmoDRGNhA+ru/fgMucDoREUu8Hk5e70lWkczi33DmYODOvnUONapm
         vOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CS7wHEgbN/XsLDJgzi/19eu8SiPOp/J5RpTdMpBDJdA=;
        b=St1azipwATxBdQTTYOOzBFpMMPSIqunDW85me9CVG/mebwwZI+6vihTlAsEYVer6EJ
         ftMBRrJ5KPcmYM98xxF+Y1t+16QF2F7rEXP21AlXMW9/22S+IppFkNjhOLOiFkUYWOqQ
         V8zh+yqh5FRPRu02wEAxBBXsDYoRc2gcOYYBD6qCoEyHeb9h4zGpulLTM3N1BYKxaqv1
         Mo8E5x2L/lq9FQkxwFeGvWqAnQOyt7qzUefXcylti+Fh2gmZemMXpbE0PotYCro7wsWj
         E9YKfqmJ/LpIPxBZ/8tmf9fDYl2e8XDgLguwLDIArMrO15BmtBR2adq3ZCHsyq2HmPXP
         C+nQ==
X-Gm-Message-State: AJIora9E7fVXVSoNDV2bS6rudDpOXkQkSN0jBXYQcojZpBdv2vFriNoB
	zT4zR+JHp+F/kNASaMq8sH0jnnSjc+k=
X-Google-Smtp-Source: AGRyM1vSS2u2BGatiyktffiPRe1xvubluqHFA/6ivxwHJPxGXAxGWgJmzCaXYdYVFH9NyzTThezW+w==
X-Received: by 2002:a17:906:74d8:b0:712:b97:f14f with SMTP id z24-20020a17090674d800b007120b97f14fmr16313471ejl.112.1655642611717;
        Sun, 19 Jun 2022 05:43:31 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	viryaos-discuss@lists.sourceforge.net,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [ImageBuilder] [PATCH 1/2] uboot-script-gen: Skip dom0 instead of exiting if DOM0_KERNEL is not set
Date: Sun, 19 Jun 2022 15:43:15 +0300
Message-Id: <20220619124316.378365-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the parameter DOM0_KERNEL is not specified and NUM_DOMUS is not 0,
instead of failing the script, just skip any dom0 specific setup.
This way the script can be used to boot XEN in dom0less mode.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 scripts/uboot-script-gen | 60 ++++++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 17 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 455b4c0..bdc8a6b 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -168,10 +168,15 @@ function xen_device_tree_editing()
     dt_set "/chosen" "#address-cells" "hex" "0x2"
     dt_set "/chosen" "#size-cells" "hex" "0x2"
     dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
-    dt_mknode "/chosen" "dom0"
-    dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
-    dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 $(printf "0x%x" $dom0_kernel_size)"
-    dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
+
+    if test "$DOM0_KERNEL"
+    then
+        dt_mknode "/chosen" "dom0"
+        dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
+        dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 $(printf "0x%x" $dom0_kernel_size)"
+        dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
+    fi
+
     if test "$DOM0_RAMDISK" && test $ramdisk_addr != "-"
     then
         dt_mknode "/chosen" "dom0-ramdisk"
@@ -203,7 +208,10 @@ function xen_device_tree_editing()
             add_device_tree_static_mem "/chosen/domU$i" "${DOMU_STATIC_MEM[$i]}"
         fi
         dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
-        dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
+        if test "$DOM0_KERNEL"
+        then
+            dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
+        fi
 
         if test "${DOMU_COLORS[$i]}"
         then
@@ -433,6 +441,19 @@ function xen_config()
             DOM0_CMD="$DOM0_CMD root=$root_dev"
         fi
     fi
+    if test -z "$DOM0_KERNEL"
+    then
+        if test "$NUM_DOMUS" -eq "0"
+        then
+            echo "Neither dom0 or domUs are specified, exiting."
+            exit 1
+        fi
+        echo "Dom0 kernel is not specified, continue with dom0less setup."
+        unset DOM0_RAMDISK
+        # Remove dom0 specific parameters from the XEN command line.
+        local params=($XEN_CMD)
+        XEN_CMD="${params[@]/dom0*/}"
+    fi
     i=0
     while test $i -lt $NUM_DOMUS
     do
@@ -490,11 +511,13 @@ generate_uboot_images()
 
 xen_file_loading()
 {
-    check_compressed_file_type $DOM0_KERNEL "executable"
-    dom0_kernel_addr=$memaddr
-    load_file $DOM0_KERNEL "dom0_linux"
-    dom0_kernel_size=$filesize
-
+    if test "$DOM0_KERNEL"
+    then
+        check_compressed_file_type $DOM0_KERNEL "executable"
+        dom0_kernel_addr=$memaddr
+        load_file $DOM0_KERNEL "dom0_linux"
+        dom0_kernel_size=$filesize
+    fi
     if test "$DOM0_RAMDISK"
     then
         check_compressed_file_type $DOM0_RAMDISK "cpio archive"
@@ -597,14 +620,16 @@ bitstream_load_and_config()
 
 create_its_file_xen()
 {
-    if test "$ramdisk_addr" != "-"
+    if test "$DOM0_KERNEL"
     then
-        load_files="\"dom0_linux\", \"dom0_ramdisk\""
-    else
-        load_files="\"dom0_linux\""
-    fi
-    # xen below
-    cat >> "$its_file" <<- EOF
+        if test "$ramdisk_addr" != "-"
+        then
+            load_files="\"dom0_linux\", \"dom0_ramdisk\""
+        else
+            load_files="\"dom0_linux\""
+        fi
+        # xen below
+        cat >> "$its_file" <<- EOF
         dom0_linux {
             description = "dom0 linux kernel binary";
             data = /incbin/("$DOM0_KERNEL");
@@ -616,6 +641,7 @@ create_its_file_xen()
             $fit_algo
         };
 	EOF
+    fi
     # domUs
     i=0
     while test $i -lt $NUM_DOMUS
-- 
2.34.1


