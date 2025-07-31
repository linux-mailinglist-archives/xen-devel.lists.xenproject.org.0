Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2AB17484
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065942.1431325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhViZ-0001X1-QB; Thu, 31 Jul 2025 16:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065942.1431325; Thu, 31 Jul 2025 16:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhViZ-0001Tz-L9; Thu, 31 Jul 2025 16:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1065942;
 Thu, 31 Jul 2025 16:01:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVgM-0000zK-RF
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:59:02 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 435e9932-6e27-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:58:56 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-55502821bd2so573430e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:56 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:54 -0700 (PDT)
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
X-Inumbo-ID: 435e9932-6e27-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977535; x=1754582335; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2OLoR+tK71eYXjQc2Rg1scLe+IVcYggQesNhZh0GIk=;
        b=PzglZtZYT/Z51T+dsYkMiIoojpRlEe4m6XCzSIf7TPNEk42pYw26sFYXNqSPJcNjWo
         I4y4sO/PhCSznacHLC0b60jtAhzMl032eBhDS8qsNWYec9uK07KI00F1pzqLi6XB+Ntn
         L9xuY5CYLK066S/J+/SKqvdeQdVMosmfCOjZv/bItRfTDeIuoJs6QiWD/qnMPghBwvk7
         Pxtp9I4vpAaq/yhMOUSD4HsIj2okNEa5f7VIKIyviI8Ya6fSzWGJmbNrMliWPmmeeeov
         RJrzQC3M34tesQIpgATHfOL5CvFB1VUy9mqu2mfWThCnbewEXbQANB7EEu8A7Q9tkATE
         ND8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977535; x=1754582335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2OLoR+tK71eYXjQc2Rg1scLe+IVcYggQesNhZh0GIk=;
        b=pnjl+RSGTpihOs45/zDrTV3/nOBF9amLS2Ce1UaohK6cDdC264gb+XzulDps+HxKX8
         0BrJ4sqv+ztxLnT9f572N5tvdEnSEBavK34L/QSbD5NZdj2zv+MT3prPaTBtJS5t4QBV
         no7e6Agtt8jCGkt+oKMU9nzWSAZHN43Yb9bzHQ7bL3daT5CKao8nPl6eQcYHybnie3jE
         Tw2N2g/UbYT3+TlejLsOBal+21t0Slsug5HsudbI0PobPMaembHlVw77S6kZcVPmob38
         Qcy99N0mxSeMXKIF+SaKr/9Lqr+IvlUEZwdNEIunLJ4UP7zPDtU/en32KhWkWuWlBtyj
         wTKg==
X-Gm-Message-State: AOJu0Yzs/SNByaHBblIS/95nlR4Lgm8cnwQsuAoYTeIL/ScPX04vmhN1
	EkPNexYh5enkINLbPVdNIvfzZd91W7kjyTOCxGP52XVinid+0FvnzjCWB2/EhA==
X-Gm-Gg: ASbGncsE1GuldXNzvmsjEH5Ry9dZoQ9kFjpPyByjCT/Mdvl37ZXH5raHKGdnyalseKS
	oDvc5jmESKbHgHa+y5OGxRJJwL8+xehX0DgiSMH5jOANRamICazsj07MmQK+dK7NFGT5VcnfYec
	NPu82lD/kxml+Ynl9/O5Sj6QEwIE24dl9YpLxX7t7O18oIo0RUoeN7NYj8HXnDa2kM8MNdge+OU
	Cq4F/0JvNt8MeaFKbp0xEbuHDEi/d9fhCtUGkTF+gE3prTpKkyZ9GXmo2VvbAhmSJqS/6aVwp8z
	qsRTUcTCL8SN7+vwWHLXFZGW17S2FZ7PqbQKswGDua9SpRtNxhaeRJgAdTCfXHk8avcFek9qHVl
	MqxrPyNH4Qz4XGLl7feY9wm0iH9oelJPd37uuMiiF+o71Ar1OoIF9NKDlNho1FQ==
X-Google-Smtp-Source: AGHT+IG7GGWG+vOdvrR3OUlZ8DihhlUeopPc4FsJLRdYIqBYPodyrGIAAPy/B54IPSj3h4hc0qsd+w==
X-Received: by 2002:a05:6512:1256:b0:55b:838c:d900 with SMTP id 2adb3069b0e04-55b838cdc70mr1621101e87.19.1753977535312;
        Thu, 31 Jul 2025 08:58:55 -0700 (PDT)
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
Subject: [PATCH v3 17/20] xen/riscv: implement put_page()
Date: Thu, 31 Jul 2025 17:58:16 +0200
Message-ID: <7a7c07d431fc943e655216d389322638a640b2cd.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement put_page(), as it will be used by p2m_put_code().

Although CONFIG_STATIC_MEMORY has not yet been introduced for RISC-V,
a stub for PGC_static is added to avoid cluttering the code of
put_page_nr() with #ifdefs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mm.h |  7 +++++++
 xen/arch/riscv/mm.c             | 25 ++++++++++++++++++++-----
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 7950d132c1..b914813e52 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -273,6 +273,13 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
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
index 1ef015f179..3cac16f1b7 100644
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
@@ -627,3 +622,23 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
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
+    }
+    while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
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
2.50.1


