Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AFACC475E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188160.1509515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYLC-0001mL-41; Tue, 16 Dec 2025 16:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188160.1509515; Tue, 16 Dec 2025 16:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYLB-0001d4-LC; Tue, 16 Dec 2025 16:56:01 +0000
Received: by outflank-mailman (input) for mailman id 1188160;
 Tue, 16 Dec 2025 16:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYL9-0006ge-0L
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:59 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 182bc0b2-daa0-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 17:55:58 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b79e7112398so961800766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:58 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:57 -0800 (PST)
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
X-Inumbo-ID: 182bc0b2-daa0-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904158; x=1766508958; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO5nx4598w9zrVt5xUIYVySyPj0TGMAZ0/hbVswglno=;
        b=h9qGWj7mwzIjIPyAj+5LWSbEUl1iRe/38c74TO3JNDlUo5k1pk5AekC1Qfz/r1Yuiv
         k5Dt8tGvOMkvmGQ70zAvEBPw3WFavQObaqnFECnfSny6Utra7TLeahuwvEDm/1nBiDzl
         ydn8oy/rB6wzl19urg3q6qmO0AqkiSG50bSsXuO6oafpx68rtNyxP8of6QJapzVdRyYh
         6svkQYFBaqeiJW5Cj/pNaSJLjvS3WI0g1prdu/NLIgDr9l2GZmyrAe8fa0njpiNKwWHN
         Pi15RzMAAjkwDCf0s4rCm33K+XUFcWTwEyBUPeOcukQIUc76LVwZhIFpoUguGsLipyVB
         Hu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904158; x=1766508958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iO5nx4598w9zrVt5xUIYVySyPj0TGMAZ0/hbVswglno=;
        b=BwGPIlavB8l/u9Ownn1QiZlkxw9Hk/Fpe2c8NtdGp8z0rLb4jCNTfuufWcH5E8M4lJ
         D9wCbyrB8sfUHl3q1RZyCR4sjFqG8j2TYphcCq9DKQb9xxOfH46Ve7k3cZUV1S/QBwxe
         +pjchJaVfqYVh4N7+oC2dsor1jpAQyCpJ0FJztwHXIec9JHujw/2QV8q1R82Q2/VO8VG
         AwfhbHfKuV0gK1qpHgL2/d2A/rWdMQMD4KMNAecZWtb5HUv4rSjJfuq4ZaiHs0vU/NHW
         o33ADG95e9T1SChsWJnfoJO20mL8o9g8g2eC51b0oLH0PXfr19VzYZS3QQrRfe4knk+I
         zMlQ==
X-Gm-Message-State: AOJu0Yw9OpMsZjnhrxNr/eE+q3d0nOpvz/KgppQKlv4LuH2eirDr/jYV
	yls/BI5dG+6MZyqR53t5buhVglwz+MW3FeBDQN6u/zM+3PTr2Y4Yutb9KbEkdg==
X-Gm-Gg: AY/fxX4NrI+/4RljvN7irmeY2de7saKX95o3AkWO7n0R0QZKICNCfwYgggK2pTx5EAO
	DdjMmDKfoFoK/fSP8/qnDXUZg+xg66PiEOI0f59bDoeVFaA5upaxAfbvQHxQZTiVGx1+dGHs2Dp
	mwiaopAAZzPBgFeWRZtdRuoSD+CmdaUZk8ivGQTbOlxB+3K6MWv1voCra8AAflSckhPVTRTjFHX
	EVX6xe4cH/7Jrfwm+m90AYMef5+a/EAxGbDQJ1zCzU0ztzmcuzbFJZ470qmcSvryKXqYpKiTRzI
	bcXN+9WjYEMCIKOovLrmIqJ8qya+juYxK3zOYoZCBVxneIwGbgfq9BUhaLKg6gnXxkiQVQZoT7x
	4EgGRo36g/hp+pJRKXAl0uF6liWLZI9vpYjiGMkdnWuI/YLccN0VEECkHLB4H54BKv2/fKrZqgH
	5YEPawNsxCm/oxL/cmi6toH2qZfXRHgPVOIUukuwEOj26BUltaiYRu6FVD4cWyPLI+TA==
X-Google-Smtp-Source: AGHT+IGQRRCuNzZF6vxesTm9DfmANaO+KpfyHWCwr/sz+VGWkW+4H41mm5f/d6qiP5ih8R6mZlMyWA==
X-Received: by 2002:a17:907:3f0d:b0:b73:5a2f:2f0e with SMTP id a640c23a62f3a-b7d235c84a0mr1853199966b.3.1765904157482;
        Tue, 16 Dec 2025 08:55:57 -0800 (PST)
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
Subject: [PATCH v7 15/19] xen/riscv: implement put_page()
Date: Tue, 16 Dec 2025 17:55:25 +0100
Message-ID: <ae4cbcb31348177164b37c9fc8c12ff1b56ad0ca.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement put_page(), as it will be used by  p2m_put_*-related code.

Although CONFIG_STATIC_MEMORY has not yet been introduced for RISC-V,
a stub for PGC_static is added to avoid cluttering the code of
put_page() with #ifdefs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6-7:
 - Nothing changed. Only rebase.
---
Changes in V5:
 - Correct code style of do-while loop in put_page().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - Update the comment message:
   s/p2m_put_code/p2m_put_*-related code.
   s/put_page_nr/put_page.
---
 xen/arch/riscv/include/asm/mm.h |  7 +++++++
 xen/arch/riscv/mm.c             | 24 +++++++++++++++++++-----
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 2f7927e6f4..08f500c99d 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -264,6 +264,13 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
+#ifdef CONFIG_STATIC_MEMORY
+/* Page is static memory */
+#define _PGC_static       PG_shift(3)
+#define PGC_static        PG_mask(1, 3)
+#else
+#define PGC_static     0
+#endif
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
 #define PGC_broken        PG_mask(1, 7)
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 1ef015f179..2e42293986 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -362,11 +362,6 @@ unsigned long __init calc_phys_offset(void)
     return phys_offset;
 }
 
-void put_page(struct page_info *page)
-{
-    BUG_ON("unimplemented");
-}
-
 void arch_dump_shared_mem_info(void)
 {
     BUG_ON("unimplemented");
@@ -627,3 +622,22 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
     if ( sync_icache )
         invalidate_icache();
 }
+
+void put_page(struct page_info *page)
+{
+    unsigned long nx, x, y = page->count_info;
+
+    do {
+        ASSERT((y & PGC_count_mask) >= 1);
+        x  = y;
+        nx = x - 1;
+    } while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
+
+    if ( unlikely((nx & PGC_count_mask) == 0) )
+    {
+        if ( unlikely(nx & PGC_static) )
+            free_domstatic_page(page);
+        else
+            free_domheap_page(page);
+    }
+}
-- 
2.52.0


