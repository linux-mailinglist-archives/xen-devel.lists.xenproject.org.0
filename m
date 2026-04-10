Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFF2EnEd2WnVmQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF133D9E20
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279417.1563863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECS-0007UU-El; Fri, 10 Apr 2026 15:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279417.1563863; Fri, 10 Apr 2026 15:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECS-0007Rm-Az; Fri, 10 Apr 2026 15:55:16 +0000
Received: by outflank-mailman (input) for mailman id 1279417;
 Fri, 10 Apr 2026 15:55:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECQ-0006zi-FM
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECP-00DRdD-RY
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d5f-2eae-0a2a0a5409dd-0a2a4506e8bc-12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:13 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d61-0df0-0a2a45060019-d1558035b098-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:13 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-483487335c2so24236935e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:13 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775836513; x=1776441313; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFYf07Rw6EEigOnFsAjQXEHqS/FUbbC2HqDC1ySUOAc=;
        b=N6OCPPryxPDH7i+Guk+LEXdipKtQX3Sc+ngp9MAxVonaOmZBiy3xMVAs+TfcFSzJfO
         hQ4oTcZGx/YbJXlzUU5sy2wuwVWIQFUOEL1G3zHWLLCGgW/VvdgoA83NMbAsT19YxXzd
         lodJW3SfrYsJUtzSICLQWqTAVtGzHu4YYx7vmZMf8Jj6jVD6xuAs4lVk57RuT1HBZ2OD
         UmG8936YUFyVjbSae40yY90IlOyGJ0Wh7gZnYdMuX22eCo8bbWj7yg7USe8ZvqY7oC9h
         pWTc2XiH8w/CNmDnqPw9ypQJuLa2ZuiXJ+P1+h5hvPVq4CI4dPhZKoswbJxkzjjNjbBD
         EWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836513; x=1776441313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SFYf07Rw6EEigOnFsAjQXEHqS/FUbbC2HqDC1ySUOAc=;
        b=Qthazv9dAehQ2XuRWmLRNojclxs2rJMfBkuJ505hFza9KsPcNoOZYs8b/xi+C+Rs34
         xSNumr3Y0QJUqH4d0ZImjNddsn8ODFExDWmAqLXZpBDFgsMCt1Mu/QO9+tViXzfMQYwu
         p5acvo03a49DPC/RqOSTYPBj/9XdOe3ilYTyP+JxEafysLj6RznEltZTKK+4FInjLF9k
         cS9v64PFGBNJ/kAAJYDqUxL7ioII5QE48HGpveEe13VfwvkH6bmzZbaICdQffLWdc8hB
         5ADXDfDmB/DSJaLEZZRQFGgXmdJml9NGPz262IdwINW88WHNaD5JW47yQK3xnEquQvdD
         S+3Q==
X-Gm-Message-State: AOJu0YyEcnJ/acFY8B2AR2VRsUV3WGw/BF2IJ8wK9IjhAFAwEQ33R8KU
	1OFUiprNJX6f+efKk0IKtATOBRXSG/puKgJMrIoN23CL/FfJT4je5xCaFozkHA==
X-Gm-Gg: AeBDieskIljIoEUIFJtGtskyrFL50/IF/jouza3zJUmNW503GalNyyuIZuV5rLJouwE
	Jlw+H7zptksKpCW3ffCnSBDj5n2mUmDvZbRARpgxXkk5/vl7PVai4MV1PeqJE7TNoTGjd6Ihx+K
	MY/QOP2Ysktgo5ffAKPkTHz9IjPi7JaJagD2qPLLtuftj78x/x0BWeEuWNg4dISss+HhQzOzU16
	0WlETY1FychPAXoKLAndVq4gRDYIdqzbZowpG6Pr0lMIuqH9ycczUzkndYPn43WXFPrJq1QPuUO
	cX+mUJcG6wuRX3hhOnQTy9yZ3kTZwip/MZoN8trwByrNLVQFSMiG25tAZMpohJas9EtMZV7Ib+S
	EPjzty5i+JaxytqMGiTK5HcdEF76GXKQyqyBC18YGsMcd6poZFzgCqV/RErtySGPpxEs6+6YOGO
	W913ibbR7HYdj32lHhb5aHo1XgzKu7Rr+IBGZWDGdlzIY20VjaMaRayATDAAGYvVEBrg==
X-Received: by 2002:a05:600c:45cf:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-488d67b8dddmr46630205e9.6.1775836513001;
        Fri, 10 Apr 2026 08:55:13 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 03/12] xen/riscv: implement copy_to_guest_phys()
Date: Fri, 10 Apr 2026 17:54:49 +0200
Message-ID: <265d9fe7c0ff46c1c969156c889e133593d57fff.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1775836513-5FF3D3D8-2F861969/10/73395122804
X-purgate-type: spam
X-purgate-size: 6368
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EEF133D9E20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce copy_to_guest_phys() for RISC-V, based on the Arm implementation.

Add a generic copy_guest() helper for copying to and from guest physical
(and potentially virtual addresses in the future), and implement
translate_get_page() to translate a guest physical address into a struct
page_info via the domain p2m.

Compared to the Arm code:
- Drop COPY_flush_dcache(), as no such use cases exist on RISC-V.
- Do not implement the linear mapping case, which is currently unused.
- Use PAGE_OFFSET() to initialize the local offset variable in copy_guest().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - s/if (page == NULL)/if ( !page ).
 - Drop " - offset" for unmap_domain_page() inside copy_guest() function.
   unmap_domain_page() is expected to mask (or something similar) the page
   offset bits.
 - Change some types for functions as copy_to_guest_phys_cb function pointer
   prototype was changed too in the prev. commit.
---
Changes in v2:
 - Use BIT() instead of open-coding.
 - Rename COPY_ipa to COPY_gpa.
 - Rename COPY_linear to COPY_gva.
 - Use  BUG_ON(linear) instead if (lineer) + BUG_ON.
 - Rename arg liner to gva for translate_get_page().
 - Update translate_get_page() to properly handling write argument.
 - Return unsigned int for copy_guest() and copy_to_guest_phys() as
   len function parameter is only 'unsigned int'.
 - Reformat function arguments for alignment
---
 xen/arch/riscv/Makefile                   |   1 +
 xen/arch/riscv/guestcopy.c                | 116 ++++++++++++++++++++++
 xen/arch/riscv/include/asm/guest_access.h |   7 ++
 3 files changed, 124 insertions(+)
 create mode 100644 xen/arch/riscv/guestcopy.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 04f02ad89cba..cfc3fdf7d208 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -4,6 +4,7 @@ obj-y += domain.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
 obj-y += extable.o
+obj-y += guestcopy.o
 obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
new file mode 100644
index 000000000000..55a2d6597621
--- /dev/null
+++ b/xen/arch/riscv/guestcopy.c
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/domain_page.h>
+#include <xen/page-size.h>
+#include <xen/sched.h>
+#include <xen/string.h>
+
+#include <asm/guest_access.h>
+
+#define COPY_from_guest     0U
+#define COPY_to_guest       BIT(0, U)
+#define COPY_gpa            0U
+#define COPY_gva            BIT(1, U)
+
+typedef union
+{
+    struct
+    {
+        struct vcpu *v;
+    } gva;
+
+    struct
+    {
+        struct domain *d;
+    } gpa;
+} copy_info_t;
+
+#define GVA_INFO(vcpu) ((copy_info_t) { .gva = { vcpu } })
+#define GPA_INFO(domain) ((copy_info_t) { .gpa = { domain } })
+
+static struct page_info *translate_get_page(copy_info_t info, uint64_t addr,
+                                            bool gva, bool write)
+{
+    p2m_type_t p2mt;
+    struct page_info *page;
+
+    /*
+     * Not implemented yet.
+     *
+     * If gva == true, the operation will likely require a struct vcpu
+     * rather than just a struct domain. For this reason copy_info_t is
+     * already passed here instead of only struct domain.
+     */
+    BUG_ON(gva);
+
+    page = get_page_from_gfn(info.gpa.d, paddr_to_pfn(addr), &p2mt, P2M_ALLOC);
+
+    if ( !page )
+        return NULL;
+
+    if ( write ? p2mt != p2m_ram_rw : !p2m_is_ram(p2mt) )
+    {
+        put_page(page);
+        return NULL;
+    }
+
+    return page;
+}
+
+static unsigned long copy_guest(void *buf, uint64_t addr, unsigned long len,
+                                copy_info_t info, unsigned int flags)
+{
+    unsigned int offset = PAGE_OFFSET(addr);
+
+    BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t));
+    BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t));
+
+    while ( len )
+    {
+        void *p;
+        unsigned long size = min_t(unsigned long, len, PAGE_SIZE - offset);
+        struct page_info *page;
+
+        page = translate_get_page(info, addr, flags & COPY_gva,
+                                  flags & COPY_to_guest);
+        if ( !page )
+            return len;
+
+        p = __map_domain_page(page);
+        p += offset;
+        if ( flags & COPY_to_guest )
+        {
+            /*
+             * buf will be NULL when the caller request to zero the
+             * guest memory.
+             */
+            if ( buf )
+                memcpy(p, buf, size);
+            else
+                memset(p, 0, size);
+        }
+        else
+            memcpy(buf, p, size);
+
+        unmap_domain_page(p);
+        put_page(page);
+        len -= size;
+        buf += size;
+        addr += size;
+
+        /*
+         * After the first iteration, guest virtual address is correctly
+         * aligned to PAGE_SIZE.
+         */
+        offset = 0;
+    }
+
+    return 0;
+}
+
+unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
+                                 unsigned long len)
+{
+    return copy_guest(buf, gpa, len, GPA_INFO(d),
+                      COPY_to_guest | COPY_gpa);
+}
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index 7cd51fbbdead..8d679319ded0 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -2,6 +2,10 @@
 #ifndef ASM__RISCV__GUEST_ACCESS_H
 #define ASM__RISCV__GUEST_ACCESS_H
 
+#include <xen/types.h>
+
+struct domain;
+
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
 unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
 unsigned long raw_clear_guest(void *to, unsigned int len);
@@ -18,6 +22,9 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
 #define guest_handle_okay(hnd, nr) (1)
 #define guest_handle_subrange_okay(hnd, first, last) (1)
 
+unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
+                                 unsigned long len);
+
 #endif /* ASM__RISCV__GUEST_ACCESS_H */
 /*
  * Local variables:
-- 
2.53.0


