Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BD5C807B1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170568.1495672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVls-0002pl-DF; Mon, 24 Nov 2025 12:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170568.1495672; Mon, 24 Nov 2025 12:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVls-0002iV-6a; Mon, 24 Nov 2025 12:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1170568;
 Mon, 24 Nov 2025 12:34:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVlq-0001zv-Ac
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:18 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4d1d136-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:34:17 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b762de65c07so169533766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:17 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:16 -0800 (PST)
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
X-Inumbo-ID: e4d1d136-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987657; x=1764592457; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmuSJYCWNiJp2x+cGklOmm8nTWZtA/7WLs7Np8CmpLE=;
        b=TzVipDSTQ2qee80Dy80QsY1bTr5c/gjWQh+557fuuaXG5L+EMQZxtwxLDxn7F3EgpR
         BaB2kGxsAoS+qgYKx7S5zDthH25dKLoq1lUHOm428jx7aS75YGXpqcppPuCYeoa0nTn+
         hO8ii9hrvQB4FTckfHDD9vtprKkap3XEW+Re2kN+bIAzc/VauD8L5MdS/gLoFI+l4e82
         lUByUqjDdNV0FNmQjUjEcRztGVKYgszW2794h8+nJSjUpwBhGKyiHoMONiqx4Gbq5+pz
         B0TmjlMrQbljIlEu93apwFyxU3pLX8YpCHtLsaP7ZexyP8foSb18XfmXP1wPOBfLBL5j
         Stgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987657; x=1764592457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qmuSJYCWNiJp2x+cGklOmm8nTWZtA/7WLs7Np8CmpLE=;
        b=UnEomsnJKgjOvwKkXs/lz77E8sL94cbsadWphPHXcXr1Ae9jWcp813sA5UOD8mGu1l
         p6yxZyVdcu5I/Wtud2XrxGnKrn45Iu+WL5KDQwsccKxX6tFZwjhFIksFjL8AedPQ7R4t
         znuxjbXG7sLkqZBojUJebIJZFCEazVF6ZbWP0XnRgkbbjaZNkzW1RG7WNrX9P4Xb7XxF
         462L2+KQDzXFSwJIKgO4qtcOW823Qy8OUP6moRHo1iGZ6q79bNUjNolJjR+Cug74f1+H
         S4iGC7LOZ8Ya6AcirdBsl1CseOBsoHgsxz7sHjwHRmBrX+mLPwofwQ+veVrAvS/W2bmY
         Gq3A==
X-Gm-Message-State: AOJu0Yyzg+quo1sgjN2mpGn+HQXSmHo9iTT+EM1zSMb1dTS4Whr68OBZ
	4rmW2GvXniCgstyYyLgsjVDPcMOMeOColmnBcgWT9SAyblx0ikLL+8FSfYxS6AYr
X-Gm-Gg: ASbGncuehwIB6stzCZR48ieZPwcJI/r91CMKdpSSAtl1ynKtNz7G0MLlX1kphxgIhjp
	v9nLdUad44H2IOAOa2Hj9nEPDGR6uMFpfiF72OebmNZ1C4J7z8E8oXcvQcZHl4+8Dz/BBuGd8Gs
	IXp63nfsLr1ENnfXCkiW+LzMRsizeqXyxLnVMAp+WDLUL5bV4EPAN9rflfcaMe6pTnUWwDEfif5
	AdjFdSaUiiS+52N+taBXb2A9HSDc1wp5bj2TnVryE46tSI8E4yIyd+F/gjPnLuvxaQDUqAHKgSW
	3RqBZmcShlHfq7NqjfNEACsYAhPfm7ZRr/I4rdUudH8XJFgwvemc0jDLNdogYPmckL8F+HAO/OG
	57Y5irgdkJJVYRUwz9Ct96F97XhHS7hShK5897Te/PhhqBRQJumL3nw/hW0iyVkbSdx7jUcP45g
	YUABg2U2lda1OLl2U3yjP65ACXyNltI6rCKsQVVg02I1kC1EN57DW7bt8=
X-Google-Smtp-Source: AGHT+IE9G67ZdOkCHyhlUWIgkLlJpxvexa0VZvHjlvOoFD/jhY3mygYqcHjUCJLsl9k16FXRYKEysg==
X-Received: by 2002:a17:906:7fd5:b0:b76:b7fe:3198 with SMTP id a640c23a62f3a-b76b7fe33b8mr86719366b.26.1763987656817;
        Mon, 24 Nov 2025 04:34:16 -0800 (PST)
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
Subject: [PATCH v6 08/19] xen/riscv: add new p2m types and helper macros for type classification
Date: Mon, 24 Nov 2025 13:33:41 +0100
Message-ID: <1073b8807531763d2fa64ceb231aa471a74741d3.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=all
Content-Transfer-Encoding: 8bit

- Extended p2m_type_t with additional types: p2m_mmio_direct,
  p2m_ext_storage.
- Added macros to classify memory types: P2M_RAM_TYPES.
- Introduced helper predicates: p2m_is_ram(), p2m_is_any_ram().
- Introduce arch_dt_passthrough() to tell handle_passthrough_prop()
  from common code how to map device memory.
- Introduce p2m_first_external for detection for relational operations
  with p2m type which is stored outside P2M's PTE bits.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-V6:
 - Nothing changed. Only Rebase.
---
Changes in V4:
 - Drop underscores for argumets of p2m_is_ram() and p2m_is_any_ram().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - Drop underscode in p2m_to_mask()'s argument and for other similar helpers.
 - Introduce arch_dt_passthrough_p2m_type() instead of p2m_mmio_direct.
 - Drop for the moment grant tables related stuff as it isn't going to be used in the nearest future.
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
 xen/arch/riscv/include/asm/p2m.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index c9aa19ad43..1c89838408 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -70,8 +70,29 @@ struct p2m_domain {
 typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
+                           PTE_PBMT_IO will be used for such mappings */
+    p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
+
+    /* Sentinel — not a real type, just a marker for comparison */
+    p2m_first_external = p2m_ext_storage,
 } p2m_type_t;
 
+static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
+{
+    return p2m_mmio_direct_io;
+}
+
+/* We use bitmaps and mask to handle groups of types */
+#define p2m_to_mask(t) BIT(t, UL)
+
+/* RAM types, which map to real machine frames */
+#define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw))
+
+/* Useful predicates */
+#define p2m_is_ram(t) (p2m_to_mask(t) & P2M_RAM_TYPES)
+#define p2m_is_any_ram(t) (p2m_to_mask(t) & P2M_RAM_TYPES)
+
 #include <xen/p2m-common.h>
 
 static inline int get_page_and_type(struct page_info *page,
-- 
2.51.1


