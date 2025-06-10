Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99249AD380E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010790.1389058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfq-0006tx-D7; Tue, 10 Jun 2025 13:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010790.1389058; Tue, 10 Jun 2025 13:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfq-0006l6-5h; Tue, 10 Jun 2025 13:05:54 +0000
Received: by outflank-mailman (input) for mailman id 1010790;
 Tue, 10 Jun 2025 13:05:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfo-0004Sm-2h
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:52 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1d624fb-45fb-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:05:50 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-acae7e7587dso823661566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:50 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:49 -0700 (PDT)
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
X-Inumbo-ID: a1d624fb-45fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560750; x=1750165550; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wljNhX5Z+KEFF48phAFs/NmPQwz56AjKrfG07RWLiVw=;
        b=Vn1/yWEBMYmo+Z/CrH+R8PICecpmbyqJHEGPrtvN8I723o0L0qIy09wOgkD0/r/d9E
         Xie3LqYjqr4appOhIUE4mm2ZGmxvCejmPH+HU3CzQIz2ZXFdpc+bIEvrz3V4Y6DxweuU
         Z3rPY074N/0bnv9w1/QsxGgCMjRbJL4B2iS5DsBQHa9lAFH0XYSoSoxZGOUiZOFynKRZ
         BnCwEiTIYI5dOY4mBfK3tBZqc573w6SZ1aEsnu1QsQSsazPGanpdtiQr/ShttTZrPeXF
         qNUBzfwewKawX+4B77odSYNQTFtddAFK9gGypPVROLDboS2G/MuhJ/r09It7ffqoM3RH
         h87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560750; x=1750165550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wljNhX5Z+KEFF48phAFs/NmPQwz56AjKrfG07RWLiVw=;
        b=lWSfSGnAahX1OmFtX80pzh2pVkGzrE26R11qitcn/AQ1O45gH6ZAMILp7tM2nPuRXB
         4rAKn0AbTQUmFre42DBNFNgXUVFQYcUYijWSX8bz0kAReEZZCfe2lViR96mltNTot3WV
         rxELeQmm/8NZnewrzFtXtyiWWG4tvA+zZAHHFD1Ji6io1GyiPDbQVT3UNN072Pohjk4m
         zHdxMZ1QwIn0XR/+58Fdxw0PzcD0mkIE5pl0xkaeXp2RnkFgKxQb7EsLgPMHkd0G9BLp
         4lAx5JLcHwQw6MzfBZqe7c1auNDX0XcOAOfv5PNZOn75TEBZbuM4i3qs8Z+1twC0afme
         jPMA==
X-Gm-Message-State: AOJu0YzAIYwNlISlFRaNFMBmP2S1Sp2x0wRUiPRIwpHs5bQY0sw77VKh
	dIVIa7bgOREzIIkdqlj3BKGQ3q1QH1Brw3tdztTFPdRpujyzXZZhOAKd7u/SZQ==
X-Gm-Gg: ASbGncudktniiDyI763MF8i6scDwyVU9KpnangAYNlDdG3MZ0pzFBl68dHV8UkyXzWy
	2DyLYBZFUINDAMj8mi2tBKQp/sz99Z8xOq13TNrjKbW2AHM+7asViHqzMcSLIh2uCIZj0TewhDm
	2UWFD95YmbWR9HpdoN9SN9bpfb0jOqM/am21HE7sVVPBPvc9DV5c6I96yD5lTqJWty8YvB+c27C
	/28gOFXXofMorwiXQD5omosRlcgnRtkSi8LWoAjVOPtMZpMm3mEAtEUTZtp/lHXVtNHi3qowlae
	BhRyOXlQf/dlWI6vMsB2XyukukIQxCEJdsknRFTIef+XVPEmNw8JQG4dP2PxZ/VxcOniG0o8DMR
	jU5Wgx4aIhZY01Dre1iPbIWlYPXC5
X-Google-Smtp-Source: AGHT+IGFjTXdFlS6sZvD06fXM72cWhnM/gD4j/C7i7+WrXUDNN4lIYkxwD7jGkhRmCOFEo4b6nz+FA==
X-Received: by 2002:a17:907:6ea8:b0:ade:450a:695a with SMTP id a640c23a62f3a-ade450a70e9mr993218466b.61.1749560749329;
        Tue, 10 Jun 2025 06:05:49 -0700 (PDT)
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
Subject: [PATCH v2 08/17] xen/riscv: add new p2m types and helper macros for type classification
Date: Tue, 10 Jun 2025 15:05:23 +0200
Message-ID: <f943c6ce5371258af0f36c2633d542341fcf47b4.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Extended p2m_type_t with additional types: p2m_ram_ro, p2m_mmio_direct_dev,
  p2m_grant_map_{rw,ro}.
- Added macros to classify memory types: P2M_RAM_TYPES, P2M_GRANT_TYPES.
- Introduced helper predicates: p2m_is_ram(), p2m_is_any_ram().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Drop stuff connected to foreign mapping as it isn't necessary for RISC-V
   right now.
---
 xen/arch/riscv/include/asm/p2m.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index a31b05bd50..0c05b58992 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -61,8 +61,28 @@ struct p2m_domain {
 typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_ram_ro,         /* Read-only; writes are silently dropped */
+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
+    p2m_grant_map_rw,   /* Read/write grant mapping */
+    p2m_grant_map_ro,   /* Read-only grant mapping */
 } p2m_type_t;
 
+/* We use bitmaps and mask to handle groups of types */
+#define p2m_to_mask(t_) BIT(t_, UL)
+
+/* RAM types, which map to real machine frames */
+#define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw) | \
+                       p2m_to_mask(p2m_ram_ro))
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
2.49.0


