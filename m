Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A7D87D350
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:08:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694017.1082873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlByy-0007i2-Kx; Fri, 15 Mar 2024 18:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694017.1082873; Fri, 15 Mar 2024 18:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlByy-0007dz-FB; Fri, 15 Mar 2024 18:08:40 +0000
Received: by outflank-mailman (input) for mailman id 694017;
 Fri, 15 Mar 2024 18:08:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwy-0005yW-Pt
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:36 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c35ef7e6-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:36 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d46dd8b0b8so29375531fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:36 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:35 -0700 (PDT)
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
X-Inumbo-ID: c35ef7e6-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525996; x=1711130796; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NcaJ1FDBCgUizy11pti52TjBeZ8r/7o9i/6uOLh9pE=;
        b=VUevo1mlyzsIjlX02nKe+Uzl+W04mhqolgcz1olCi9pbeW3cbYyoqh0gIwOL7sYGDh
         2reK5Hob875uGjVsno0OMl20HJYagZuNOIgdxvoavMnqeiZ5zkgD6OaGzi5uu8Rs2bhN
         6Hh087pvc+coaDV5jLEbNvIGCYpyAgd7DzOcUo3YHTSzw77+xmauYk8PUpmh8Yy+OIIi
         58AH6YMWIMACuQN2fZxfbgR/DxLjYIBDdwnl1uL1lqSP0kYWAdLqwlgc8XiasVOOl0ym
         l555KAdv5B0o4hvJu+HurhuDP0tEd3rGZCfMrlEbXpQxkyvNjAhbVePb4hcfO2mkzEcw
         Y4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525996; x=1711130796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NcaJ1FDBCgUizy11pti52TjBeZ8r/7o9i/6uOLh9pE=;
        b=SD0X0g2rWCum7I8bJaGP0txq0GxvIRZ2cjKpDpQlqQvB176r+6yLcB5+LTptrAlNPH
         Al2WNexckJLT/W19wFXOhUZ0z+IgbX+4UdlcUfXp2QK0cIra2xRdl80FVrTKJsiLSVCO
         jcbwQkpwj/pTLYNvN4V8p1vFDa3d+mEA2/YrRBETbzHNRTYuiW1qqh7BL8WlCSSSQnL3
         N0RiA7FRpD0MQvjudE0IMyzzuhb2gAhOdQElzUn8QwnDPgRDIGQ/1OHpeL3ax5Ghocqy
         UHJZOd539Jl87hK3Mf1wiTTpcxaqhjr3YvUudcrtAJ6qt0V62gV7fmj+LgwiXZy0Hr68
         5jQw==
X-Gm-Message-State: AOJu0YzCfjJ/NKV4sWMQ4H2TByRA3WAZLyQiTVyAbW4w/mV9ilamwysj
	I520RpSWBGIp9dZO8ekLYw7L4NHlzn/mwcpS/+xbGHehNsezLjYoFcjlrAwieU8=
X-Google-Smtp-Source: AGHT+IFUA3l0o9eYEyt5lnD3XT9b0AohpyxLIuldInNn5GFm49HJTE/aTML44nK1r1Z3YqeXQ9yXFw==
X-Received: by 2002:a2e:3c10:0:b0:2d4:64db:d661 with SMTP id j16-20020a2e3c10000000b002d464dbd661mr4275254lja.0.1710525995665;
        Fri, 15 Mar 2024 11:06:35 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 14/20] xen/riscv: add minimal stuff to page.h to build full Xen
Date: Fri, 15 Mar 2024 19:06:10 +0100
Message-ID: <d005b450f6a02a5f49e85d2551739779affe9e5c.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-6:
 - Nothing changed. Only rebase.
---
Changes in V4:
---
 - Change message -> subject in "Changes in V3"
 - s/BUG/BUG_ON("...")
 - Do proper rebase ( pfn_to_paddr() and paddr_to_pfn() aren't removed ).
---
Changes in V3:
 - update the commit subject
 - add implemetation of PAGE_HYPERVISOR macros
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - drop definition of pfn_to_addr, and paddr_to_pfn in <asm/mm.h>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/page.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 95074e29b3..c831e16417 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -6,6 +6,7 @@
 #ifndef __ASSEMBLY__
 
 #include <xen/const.h>
+#include <xen/bug.h>
 #include <xen/types.h>
 
 #include <asm/mm.h>
@@ -32,6 +33,10 @@
 #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
 
+#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
+
+#define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
+
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
 
@@ -62,6 +67,20 @@ static inline bool pte_is_valid(pte_t p)
     return p.pte & PTE_VALID;
 }
 
+static inline void invalidate_icache(void)
+{
+    BUG_ON("unimplemented");
+}
+
+#define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
+#define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
+
+/* TODO: Flush the dcache for an entire page. */
+static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
+{
+    BUG_ON("unimplemented");
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PAGE_H */
-- 
2.43.0


