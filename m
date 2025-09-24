Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA4B992EC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 11:37:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129205.1469257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Lv6-0000bo-Ou; Wed, 24 Sep 2025 09:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129205.1469257; Wed, 24 Sep 2025 09:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Lv6-0000Ye-LX; Wed, 24 Sep 2025 09:36:16 +0000
Received: by outflank-mailman (input) for mailman id 1129205;
 Wed, 24 Sep 2025 09:36:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CQP=4D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v1Lv5-0000YY-AZ
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 09:36:15 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9752e3f-9929-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 11:36:13 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b0b6bf0097aso1182819566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 02:36:13 -0700 (PDT)
Received: from fedora (user-109-243-67-38.play-internet.pl. [109.243.67.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b29f45b5384sm856040566b.27.2025.09.24.02.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 02:36:12 -0700 (PDT)
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
X-Inumbo-ID: e9752e3f-9929-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758706573; x=1759311373; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eM13Ah7EvPl7q7ylYUqO4dw83eLOYYf8SpoQ1C3vCO4=;
        b=E0KTT77AH23gK5L7Xg3yBXPwJizZVm3u683uTE9IBb+srDO9FQ7bVJAyQH2h5zofh+
         09S8YtnBqti0btGw5h7YvOWU55n6VvBpKCzjdMS53BKn0eGAhXsAd++/5m8UKp+V0sc7
         XkRfhVFbySL8jsjom9acaoMZo8p2OjMQcMS/yPsogDVDSgEJgC511aeeSSVfukXae2Ds
         Ma3LC6MATwI3PF5VmxrfpO/b6VysNefgQosDDMYOonODTZk6AP0040fqX0lQmnVYlgP+
         lnlEWSL52R/C7MgBmap9qCgez21jqUEA/Gf9do/mn8gNfjVugz3q7icTqLA7XwDY2C+t
         s2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758706573; x=1759311373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eM13Ah7EvPl7q7ylYUqO4dw83eLOYYf8SpoQ1C3vCO4=;
        b=klbB70Zq2FQpcLwxzY2mczSs7PihKX7EReMiaBHpMsaglRAus9A6e75OsjNxDfrMUe
         K3fjXd8oB8jd4l1hyXzzcPnzCkqnalFW0oh1uawFXZncj4w/P6K7e77yy2F3vWDyvpzn
         8WCr0X/iLFVE5zBuXURMhfBeQuTmc4zjMeHoqUo3dazHpsIOsTK0cil8gXgsmtsjhG57
         +QhehzG7wxFEw5LNslZsFYGHlIAstTdUs4iaKRMi+yRd/QodE/22ffmPpogkUX3iFBSx
         eqjTfRSwneQ8UG5swKhTDmepCKl8KK5vM0YDah/RummGnsBVk2knXE5mQkiEVaFe7M34
         sr9Q==
X-Gm-Message-State: AOJu0YymFvCxuT92jeM+flO0pq83XmW8RgWdUhI/H1j4vo0e2pqTXZqi
	EWX0F8pHppJsJm2oYBH6g+r82s8sAO/bUHqHKBtTTjVhOizQ+onh7zdq3/thaQxC
X-Gm-Gg: ASbGncvE3vq/TQOJKSwJBmsp9J+EYyQ3OsKQYV4Dkah2FyhyR4V9jjuGrdr/eeYWaj9
	74rBsaYolcCAPrdIVT/XdxRqHZ75uFbJyFt7GFzwCANKZawvAnskt8Sa0LHCGyEVrbeqjRbOAkp
	xlAFsUFdga1ZqBUKMvVAzp512Ey1MmKpv5FXOICXxzuXtVeHPshr/39D4c9oqquexGEnxdumVu2
	m34B0Eol0iODv3f15DPuBND+z/ltpeRtkITqpndFzggFWJHUymXWxgM7qg1avYoPTdE4sm3SnGY
	nHBPscIgW6WtPVpJdn9BuAjikE2vjpRusnXrPBlmluN9+MlBot0r45P3Hhx5dceFooZAKJNa/r5
	s9Q/nwrAlgwZfSfGWJzzk4JDRr4IUJDTQO1oSqOyyh0Gk4RWNyefYscajxXBw3UWsVEcdO55lYA
	==
X-Google-Smtp-Source: AGHT+IG3WifV+IqHTvoUsXBBrRoGqXZpCVxcU3HUWzNtVXFHkS4wwBMF2KyBT6FI7avwk4Lkz80OUA==
X-Received: by 2002:a17:907:3d56:b0:b04:4175:62f7 with SMTP id a640c23a62f3a-b302a17bd6amr626528666b.33.1758706572718;
        Wed, 24 Sep 2025 02:36:12 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH] CHANGELOG.md: Update for 4.21 release cycle
Date: Wed, 24 Sep 2025 11:36:04 +0200
Message-ID: <20250924093604.17110-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 CHANGELOG.md | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ca1b43b940..5a0902cc3e 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
    to the baseline change.
  - Linux based device model stubdomains are now fully supported.
+ - Remove libxenctrl usage from xenstored.
 
  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
@@ -21,6 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Allow controlling the MTRR cache attribute of the Xen platform PCI device
      BAR for HVM guests, to improve performance of guests using it to map the
      grant table or foreign memory.
+   - Allow to unflatten DTs.
 
 ### Added
  - Introduce new PDX compression algorithm to cope with Intel Sierra Forest and
@@ -36,11 +38,20 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
      Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
      and 28 (Temperature Probe).
+   - Basic kexec support to Mini-OS for running in PVH mode.
 
  - On Arm:
-    - Ability to enable stack protector
+    - Ability to enable stack protector.
     - GICv3.1 eSPI (Extended Shared Peripheral Interrupts) support for Xen
       and guest domains.
+    - SMMU handling for PCIe passthrough.
+    - R-Car Gen4 PCI host controller support.
+    - SCI SCMI SMC single-agent support.
+    - Initial support for MPU, R82, and R52: reaches the early boot stages.
+
+ - On RISC-V:
+    - Basic UART support and external interrupts (APLIC/IMSIC only) handling
+      for hypervisor mode.
 
 ### Removed
  - On x86:
-- 
2.51.0


