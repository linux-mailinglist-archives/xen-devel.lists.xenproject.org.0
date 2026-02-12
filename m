Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NsDEwv+jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD412F4FA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229475.1535436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRR-0006PZ-Io; Thu, 12 Feb 2026 16:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229475.1535436; Thu, 12 Feb 2026 16:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRR-0006Ku-CE; Thu, 12 Feb 2026 16:21:21 +0000
Received: by outflank-mailman (input) for mailman id 1229475;
 Thu, 12 Feb 2026 16:21:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqZRQ-0006Fi-Kf
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:21:20 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc8a1bbe-082e-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 17:21:18 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so32425e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 08:21:18 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e5c635sm13938426f8f.37.2026.02.12.08.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 08:21:17 -0800 (PST)
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
X-Inumbo-ID: dc8a1bbe-082e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770913278; x=1771518078; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PELzgBrkYoFU28QGxSaV7T34+uk+b3op31q7VDuVJfM=;
        b=N4TqEt1QE/B8pYIP+hQ+7eFD2X+6KEctSsdPp4P8HWs9uKANviylSh3QnWZDkBUFfm
         afd2WRuCFtrCcqsvvB2n6tE7PbKWuTjxWnk6EnfKWQIMlY/5OpAUIAnU+FydfGCZWGII
         hmN3fHWqWey4cvex2Wubsea/fog+ol6bNGaIk/PfgEYfhbiFrbONdMOZ1D4PJ8ICv14Y
         lOyK1a8ifrEZu3ZDqwmlDZAgP5a9ewIptJSKBaroFAvji2j4Kv5YdwPcHpePJxYRXlWT
         wUtK7r3JQfHw/30+9WdeT7E9adgXS+UZrAoa6GtaAWs6M6/5aHM7E9XIOQe2klKfe8/d
         PSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770913278; x=1771518078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PELzgBrkYoFU28QGxSaV7T34+uk+b3op31q7VDuVJfM=;
        b=CIGbO3TRJmSlurtGHefyM8a5rdM2TGgbN3taVDDm/LQjfq59k/fDJmVzljtikWfXRu
         8CuChyWVZudA+MJ7ETjWKndhnHkIHWtGxEoF2p+AJrShLrm/uF2Z2uzNHe6nH87Hp2xV
         0oJo14A4t6WreIIFBghGa9W1SclSeDeLD0MWetY/eHQ0KLlditiskUzAItOeB7eIv0lL
         HK2V9cPYl5awAWcjSpMa02NMTbMrt4wTQJm7H1NEGqGz//Y+NNiA3CJftj7zG3I16GyD
         GV1f93GvMLB+bZl7V+8w65Zv7Z0ED0TDhzwAWXE7cSIvZfDuT29q2gnSGsiqmYuzRvx0
         IUVQ==
X-Gm-Message-State: AOJu0Yya6P0ZF14serfLv2+UOZlz56avLDldAV4mKd7ipseQynNmo6qt
	k2LJrj6G/0tQsYvcb5pHZLhAfeoykiXw130GjZ7wr6FrWkVsFlsqovODcH/oOfqZ
X-Gm-Gg: AZuq6aJ7ueKKyTx+ng3EdeawZgbtqANs6uC3sw0z9+QMNe+q3Hlacau/GKpwjPEbrBz
	1kgKHtThonjWnftSNy2gVsh/ISvJgpAmIX0PMyoskjj7/QgJYNtTki/E2Dn251nNcAfJ+gZN8tb
	mGjk69m2KTLw/dXWeu/qTgtvtaSuBgmcPEhPRRl1k+xQE901loBl+ZflMcVTQsZLLbfJUoGA0X0
	8I+BzskUO40f4QbFzYQ59RDUn55cGLFpjqqljSCLuBygAiUJOKVio6uxJhX2059c8J81t5JW9Vu
	GIXC/+ZtPMTOd+sSZGQyCPzHY/kNDeDmA9X3kgfLN/iBCLYiDNqiV2lwxAnB990OHIxeRUbZt0d
	8Qq3aq0ntPduqNc3jMmPBZbIlGXdnucIBAjmGbi9xQvlC5gdDct2s7dJEHnJ6YurM9+e+0xkJtc
	g5cOyPrKkeWBQ93K8+c+94NGtRq+umuMJRYjY7gTqE3qG1boYD5plPCG1fAWE057bDtA==
X-Received: by 2002:a05:600c:6285:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-4836715979emr46166525e9.17.1770913277874;
        Thu, 12 Feb 2026 08:21:17 -0800 (PST)
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
Subject: [PATCH v1 2/6] xen/riscv: implement copy_to_guest_phys()
Date: Thu, 12 Feb 2026 17:21:03 +0100
Message-ID: <cb50d76c627cb666317b23ae136ca43bfbfd04c5.1770821989.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770821989.git.oleksii.kurochko@gmail.com>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 01DD412F4FA
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
---
 xen/arch/riscv/Makefile                   |   1 +
 xen/arch/riscv/guestcopy.c                | 112 ++++++++++++++++++++++
 xen/arch/riscv/include/asm/guest_access.h |   7 ++
 3 files changed, 120 insertions(+)
 create mode 100644 xen/arch/riscv/guestcopy.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 7439d029cc45..90210799e038 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -3,6 +3,7 @@ obj-y += cpufeature.o
 obj-y += domain.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
+obj-y += guestcopy.o
 obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
new file mode 100644
index 000000000000..19b681c30b1b
--- /dev/null
+++ b/xen/arch/riscv/guestcopy.c
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/domain_page.h>
+#include <xen/page-size.h>
+#include <xen/sched.h>
+#include <xen/string.h>
+
+#include <asm/guest_access.h>
+
+#define COPY_from_guest     (0U << 0)
+#define COPY_to_guest       (1U << 0)
+#define COPY_ipa            (0U << 1)
+#define COPY_linear         (1U << 1)
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
+                                            bool linear, bool write)
+{
+    p2m_type_t p2mt;
+    struct page_info *page;
+
+    if ( linear )
+        BUG_ON("unimplemeted\n");
+
+    page = get_page_from_gfn(info.gpa.d, paddr_to_pfn(addr), &p2mt, P2M_ALLOC);
+
+    if ( !page )
+        return NULL;
+
+    if ( !p2m_is_ram(p2mt) )
+    {
+        put_page(page);
+        return NULL;
+    }
+
+    return page;
+}
+
+static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
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
+        unsigned int size = min(len, (unsigned int)PAGE_SIZE - offset);
+        struct page_info *page;
+
+        page = translate_get_page(info, addr, flags & COPY_linear,
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
+unsigned long copy_to_guest_phys(struct domain *d,
+                                 paddr_t gpa,
+                                 void *buf,
+                                 unsigned int len)
+{
+    return copy_guest(buf, gpa, len, GPA_INFO(d),
+                      COPY_to_guest | COPY_ipa);
+}
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index 7cd51fbbdead..024e29b4c9f9 100644
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
+                                 unsigned int len);
+
 #endif /* ASM__RISCV__GUEST_ACCESS_H */
 /*
  * Local variables:
-- 
2.52.0


