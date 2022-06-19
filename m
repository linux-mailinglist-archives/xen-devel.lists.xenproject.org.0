Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D392B550AA2
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jun 2022 14:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352155.578892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2uHH-0001x5-Bu; Sun, 19 Jun 2022 12:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352155.578892; Sun, 19 Jun 2022 12:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2uHH-0001tx-8y; Sun, 19 Jun 2022 12:43:43 +0000
Received: by outflank-mailman (input) for mailman id 352155;
 Sun, 19 Jun 2022 12:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWMG=W2=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o2uHG-0001dY-EM
 for xen-devel@lists.xenproject.org; Sun, 19 Jun 2022 12:43:42 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72c43af4-efcd-11ec-bd2d-47488cf2e6aa;
 Sun, 19 Jun 2022 14:43:41 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id ej4so7713417edb.7
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jun 2022 05:43:41 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 b9-20020a17090630c900b006feba31171bsm4602659ejb.11.2022.06.19.05.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 05:43:40 -0700 (PDT)
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
X-Inumbo-ID: 72c43af4-efcd-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FjZNmxi+2WT8F5w+hlZIxGF+xmDyxTtCYBnFYEEitNo=;
        b=iwCNl++eIweW8fcKZ+9+ip7WKlT0EFV8s2Ho07eIdsHUuDn85ZGDbXcdOZHTLjJe5U
         lFDTISGPUkGip4D1d9J1WnSiPTenBnZcYJtpTg/MAIDNHcVl850/stNpY4NWfdxkU5Qk
         0jqn4zqB689aNQ+6zzEyFG3xyE9ZcKl3quiVR8KWoTDOX1ySsDnyJgc2jZ9wKPaklnZN
         9qDZ/GKYvLVSnH+qzukSNRv/XTbrUKyZhD9XYQ6GLAOEbObyoKn1wQHP34dofNn+5uDU
         9ugpuoQvwcWZiBUNCp83fTzgjkGmc67AzqgqulzIZTO7m1iYMPSfOHGmr1nInsmVhN7k
         KtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FjZNmxi+2WT8F5w+hlZIxGF+xmDyxTtCYBnFYEEitNo=;
        b=0K/bUyr4v+CLuLxboe1WEx1nyreohAtNWTj9Zmd60Npm9M1oByChsnJ/nkZ3x5TxAd
         OpkIMhFMS3yiEdTUZobeaQqtd7hg9ZnTInKO0nKg+lvNMbi3doxcIbVNe/9W+bGMH8MO
         PTE6xGEtXgljiha/Ifjq/rj73AcY2+GH1o2GVfCBwIfYJ1s9aUuIo5qGs45ZtqWk0J+1
         y85NtsMd90P+CgNnxda7KztKmqBYUvnJo3zAFkvvM99O+9+JYnIsmoOSD1J6dbuBe1Ji
         rJGrrLm3Eyq7Di7EznJaHp0MXlRb9ioY+XDD4v/ieaMPIZF+RYDEuFdmWArF0rOFke3p
         M/zg==
X-Gm-Message-State: AJIora+dR6TIzSHxc7yIj/GKUAKdtWXlrS/C+nBipbtulelcz3XQdIBM
	CwJSiLhef4cRbBgaqwksROfi5XvcoxA=
X-Google-Smtp-Source: AGRyM1s+EnV1hRSzk8o7pv5EPl82xJMr9HVxhgKyCD3hsOOIbTnzSFUAlIo+abrnHJdIfQPZ1rfUwA==
X-Received: by 2002:a05:6402:2706:b0:430:6238:78d5 with SMTP id y6-20020a056402270600b00430623878d5mr24049336edd.413.1655642621005;
        Sun, 19 Jun 2022 05:43:41 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	viryaos-discuss@lists.sourceforge.net,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [ImageBuilder] [PATCH 2/2] uboot-script-gen: Enable direct mapping of statically allocated memory
Date: Sun, 19 Jun 2022 15:43:16 +0300
Message-Id: <20220619124316.378365-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220619124316.378365-1-burzalodowa@gmail.com>
References: <20220619124316.378365-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Direct mapping for dom0less VMs is disabled by default in XEN and can be
enabled through the 'direct-map' property.
Add a new config parameter DOMU_DIRECT_MAP to be able to enable or disable
direct mapping, i.e set to 1 for enabling and to 0 for disabling.
This parameter is optional. Direct mapping is enabled by default for all
dom0less VMs with static allocation.

The property 'direct-map' is a boolean property. Boolean properties are true
if present and false if missing.
Add a new data_type 'bool' in function dt_set() to setup a boolean property.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 README.md                |  4 ++++
 scripts/uboot-script-gen | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/README.md b/README.md
index c52e4b9..17ff206 100644
--- a/README.md
+++ b/README.md
@@ -168,6 +168,10 @@ Where:
   if specified, indicates the host physical address regions
   [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
 
+- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
+  If set to 1, the VM is direct mapped. The default is 1.
+  This is only applicable when DOMU_STATIC_MEM is specified.
+
 - LINUX is optional but specifies the Linux kernel for when Xen is NOT
   used.  To enable this set any LINUX\_\* variables and do NOT set the
   XEN variable.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index bdc8a6b..e85c6ec 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -27,6 +27,7 @@ function dt_mknode()
 #   hex
 #   str
 #   str_a
+#   bool
 function dt_set()
 {
     local path=$1
@@ -49,6 +50,12 @@ function dt_set()
                 array+=" \"$element\""
             done
             echo "fdt set $path $var $array" >> $UBOOT_SOURCE
+        elif test $data_type = "bool"
+        then
+            if test "$data" -eq 1
+            then
+                echo "fdt set $path $var" >> $UBOOT_SOURCE
+            fi
         else
             echo "fdt set $path $var \"$data\"" >> $UBOOT_SOURCE
         fi
@@ -65,6 +72,12 @@ function dt_set()
         elif test $data_type = "str_a"
         then
             fdtput $FDTEDIT -p -t s $path $var $data
+        elif test $data_type = "bool"
+        then
+            if test "$data" -eq 1
+            then
+                fdtput $FDTEDIT -p $path $var
+            fi
         else
             fdtput $FDTEDIT -p -t s $path $var "$data"
         fi
@@ -206,6 +219,7 @@ function xen_device_tree_editing()
         if test "${DOMU_STATIC_MEM[$i]}"
         then
             add_device_tree_static_mem "/chosen/domU$i" "${DOMU_STATIC_MEM[$i]}"
+            dt_set "/chosen/domU$i" "direct-map" "bool" "${DOMU_DIRECT_MAP[$i]}"
         fi
         dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
         if test "$DOM0_KERNEL"
@@ -470,6 +484,10 @@ function xen_config()
         then
             DOMU_CMD[$i]="console=ttyAMA0"
         fi
+        if test -z "${DOMU_DIRECT_MAP[$i]}"
+        then
+             DOMU_DIRECT_MAP[$i]=1
+        fi
         i=$(( $i + 1 ))
     done
 }
-- 
2.34.1


