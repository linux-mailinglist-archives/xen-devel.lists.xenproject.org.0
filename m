Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC28849EB1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676336.1052472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1Cf-0002VA-UC; Mon, 05 Feb 2024 15:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676336.1052472; Mon, 05 Feb 2024 15:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1Cf-0002Sy-QI; Mon, 05 Feb 2024 15:48:13 +0000
Received: by outflank-mailman (input) for mailman id 676336;
 Mon, 05 Feb 2024 15:48:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0y4-0007I6-SS
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:08 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbd8ab44-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:33:06 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51124d43943so7188941e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:06 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:33:05 -0800 (PST)
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
X-Inumbo-ID: dbd8ab44-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147185; x=1707751985; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcO8xwP8eE9Ny9t0TSMCXWd0AmNb0Mm6hrsaI38kCRE=;
        b=ksnoSg4Z9AEiHTvUoDuGqCzxP+ktIU3NoCj7666sOMkhpWjvgVhI994avG86kGJY/x
         DbRbESEfAjSmUMNwnivWyA58XIGRLfTR3Myd9JFxq0q5pfw4CwQNc4CBBDYDqHBAGv43
         j9DqwXX48MxeGbCpzS4rpybZBevdT1K/bFd3Rfa9m9daZpw1w6ZFhzZ+3u5ljk57JID+
         i5B0V5TYjscicsk4WPHf1SQnXb25jMsBBsKCAa/DK9tWCYy3A1Ova7FnjxPtsvX5u3Oy
         u86kIWgVLbnRHknWJwFZx6sSivXbPOmOuKlXyzZ6euiVpWVIf9NXiCggW5O0BKO5p4we
         o3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147185; x=1707751985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcO8xwP8eE9Ny9t0TSMCXWd0AmNb0Mm6hrsaI38kCRE=;
        b=b+dTMvX0JPBPVKuDC/NnruVnCQDVqOlVLC+eKuJ00A4qckigTXuxToKpyq/oS985g4
         idzXGWlfSgIRs3PQ98DqgHVuGuWkUoWMO1AI51VpuWgPhMUhQFjN7YSNZ1C5nBp4Xaic
         AJcxkZ0rNFYWOJSSKL29/+w9UBKb3QOmRKw+qCXhLgH4lR9pGwmivSrcNvcnnvCmc0s8
         me8wYwzRmnBFd5dQvnU/a8VwmYqgcj673iHEoPxKyazEoUZRQtewuFlKPSBQfeChs+a+
         v07bUtMQvQn1OpIobG5FYV6IOBkhAfkXI54tqgCWFY/DNaKvaJP78mBzh6Ig1dvOaJC1
         zmNg==
X-Gm-Message-State: AOJu0YwMuCUyOAxSpaAwqU9BIZcjV6a7KAEDPWZayLbDsZku13sa6IaA
	tJUqIg906LsD3MBSWHH4xg2divlXZYdb+6OQ9tQo4QPX3dwvEEIsEcRIbV+6
X-Google-Smtp-Source: AGHT+IFIzC8AdcGSBzbEPiks7ytlRuyAsj/j9OWBPq6/l5/zEMKKM6cwDyYthtTUCsqaXf4ND+HjDg==
X-Received: by 2002:a05:6512:3b08:b0:510:293e:83b with SMTP id f8-20020a0565123b0800b00510293e083bmr7694639lfv.18.1707147185488;
        Mon, 05 Feb 2024 07:33:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWJ8cDpdCo+idSwySOUCyUOifCs758PnOfDsZoIkm1E4U8dA9TJ9d38AiaxHlLDlEf4RT6oDxbcKWDTbsZPWax5nO0VmtTyEUvHs2GPyAkdLHStPZSU+gDN7eFtbWY7cqubJ1TOmjYQxWt2tcuYCYbylEJLrWpwj5nXZABy8TpSUnciTONjFFLgKbdhit+o9F3/CV+iOoVHFBN1MWH+ySKLmRE32Hchd+Z9bcjYgZnsqKVL1RCFE+IgjXdl5CCPQ4rBHHw/wB0KzwLyRkAXneh3jhw6dDbg/SRVXWPf8Hn4H5nORnjKrDPdhogm8sbccHGFwtqT
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
Subject: [PATCH v4 24/30] xen/riscv: add minimal stuff to page.h to build full Xen
Date: Mon,  5 Feb 2024 16:32:31 +0100
Message-ID: <63338d9a50979ef0e819f92719eb4e11154f6cff.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


