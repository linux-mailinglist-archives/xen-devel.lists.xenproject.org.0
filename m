Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 674C567983C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 13:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483556.749804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIcw-0001yP-6W; Tue, 24 Jan 2023 12:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483556.749804; Tue, 24 Jan 2023 12:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIcw-0001vX-37; Tue, 24 Jan 2023 12:42:14 +0000
Received: by outflank-mailman (input) for mailman id 483556;
 Tue, 24 Jan 2023 12:42:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jOcK=5V=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pKIct-0008Um-Px
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 12:42:11 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84a944e9-9be4-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 13:42:10 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id h12so9748480wrv.10
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 04:42:10 -0800 (PST)
Received: from uni.router.wind (adsl-208.109.242.227.tellas.gr.
 [109.242.227.208]) by smtp.googlemail.com with ESMTPSA id
 bj10-20020a170906b04a00b0086b0d53cde2sm825419ejb.201.2023.01.24.04.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:41:58 -0800 (PST)
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
X-Inumbo-ID: 84a944e9-9be4-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qI0M5gT9kSSd1gsZvE7ggqEPt+mXuOzha9tFmlwlkiE=;
        b=dKuI58OeLbfqPF7oeKZz0cgwlQZesgZk4RIVJMgZDOh/e8CesFSFn2bfcISkCdJKK9
         Zu7nYsZ8i+JCrEiF+eZ7Bz+2R1xQN5963Lbj2MxjhO2Xanm8agm7zDeOqdzV/KgCo8FB
         1mYjRSLc3ib+0UjZqvhLwHS7qK6W1g84mjQwK8HI3qi67q0+Mtvu3N3SaQyAsy9BAvv8
         PWwQ6AhkW5vmoy/B2/IwLNK+/l/RQBfP4XpUF5oe2tTIJpE8ipnuaoQNziv/Wn0N0vsY
         6LgC4WIBH7LIaris1cuXuhfalVa0KVY00GI1+9VYhME76JQ1jdiT3DQwUMhVHNypMQPh
         +/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qI0M5gT9kSSd1gsZvE7ggqEPt+mXuOzha9tFmlwlkiE=;
        b=sZTtYo412eoXD2LF/+k7+4mnzIuljF/OSxCibqvRlo4aXG/63FWySd0/tjQMJCdXQe
         peiLwv3vlgT/4xbBomHJU+K2NARnj7RNt5mfSEoLZVUObGu9YHf+Jiav3qOY8tiX0OPY
         sX5WlHI4TAjXAQTjIv53pWI3w5nBg4Wg29ZIEAImLqS+pT0OORFhPaRVeoTN1+NswhNh
         dJqU5IJUpWJXlCqC5tAQKB5Wjq0lGCzlakAikMof7sbymS4Zdwsp4l5K/HmJQ6TFHeI2
         sUejYB4hmdkE/RU3Q3PzVTNicznsDUkhmeruT5AWlJZBuQ9rVOwtBJQP4bmzgGarVeHW
         kzlA==
X-Gm-Message-State: AFqh2kqfncA9aHTefWtf/uMWJZeh8bVv2N7upx/xbboUDWwvwpZnS1cr
	ItBfhNRtu/Gu0X+y85YOq+Eehdv03KI=
X-Google-Smtp-Source: AMrXdXuUclYajZExmVcH4C4tyOQnOeyyDeiiyiuoFV1khSj4/cLh+ok3jFslTwhIuV+PqBlHlznl6A==
X-Received: by 2002:a17:907:6e2a:b0:871:e9a0:eba7 with SMTP id sd42-20020a1709076e2a00b00871e9a0eba7mr74177322ejc.57.1674564118764;
        Tue, 24 Jan 2023 04:41:58 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 5/5] x86/iommu: make AMD-Vi and Intel VT-d support configurable
Date: Tue, 24 Jan 2023 14:41:42 +0200
Message-Id: <20230124124142.38500-6-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230124124142.38500-1-burzalodowa@gmail.com>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---

No changes in v4

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


