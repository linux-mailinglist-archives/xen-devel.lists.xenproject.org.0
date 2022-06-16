Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB80B54DE82
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 11:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350514.576880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1mFu-0002DM-7L; Thu, 16 Jun 2022 09:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350514.576880; Thu, 16 Jun 2022 09:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1mFu-0002Ae-41; Thu, 16 Jun 2022 09:57:38 +0000
Received: by outflank-mailman (input) for mailman id 350514;
 Thu, 16 Jun 2022 09:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sau3=WX=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o1mFs-0002AY-AG
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 09:57:36 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd99c3ee-ed5a-11ec-ab14-113154c10af9;
 Thu, 16 Jun 2022 11:57:35 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id g7so1456214eda.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jun 2022 02:57:32 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 n22-20020a1709065e1600b0070b1ecdc12bsm568285eju.112.2022.06.16.02.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 02:57:31 -0700 (PDT)
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
X-Inumbo-ID: bd99c3ee-ed5a-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4yF/dBZvUdI7jPmuRQj/KahNk9taCdE/KQDKfwzRreY=;
        b=NiFREroozi+yeGJILk2A376YU2UvEatLQBh1WJdrfYNAy6AO5371RsixdtawB4yP4A
         W41rYxKt5aGiO7fGIOi3dgHgP5vUq1SCWnSkVzAHEo7Sv2k4zWYt2p+2MJ1fBLIDoml1
         +l6CRJF1jJpXjVl3tbgxbaqOPZHOTJoM2Mzt5GdhzDR2TFP84i1cbBS9S4v2uK6BRu3d
         FAIyFhV004exrYlQNO+Qv09TLy5z0NC1YbYrxuzk+QIigWwVJUlvbjOMgwuTCOk/Uz9q
         Aqt8NkeNyyZGCd4zQz5sOSq1Jp5AtgiR4APZiMxhb6T4T7zahpgrn/13PhPy51vGsDa2
         aUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4yF/dBZvUdI7jPmuRQj/KahNk9taCdE/KQDKfwzRreY=;
        b=6UZVCjQV56gW8CIUai1ih3xKJk3GhYfuLmnJMfZKpkqaLNkV8au9f44Zetx9nX6zaf
         w+zW07Zw1N9tPC4w6a3rt/OE+W1HJyJEMMJeoTsnZDd5ElR9SN8Go9eibs/u5At6VGZh
         d3NzACOaJxxIPnaPTgoNpZQsm6nsFkEAq825sm+JqEGwqEFxrFDkUeyAAZv56IsnXk+F
         erULoHmiHh/dOirNTG0jy3t7p9+CiTvl0Od87lnO+xl95XR+x+3i8LW5btX0E8XxUTRA
         K1XuQ4Cq7F4Yw15jJpVPBNFwKSMILA2ky/CRZfWcCcJvFpldG7iuYD/8+kFpGjGUFJ7X
         GBDg==
X-Gm-Message-State: AJIora9Y0qRTPaRkGjr5x3EDhM0dykACu0aeQH7+3mxSRe6eVxyMO7lU
	tmSYrJivcdKtY968h8+tWwxl6bkN+cc=
X-Google-Smtp-Source: AGRyM1tl9OemBVv83q1e06HFaXP3z3u2SIDqEiy486RImFNK3Jc7opTNHnQfhZbMK63W66WJ+xIYcg==
X-Received: by 2002:a05:6402:a4f:b0:42d:db40:f685 with SMTP id bt15-20020a0564020a4f00b0042ddb40f685mr5335455edb.384.1655373451905;
        Thu, 16 Jun 2022 02:57:31 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	viryaos-discuss@lists.sourceforge.net
Subject: [ImageBuilder] [PATCH v3] uboot-script-gen: Add DOMU_STATIC_MEM
Date: Thu, 16 Jun 2022 12:56:39 +0300
Message-Id: <20220616095639.305510-1-burzalodowa@gmail.com>
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

Since currently it is not possible for a VM to have a mix of both statically
and non-statically allocated memory regions, when DOMU_STATIC_MEM is specified,
adjust VM's memory size to equal the amount of statically allocated memory.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2
- in add_device_tree_static_mem(), replace 'i' with 'val' because variable 'i'
  is already in use as an index
Changes in v3
- fix indentation
- in add_device_tree_static_mem(), declare 'cells' and 'val' variables local
  to not mess up any global variables by accident
- add a new function add_device_tree_mem() responsible for setting up
  the memory property in the device tree, as well as for adjusting
  the memory size accordingly when static mem is specified

 README.md                |  4 ++++
 scripts/uboot-script-gen | 48 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

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
index 0adf523..7781714 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -108,6 +108,48 @@ function add_device_tree_passthrough()
     dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
 }
 
+function add_device_tree_mem()
+{
+    local path=$1
+    local memory=$2
+
+    # When the DOMU is configured with static allocation,
+    # the size of DOMU's memory must match the size of DOMU's static memory.
+    if test "${DOMU_STATIC_MEM[$i]}"
+    then
+        local array=(${DOMU_STATIC_MEM[$i]})
+        local index
+
+        memory=0
+        for (( index=1; index<${#array[@]}; index+=2 ))
+        do
+            (( memory += ${array[$index]} ))
+        done
+        # The property "memory" is in KB.
+        (( memory >>= 10 ))
+    fi
+
+    dt_set "$path" "memory" "int" "0 $memory"
+}
+
+function add_device_tree_static_mem()
+{
+    local path=$1
+    local regions=$2
+    local cells=()
+    local val
+
+    dt_set "$path" "#xen,static-mem-address-cells" "hex" "0x2"
+    dt_set "$path" "#xen,static-mem-size-cells" "hex" "0x2"
+
+    for val in ${regions[@]}
+    do
+        cells+=("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((1 << 32) - 1))))")
+    done
+
+    dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
+}
+
 function xen_device_tree_editing()
 {
     dt_set "/chosen" "#address-cells" "hex" "0x2"
@@ -141,8 +183,12 @@ function xen_device_tree_editing()
         dt_set "/chosen/domU$i" "compatible" "str" "xen,domain"
         dt_set "/chosen/domU$i" "#address-cells" "hex" "0x2"
         dt_set "/chosen/domU$i" "#size-cells" "hex" "0x2"
-        dt_set "/chosen/domU$i" "memory" "int" "0 ${DOMU_MEM[$i]}"
+        add_device_tree_mem "/chosen/domU$i" ${DOMU_MEM[$i]}
         dt_set "/chosen/domU$i" "cpus" "int" "${DOMU_VCPUS[$i]}"
+        if test "${DOMU_STATIC_MEM[$i]}"
+        then
+            add_device_tree_static_mem "/chosen/domU$i" "${DOMU_STATIC_MEM[$i]}"
+        fi
         dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
         add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
         if test "${domU_ramdisk_addr[$i]}"
-- 
2.34.1


