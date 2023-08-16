Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD8B77DEA9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584382.915087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDn7-0007HX-78; Wed, 16 Aug 2023 10:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584382.915087; Wed, 16 Aug 2023 10:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDn7-0007Do-3E; Wed, 16 Aug 2023 10:30:17 +0000
Received: by outflank-mailman (input) for mailman id 584382;
 Wed, 16 Aug 2023 10:30:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeE-0003R9-LT
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:06 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97c7b934-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:59 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-317b31203c7so5820686f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:58 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:57 -0700 (PDT)
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
X-Inumbo-ID: 97c7b934-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181258; x=1692786058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q2zT/VxjHIn8Cghl8LQb45xQzWmcTLXNJeuMOWtX3M=;
        b=E4g7mJYSL+wxnqOsmH8WOX+iQ2KDvTVxjdJNgLcSlqtx2PvfKULWF7qPG6KURi3FTA
         cmasPgIIjuZLvpW75MkuzgTauTeW2wSiiwGY+0GmZm3YaGLPDv4DLfwxaarmHDuKiSV7
         w7hI/PrYLqGPG1mgP8K4MqWXYBuJstrJJSmxeLQNv8ZMN4aLPcXYsLnCSInmb/J+iZaG
         QHy6qc4CxQ4wytYsB4UKT/S2x4Vz7Cz/v4DE/KpOOMQjkQpjxXuoVscp+77NNDwfnjA/
         M6ZtKlNmicHIEhRRonVTURnusa9LSxzT1boBpxwhMt5C7UZ3ZL0SPUHAoP8q3E3g7GuM
         UTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181258; x=1692786058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9q2zT/VxjHIn8Cghl8LQb45xQzWmcTLXNJeuMOWtX3M=;
        b=hvaMqqOOe7FucVtS6lL0mzhD0LG0b4uR5Xu05JkpG5v7vx3NBbqErH5HVEqdj+lNiv
         tgjIsgkxVJEaoy08CeePVN+pJnfYbALz+XkXPZBJsnGxV62w2FyF7PhWErLqz3zowbd7
         X6TDdtI/oUdQIuQ+NQsV/PcKp2c0SXRInXsvld9Lv1g/1GLfTSZOP3Au47J09sCYSVbU
         77GsO+ghi2CGYehHzCXDSO90jLC2m6aep/KSdJrNG62DPym6vH+GmMaH8B8onpwPkXhH
         hmlUOx2YgmUu7g5kCkhPAk1pXBk+QHmXRi1NqQidRUf/DjBK3vUyIOCJvwmwTHDIVPEi
         Y/Fw==
X-Gm-Message-State: AOJu0YwekHwOxgegQtXl7J3AV0NYwXJtvMe4p6Bu2s/px1bHpBtRSM//
	irV1NqHqAI4tiljyOabcvZHMQtPro8NwSMdi
X-Google-Smtp-Source: AGHT+IGWRvizebIcgJvp9+wt7uHR134epjVXNLpJ188yuTQVc2xUMvT/5XzySfG5Fraa31iVv0D+sQ==
X-Received: by 2002:adf:f5cd:0:b0:319:6327:6adb with SMTP id k13-20020adff5cd000000b0031963276adbmr952470wrp.70.1692181258187;
        Wed, 16 Aug 2023 03:20:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 52/57] xen: add necessary headers to common to build full Xen for RISC-V
Date: Wed, 16 Aug 2023 13:20:05 +0300
Message-ID: <8a0ba03485f42ad3fdfaaaa8eb06caf63f4205ec.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mostly patch was taken from the PPC patch series so can be skipped
during review:

https://lore.kernel.org/xen-devel/2c9eb4fc175a1bdd21293f2e2611d8e21991636d.1691016993.git.sanastasio@raptorengineering.com/#Z31xen:common:symbols.c

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/common/memory.c      | 1 +
 xen/common/symbols.c     | 1 +
 xen/include/xen/domain.h | 1 +
 xen/include/xen/iommu.h  | 1 +
 xen/include/xen/sched.h  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index b1dcbaf551..fa165ebc14 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -28,6 +28,7 @@
 #include <asm/current.h>
 #include <asm/hardirq.h>
 #include <asm/p2m.h>
+#include <asm/page.h>
 #include <public/memory.h>
 #include <xsm/xsm.h>
 
diff --git a/xen/common/symbols.c b/xen/common/symbols.c
index 9377f41424..691e617925 100644
--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -19,6 +19,7 @@
 #include <xen/virtual_region.h>
 #include <public/platform.h>
 #include <xen/guest_access.h>
+#include <xen/errno.h>
 
 #ifdef SYMBOLS_ORIGIN
 extern const unsigned int symbols_offsets[];
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index d35af34841..767127b440 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -4,6 +4,7 @@
 
 #include <xen/types.h>
 
+#include <public/domctl.h>
 #include <public/xen.h>
 #include <asm/domain.h>
 #include <asm/numa.h>
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 110693c59f..7368df9138 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -24,6 +24,7 @@
 #include <xen/page-defs.h>
 #include <xen/pci.h>
 #include <xen/spinlock.h>
+#include <xen/errno.h>
 #include <public/domctl.h>
 #include <public/hvm/ioreq.h>
 #include <asm/device.h>
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index b4f43cd410..d8c8dd85a6 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -21,6 +21,7 @@
 #include <xen/smp.h>
 #include <xen/perfc.h>
 #include <asm/atomic.h>
+#include <asm/current.h>
 #include <xen/vpci.h>
 #include <xen/wait.h>
 #include <public/xen.h>
-- 
2.41.0


