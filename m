Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YykoFGvF8GkqYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B064870B2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296336.1572799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVg-0006gh-4a; Tue, 28 Apr 2026 14:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296336.1572799; Tue, 28 Apr 2026 14:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVf-0006dm-Vy; Tue, 28 Apr 2026 14:33:59 +0000
Received: by outflank-mailman (input) for mailman id 1296336;
 Tue, 28 Apr 2026 14:33:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVe-0006KX-3x
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:33:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVd-008e9B-Fy
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:33:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c549-e002-0a2a0a5209dd-0a2a450ab9ca-34
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:57 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c555-56b3-0a2a450a0019-d155802ed89e-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:57 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso88343765e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:33:57 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:33:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777386837; x=1777991637; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0p2rPrjn5OibxQ2M64WVzW16uHfFGsN8U9iQfuox9F0=;
        b=q6v3sotR/hyBodh/pDMvS1DuMVm/Yd1KxIgFhrgnKNAUp6sbkHGym9vcp/6uQxtwqm
         /eBPFrmyVJdrxFedaxIEQMdWr8lKOyCtkGrhyYehP/eZnxO3HPg6tjEJ4JgmmRck5U6E
         hK7pd660ayqk+nBfC0OCL6WvitbBlRWC/2pgr5qB9Z160LjDSIFpGrKjFoSV3mFGZkY3
         5xn2+77UrS29iBW0zs+4ag/JwY8aSrPs6skzJwrAnwVlreyNAWkU4PrxAGlfEFS8dVlh
         xddDTE4SN3n4xxRj1M5Typ70MlNPlQbvzupZvABhDKZKp+k1SN6RgTy4sQzv3IP0vYlK
         noxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386837; x=1777991637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0p2rPrjn5OibxQ2M64WVzW16uHfFGsN8U9iQfuox9F0=;
        b=HzjMas+ZwCR7enQcfC4acpo1yjxUFCkaJ35uca6yzWuw3gMDSKAGNAdUn7PpqBrP9X
         OVXGC+EnYY7TGEK89CU/oofMcoG3HOUp+9OpkNoR8T5r1/cbEnYkAfe2z9iaC0L66q5s
         kzsSkTpmVwoV0FnRB8qyumLItaw085F0CwWk90uA3QBi0mOPIV/yxHgI8Ipno7qjLXU7
         DMaOk2/jLKD8ZvzkoLBFfefnj237dQyBNalwITlyUaECAUQXyL9BW2uTWXbFgMdB77N2
         Gpp+tQF5CJIV7dEl6eWfQLmLbpQW8+YlRIe+1b+jO1K6wv6NqvFoYq1WCOcK6euFJbA8
         TwMA==
X-Gm-Message-State: AOJu0Yza4gdwr/Vy9SfBF7JjaeeNvu+bYvercHhPCJ2KkIUVK8Zfd8Ph
	qdyOGqttnjL8MOeJzP7AJbRJ0OoUr0JA5Kij0pQpGtN9cqECBlG8f3GTxYAPPg==
X-Gm-Gg: AeBDieu2kHbF6Y+3HwMGqNuz16+z4F5238/FsaKIUXKscf45bj+I6clpMQLNlHud3uk
	xzXwp62/Pww/iP65vvK9hcHHo08oX/r1ZvGaYLdkJIeGgH/IpmGHdIHAKWCSq0W03HTkL9g2hZ4
	AqG4Ocw7MQU2ntbI3Eaic7R0QsS4Us2gx/pDX3qMoDDh4EpqmHlnJItRpRCx3/NJR/3HBH+bV51
	/PGNYuaUZw4XH73M6987kLRhxw9Rwn74G6j7D3fXnq32y1pFysFdJw6yHBOC7J9iBET6P/NNvJ5
	gvdvVBhecS9mIenBN/pJZe1HUV2INzcN1lQZP6tLfLm6H+AYqrsnqzUvDb1xwn2DpQzwJH7Bgl9
	e+tM/EleJV68U8Qd/cKjeVJSgVF0374gml4BFyg2D0pJRsNY4MM2nwhvnWYe/PB/2NVNDAvtWUN
	I3zn1aiO4AmnBxXQh7+QYAOh/BBm9+Axk3ysR49mY44LwvTQCoyqU79CYcPT/xPXLtYOh7rXxe3
	389
X-Received: by 2002:a05:600c:1c20:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-48a77b241admr55613805e9.23.1777386836472;
        Tue, 28 Apr 2026 07:33:56 -0700 (PDT)
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
Subject: [PATCH v4 06/11] xen/riscv: implement copy_to_guest_phys()
Date: Tue, 28 Apr 2026 16:33:35 +0200
Message-ID: <a3845dccd5667299cbc0535e0056972e56dff942.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1777386837-467758B7-47A8CE3E/10/73395122804
X-purgate-type: spam
X-purgate-size: 6519
X-Rspamd-Queue-Id: 61B064870B2
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.563];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

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
2.53.0


