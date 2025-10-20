Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95294BF252C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 18:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146756.1479151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsT0-0001rq-Ag; Mon, 20 Oct 2025 16:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146756.1479151; Mon, 20 Oct 2025 16:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsT0-0001mx-5N; Mon, 20 Oct 2025 16:10:38 +0000
Received: by outflank-mailman (input) for mailman id 1146756;
 Mon, 20 Oct 2025 16:10:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsHH-0004DQ-52
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:31 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d944734-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:58:27 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-63c523864caso5024935a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:27 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:26 -0700 (PDT)
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
X-Inumbo-ID: 9d944734-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975906; x=1761580706; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lK/gM70l8B95feEe910Sc4XNkb2hL034DdKe0NvGuM=;
        b=hF2aDSgQ0+YhL2+Oebl6fFkgpVB2xORwIGcMQErPcUogT/9Rcur5FtQJvnvQbRV/uU
         1ZP0lDb6xj9epigZII+5OzOxD7MYq4145eP/tLHRaqKrUXkfvscYphloQiKn3HLtPMS0
         AP6izIwviSbVMQifkmfWx6baRrCoH6BcShaUor7pK2bwaADH4vlPqabZkUdV8Qe3dLE6
         wSpZPO0rUjtYr/euB/diirt4Y4GOx3KndtA2OOrUmtH9LLnzpwfSw0TOYOAhyogVVWn1
         JG1c/kRt29ycXiY78Uvtjs0e0F/WNlDU4YOLpGHfoFshZON+nsVNw9sAlOl8PG6jhX45
         G14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975906; x=1761580706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lK/gM70l8B95feEe910Sc4XNkb2hL034DdKe0NvGuM=;
        b=WMZ2zDbUMdGJLlVmTRlZ6E0i2bCfPQ5Q6mFAv+R4cIb5DrllW757MbcLsZQ4EmnScS
         bPsacHBGlzpv5EVtqUxv6Sz5srj97Jk3czhr9vrgngad4ZEQvUazoO0Y8Qt+6A+D48ko
         t514qehE54mDWRHU0/xT++8ectHGiHmDRVNwcQFsP9IkFU9QJSaiX8A2YzTa36guMkn7
         P8yq2ONpTXbL7sMyxn3UWy2HcRcweT4zt9ULDS3tJj6c8TzlchoHIdTlmZ9Z5vSlw5Nt
         bI/JWx9BZJ1UYyP6TdAJW9QnklBHc/ATz/xJqGHXhaml1d1mWKYImKhteNALC2/0vaAh
         YknA==
X-Gm-Message-State: AOJu0Yyn2PPGzg67vS50tgHOiOEWdOXqquzI1u5FbZh2XcC2W6/+/HmC
	EUeN7RaP+vwAyn1ipIoJm0GuxBbprD/ivgY4Il9ZirwWWFPRToxCxY3jVdN3Ig==
X-Gm-Gg: ASbGncvSkWqsAl+trkdL8U0bfoe1c+5aFxYo52sBLzN7Cplj+7amAXA8NlckLY2Q7oc
	QIt4++K3vOiDVbdDHoS4au4Os0gLeK4/zVRpSyoOSf/Tfr56YXV388NfEkRMKZW6Kq0rTYwpwwZ
	GkwLdhKICyXMZKUMKmJP1GOL9tk/Wfvs3+lxU1grN4fj5+MpyUriGgEwGTiU0UQM+Rb0lIE9vkV
	PBcdrN/ozZDnhmytoEt8KlbnRHpct5utiw5M12MR3V8mY1wGD9yhW5dnIVhKszb4X9I+EEfUrdz
	nQVU+BSsbXkwd1Gv/Spy0SF4f0UNc9x1YbhqzHxRhoiGjeYz8OKnF50PCZaeCXpc4z4cyq/qGo0
	EbvEf9g/S/pkbYp8heNRmtB8CsOtQzP+qrlHYdT30HsnyD1ivS8OOP9rDHzO2sOVjp/CFsfQQvG
	A28rikeccnZIqMZ0kh3UlIwfnNdvO8aQGKHz3WtCeYGL5a+b3L8dduBWMcq5ipSW5Nlmq2
X-Google-Smtp-Source: AGHT+IGMqGbsWLlJZuz66hkF8AYzDXsIRAAUCAzeiHaMP4/MfYq17MGblBDlDsbsdm7Ixm8oaUMAUw==
X-Received: by 2002:a05:6402:2707:b0:63c:4d42:993f with SMTP id 4fb4d7f45d1cf-63c4d429acfmr8313933a12.3.1760975906476;
        Mon, 20 Oct 2025 08:58:26 -0700 (PDT)
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
Subject: [for 4.22 v5 16/18] xen/riscv: implement mfn_valid() and page reference, ownership handling helpers
Date: Mon, 20 Oct 2025 17:57:59 +0200
Message-ID: <32618e3dbffea2bc7705ba67ede0f781eee783e7.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the mfn_valid() macro to verify whether a given MFN is valid by
checking that it falls within the range [start_page, max_page).
These bounds are initialized based on the start and end addresses of RAM.

As part of this patch, start_page is introduced and initialized with the
PFN of the first RAM page.
Also, initialize pdx_group_valid() by calling set_pdx_range() when
memory banks are being mapped.

Also, after providing a non-stub implementation of the mfn_valid() macro,
the following compilation errors started to occur:
  riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
  /build/xen/common/page_alloc.c:1054: undefined reference to `page_is_offlinable'
  riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1035: undefined reference to `page_is_offlinable'
  riscv64-linux-gnu-ld: prelink.o: in function `reserve_offlined_page':
  /build/xen/common/page_alloc.c:1151: undefined reference to `page_is_offlinable'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_is_offlinable' isn't defined
  riscv64-linux-gnu-ld: final link failed: bad value
  make[2]: *** [arch/riscv/Makefile:28: xen-syms] Error 1

To resolve these errors, the following functions have also been introduced,
based on their Arm counterparts:
- page_get_owner_and_reference() and its variant to safely acquire a
  reference to a page and retrieve its owner.
- Implement page_is_offlinable() to return false for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
- Move declaration/defintion of page_is_offlinale() before put_page() to have
  get_ and put_ functions together.
- Correct code style of do-while loop.
- Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - Rebase the patch on top of patch series "[PATCH v2 0/2] constrain page_is_ram_type() to x86".
 - Add implementation of page_is_offlinable() instead of page_is_ram().
 - Update the commit message.
---
Changes in V3:
 - Update defintion of mfn_valid().
 - Use __ro_after_init for variable start_page.
 - Drop ASSERT_UNREACHABLE() in page_get_owner_and_nr_reference().
 - Update the comment inside do/while in page_get_owner_and_nr_reference().
 - Define _PGC_static and drop "#ifdef CONFIG_STATIC_MEMORY" in put_page_nr().
 - Initialize pdx_group_valid() by calling set_pdx_range() when memory banks are mapped.
 - Drop page_get_owner_and_nr_reference() and implement page_get_owner_and_reference()
   without reusing of a page_get_owner_and_nr_reference() to avoid potential dead code.
 - Move defintion of get_page() to "xen/riscv: add support of page lookup by GFN", where
   it is really used.
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/include/asm/mm.h |  9 +++++++--
 xen/arch/riscv/mm.c             | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 0503c92e6c..1b16809749 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -5,6 +5,7 @@
 
 #include <public/xen.h>
 #include <xen/bug.h>
+#include <xen/compiler.h>
 #include <xen/const.h>
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
@@ -300,8 +301,12 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define page_get_owner(p)    (p)->v.inuse.domain
 #define page_set_owner(p, d) ((p)->v.inuse.domain = (d))
 
-/* TODO: implement */
-#define mfn_valid(mfn) ({ (void)(mfn); 0; })
+extern unsigned long start_page;
+
+#define mfn_valid(mfn) ({                                               \
+    unsigned long tmp_mfn = mfn_x(mfn);                                 \
+    likely((tmp_mfn >= start_page)) && likely(__mfn_valid(tmp_mfn));    \
+})
 
 #define domain_set_alloc_bitsize(d) ((void)(d))
 #define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 2e42293986..e25f995b72 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -521,6 +521,8 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
 #error setup_{directmap,frametable}_mapping() should be implemented for RV_32
 #endif
 
+unsigned long __ro_after_init start_page;
+
 /*
  * Setup memory management
  *
@@ -570,9 +572,13 @@ void __init setup_mm(void)
         ram_end = max(ram_end, bank_end);
 
         setup_directmap_mappings(PFN_DOWN(bank_start), PFN_DOWN(bank_size));
+
+        set_pdx_range(paddr_to_pfn(bank_start), paddr_to_pfn(bank_end));
     }
 
     setup_frametable_mappings(ram_start, ram_end);
+
+    start_page = PFN_DOWN(ram_start);
     max_page = PFN_DOWN(ram_end);
 }
 
@@ -623,6 +629,11 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
         invalidate_icache();
 }
 
+bool page_is_offlinable(mfn_t mfn)
+{
+    return false;
+}
+
 void put_page(struct page_info *page)
 {
     unsigned long nx, x, y = page->count_info;
@@ -641,3 +652,24 @@ void put_page(struct page_info *page)
             free_domheap_page(page);
     }
 }
+
+struct domain *page_get_owner_and_reference(struct page_info *page)
+{
+    unsigned long x, y = page->count_info;
+    struct domain *owner;
+
+    do {
+        x = y;
+        /*
+         * Count ==  0: Page is not allocated, so we cannot take a reference.
+         * Count == -1: Reference count would wrap, which is invalid.
+         */
+        if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )
+            return NULL;
+    } while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );
+
+    owner = page_get_owner(page);
+    ASSERT(owner);
+
+    return owner;
+}
-- 
2.51.0


