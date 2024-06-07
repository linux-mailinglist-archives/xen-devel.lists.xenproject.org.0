Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B423790003C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 12:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736472.1142560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFWT2-00036r-DY; Fri, 07 Jun 2024 10:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736472.1142560; Fri, 07 Jun 2024 10:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFWT2-00035M-Ar; Fri, 07 Jun 2024 10:05:04 +0000
Received: by outflank-mailman (input) for mailman id 736472;
 Fri, 07 Jun 2024 10:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKbl=NJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sFWT1-00035G-CO
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 10:05:03 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 675769f3-24b5-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 12:05:01 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42166eb31b2so4684275e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 03:05:01 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2cd2d3sm47711145e9.41.2024.06.07.03.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 03:04:59 -0700 (PDT)
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
X-Inumbo-ID: 675769f3-24b5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717754700; x=1718359500; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cC7s1N5JwzVGpOSE8kERMNzt+zX1aSVzHWVpT78zhhc=;
        b=SX8B+ShbqXzIcmHG114pqic9U5nE6i5TUyroJNeKToa7pVPuIQq8Spfbn+6dO1PTIE
         jjDRKJpMO1hEht4j00OKWnM6ZM+TA4HikLx2qbZGkwvLhCRiUwsD7k2UJPYDd0+MiaZm
         D/20HkvnR0GMlCOWyVdjaHLzl1NKD25NcaZCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717754700; x=1718359500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cC7s1N5JwzVGpOSE8kERMNzt+zX1aSVzHWVpT78zhhc=;
        b=Klp2l6QvFrijOh8afllieBTcraJ5APFcpzmxue7RHXuizikmHC0oyeZgS2aWArXewi
         +ZLGs7eNAuab/+huQ6sIYWg/F3ATXh9EUrAr+Pq40bPfgE/6jpa5DauQhdYPeBzIgtDf
         iKks10GzrzWiRn64f6IgjovLPyenQsueOXZa8WoYor8SKK9lj9bNQ5gfHcGViZqM4eY3
         tRF+nOnsp7HilyVX0KigcBva3o37QaNlAK+QuY9ykBZK++41Db1RxgHwNqVjLMuZsnYa
         0MI3yP3Qj4l3Te5ctIGKeG8yr1iG9MYOo904FBue3T8ywjXrIca5Lh9hFSWIpv0LWdtV
         DSHQ==
X-Gm-Message-State: AOJu0Yxf1UrrYMqG5MHDzoscClBjfTl6yrqJFO9NFqtKImqdG3425GZe
	WnYZpvQ0qQvKEjXbuGtsf7/yokhYnklJN9sZYMC0KqBloG7uh7K3o8omlqa4tnOvmqpa2U9+nXV
	cFc8=
X-Google-Smtp-Source: AGHT+IGGSfkS678KPq++R8Uvx6ts2+CcsegeQJNkfwyPpnpjFUuKnNCW8ZTijz0urPRNrSLJy6Ivmg==
X-Received: by 2002:a05:600c:3d93:b0:41c:290e:7e6b with SMTP id 5b1f17b1804b1-421649f4a2amr17692325e9.13.1717754699717;
        Fri, 07 Jun 2024 03:04:59 -0700 (PDT)
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
Subject: [PATCH for-4.19] x86/pvh: declare PVH dom0 supported with caveats
Date: Fri,  7 Jun 2024 12:03:20 +0200
Message-ID: <20240607100320.11723-1-roger.pau@citrix.com>
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
---
Hopefully this will attract more testing an resources to PVH dom0 in order to
try to finish the missing features.
---
 CHANGELOG.md |  1 +
 SUPPORT.md   | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

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
 
-- 
2.44.0


