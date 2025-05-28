Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA10AC7294
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 23:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999542.1380181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKO2z-0002Gn-M5; Wed, 28 May 2025 21:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999542.1380181; Wed, 28 May 2025 21:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKO2z-0002Eo-JR; Wed, 28 May 2025 21:10:49 +0000
Received: by outflank-mailman (input) for mailman id 999542;
 Wed, 28 May 2025 21:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMiF=YM=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uKO2y-0002Ed-GK
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 21:10:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 399f1543-3c08-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 23:10:47 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4d33f971aso189658f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 14:10:47 -0700 (PDT)
Received: from localhost.localdomain ([91.85.47.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4ef4f3aa3sm143910f8f.84.2025.05.28.14.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 14:10:45 -0700 (PDT)
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
X-Inumbo-ID: 399f1543-3c08-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748466646; x=1749071446; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=877Qh42+jkY8cdr8W69/LgWDAPp4oF1qwK/ps88nv2w=;
        b=H87x3MLGiVJ6vkmNoLWaNukYD9g1oGiLPVvBk3YrV+lkmRqARUgEDQrZ1AvOyGFPUG
         nCESBbFXWYA0I9mMCLY1xOkxTxVKgdAjmsZzP2pazq1iQieL/9AS4eW6ogi/2jlDtTdm
         UtaKOB2Sd5bjWhPabqkobxSKoNY7meSk6OfG+ei8VKlzaCL5DUcsmMCoLLB0KpzJ3WTu
         P4o6Xesd/cugQFjeMMDFI+qRzdGNRe1YUbHAPaAsoxk6+d1XrBKUIzXz8y7E5MrGfT8+
         coF+rII1OQwaXWmh/aE/Kkt+iMa/yNsogrgxUCj76lK7S89+cqbHBFk9GWsV1QCLNTpa
         8wLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748466646; x=1749071446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=877Qh42+jkY8cdr8W69/LgWDAPp4oF1qwK/ps88nv2w=;
        b=iNSXimvypDrhBHP0wA/aPZBVfBQTeODWcsiUmXw/uR+ocKdO2wD9sZLOhjUqrZB3n3
         rD1zQZ3/IF/qhupIRuLW0p4+1yQFEMPMB8+J4BTV240NT5TGMCTGH8msrJdeB1jQmXFS
         M4cX6veWbAZWYRIWFw0iIsEuhVAlRDK/PJViixH/EpkJ856s3m2sbY/+zk7ZhWmpog97
         CULB+ZDEBTxC0FF4Mzp82xdcAJkDw3uZzY8BDkRGJpeWgLfj/giKPEKuUGoh0ReUJVeU
         Oj1S0Mv/+RFDLHnPllspJ0ckhkMwf2bK640UAxVUmBvhvt+jtXqJKPA1xy2WpmlPDQWn
         6S7g==
X-Gm-Message-State: AOJu0Yxw9MAboMCkKJiS7CPpnC6ECvYWbY1LRhuI1P6gVwzsOKTiYL+r
	I92dnzy1vKZFn48qhRxiWSHsRP8wdXGEVWc6VioIXwczDI0k6gD2aPZgd1embMyJ
X-Gm-Gg: ASbGncs8z99RwA0ZQiTQ+dSUfqvyqH3vSCXiQt1r3dC6V0Q6fcCc1DFYc2YVoETam09
	yq19hXH9X+APCarXRV7Aykq65A5f5n9sIwTp763Q5y+9US+fVAq6uIKp4r1+JSRt4NFeNJO2ijR
	EU40Invu5pCmZODiZqMPY85pFsNhRO1IjHCIZRycie7YCyN97Genz4pL/0PQfSG/RGPX7Uw4w6J
	Nd2K3GJ2+qaJ8QoCfLG6UsiYC3+yS2ZjBcy4X3usNUZGdbj8ig0f+CS/Y2cICcIWxrX3xjy7BwU
	IbEtCcl8fq4UHVJeImgsd3SuviYsL7BXGimJdzB9rftKLWU/UifBjy/7RczELvr0mQUn6jmlnRU
	=
X-Google-Smtp-Source: AGHT+IEa+KeeVvXp6y4yzu1dcnTwLRlFU8CuyiBUzB06cq2FylipqWQgJDokiKcATuCO/eyo3T5MhA==
X-Received: by 2002:a05:6000:1a8e:b0:3a4:d367:c5aa with SMTP id ffacd0b85a97d-3a4e943c65dmr3436178f8f.20.1748466646138;
        Wed, 28 May 2025 14:10:46 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	Rich Persaud <persaur@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/3] docs: add documentation for Argo as a feature
Date: Wed, 28 May 2025 22:10:38 +0100
Message-Id: <20250528211040.10562-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds approachable documentation describing system components and
introduces the support statement for feature status.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 docs/features/argo-feature.pandoc | 99 +++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 docs/features/argo-feature.pandoc

diff --git a/docs/features/argo-feature.pandoc b/docs/features/argo-feature.pandoc
new file mode 100644
index 0000000000..b6a10be78a
--- /dev/null
+++ b/docs/features/argo-feature.pandoc
@@ -0,0 +1,99 @@
+% Argo interdomain communication
+% Revision 1
+
+\clearpage
+
+# Basics
+
+---------------- ----------------------------------------------------
+         Status: **Tech Preview**
+
+  Architectures: x86, ARM
+
+   Component(s): Hypervisor, guest
+---------------- ----------------------------------------------------
+
+# Overview
+
+Argo is a lightweight data transport for communication between virtual
+machines, with a simple hypervisor interface that is accessible for
+building embedded systems and designed to work with familiar primitives
+within guest OS kernels. It supports policy control over communication
+and isolation between VMs.
+
+# User details
+
+Argo is present in Xen, included since Xen 4.12. A Linux device driver
+and userspace library are available and Argo is regularly tested in the
+Xen Continuous Integration system.
+
+To configure a Xen system to enable Argo:
+
+* ensure that Argo is enabled in the hypervisor with KConfig option
+
+* enable Argo on the Xen hypervisor command line
+
+* load the Argo guest kernel device driver
+
+* ensure that the Argo guest libraries are installed
+
+The guest userspace libraries support software designed for Argo
+interfaces and also enables software designed for networks to
+communicate between VMs by Argo.  This allows platform software to be
+plumbed easily between virtual machines, without requiring networking
+and with system policy controls over this communication.
+
+# Technical details
+
+## Argo components
+
+* Xen: Argo in the hypervisor provides communication between virtual
+  machines.
+
+* Guest kernel: driver provides interfaces for data transport for use
+  within the kernel, and implements familiar abstractions for
+  networking software.
+
+* Guest libraries: provide application-level support for interdomain
+  communication.
+
+## Argo implementation within Xen
+
+See the public Xen headers for the primary interface documentation.
+
+# Limitations
+
+Argo has been developed and tested on x86 and ARM architectures.
+
+# Testing
+
+The Argo test developed for the Xen Test Framework provides coverage of
+the hypercall operations.
+
+The Xen Project CI provides system test coverage of an Argo-enabled Xen
+system with Linux.
+
+# Areas for improvement
+
+## Argo and VirtIO
+
+References to design documentation for the development of an Argo
+transport for VirtIO are available via:
+https://wiki.xenproject.org/wiki/Virtio_On_Xen
+
+# Known issues
+
+* For development: sysctl/domctls for toolstack to control per-VM access
+  to Argo
+
+# References
+
+See the ARGO section of the Xen MAINTAINERS document for web reference.
+
+# History
+
+------------------------------------------------------------------------
+Date       Revision Version   Notes
+---------- -------- --------- ------------------------------------------
+2025-05-28 1        Xen 4.12+ Feature included in Xen 4.12.
+---------- -------- --------- ------------------------------------------
-- 
2.34.1


