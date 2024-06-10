Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8398D901D46
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 10:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737061.1143188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGak2-0003RT-Vo; Mon, 10 Jun 2024 08:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737061.1143188; Mon, 10 Jun 2024 08:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGak2-0003OZ-T8; Mon, 10 Jun 2024 08:51:02 +0000
Received: by outflank-mailman (input) for mailman id 737061;
 Mon, 10 Jun 2024 08:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGak1-0003NB-7y
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 08:51:01 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f868f72-2706-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 10:51:00 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52c8ddc2b29so470095e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 01:51:00 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0e49e898sm6676580f8f.22.2024.06.10.01.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 01:50:58 -0700 (PDT)
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
X-Inumbo-ID: 8f868f72-2706-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718009459; x=1718614259; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=De9eQf+RRJBH4siiQAx4glFqcwjN/h5NTtVT8vduH1g=;
        b=dU17lyMgqVgVHSaOryqMqOtFuGz1nXj/uRSA6/DLjzM69jFygNkg+NpJSlHgj3FDWY
         a/ZuVW0VLxwUF3KLT+VGgZT+FpgQl4z4d6BF+G94wdOJTOBliWJrNAHrLm9JNauqhvIq
         zgRu1jjIyqxgB7ebN8BBoxRrnVsKF6MHmeA0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718009459; x=1718614259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=De9eQf+RRJBH4siiQAx4glFqcwjN/h5NTtVT8vduH1g=;
        b=J9KThnik8jFaPQCuWfCsHJX9fssDhbjhUsCZabkAgMza3Fa6m6EH473tLL5A9G7bo4
         fxU0aEjH0nAbkS4uwlAmaD8n8aikb18aqy1c3NTQTSVvBmvEMN4fcDN3Oo+Wf9CsG5Ev
         KVSSp76/wOL6vD1PDK8nIP7fmNawJ7O/1nPjoWxNypK8Z9h6mWr9SZI7NZ81vSEoO1G6
         z/nNq1BBTigVXmQnwAyvFKtVMiocv+yjA6j1iJS6RXUJnmvBWNvf0sFOsC2K3GbPpBU6
         4spNUUlozUONiaO6FB321qR/bfn+KNBPmvHbWDbrYZQyDnRhGM2MdaMo52MFEnHMPlo4
         Bsnw==
X-Gm-Message-State: AOJu0Yz57/vLyXCr9sktD4Nj2/smJrJd4XlpVhbIJ+I1gzVahSzr4otx
	Nwc9fd4dlJIzC91p5Njp5VMhYDzF2r1stblr61WPvFqkUyqecTTIzsK4QvzPgSKB5KnFAqDEEXi
	Z
X-Google-Smtp-Source: AGHT+IG2aSm0jdoW2rk0v5C9fQQkJy/SNNR/86B2O4aqqEQ74/wErpgNdDF2TrAdubVoOqjErn8GKg==
X-Received: by 2002:ac2:5dfc:0:b0:52c:8a9b:17f4 with SMTP id 2adb3069b0e04-52c8a9b19e4mr1411736e87.37.1718009458784;
        Mon, 10 Jun 2024 01:50:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.19 v2] x86/pvh: declare PVH dom0 supported with caveats
Date: Mon, 10 Jun 2024 10:50:52 +0200
Message-ID: <20240610085052.8499-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PVH dom0 is functionally very similar to PVH domU except for the domain
builder and the added set of hypercalls available to it.

The main concern with declaring it "Supported" is the lack of some features
when compared to classic PV dom0, hence switch it's status to supported with
caveats.  List the known missing features, there might be more features missing
or not working as expected apart from the ones listed.

Note there's some (limited) PVH dom0 testing on both osstest and gitlab.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes since v1:
 - Remove boot warning.
---
 CHANGELOG.md                  |  1 +
 SUPPORT.md                    | 15 ++++++++++++++-
 xen/arch/x86/hvm/dom0_build.c |  1 -
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 201478aa1c0e..1778419cae64 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - HVM PIRQs are disabled by default.
    - Reduce IOMMU setup time for hardware domain.
    - Allow HVM/PVH domains to map foreign pages.
+   - Declare PVH dom0 supported with caveats.
  - xl/libxl configures vkb=[] for HVM domains with priority over vkb_device.
  - Increase the maximum number of CPUs Xen can be built for from 4095 to
    16383.
diff --git a/SUPPORT.md b/SUPPORT.md
index d5d60c62ec11..711aacf34662 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -161,7 +161,20 @@ Requires hardware virtualisation support (Intel VMX / AMD SVM).
 Dom0 support requires an IOMMU (Intel VT-d / AMD IOMMU).
 
     Status, domU: Supported
-    Status, dom0: Experimental
+    Status, dom0: Supported, with caveats
+
+PVH dom0 hasn't received the same test coverage as PV dom0, so it can exhibit
+unexpected behavior or issues on some hardware.
+
+At least the following features are missing on a PVH dom0:
+
+  * PCI SR-IOV and Resizable BARs.
+
+  * Native NMI forwarding (nmi=dom0 command line option).
+
+  * MCE handling.
+
+  * PCI Passthrough to any kind of domUs.
 
 ### ARM
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 6acbaceb94c1..f3eddb684686 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1360,7 +1360,6 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         print_e820_memory_map(d->arch.e820, d->arch.nr_e820);
     }
 
-    printk("WARNING: PVH is an experimental mode with limited functionality\n");
     return 0;
 }
 
-- 
2.44.0


