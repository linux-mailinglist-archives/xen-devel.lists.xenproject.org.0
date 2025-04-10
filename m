Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C11A84207
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945332.1343592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNI-0005An-6S; Thu, 10 Apr 2025 11:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945332.1343592; Thu, 10 Apr 2025 11:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNI-00058Y-2C; Thu, 10 Apr 2025 11:47:16 +0000
Received: by outflank-mailman (input) for mailman id 945332;
 Thu, 10 Apr 2025 11:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qNF-0003hP-TR
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:47:13 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 896c174a-1601-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 13:47:10 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so4780455e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:47:10 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893776dfsm4651418f8f.33.2025.04.10.04.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 04:47:09 -0700 (PDT)
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
X-Inumbo-ID: 896c174a-1601-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744285630; x=1744890430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQtcmdgC+7vfQg2A8IxuYMtTNVD5Qv9GQXTpir99CIU=;
        b=GgHF0oGoS+72C4yATUemQTKfSH6SnhLfbCdapOIp1sRJCIaU6xLhkuK2OojeAGStp+
         q15UOJIM0WLJK9KlJvbR7j3qAtAVIIwAcsUHye+fktBgwtzm3MuNh1SnBPTudCNWnLnp
         bEcat/Q2nTUAfOhVU+IiiN2To3EifQqGOuIDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744285630; x=1744890430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQtcmdgC+7vfQg2A8IxuYMtTNVD5Qv9GQXTpir99CIU=;
        b=afnlfCIVMirdkzSeQXssC6YLJcCG78Z8Tbk7ePe4Np3HUGYHEFd7tnNFPLY/vChdeI
         aBibKtk7W7NtvFLpXqx9pk732hcEnuHbsmhD5pgqZtKD10NxJ/EWh/CUnvdHGQ+CbBu1
         ShbAx0y9bEMBV1PljZipyfN6QFK6JHcFXPAFZ9DVNDbNxDZmaz+BjfEdzdbWwrNa0wWH
         HSC5ULLvBuM0wQZPYop3pJ/xFhbPOgaapWBzFj7xHclHIqE8UPx9oR6+ra+e9RD1SVnC
         XrN3D3UcYF3Rn0uEU9jtAKbidixSwBHXd4FvtPKg3J2wqVpBzLvF6YhJQUGCR142iNrd
         QYOA==
X-Gm-Message-State: AOJu0YxFj5++iuBQ8ed3mbYzfC4NCz+Qj/37c/BQ/uqxhi4aI0Mg5rYL
	1S7uP5pxUwjZX9jJfs8AyjglcGtYFw80tEcR92wM6LCfDZOhafXMEW0bqGhZ6uMeVDjziP113Jb
	zCTY=
X-Gm-Gg: ASbGncu4OeH5YOieaItzc1RIu0khhe3UcAL4MC25AKkr4ZVx8iBR2TBSBOAF/HTq7Qz
	jY7W+4VfN43D5VG0BHbTFZ6U9uoKHU2+87EiqXhQtdak8km1DEr2mrV5ms978x6MuZ6RFGcJMgv
	zhgAi3lODEYrnTYrhUMAb2G7LBz6duPNST8L+xKV4A/DqfDS4gWRVV9y9cbS+gpXK+9Ct6oJU9q
	7gkRN/Tl9+I8wBW/1dkFym9gRH/Mo4lnVAz06/7oVJ9f6UIFNQ5xyfcF1FFtn+jCU5DrJdDJnnM
	7OLdsLnVTbViPEzDe1PxfiJIvQgGTecK+SCeMq9kvIPsCeeEqOpuM8WxNgHotZ0lKvvN/3XyD69
	fg5KMb3xKKpBXLg==
X-Google-Smtp-Source: AGHT+IFioVQOmsy44gPyli+5f1vsL2eu8Mopp7MqvGSQ4NU6+BDYI4RKpJFWw4yp6NJmDv22eEdPpw==
X-Received: by 2002:a05:600c:8711:b0:439:9737:675b with SMTP id 5b1f17b1804b1-43f2f0614eamr20779155e9.7.1744285629884;
        Thu, 10 Apr 2025 04:47:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 6/6] Linux builds for x86 and ARM64
Date: Thu, 10 Apr 2025 12:46:28 +0100
Message-Id: <20250410114628.2060072-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For ARM64, the tests in Xen currently use 6.6.74, but 6.6.86 works so update
to the latest.

For x86, stay at 6.6.56.  There's a PVH regression upstream in need of fixing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>

v2:
 * Move x86 back to 6.6.56 until the PVH regression is fixed.
---
 .gitlab-ci.yml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6faa85d8dd7c..670f9621e26d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -30,6 +30,24 @@ stages:
   variables:
     CONTAINER: alpine:x86_64-build
 
+#
+# ARM64 artifacts
+#
+linux-6.6.86-arm64:
+  extends: .arm64-artifacts
+  script: ./scripts/build-linux.sh
+  variables:
+    LINUX_VERSION: 6.6.86
+
+#
+# x86_64 artifacts
+#
+linux-6.6.56-x86_64:
+  extends: .x86_64-artifacts
+  script: ./scripts/build-linux.sh
+  variables:
+    LINUX_VERSION: 6.6.56
+
 #
 # The jobs below here are legacy and being phased out.
 #
-- 
2.39.5


