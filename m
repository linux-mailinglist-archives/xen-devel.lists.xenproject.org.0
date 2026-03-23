Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CCdJ7xqwWkVTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:30:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C832F836D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259447.1552765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iAv-0005lr-7E; Mon, 23 Mar 2026 16:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259447.1552765; Mon, 23 Mar 2026 16:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iAv-0005ju-40; Mon, 23 Mar 2026 16:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1259447;
 Mon, 23 Mar 2026 16:30:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w4iAt-0005jA-Kb
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:30:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4iAr-005upU-Ey
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 17:30:43 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16aa9-e002-0a2a0a5209dd-0a2a45059b5c-28
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:30:42 +0100
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16ab2-5aeb-0a2a45050019-d155da34e82d-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:30:42 +0100
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so63035366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:30:42 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:30:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20230601 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283442; x=1774888242; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkR/V7e+x0LZ5vy6oulB2qy/2ayyRS6OQM1v0e6EP4s=;
        b=kQONQ+ql+0NfUwfI+2YTrOyGjlQXtHKYc8N9K1vzadtKjj31evo5OpQgo/JcKqARpG
         aTLm5GjYzAfJEdmth0czFIWoZhUMBZJTneElC16iC8lDkZVhDtreBCEDpMc9eOaMg9Pz
         LZhL4Eoosw/A3PA9HO3k0aSvbBpY2X1oE0fz6T+7i+flL7YRaYYeN7AlK0hhHOwFjntb
         GlhuR7AfZSKkDbZ9VINyQeG7LJAb9H0nRRMLrYaZvkBVk0f6ByoexsqyKB5U8CRPArMx
         D9skUlQHGMDFDlIPS27u4gO6m0zagHUhaFZt3+UH+As5siZ8bKc9+T6S8t9hFCIzAdl5
         LIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283442; x=1774888242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkR/V7e+x0LZ5vy6oulB2qy/2ayyRS6OQM1v0e6EP4s=;
        b=r91PBURODfBE1HyXiNLoPXeYMfBHjh2MU22cFmNqRp6Kc7T6oyyb/nt56wJ2jmCFOp
         tPmg7aVOxjZqdP+Ipcz8xm4PW7PqEPg9EDC50GxbkUnbKb73Z5UMvcVMofce2Rg8Tjax
         4A5KynHEAOWWhZ5qPGdIscSfPMHFiEq46+pvWC+Pv35Ldi1HsXCGAk09BYMHQFBGUwJ0
         zN9Wb7tVJgQphCMdU8qShUP7D3Y5KFuqpEALgjbErR/KVzaRDG1FIkxa084UPD+coYeO
         O4z6Hl73TA49cLQg0K2PCaFsXZmZhFfCrKPDpg2tTNw8GZhFubjv5LFra6wJZHlx9QhD
         Qg3w==
X-Gm-Message-State: AOJu0YxmW4+mRYVDNDiWVxXFbUnxshCJGDfKWtJ0Ujz06dIWdODQdQbz
	CozV8AolfFgg7fPSeHSqjFFqwGZp1Q4Z4VqDYMpta4CbRHcMjUhmYFA9FfHROw==
X-Gm-Gg: ATEYQzzhgJzFrESC5Z5PZI9JHjEVPCYkY/iGCpGBLJUjV/x//4Kf+KN2sezilUsdJ9D
	Dn/rN1c1PY+czW98GDLsC8dTOzf9o2BE6OmE85GLmGLuHuq8uA2ooAQWO7swz0sUR79WnZFmv3d
	Zsk6VRBWQ0720Yg8uUrJMIOav2SZ7QApgrgwkuYu4yKz8jeIzdoqx2MhSDuZ6D6znd0LjAGJUQ4
	MGMwBzjfp7cDcjrPkNePXBasrzPsq1x4ScXA0V/JS5EUuypdSJr7skEI8+viLdrIUZ9UYsJwx8/
	AcLP6ewFKwtoCOysxld8Eqp7sUCAPeEnPaOOpfUkGuXAh+OOSe3FQcSiXUgDPCtKBKJ9tcxMC7q
	1ZL4BJaWyiyd138aGe0HCHSE5rAnUMJGzEpwZSGUqJOAWt3IlES/l3u4hasxuQ1f2d9z6jrC/In
	icyH/qlKvYCA6ERdbtz14g492IZECGncv7hObBXymcIenPzK9Lhr9wn8NMAApAx/ya9bB8h8XCY
	XnE
X-Received: by 2002:a17:906:37cb:b0:b93:5e04:a74b with SMTP id a640c23a62f3a-b982f39a063mr658768666b.31.1774283441888;
        Mon, 23 Mar 2026 09:30:41 -0700 (PDT)
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
Subject: [PATCH v2 03/11] xen/riscv: implement copy_to_guest_phys()
Date: Mon, 23 Mar 2026 17:29:44 +0100
Message-ID: <062e50c596b9271858d2d63e101bfde5311a3817.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774283442-23082488-FF239CAA/0/0
X-purgate-type: clean
X-purgate-size: 6033
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 12C832F836D
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
index 6b3f3ed90bdb..6d3c822409b8 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -4,6 +4,7 @@ obj-y += domain.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
 obj-$(CONFIG_HAS_EX_TABLE) += extables.o
+obj-y += guestcopy.o
 obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
new file mode 100644
index 000000000000..d774a90bff92
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
+static unsigned int copy_guest(void *buf, uint64_t addr, unsigned int len,
+                               copy_info_t info, unsigned int flags)
+{
+    unsigned int offset = PAGE_OFFSET(addr);
+
+    BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t));
+    BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t));
+
+    while ( len )
+    {
+        void *p;
+        unsigned int size = min(len, (unsigned int)PAGE_SIZE - offset);
+        struct page_info *page;
+
+        page = translate_get_page(info, addr, flags & COPY_gva,
+                                  flags & COPY_to_guest);
+        if ( page == NULL )
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
+        unmap_domain_page(p - offset);
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
+unsigned int copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
+                                unsigned int len)
+{
+    return copy_guest(buf, gpa, len, GPA_INFO(d),
+                      COPY_to_guest | COPY_gpa);
+}
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index 3f4c68e4da20..f0a42745330e 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -2,6 +2,10 @@
 #ifndef ASM__RISCV__GUEST_ACCESS_H
 #define ASM__RISCV__GUEST_ACCESS_H
 
+#include <xen/types.h>
+
+struct domain;
+
 unsigned int raw_copy_to_guest(void *to, const void *from, unsigned len);
 unsigned int raw_copy_from_guest(void *to, const void *from, unsigned len);
 unsigned int raw_clear_guest(void *to, unsigned int len);
@@ -18,6 +22,9 @@ unsigned int raw_clear_guest(void *to, unsigned int len);
 #define guest_handle_okay(hnd, nr) (1)
 #define guest_handle_subrange_okay(hnd, first, last) (1)
 
+unsigned int copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
+                                unsigned int len);
+
 #endif /* ASM__RISCV__GUEST_ACCESS_H */
 /*
  * Local variables:
-- 
2.53.0


