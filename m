Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EDEB17478
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065878.1431278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVg6-0003c0-Sc; Thu, 31 Jul 2025 15:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065878.1431278; Thu, 31 Jul 2025 15:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVg6-0003TA-IW; Thu, 31 Jul 2025 15:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1065878;
 Thu, 31 Jul 2025 15:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVg4-0001FB-C2
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:44 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b333a37-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:42 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-55b859545c3so1221538e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:42 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:41 -0700 (PDT)
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
X-Inumbo-ID: 3b333a37-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977522; x=1754582322; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvVQ0FbSOnQU5awNmCzNnO6W0RjQ/JOFOltcFhlpheU=;
        b=a8DFdFzCG9ILeRY0e/54ye3QQQi7FefMM+fb3O/4ITx37S+nRLubkYHplsXsPH+5Wt
         Aalz0uLotDPLcwLvqe+EI8LbJWLbBNEXFTeMKTF8gVceyElFK2Yth705jE9M3p2/sdbP
         zn9J4BXKcK8ZkmfIbaQtFyke13s4gyCs+QcZplA8As6JzXnOXkRsLR94JSH0g5XYZX3g
         DuN54eG1V5n5f0GJLw6c+XFChAHf09rQYBBQ5kzgalFfFE+qApipgeBpOY68Q28rrFlf
         zUmlLREyIYAET1q/wNyxwolnAm2vvPVR9pjuHws1n8+yJYjx1UigycNmecqHi0iSAHki
         ufXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977522; x=1754582322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AvVQ0FbSOnQU5awNmCzNnO6W0RjQ/JOFOltcFhlpheU=;
        b=DXeYsLflDLTK6z57pDE/TDFT80KqopjjV2fCKMlZcm3QGbgW8VNZ6hRcpAYAdMA+uQ
         xhznWFBLtU2mIaOc8TGA4kvErHVUcw3sac4x884jKrzl1IBNHyz7mPrqXcviQzBhQ612
         9pVNKegGqqh1qU0HAHhcT4UCnz8LmbaToPjzzCLjMW6ee9+pe9sU0ENwUDplB8TXrE22
         JVychysI5b3imzesqlyC0/+o6KJ6XKCO36qC7W2+tGrEeSg9uSjLBI80UfPl871qUHyO
         uOPcBIdnMGeGgh+BlYbQgEN2/o1iAPtj1S1vyQ+1J9M/7ObwXq1WuWKiRTR4X8DZsDpC
         VRxg==
X-Gm-Message-State: AOJu0YzhGbiO8r0i5SXZ4UXYd/1bdT3ePOidUR8VL5OcRZYwAHI4W2LI
	p6RxcbCSHUQi5bSzsq/eXentVruo/IihsAVCoPfArrpcV18Aq1XWAXjJ+97Fcw==
X-Gm-Gg: ASbGnctOZ2mAWsW8b2E4brTV0baTpiD57U36qAbwIBVxUceVSKnMwXGhCCxa0saVBuD
	cTND6GOZlo7CZVM4qZ2A79m8N4NqMGbZl8qLo2qpISl3Z+eOJ9Gl/hDCrF9aUFgD5wtCQH8TpAG
	bRGrgByrUxUJiQNH9v8RNuwR0m4ixMg5tWg7gUdkikuCvo6NbR8qAGY63yYNq5szSVpoCDLpgLh
	1/yNrtYyCptfME6M8nsZVmZ3al+uAAiICo25FV7cGc67gKkIqqH3jsZNFaVH8IsYgzKyujQArz5
	RIFj7JEOnWrHvDSg6Q/ICM4Mcv76YBBtwMyLo9DBVurw/QwIp/qfMulQo4Eu4X4fP5q7af2S/VY
	+qw+21BcfGMwHfLMZLa4y7E/4ob3XKAysIHF8zlPLq2u6QTfHOHzgl9gQJYBTJw==
X-Google-Smtp-Source: AGHT+IGfhYrqfOW245zy9Jhh4v3hYQUoQNMXIvYeE7OKblKWd/4uJrpdvGZVRg1RWVeYvGobZBqyNA==
X-Received: by 2002:a05:6512:1383:b0:55b:7ff4:bb3b with SMTP id 2adb3069b0e04-55b88c8809emr893317e87.21.1753977521586;
        Thu, 31 Jul 2025 08:58:41 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 08/20] xen/riscv: add new p2m types and helper macros for type classification
Date: Thu, 31 Jul 2025 17:58:07 +0200
Message-ID: <3d35b6f4bb79048647020ed4e7b222585ca3a9a3.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Extended p2m_type_t with additional types: p2m_mmio_direct,
  p2m_grant_map_{rw,ro}.
- Added macros to classify memory types: P2M_RAM_TYPES, P2M_GRANT_TYPES.
- Introduced helper predicates: p2m_is_ram(), p2m_is_any_ram().
- Define p2m_mmio_direct to tell handle_passthrough_prop() from common
  code how to map device memory.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Drop p2m_ram_ro.
 - Rename p2m_mmio_direct_dev to p2m_mmio_direct_io to make it more RISC-V specicific.
 - s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
---
Changes in V2:
 - Drop stuff connected to foreign mapping as it isn't necessary for RISC-V
   right now.
---
 xen/arch/riscv/include/asm/p2m.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 3c37a708db..5f253da1dd 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -62,8 +62,30 @@ struct p2m_domain {
 typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
+                           PTE_PBMT_IO will be used for such mappings */
+    p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
+    p2m_grant_map_rw,   /* Read/write grant mapping */
+    p2m_grant_map_ro,   /* Read-only grant mapping */
 } p2m_type_t;
 
+#define p2m_mmio_direct p2m_mmio_direct_io
+
+/* We use bitmaps and mask to handle groups of types */
+#define p2m_to_mask(t_) BIT(t_, UL)
+
+/* RAM types, which map to real machine frames */
+#define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw))
+
+/* Grant mapping types, which map to a real frame in another VM */
+#define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) | \
+                         p2m_to_mask(p2m_grant_map_ro))
+
+/* Useful predicates */
+#define p2m_is_ram(t_) (p2m_to_mask(t_) & P2M_RAM_TYPES)
+#define p2m_is_any_ram(t_) (p2m_to_mask(t_) & \
+                            (P2M_RAM_TYPES | P2M_GRANT_TYPES))
+
 #include <xen/p2m-common.h>
 
 static inline int get_page_and_type(struct page_info *page,
-- 
2.50.1


