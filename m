Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8268A82D3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707424.1105347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45X-0007Ms-8D; Wed, 17 Apr 2024 12:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707424.1105347; Wed, 17 Apr 2024 12:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45X-0007Jx-3c; Wed, 17 Apr 2024 12:08:31 +0000
Received: by outflank-mailman (input) for mailman id 707424;
 Wed, 17 Apr 2024 12:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bxKY=LW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rx45V-0006LA-Iu
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:08:29 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3379bda6-fcb3-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 14:08:29 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a5557e3ebcaso86768466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 05:08:29 -0700 (PDT)
Received: from EPUAKYIW03DD.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 zh17-20020a170906881100b00a5271ae4458sm3484247ejb.16.2024.04.17.05.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 05:08:26 -0700 (PDT)
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
X-Inumbo-ID: 3379bda6-fcb3-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713355708; x=1713960508; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4GN6k0JwPyQRPpK231MLixXO3px4oGXprs3iL1xZi8=;
        b=MRoEHqedvsXZ1HJ+k95qDI7SZTk5ou08Pdv6ycREvxTSdjHg7zcWbRNs3kx+wJqPxr
         T/PulHjrNctrRQZJrHA65OzH7ULiZnwrbiV2EJ69Vmr+n+qBapHJZ3MPhFD+Qif9+srk
         9Ep5+6NA3UkTuoPHKs3hnZTtSCd8UGtXKigahW2bkqWrAW97wnUFEcdA0pCQtksTLjel
         BiQFW+ZuMpDBwJpQ/Sb0QYsmbiYtg2CBDgejwU4NHp0+Ef/m39rRNaypAmBAV4y57ZZ1
         fsWr/NYGN8faVoAVXZ2Qwxo0P1rToL09GDNanxPb/TL9UcU6tIdBMfl6IiD2Rlz0xsXB
         bdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355708; x=1713960508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4GN6k0JwPyQRPpK231MLixXO3px4oGXprs3iL1xZi8=;
        b=rXdqXvErig//BoyAumQI+apQS0L6mIJMATWLeYqa0KEuIhr2ekziLB57atFdmToGkx
         htBuXQSuW9L3zF9PbHS5GXchxAxH8hYLlfBs5+bbYiOG4gZjkkI3SuMdi4Z0ENdv1rl7
         ax3xRrTQiS8jczGo9hQEf5Z7NN9xXjcCK8Tbc6Yo6HUBDEfugJuXb2pLq/Lv7EhMbIsT
         FYI7PFbxDKD+XsxSm2NWqq8J5mE7YaNwQ1L/7MqRcydHXsaWcFjR9hgzHSfKJJP32vrY
         Dq2CaqHkts8wt2i4/yNqjB8DLK9vOm75Mfm6glLBnliSGdTVC7OF9NcXJ3yCEhIPKGLc
         i4FQ==
X-Gm-Message-State: AOJu0YwcGLYXf30vNJad5rqe+rw9LGqbfKiEDRGODhzo9K8WCQAzJE5P
	DoQoQJSCWHWQzy1QBEFDAuq2tysWG6kZTkGJ8Jha6Q0e0JDRqbPRl5qvwQ==
X-Google-Smtp-Source: AGHT+IGwt9EigWWHTg9MtqaVnIToTJrMrHzuOR3J9RTn7El85XRsROYhk7/E0iHVGj1yWOXdLMpWhA==
X-Received: by 2002:a17:907:7f87:b0:a51:d081:4bab with SMTP id qk7-20020a1709077f8700b00a51d0814babmr5038579ejc.21.1713355707902;
        Wed, 17 Apr 2024 05:08:27 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [ImageBuilder 4/5] uboot-script-gen: Add ability to unselect "vpl011"
Date: Wed, 17 Apr 2024 15:07:40 +0300
Message-Id: <20240417120741.2453431-5-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417120741.2453431-1-olekstysh@gmail.com>
References: <20240417120741.2453431-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Introduce new option DOMU_VPL011[nr] that can be set to 0
or 1 (default).

Also align "console=ttyAMA0" Linux cmd arg setting with "vpl011" presense.

Suggested-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 README.md                | 7 ++++++-
 scripts/uboot-script-gen | 7 +++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index b2459fd..63c4708 100644
--- a/README.md
+++ b/README.md
@@ -151,7 +151,8 @@ Where:
 - DOMU_KERNEL[number] specifies the DomU kernel to use.
 
 - DOMU_CMD[number] specifies the command line arguments for DomU's Linux
-  kernel. If not set, then "console=ttyAMA0" is used.
+  kernel. If not set and DOMU_VPL011[number] is not set to 0, then
+  "console=ttyAMA0" is used.
 
 - DOMU_RAMDISK[number] specifies the DomU ramdisk to use.
 
@@ -232,6 +233,10 @@ Where:
 - DOMU_MAPTRACK_FRAMES[number] is optional but specifies the maximum number
   of grant maptrack frames (the default value used by Xen on Arm64 is 1024)
 
+- DOMU_VPL011[number] is optional but used to enable (1)/disable (0) a virtual
+  PL011 UART for domain. The default is 1. If explicitly set to 0, then
+  "console=ttyAMA0" is not used as a default DOMU_CMD[number].
+
 - DOMU_CPUPOOL[number] specifies the id of the cpupool (created using
   CPUPOOL[number] option, where number == id) that will be assigned to domU.
 
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index adec6f9..fd37e18 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -344,7 +344,10 @@ function xen_device_tree_editing()
             add_device_tree_static_mem "/chosen/domU$i" "${DOMU_STATIC_MEM[$i]}"
             dt_set "/chosen/domU$i" "direct-map" "bool" "${DOMU_DIRECT_MAP[$i]}"
         fi
-        dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
+        if test -z "${DOMU_VPL011[$i]}" || test "${DOMU_VPL011[$i]}" -eq "1"
+        then
+            dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
+        fi
         if [[ "${DOMU_ENHANCED[$i]}" == 1 || ("$DOM0_KERNEL" && "${DOMU_ENHANCED[$i]}" != 0) ]]
         then
             dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
@@ -677,7 +680,7 @@ function xen_config()
         then
             DOMU_VCPUS[$i]=1
         fi
-        if test -z "${DOMU_CMD[$i]}"
+        if test -z "${DOMU_CMD[$i]}" && (test -z "${DOMU_VPL011[$i]}" || test "${DOMU_VPL011[$i]}" -eq "1")
         then
             DOMU_CMD[$i]="console=ttyAMA0"
         fi
-- 
2.34.1


