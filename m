Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3BABF2514
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 18:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146722.1479121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsS7-0007mW-9w; Mon, 20 Oct 2025 16:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146722.1479121; Mon, 20 Oct 2025 16:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsS7-0007jQ-76; Mon, 20 Oct 2025 16:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1146722;
 Mon, 20 Oct 2025 16:09:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsHD-0004DQ-4N
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:27 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cfef3c2-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:58:26 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-637e74e9104so6216969a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:26 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:25 -0700 (PDT)
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
X-Inumbo-ID: 9cfef3c2-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975905; x=1761580705; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cxtv3BMlv21jdp4Ip+HjiyNuW5KsWMFtWda7wHvVoac=;
        b=CsBk/M7DOc4rBsp3ZF7kBYm/jBGW70uoqtsdQKTZ6qXxoZHxhi+picsHiMGBKIPjit
         41E2LYgFlWqAVqwMNoT9d9abHt/nxPNbJhk5N+DiQkM3h6ecz7KXL40XztW1RDZVxf4b
         JVAA1JGKlR0QdItr8xyTtcFho6T7wSsYEEqW8QhOasSH5tyhVIxLnNYbl1NsyOBLvsvz
         W6UDvcQbDIhNxKAmXvYAsD5pHiszC3rpMwqWV7O7udNz9C1Z3o6NUrrc8CI0lwSfJmMv
         ye7mmmwp7fa62SRUn5nUH/zYSmLq5TL8IlFe6WsrVBvs18sBvaC0vPYLzPWw66MpzCwk
         D5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975905; x=1761580705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cxtv3BMlv21jdp4Ip+HjiyNuW5KsWMFtWda7wHvVoac=;
        b=ZUmllFLwKRozhqMwedSGc2in6Mc6gwIb941nUp7sq+wN6Xu0xOVtzoztuTb+OKBF4Z
         bIo1kyseGJL09jx7FYZbD05Ln4PinGxeNGe0Gn1wnR53R8iPEC+6ETZPk8NRNs2xWMNv
         S8abHySf+tAQvgOq0lLRHwkN9VuGyu0/aJ+UwIROcG+jGUZ1ynbK6qk3yRTxBQnSGfTG
         IQcyneyZ9tJYlL8D8FwEYI2OrYALP7w1ckDi+eA+GYRwUFW9jEK3JF9WVfp2/XquMUGX
         2ATL9DXb/4QFa7Ib9rMPW7tbEG8mtlXIz3LgRoTt+ATX06psduJsNouF3n8m9dDm0xVH
         4nJw==
X-Gm-Message-State: AOJu0Yzcdjo8N/84Ox8wka1113BTFzqGAjT4yYMkPpNG/26ozH/S/EbZ
	LXc6UIwvE8Up+wcfd6HwNthdPSpQCZmV5Pap9P2oFlM4zsBX9dqfgBQNdEQzRA==
X-Gm-Gg: ASbGncv1zyqcMzJBl8Nu9UJPAjFZlNiSa5ELxE1oEIeXKyYxV2Ju0t26xojtxB+TGxX
	RbzNv+kkEAEJZzdbjyV7/j/faXX75juZ+tRZc0vO9z3I68BIUndhC/5IliH5tJKlffqNj4gKHS2
	VguWClcbV4UQEGbH/XRpibC0xOeiiR5PyA/Tl8LG1zkZe1Fs26mtV2vRBARpwkJ20axLwSfKDvz
	O9Mpzp0eU6xvwdzn0Zpvj3sr9GeuUV+dfOYSeW5VMwNrk+tHLWlqzM0kkoQIoz/nxGwi9FW+QqP
	8QsX+XhB33wyuyYsoKk0M58MvWrDAgdUNN3sg5E2YKHdOTWUxc36g6RbOmkAmas2qWPiAbj6s4w
	PUjojlEvcszw/2zObMTUJB9Ie58n+SE1n7yzihTZh09lUJXDrQYVGOBUod6iDJbRG9k6UBMq7Ey
	c3YGdwvgoLu67EIvF+RJfBuLnA4yQn5Pc9ElRLuO5YC1P+Qs8=
X-Google-Smtp-Source: AGHT+IF5ucbhQzw4jIkyq+gtZKbaydALhhXv5GV/+yNefqCo4pLvofWsWifLfqFebcjWNU0rfjICjQ==
X-Received: by 2002:a05:6402:5c8:b0:639:6bc8:c7bd with SMTP id 4fb4d7f45d1cf-63c1f645c25mr12323874a12.15.1760975905504;
        Mon, 20 Oct 2025 08:58:25 -0700 (PDT)
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
Subject: [for 4.22 v5 15/18] xen/riscv: implement put_page()
Date: Mon, 20 Oct 2025 17:57:58 +0200
Message-ID: <6b2fa23a871eb6a8405265dcf3bbac51f29c84b6.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement put_page(), as it will be used by  p2m_put_*-related code.

Although CONFIG_STATIC_MEMORY has not yet been introduced for RISC-V,
a stub for PGC_static is added to avoid cluttering the code of
put_page() with #ifdefs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
2.51.0


