Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A9BBBF275
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 22:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138430.1474156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5rVr-0005Lg-1j; Mon, 06 Oct 2025 20:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138430.1474156; Mon, 06 Oct 2025 20:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5rVq-0005JB-Uf; Mon, 06 Oct 2025 20:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1138430;
 Mon, 06 Oct 2025 20:08:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v5rVp-0005Hv-Iy
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 20:08:49 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43c66648-a2f0-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 22:08:46 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso4051466f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Oct 2025 13:08:46 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8efffasm22218896f8f.41.2025.10.06.13.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 13:08:44 -0700 (PDT)
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
X-Inumbo-ID: 43c66648-a2f0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759781325; x=1760386125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YUIJM3OnJnWMQNMcybvkmuLsNfp6PC1VLAjmY9gl9s=;
        b=KCDfms/uq0xDRkMrYODw1Df6df8cYGHr3kI/FaW2xDJsZotG7Mxr08wa5qSe8wKY9n
         ZSlZlp2b+TCwZtaUp1qlw+PqGGS7ynqLcAFO/UTF2DLtH2Ou7y88wMhKyGZM2SpgPQ9N
         CuclIaxMLYx8wLYINuR3z2kfETOWNptxWebQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781325; x=1760386125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YUIJM3OnJnWMQNMcybvkmuLsNfp6PC1VLAjmY9gl9s=;
        b=VL70AaO7hadKBRhT93mXznzYZlQgxwQzIm6q8i8wc38J2ryYkVEA3nQ1R3JaMFqJN0
         l40NpBHeEz7LgvKXdGfP0RqukuViSCL2e0gqdfZc9qZjKhlSAg6AZ/0b4hw6XDM+x+1k
         E1N91E6/+O9bJLJwSlOqK2oZM52AN6JR4K3PGzKhidvYV+dw9BAg9tJk7rgmSqjRMtGh
         QVQidBdVfD9r1mkPjkqxB1c4PmSKH+plLHQKmw1XBv/flEYNnJdr7P8S38iY88z2HnjL
         uclzb9U6+LRlgxBWNKyFM0hW93xjty7H+eGuU4KL7fg0kYaiiUnZav2NG5+ca/Y+jd+N
         ecZA==
X-Gm-Message-State: AOJu0YwDEak3DZn4SiwC5ICCtKDMn1vYpU+4DcCdOrbI+NmEDF/P9Y7+
	8+GCxbNgIAJUqZkRVh16025DiEsPYZr1AH2bUYdHS63MoWAHFke0fatKJMKGzmmnlWldZ5lHQmJ
	mw0Re/azHyHaN
X-Gm-Gg: ASbGncu7xDJpiAbhzOHOMAoP6G9krtL/YaIw5YpuoqcPXEnrAMxxfsfjkujLI5rlOrk
	Ph0uibizc2rlfJtBY0aaGMWEhrRXcWA3XGGDHTTfwEzEzO/OTMDzXTeurntli8VbS86UxESv79k
	Pb8ljvl5Sbh7Nqq+9h3rgOZDqYa2fN9yfbehaMERXnu61czzdNwvqQC44zZXy7s36irqLtm67Ph
	GX//hT43BFhcq58vKyMXgd8qpPx2tJzu8n4+qV+xv1gitNSczw5bu75KYABO1LpK+veNO12h5j8
	igkxWOwSuCKWTxQ973fR+ns4KSBKC21OSZxWzZ3vNd+j6AtD82O/TN8FQOIuf490Mgo6sdUXD7j
	l+hz11XFIQ58+1kLJd+MEeHIm+bvMhg8CQccS6HvbuKRLcI7s4Ey/itbzxf4iHK0VMPsFThpQGf
	Uuohz/1CD3fkHgk3HZj1IA
X-Google-Smtp-Source: AGHT+IGln3vnWeqzZ0xvpw8PQGn2kOV/XkE36gjbGzsooZzHTkAwymPjVfXVe2JngeU3qVUc+O1AkA==
X-Received: by 2002:a05:6000:3105:b0:3f9:1571:fdea with SMTP id ffacd0b85a97d-425671b28b5mr9858025f8f.44.1759781325326;
        Mon, 06 Oct 2025 13:08:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] Update Xen version to 4.21.0-rc1
Date: Mon,  6 Oct 2025 21:08:40 +0100
Message-Id: <20251006200840.2171113-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
References: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 README       | 10 +++++-----
 SUPPORT.md   |  2 +-
 xen/Makefile |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/README b/README
index 9329f30e1366..eaee78bd7375 100644
--- a/README
+++ b/README
@@ -1,9 +1,9 @@
 ############################################################
-__  __                                _        _     _
-\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
- \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
- /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
-/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
+ __  __            _  _    ____  _
+ \ \/ /___ _ __   | || |  |___ \/ |   _ __ ___
+  \  // _ \ '_ \  | || |_   __) | |__| '__/ __|
+  /  \  __/ | | | |__   _| / __/| |__| | | (__
+ /_/\_\___|_| |_|    |_|(_)_____|_|  |_|  \___|
 
 ############################################################
 
diff --git a/SUPPORT.md b/SUPPORT.md
index eb44ee85fd12..491f9ecd1bbb 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.21-unstable
+    Xen-Version: 4.21-rc
     Initial-Release: n/a
     Supported-Until: TBD
     Security-Support-Until: Unreleased - not yet security-supported
diff --git a/xen/Makefile b/xen/Makefile
index 49da79e10fb4..ba8c7147a2f6 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
 export XEN_SUBVERSION    = 21
-export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
+export XEN_EXTRAVERSION ?= .0-rc1$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
-- 
2.39.5


