Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A4A764A0D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570834.893082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOw0o-0001Jo-MH; Thu, 27 Jul 2023 08:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570834.893082; Thu, 27 Jul 2023 08:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOw0o-0001Gg-IT; Thu, 27 Jul 2023 08:06:18 +0000
Received: by outflank-mailman (input) for mailman id 570834;
 Thu, 27 Jul 2023 08:06:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOw0m-0001DS-Pt
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:06:16 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73c860c0-2c54-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 10:06:14 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6862d4a1376so188187b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 01:06:13 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:06:11 -0700 (PDT)
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
X-Inumbo-ID: 73c860c0-2c54-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445172; x=1691049972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMz0NiXWW4aad/y0uXjwCFa/Ag/H17CXQFU4sIH/+zs=;
        b=AHxGvLfHLl40j8B2JJRU5s4VfBVIfkKAsI0cQEyx34RUKm+kvHJrB2iQzGzRnBcS3v
         6USwrAVD49Q91VdWL412Beuc1lh9luLsvseTAfwZXNQFTlfXj/44XL3QSDLO3kE477UK
         PuQisTQDtaTenLhmz9UxJrWIk76t/9C2sGl3AoIFTG0F/GG2DtEXlZsFxPta58HNNxGh
         nuotqk/EcRuGp6B6DpQqHvzB1OaU8/LVfrpsdfcpoHM2+LjVOOXNlq+MDZzMAY0XeOby
         XoS1N9oa25ZJEGOvTPLqpEaa/2bkazEZHcopiam72Y0TXS5KlF1vjQrUn3lGIfR4Oiwn
         FzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445172; x=1691049972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMz0NiXWW4aad/y0uXjwCFa/Ag/H17CXQFU4sIH/+zs=;
        b=XJuVC8r8RudjUWkm6AUFFEDOAq8+rqiF/7IqAKzCWaWcA2ucKnU8ontW57lDtgMik5
         4Ev7uxgqFOV1++eTl3GW44Sx12tH8Ih5Z4kwRo9JFqCfUvKOgVoNXOveEiB1bSrCFUPj
         Un01ncIKHQrFKgF6rd3dAC5F/cYktUXqNdlcZJOLBIvCzzxvU/CF4WZwwZ28oPqhXZ0B
         Mmg0aIzPPx1zNoTfnEtSah4Le8hNxAByV6Kwm0OdKTTWLEj8ZPURrQBJnnpU361SGp4V
         vzBlMjsdMZOP7ToItO1Znq1u7TRGstuHMxrtz4r0HB7FeaOiHang4jvL+q2Ocd/MtMaJ
         DfPw==
X-Gm-Message-State: ABy/qLaw3IQ9W+IKerVuCJt9FwDrwNjYUsv6sI6HqpF78td8SxaCwUUl
	gZGpabVIvxiFYN7A2VUcy6rdGA==
X-Google-Smtp-Source: APBJJlELtr5cWJQ0To//AtRPEOYgFBMbhSo+p4MsXdX0IoPp5bJSVuIL2HKgeywTxbzsVW+qtVe8tQ==
X-Received: by 2002:a05:6a00:4792:b0:668:834d:4bd with SMTP id dh18-20020a056a00479200b00668834d04bdmr4674312pfb.0.1690445172123;
        Thu, 27 Jul 2023 01:06:12 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org,
	david@fromorbit.com,
	tkhai@ya.ru,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	djwong@kernel.org,
	brauner@kernel.org,
	paulmck@kernel.org,
	tytso@mit.edu,
	steven.price@arm.com,
	cel@kernel.org,
	senozhatsky@chromium.org,
	yujie.liu@intel.com,
	gregkh@linuxfoundation.org,
	muchun.song@linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	rcu@vger.kernel.org,
	netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	dm-devel@redhat.com,
	linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 02/49] mm: move some shrinker-related function declarations to mm/internal.h
Date: Thu, 27 Jul 2023 16:04:15 +0800
Message-Id: <20230727080502.77895-3-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following functions are only used inside the mm subsystem, so it's
better to move their declarations to the mm/internal.h file.

1. shrinker_debugfs_add()
2. shrinker_debugfs_detach()
3. shrinker_debugfs_remove()

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/shrinker.h | 19 -------------------
 mm/internal.h            | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 224293b2dd06..8dc15aa37410 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -106,28 +106,9 @@ extern void free_prealloced_shrinker(struct shrinker *shrinker);
 extern void synchronize_shrinkers(void);
 
 #ifdef CONFIG_SHRINKER_DEBUG
-extern int shrinker_debugfs_add(struct shrinker *shrinker);
-extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
-					      int *debugfs_id);
-extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
-				    int debugfs_id);
 extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
 						  const char *fmt, ...);
 #else /* CONFIG_SHRINKER_DEBUG */
-static inline int shrinker_debugfs_add(struct shrinker *shrinker)
-{
-	return 0;
-}
-static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
-						     int *debugfs_id)
-{
-	*debugfs_id = -1;
-	return NULL;
-}
-static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
-					   int debugfs_id)
-{
-}
 static inline __printf(2, 3)
 int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 {
diff --git a/mm/internal.h b/mm/internal.h
index 5a03bc4782a2..8aeaf16ae039 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1135,4 +1135,32 @@ struct vma_prepare {
 	struct vm_area_struct *remove;
 	struct vm_area_struct *remove2;
 };
+
+/*
+ * shrinker related functions
+ */
+
+#ifdef CONFIG_SHRINKER_DEBUG
+extern int shrinker_debugfs_add(struct shrinker *shrinker);
+extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
+					      int *debugfs_id);
+extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
+				    int debugfs_id);
+#else /* CONFIG_SHRINKER_DEBUG */
+static inline int shrinker_debugfs_add(struct shrinker *shrinker)
+{
+	return 0;
+}
+static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
+						     int *debugfs_id)
+{
+	*debugfs_id = -1;
+	return NULL;
+}
+static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
+					   int debugfs_id)
+{
+}
+#endif /* CONFIG_SHRINKER_DEBUG */
+
 #endif	/* __MM_INTERNAL_H */
-- 
2.30.2


