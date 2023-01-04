Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404F165CE94
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 09:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470990.730745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOj-0002IU-2Z; Wed, 04 Jan 2023 08:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470990.730745; Wed, 04 Jan 2023 08:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOi-0002FP-Th; Wed, 04 Jan 2023 08:45:20 +0000
Received: by outflank-mailman (input) for mailman id 470990;
 Wed, 04 Jan 2023 08:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfqB=5B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pCzOg-0008Pf-OL
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 08:45:18 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cc9b85c-8c0c-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 09:45:17 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id ud5so81013310ejc.4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 00:45:17 -0800 (PST)
Received: from uni.router.wind (adsl-57.109.242.233.tellas.gr.
 [109.242.233.57]) by smtp.googlemail.com with ESMTPSA id
 k22-20020a170906129600b007c10fe64c5dsm15016382ejb.86.2023.01.04.00.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 00:45:15 -0800 (PST)
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
X-Inumbo-ID: 1cc9b85c-8c0c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXOzrCrP8CVhczjYbqhFp6hVHdTDovyn5H+grp051f4=;
        b=qeP7xCjifPj0QarjFgSOGJRU4qkTv1zwQ4edK6rTI+eSwqKg+JufxW8DXzH8md0vUK
         OOfmwgDfA2698SQzUCoM/5O1c3rlhV5lq3nsDZqtyGLrjNzJoKO+o5QRpQcxNdgUjSck
         8pz7Y3YcWzIGlbpLWFWTq9L5GXNOVcK1wWg9EyGkQypzwYLtk824AZKDhIMFNHbzaWnZ
         68ftp/Tmkt+E39dxup49sKqm1JK2p6me2q8IqsL1sof2c5x7UUqzdDNDtMhUXv64nE9D
         UzQabCUIHGG6hblKTyrWFfaWVz/ZO15PUiP+3ZAgHUKueM8BE57SN7F8Qr+4CmQjO7l1
         Y0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXOzrCrP8CVhczjYbqhFp6hVHdTDovyn5H+grp051f4=;
        b=VK+RU3jJgk7Fahz518Wt6xzeIbT1p5HoHQiqi52dWagfvUP66BXivZ/Y3D50WvvpMa
         6erQU8nTMARf6ozWTTGqgPR0mgTAmYIaviDaTh6Ko5B61WMtgoOEsy5eiwL5mjM6OJVa
         ApqUrF4qxhjP3TNO1DQdR8bdlKGuIumI3X0i32wHAbm8i/Nc99yJ+g7BQUXjOvy2gv1D
         tU+e+v8lCixSptuRdOSUbbVXXbRNypXe42DihPYm0Mo7dxhSOvLnJYK/Qz2SQmVGeK6e
         uawVOdmIPwUw4yf4tDDk60hioMMr9yhQU6rHCw4N5Qm6vXY2FsHXdDp96IJMETVv2c3q
         twtg==
X-Gm-Message-State: AFqh2kqNCxHeXJVaqQ3a3bGQSm+P806m2K0IP/OHHJXv8Tz8Yl52bFeR
	dNQbl1oFfDjGhdbBWQQuA/Nu8fU5r7k=
X-Google-Smtp-Source: AMrXdXubp/bxwGlLu0FavJ4su5iF17RcY+AXjEy9frY7aW1SYFUeDfC4LNrgH7JgZHj4KH1yH9TQ+w==
X-Received: by 2002:a17:907:d389:b0:7c1:5a37:825 with SMTP id vh9-20020a170907d38900b007c15a370825mr52798189ejc.34.1672821916328;
        Wed, 04 Jan 2023 00:45:16 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 8/8] x86/iommu: make AMD-Vi and Intel VT-d support configurable
Date: Wed,  4 Jan 2023 10:45:02 +0200
Message-Id: <20230104084502.61734-9-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104084502.61734-1-burzalodowa@gmail.com>
References: <20230104084502.61734-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide the user with configuration control over the IOMMU support by making
AMD_IOMMU and INTEL_IOMMU options user selectable and able to be turned off.

However, there are cases where the IOMMU support is required, for instance for
a system with more than 254 CPUs. In order to prevent users from unknowingly
disabling it and ending up with a broken hypervisor, make the support user
selectable only if EXPERT is enabled.

To preserve the current default configuration of an x86 system, both options
depend on X86 and default to Y.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - new patch that derives from patch 1/7 of v1 
  - replace --help-- with help
  - make the options visible if EXPERT is enabled
  - indicate the cases where the options need to be enabled

 xen/drivers/passthrough/Kconfig | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 5c65567744..864fcf3b0c 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -38,10 +38,28 @@ config IPMMU_VMSA
 endif
 
 config AMD_IOMMU
-	def_bool y if X86
+	bool "AMD IOMMU" if EXPERT
+	depends on X86
+	default y
+	help
+	  Enables I/O virtualization on platforms that implement the
+	  AMD I/O Virtualization Technology (IOMMU).
+
+	  If your system includes an IOMMU implementing AMD-Vi, say Y.
+	  This is required if your system has more than 254 CPUs.
+	  If in doubt, say Y.
 
 config INTEL_IOMMU
-	def_bool y if X86
+	bool "Intel VT-d" if EXPERT
+	depends on X86
+	default y
+	help
+	  Enables I/O virtualization on platforms that implement the
+	  Intel Virtualization Technology for Directed I/O (Intel VT-d).
+
+	  If your system includes an IOMMU implementing Intel VT-d, say Y.
+	  This is required if your system has more than 254 CPUs.
+	  If in doubt, say Y.
 
 config IOMMU_FORCE_PT_SHARE
 	bool
-- 
2.37.2


