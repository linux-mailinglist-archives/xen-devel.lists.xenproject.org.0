Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140B0BA47BF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 17:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131664.1470631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2Afr-0005fi-Sk; Fri, 26 Sep 2025 15:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131664.1470631; Fri, 26 Sep 2025 15:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2Afr-0005dC-QA; Fri, 26 Sep 2025 15:47:55 +0000
Received: by outflank-mailman (input) for mailman id 1131664;
 Fri, 26 Sep 2025 15:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5CHW=4F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v2Afq-0005d6-38
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 15:47:54 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29a3b857-9af0-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 17:47:53 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3164978f11so436191466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 08:47:53 -0700 (PDT)
Received: from fedora (user-109-243-67-38.play-internet.pl. [109.243.67.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3544fcdd89sm392116266b.79.2025.09.26.08.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 08:47:51 -0700 (PDT)
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
X-Inumbo-ID: 29a3b857-9af0-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758901672; x=1759506472; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Rt00F//oeAyBrfAKD78jVuBtJwtye0ynXNfDUvkFiM=;
        b=e/D0gBj8LVUFE15nH6JY04xuaFSqqiCmu9kXPOd9E6XNwz1MIFRwIHx/Mfy0I7Kd2K
         Wr/QKqNVQBA+cNQcw89J3CIBF5hpG++7G+sQ+OrVQ70B81Tjx2MnbMRIahUwQm5l/Ko/
         zi48ymEoK44ruCUSTaVK+2V2pDRghAT03TABCQ7F36bAf/XtF/tRu4+TOoiK9sdYoaaN
         2NlmPurv+eP6g6baG5QoA7Vzoyu/KYAQDNMXKkbJol13/8ux38eZQz/6REMLC4aaz2W1
         M2VAuBqB8TIAHHNbRC6Lol6NTM/CNKMp8H0tw5vSCcCD01UcbjkONHYn4fHaaKoixKmw
         j9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758901672; x=1759506472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Rt00F//oeAyBrfAKD78jVuBtJwtye0ynXNfDUvkFiM=;
        b=w78h+Q7pZvksI9/Y/a/qBA5jRb2BfLK/w9aUJlvVYLIF/2C4qjb6EJXV5pbXXFka/K
         WphYhvrs358P4TdVEGJ1D9KK7qfSLsVE+KGpog6G3yWy8jbmFKfR1OGLTjMNeea0fIG3
         8FNw413B/5vSPGjVM8iMA0McN688S+m5pZSLBiG6XKgYaK7FO0mDdJtqdXPLV1SvcSzf
         opmP4HGg0tmzIqD1ln+izo8woKH7aFyGp1xsUZMXtLS1UuxketMdrXdz4JFhSFil66zj
         IzpkZn6sbfxBjp8+9ux9Uw08gAMkMOTuIpTKE7J3KAAvvR5+MLMgValJmB4HjxKWGwXy
         J3qw==
X-Gm-Message-State: AOJu0Yy8jvW90S0w18jPpSNo2RCoPX9bnvp06skMxtxzYhZYj12CPoQ4
	5+i6K+IZI9p/QCBG6cUCrUkcqzkLy922GO47hd5lJ7485LfMQQPEvJ0dTeORnIqK
X-Gm-Gg: ASbGnctKSBnlqE688kDGH6eIo0HNfy1yzPo/KLhvd18Rex63ApgUddCzT2q7vBChxd0
	uLovIJiA/oyE0rH/kZCigk2K/rndsR5/L56eZ9s4CuEuB3DPaTdycn7rDvSHd5vaw4tjMUyhitL
	DTOnpfoDEvx7A3H5xJEhARVzvCQhC4SD9aH3h08qh2VGaVmCoFNZIHj1egdvTRe3Lm463ley00E
	Hu/akxLJbSqtAoP52OlrwpdShPsll9hWFPDE9ya8vl8BechHU9dvCx6YK//f8Ysqt7Kr4t5Ln5m
	MY2wWb/iyVf27Y2s3bAHTGF/gJttbYqoyMZp2ed1A5Hv8eHJql/T56+TBWSSqc12AI2YTlzIPzI
	6sUi5+vBR6osag4jBsR0PPOe4n4cSUoShBc2ZLXhL9wbxzZGlP2LvFfLVrHsCcZk=
X-Google-Smtp-Source: AGHT+IHVbHHATGYLWa4GCRLvTVmILv2/7MQh2tE1R8BhPwsXXn6f3oEsZDGGDWn58SmI7jmz3rvUzQ==
X-Received: by 2002:a17:907:9628:b0:afe:be04:5ce2 with SMTP id a640c23a62f3a-b34bc67bdc0mr807195766b.64.1758901672243;
        Fri, 26 Sep 2025 08:47:52 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	committers@xenproject.org
Subject: [PATCH v2] CHANGELOG.md: Update for 4.21 release cycle
Date: Fri, 26 Sep 2025 17:47:43 +0200
Message-ID: <1930832802df980a6fe610233265bc238fcfaca4.1758901622.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Chnages in v2:
- Drop the following items:
  - Allow to unflatten DTs.
  - Basic kexec support to Mini-OS for running in PVH mode.
---
 CHANGELOG.md | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ca1b43b940..0afd2eeb4b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
    to the baseline change.
  - Linux based device model stubdomains are now fully supported.
+ - Remove libxenctrl usage from xenstored.
 
  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
@@ -38,9 +39,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      and 28 (Temperature Probe).
 
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


