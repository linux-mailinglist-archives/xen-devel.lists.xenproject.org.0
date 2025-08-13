Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04232B2457D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 11:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079615.1440368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um7qW-0007ri-TO; Wed, 13 Aug 2025 09:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079615.1440368; Wed, 13 Aug 2025 09:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um7qW-0007p9-QO; Wed, 13 Aug 2025 09:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1079615;
 Wed, 13 Aug 2025 09:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zV9=2Z=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1um7qV-0007p3-Uf
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 09:32:35 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 715ce206-7828-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 11:32:34 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so3942309f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 02:32:34 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b8e04c7407sm37690379f8f.13.2025.08.13.02.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 02:32:33 -0700 (PDT)
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
X-Inumbo-ID: 715ce206-7828-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755077554; x=1755682354; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JtshJLMpICbhxQNlJ/WlonBTVc5noVJermwW+FakGTM=;
        b=vqri4SxbZmfymEbx1Mt0Bh0fK+mstAs8/mYodpNQ412JYAZ+sH7zSlYsTPZ2B/lzmG
         4WGbeqUCPOi49iK8I1hcuiQsjqaTRJ1O2EIEdWQbwU8rQ0fG5UHaXu2ceNy/C9Q1dsxY
         st1QGJ4UXTAN+S+wsgovbnnT3dUkf6RuAhKHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755077554; x=1755682354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtshJLMpICbhxQNlJ/WlonBTVc5noVJermwW+FakGTM=;
        b=EYhkZKpxBOJefTwwsr8+3hkn6uhAO6eRjzFSVxZdbzxVNcyhIfK1h5Irruudmfb896
         1cLpVk7IbjB/1cdm6EBfG4bkI44GtKPAVAFAbkDN8LRxQNseGSi5Yw7cfNIFIIyiYgMI
         5trYtU5PvPrr57453lFXcOBPTyVKRqlYAMY3NRorXxUVdQ79HkQQpvMjjibcUYlUhVbH
         Qc017RXbL4voR06i9XKY+Xcq3HpNRiU/CfQIoCC43DwvwUUiGLkkFxh+fI30FcvKJOZp
         4uaMCVowhnOmaY2feCAtJexXdMOV+pBZ3gCBeXlmYkOmuRMDietJ962q17O7oYaO3e5T
         lLWA==
X-Gm-Message-State: AOJu0YxlxMfhB36WIgtO+64QeMIc2GEGmxZb1tUiNBKUNv4uk988lEm0
	vBycN6VvZjvteUgiRDDJV+Fs4+EYnjNanI6cNuAs0pdmk0cmjepsjRPPVtmZ+DMerpt4E3qSIQz
	HpLGW
X-Gm-Gg: ASbGnculCgG9DU5OsDaea8Kd9zQS58dw/fe4fEzkJeACgQeEpdpkZ33IfnlUseHS4Ny
	nIyNxPAKWugKse1fmjpfxCMoIVIdUq1/Go1P3yBY0Yq0DF3VVbEV3BM1C/Go4cvfu5tRHcteTqk
	ibD7PoiaEseU/PHJuhvhjWDubQ02OGh7yB7D1Xat8ePNetWj7P8cpcXP2UK9MhTqmFYny2wj/5x
	+9+rCp+6++8vkOEeidKcGD9ZeB+Ngjv+1gQue2ONZATETa80Htu2+aqHeHbZmvMYCiFik0bKnq+
	WcamMBH0dGxDbe11kZfZ8BdkJKU0uUHqAs8D2sr5OoxG9X6rGExX6tPqbn6THh4aaGCaL09wT2N
	l0l9wwMCWtnHu4r72Num04F6E/AR26uVthi4gLhh01HIPsNHrLPMU07JWIyvvOEDT9+pQ9H7S7y
	Uj
X-Google-Smtp-Source: AGHT+IGLx4DW9GFH2ffUQoXsoGQ6FN+XzYi2GV/5Gen40tno0Ma4YgFMJ5ooM2TPrxRsr3bXEHW8GA==
X-Received: by 2002:a05:6000:238a:b0:3b9:53c:24a4 with SMTP id ffacd0b85a97d-3b917eb4a14mr1717892f8f.39.1755077553630;
        Wed, 13 Aug 2025 02:32:33 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/pvh: update "Host ACPI" support status
Date: Wed, 13 Aug 2025 11:32:20 +0200
Message-ID: <20250813093220.76030-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For x86 PVH dom0 makes uses of the host ACPI tables, and hence the status
of Host ACPI entry should have been updated to reflect that PVH dom0 is now
supported, and Host ACPI support is not one of the caveats.

Fixes: ea1cb444c28c ('x86/pvh: declare PVH dom0 supported with caveats')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 SUPPORT.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 6a82a9218991..109b62835f99 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -70,7 +70,7 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
 
 ### Host ACPI (via Domain 0)
 
-    Status, x86 PV: Supported
+    Status, x86: Supported
     Status, ARM: Experimental
 
 ### Host EFI Boot
-- 
2.49.0


