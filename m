Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLimMmxU/GmKOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A3F4E55E7
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302336.1576334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZf-0003id-Sw; Thu, 07 May 2026 08:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302336.1576334; Thu, 07 May 2026 08:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZf-0003fe-MN; Thu, 07 May 2026 08:59:15 +0000
Received: by outflank-mailman (input) for mailman id 1302336;
 Thu, 07 May 2026 08:59:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZd-0003LL-Gs
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZc-002yCt-Sp
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:12 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc545c-2eae-0a2a0a5409dd-0a2a4508d59a-10
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:12 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5460-63b5-0a2a45080019-d155da2bcd56-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:12 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-bb962ce4dcfso87521966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:12 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778144352; x=1778749152; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGQ7zO8AKfHP1ag+tsRcXVHwApXHfJapq9I/qFco5NE=;
        b=jf/i/+rDqRPS5qI4SAfOdsRF1r5QN2gNCYxHQELqmI2ZZg8Rsb53/D3Ip+UTOCQcS5
         CfXtUDO7e4+FdnWLChhjcjvUbg61o7yLnL4Ba5w9iEUnbVwpuRg8nLhWKoLIodCm+uOq
         mIYjZTdf3SXed18DglZG8pEY8grbL5bYUPw/24lC/4gkTHIJPX8w1WEsRTm/kFoqaY6l
         aFrVKe8AAr4HWj6BvKRNgT0+Iwj6O1/RD43Wf9eXJUI9vC36X5ji2KIXXeUx44K9pQc4
         DyGDPGy0CvpH80EHEdaamqhJ9p/ZMc3JVjVtPFEBEVYrHk3FKH+YBMxLgnUe2yXYG6GW
         LqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144352; x=1778749152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wGQ7zO8AKfHP1ag+tsRcXVHwApXHfJapq9I/qFco5NE=;
        b=LrViiuvETZVScqRUCoTxeUTXhSpdrQ9+rb9pUjFkMFzHodmztqONg7bsfnqymy9Axf
         rS1lAZF+wvxanvk8Li6UGlTc0BNPlErutSLwiMGG/rDnutIvp+3Us4+nJ6TZKH5umrua
         GMV1E+UmJdWUgpuw3UKlWlt+4FkQU+8v7HfXeNck+uUeJysO0VFDxvjLLoL0uMcD5i5W
         k7+NcACX7QmCN2mZjMkry1eQxCFRx+alCjM4bMl9AU6FgMfAXX6Tiy9h1kf0uVdyg/vi
         w+vJl86eTvvnB0oDji8AUb6Kzr14iczts/bMRSSGQd5NHw7NLdZKMyy6FRxwt8uELVJw
         RwZw==
X-Gm-Message-State: AOJu0Yx2ZQ9z6y/Cjcp+BKtsow6ZsbJQLPODVTqOGlH4RJoS4BHss2Rm
	DFzgmn8VkPplDqzq1An2Q0EXJglP++Yqf2yYjPV58LXGk8DjXPvMreqGFcSkHA==
X-Gm-Gg: AeBDievIuMwkYYm2oLehyGfMySXZQwnnWrzjCiPVtJ5XYM4ciebV1toxoS2CX/wzMbf
	Mjtlq7Q0ZWI1FikTEnwSxEVDXwy6d7DzS1LEstmxUMDcb89rAV9n5Y7dtAzCDtkgER4W8qOf4MM
	3smdKmj8bedXTCdUjxsvW3B4dVWQW02Xu6piUlfOym0lTYCpEytZ4lA2VA+c4pSiWeT87ZFUd6e
	4Fcxg9AeXaKYeUjkOgLlkVQQbDbVbUhLao2uuVL5f98lZ9OTXu2LE7kBUVx0dFzYKdsCa1o9Lny
	+gUJVANqN3fH7y5IQYGtg02T8M89JtY6gCTUjYkT2qay0sUnI7yIPx5qj3r9ujPDkdGXUBd+zQR
	TMfvQkoHihpBGxwaDqP7I14sBtTlR+28q8e0vlqAZjGsIiNP7axz1D02AQM8TERitBMdVYG69GK
	tmwJjkFT4x7JOzTS1g5i08xz9XHaxApqrlrEMFcsFytbGIgc3PXIJo8mQeD9Qn6wo8z1VRQacfv
	NJt
X-Received: by 2002:a17:907:1ca8:b0:bc3:783f:1da9 with SMTP id a640c23a62f3a-bc56d13123amr367776966b.33.1778144351614;
        Thu, 07 May 2026 01:59:11 -0700 (PDT)
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
Subject: [PATCH v5 06/11] xen/riscv: implement copy_to_guest_phys()
Date: Thu,  7 May 2026 10:58:45 +0200
Message-ID: <90ff94daad0c3910b1398a7bd956f0d0bd6a2041.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778140240.git.oleksii.kurochko@gmail.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1778144352-B7D7BDB1-F2C646D4/10/73395122804
X-purgate-type: spam
X-purgate-size: 6574
X-Rspamd-Queue-Id: 84A3F4E55E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
X-Rspamd-Action: no action

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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Nothing changed. Only rebase.
---
Changes in v4:
 - Avoid using of min_t. (sync with Arm)
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
index 000000000000..8a89212e0bea
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
+        unsigned long size = min(len, PAGE_SIZE + 0UL - offset);
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
2.54.0


