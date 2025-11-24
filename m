Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D255BC80865
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:43:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170731.1495798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVud-0004IA-LP; Mon, 24 Nov 2025 12:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170731.1495798; Mon, 24 Nov 2025 12:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVud-0004FR-IQ; Mon, 24 Nov 2025 12:43:23 +0000
Received: by outflank-mailman (input) for mailman id 1170731;
 Mon, 24 Nov 2025 12:43:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVm1-0001zv-SB
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:29 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea40365d-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:34:27 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b739ef3f739so225758566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:26 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:25 -0800 (PST)
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
X-Inumbo-ID: ea40365d-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987666; x=1764592466; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RDJV1JllPajR6yFaGO7a7j1xOEhUP7aY3PWH11n40w=;
        b=Pfdtbl+GqYP78/JzEyrfXNjoXO2FCupIgyMDAINXnv790OEPAFyE7MicQ9U+GxkkG5
         HxeI4gHev5hH9K5cvGD4XOnwZPpbz/wdPgdgF+Wc37JfxbY6KrdqlnkdWZ1qIWA6r6HZ
         4p+cQSAZl2RPbTWScDNI4UAk/QXTZJ5m3px7C4hWstoFwrNP5sOxtiQCJYWCmj8HcsTw
         N1OMcJ2w8229dxsNPYAFG5Tk/uz7nn4TQBxsY3IEE3UIECGhTP5LEu8+jL4POipXRfJp
         JEAB5CaxpGH6IGAF+2NAk/Ch+yMytbiTB9Ic/e6hMN8tPUfq2YEyiu2d8GSz52PjhliJ
         7nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987666; x=1764592466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RDJV1JllPajR6yFaGO7a7j1xOEhUP7aY3PWH11n40w=;
        b=S+C7SFUNZ8GajUkPpezkpaYVHAy1qly18Q3yaOgdp0KX8VKqSh2OWHGRmSQHzy437l
         uTu9hdZcB/6U2m6PtITtL3N9W8/fy2NuLu94o5i5rBsGA1+qZug/X3ZJFXmAjQkwOZN/
         JmZMyIHumVVOmEHyA7qlWV93FkHtUmUMflyUR2ihZsoxJHLx8G1LVfqMZSpeuA4TTw6n
         q2nM2Os/P9ScAk32vXoWpSH/jF58zMzoR8nMEri47vy9K4xpED1qK3RxjN2n7AWzr8OO
         o9X95tv2CLS4FpzDnrMwQL0LVD38o9ll0j+i+Rp3WnaoLQO+6a1U/TZol3jrsBFl5FVt
         y7dg==
X-Gm-Message-State: AOJu0Yx0f6J5UKRb/I4PPqqUf92fN1MVzyf3AMx9Oggo/P7mE5uXDI2z
	SZFIvD3ZVTNRRnwD/8NWgnXfO+/wzWwCl38ifMRJMYmDkAOEKLm6lJKF8N4bT78/
X-Gm-Gg: ASbGnctrtyoeN8WaEf0L+112MCOD6r89oYSky1Or2S0tz4b2KbDShJbqDXkYHk2/szz
	8uuNq/Qym8IqgL0WFeapZxfwAEkf4dnjwIxpMcEBtWiJvIzFfgQB1OZSgwnLp37b29mgUQknaOc
	qZcEJJXjrbMf/srQhyNUJFLjWvpf4BkSL8YhcuLNNJQ/TlNsL6veYgg8BJVdqvB8A7nC8MnWBBp
	9l44o7ejwlpcQts7siRrx+VXamNq18QEa/8qbGyIVG55k+gXZ8qxWxRL9bn90pYNCu9Q/97j9md
	fC4miv9yHI2m4LX3ZdsAVqcC4sc8yEvN28ahtjK+e9KceuMs+qin3MOlFytrasIfcqiHjYY6JML
	drnZQAbO2gaRMwu1wMN8oOaUHb7jrrGGCUbZ0qRPh9hQYY8HnYn2rif/bOoclIcxnkWvhM0DbS9
	N2XWOJz54x11lq8hD+aKW7h8sBxaE4yjAkzo/6m0pAQiBb0dcuZI7deSw=
X-Google-Smtp-Source: AGHT+IHWtHVXehQFD3RTWT2Z7aQegTgp3LU3M4DB9hHxeDjk8+L8TQHv6+s8a3xpdcpSloDAx+s+Bw==
X-Received: by 2002:a17:907:98e:b0:b76:3b69:cb5 with SMTP id a640c23a62f3a-b76715723dbmr1229441366b.21.1763987666087;
        Mon, 24 Nov 2025 04:34:26 -0800 (PST)
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
Subject: [PATCH v6 16/19] xen/riscv: implement put_page()
Date: Mon, 24 Nov 2025 13:33:49 +0100
Message-ID: <3a7ddc77031d24ad5a318375c4ec420bd749b2ca.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement put_page(), as it will be used by  p2m_put_*-related code.

Although CONFIG_STATIC_MEMORY has not yet been introduced for RISC-V,
a stub for PGC_static is added to avoid cluttering the code of
put_page() with #ifdefs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6:
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
index dd8cdc9782..0503c92e6c 100644
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
2.51.1


