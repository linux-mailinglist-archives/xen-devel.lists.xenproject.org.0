Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDuwHk8Oi2lXPQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:54:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C323B119DC7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226242.1532779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplNT-0005KV-R0; Tue, 10 Feb 2026 10:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226242.1532779; Tue, 10 Feb 2026 10:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplNT-0005I8-O0; Tue, 10 Feb 2026 10:53:55 +0000
Received: by outflank-mailman (input) for mailman id 1226242;
 Tue, 10 Feb 2026 10:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vplNS-0004jf-Ax
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 10:53:54 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9f9ac04-066e-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 11:53:53 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-482f2599980so7818395e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 02:53:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629754c62sm30715414f8f.38.2026.02.10.02.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 02:53:52 -0800 (PST)
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
X-Inumbo-ID: c9f9ac04-066e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770720832; x=1771325632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UqWY/OHj/E7vo6rEZ7e1xZN5PDQeyG/GwojCyOGrDlE=;
        b=QAeSFrOGJd1kWJpj7JYvhOu7M5OEaeiVZu+wx8Xj/D/4DhbBbRBECUdROlb8AbcZTz
         7Xsop8CUU2WqCzQV4B0z58N0k//WW1TrDbbYgxOa6B5xZ5RbzkaT1LPKaKVUDeRflf1O
         xKEWe4Q1J5UwkjM6l0teDY55kkiFr3YVfRLbJ0fqfbjSM5eWTBAogkF3egmNCkpbalxL
         BdI8tCss4WykSvz+h6r6lzuSMommUvSrEczv9W9SHnziJnO79W9hmBGcmLEQRDEEApJH
         FSzE8gGE7UtrGK8tVz23SeUON5MzJN/fqcYc9QwuzdhDAuKxGZl8ulFvqvULDKMCIlbQ
         PnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720832; x=1771325632;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqWY/OHj/E7vo6rEZ7e1xZN5PDQeyG/GwojCyOGrDlE=;
        b=w81RlMG5S2neZTxFbwl05nfRUUhhVmYFsb6Hz9lnvtvY0hKi0SYLFkb2cB8XM5nxtB
         pGuIRVWOdli5SexV57oGVCJUcv6wMcHDI7rTIBv3r/uvQnAkyZu59DcDHTCICO2VnGVK
         DIZmNSkaeJIJr+A4Kov3NVkf+u8s4hK9MXLXo5ALCYHwVyg2hJi6PtVD4FItmVLRF2C0
         z8vVfZH5lQvD9vIGxIsTk8jf6Fy51k63E7fj0wBH6ORb0nE3vQSP9tc4XtItO2hZBxdL
         PiOVNNNOdrc6Ud9lkOsAcoSZAMP3GcVDq+Z+fzl7YQjjpcmkvsyI6Z5p7cpl4GHtqJ/E
         jBIg==
X-Gm-Message-State: AOJu0YwJDUBcTj+c7hojf1NqVl3+fxu5j54kTHlJgjA+WUBAMJzwKGmf
	PrbuCY8f2ZxMriWBK3eidCPjq9CPeVlnuMJz/3xnFnXLgNcvTO2AJl1T0A/w6X3iHUpSwtf+U/b
	Z3gY=
X-Gm-Gg: AZuq6aL1q04fjIvG17wcJCbqpaAlOOBY/uoXXIj338sx0XjuNsm5jVvAdATIzp3gaE0
	vDDCih3mQhjT5ZTs49J5ZXKJVXrpbchbn/e2hmt687JJfBcoIN5TbfR5e+FF/0Jpn79Qov6JavI
	r94LDZYrhDHeDTqu6agemPVwzfkpWKh0t1kpUbwUfIpIObpip/0+RI7oZLngn2H5aIpx44ouiZc
	5r2Qcgnyc6jbu9sbd2Lgw4OjvF4jLukffRCnnMkdnMLWv7m+3CPnm0FzIrdmxtyAxfyHRQ6QghS
	J+NXJyEa8cIV7rC5s7JEmiurm5iSUBNnE2br7JWkkATxXkmjbmaUGn5WFkP6jR1W4HK56jLQyMF
	2jnm4mcQYqcV10kfoJEeR5x3XdOX0baBBylJ9SQOL6hQeYLWIJYIY1mFrpieajXNQCWQgKoeo68
	/u1I0NjAgxPmoyRBwBbCn16g1c3Y74nKcq3fHBSDgl81T2QYf0MGWxpIk94wXtMnKAJ74MujFpn
	Bw2AsdeZBpFhSQFu1TQtvuf2A==
X-Received: by 2002:a05:600c:19c7:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-483201dd0afmr188048785e9.5.1770720832284;
        Tue, 10 Feb 2026 02:53:52 -0800 (PST)
Message-ID: <4fda7acb-e1a4-4a24-982e-4cae90048018@suse.com>
Date: Tue, 10 Feb 2026 11:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/5] vPCI: introduce private header
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,gnu.org:url];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C323B119DC7
X-Rspamd-Action: no action

Before adding more private stuff to xen/vpci.h, split it up. In order to
be able to include the private header first in a CU, the per-arch struct
decls also need to move (to new asm/vpci.h files).

While adjusting the test harness'es Makefile, also switch the pre-existing
header symlink-ing rule to a pattern one.

Apart from in the test harness code, things only move; no functional
change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Subsequently, at least on x86 more stuff may want moving into asm/vpci.h.
---
v4: New.

--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -14,8 +14,8 @@ else
 	$(warning HOSTCC != CC, will not run test)
 endif
 
-$(TARGET): vpci.c vpci.h list.h main.c emul.h
-	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
+$(TARGET): vpci.c vpci.h list.h private.h main.c emul.h
+	$(CC) $(CFLAGS_xeninclude) -include emul.h -g -o $@ vpci.c main.c
 
 .PHONY: clean
 clean:
@@ -34,10 +34,10 @@ uninstall:
 	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
 
 vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
-	# Remove includes and add the test harness header
-	sed -e '/#include/d' -e '1s/^/#include "emul.h"/' <$< >$@
+	sed -e '/#include/d' <$< >$@
+
+private.h: %.h: $(XEN_ROOT)/xen/drivers/vpci/%.h
+	sed -e '/#include/d' <$< >$@
 
-list.h: $(XEN_ROOT)/xen/include/xen/list.h
-vpci.h: $(XEN_ROOT)/xen/include/xen/vpci.h
-list.h vpci.h:
+list.h vpci.h: %.h: $(XEN_ROOT)/xen/include/xen/%.h
 	sed -e '/#include/d' <$< >$@
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -86,6 +86,7 @@ typedef union {
 
 #define CONFIG_HAS_VPCI
 #include "vpci.h"
+#include "private.h"
 
 #define __hwdom_init
 
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -31,14 +31,6 @@ struct arch_pci_dev {
     struct device dev;
 };
 
-/* Arch-specific MSI data for vPCI. */
-struct vpci_arch_msi {
-};
-
-/* Arch-specific MSI-X entry data for vPCI. */
-struct vpci_arch_msix_entry {
-};
-
 /*
  * Because of the header cross-dependencies, e.g. we need both
  * struct pci_dev and struct arch_pci_dev at the same time, this cannot be
--- /dev/null
+++ b/xen/arch/arm/include/asm/vpci.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef ARM_VPCI_H
+#define ARM_VPCI_H
+
+/* Arch-specific MSI data for vPCI. */
+struct vpci_arch_msi {
+};
+
+/* Arch-specific MSI-X entry data for vPCI. */
+struct vpci_arch_msix_entry {
+};
+
+#endif /* ARM_VPCI_H */
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -97,17 +97,6 @@ void msixtbl_init(struct domain *d);
 static inline void msixtbl_init(struct domain *d) {}
 #endif
 
-/* Arch-specific MSI data for vPCI. */
-struct vpci_arch_msi {
-    int pirq;
-    bool bound;
-};
-
-/* Arch-specific MSI-X entry data for vPCI. */
-struct vpci_arch_msix_entry {
-    int pirq;
-};
-
 void stdvga_init(struct domain *d);
 
 extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
--- /dev/null
+++ b/xen/arch/x86/include/asm/vpci.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef X86_VPCI_H
+#define X86_VPCI_H
+
+#include <xen/stdbool.h>
+
+/* Arch-specific MSI data for vPCI. */
+struct vpci_arch_msi {
+    int pirq;
+    bool bound;
+};
+
+/* Arch-specific MSI-X entry data for vPCI. */
+struct vpci_arch_msix_entry {
+    int pirq;
+};
+
+#endif /* X86_VPCI_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -17,11 +17,12 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "private.h"
+
 #include <xen/iocap.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
-#include <xen/vpci.h>
 
 #include <xsm/xsm.h>
 
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -16,9 +16,10 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "private.h"
+
 #include <xen/sched.h>
 #include <xen/softirq.h>
-#include <xen/vpci.h>
 
 #include <asm/msi.h>
 
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -17,10 +17,11 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "private.h"
+
 #include <xen/io.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
-#include <xen/vpci.h>
 
 #include <asm/msi.h>
 #include <asm/p2m.h>
--- /dev/null
+++ b/xen/drivers/vpci/private.h
@@ -0,0 +1,124 @@
+#ifndef VPCI_PRIVATE_H
+#define VPCI_PRIVATE_H
+
+#include <xen/vpci.h>
+
+typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
+                             void *data);
+
+typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
+                          uint32_t val, void *data);
+
+typedef struct {
+    unsigned int id;
+    bool is_ext;
+    int (* init)(struct pci_dev *pdev);
+    int (* cleanup)(const struct pci_dev *pdev, bool hide);
+} vpci_capability_t;
+
+#define REGISTER_VPCI_CAPABILITY(cap, name, finit, fclean, ext) \
+    static const vpci_capability_t name##_entry \
+        __used_section(".data.rel.ro.vpci") = { \
+        .id = (cap), \
+        .init = (finit), \
+        .cleanup = (fclean), \
+        .is_ext = (ext), \
+    }
+
+#define REGISTER_VPCI_CAP(name, finit, fclean) \
+    REGISTER_VPCI_CAPABILITY(PCI_CAP_ID_##name, name, finit, fclean, false)
+#define REGISTER_VPCI_EXTCAP(name, finit, fclean) \
+    REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
+
+/* Add/remove a register handler. */
+int __must_check vpci_add_register_mask(struct vpci *vpci,
+                                        vpci_read_t *read_handler,
+                                        vpci_write_t *write_handler,
+                                        unsigned int offset, unsigned int size,
+                                        void *data, uint32_t ro_mask,
+                                        uint32_t rw1c_mask, uint32_t rsvdp_mask,
+                                        uint32_t rsvdz_mask);
+int __must_check vpci_add_register(struct vpci *vpci,
+                                   vpci_read_t *read_handler,
+                                   vpci_write_t *write_handler,
+                                   unsigned int offset, unsigned int size,
+                                   void *data);
+
+int vpci_remove_registers(struct vpci *vpci, unsigned int start,
+                          unsigned int size);
+
+/* Helper to return the value passed in data. */
+uint32_t cf_check vpci_read_val(
+    const struct pci_dev *pdev, unsigned int reg, void *data);
+
+/* Passthrough handlers. */
+uint32_t cf_check vpci_hw_read8(
+    const struct pci_dev *pdev, unsigned int reg, void *data);
+uint32_t cf_check vpci_hw_read16(
+    const struct pci_dev *pdev, unsigned int reg, void *data);
+uint32_t cf_check vpci_hw_read32(
+    const struct pci_dev *pdev, unsigned int reg, void *data);
+void cf_check vpci_hw_write8(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
+void cf_check vpci_hw_write16(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
+
+#ifdef __XEN__
+/* Make sure there's a hole in the p2m for the MSIX mmio areas. */
+int vpci_make_msix_hole(const struct pci_dev *pdev);
+
+/*
+ * Helper functions to fetch MSIX related data. They are used by both the
+ * emulated MSIX code and the BAR handlers.
+ */
+static inline paddr_t vmsix_table_host_base(const struct vpci *vpci,
+                                            unsigned int nr)
+{
+    return vpci->header.bars[vpci->msix->tables[nr] & PCI_MSIX_BIRMASK].addr;
+}
+
+static inline paddr_t vmsix_table_host_addr(const struct vpci *vpci,
+                                            unsigned int nr)
+{
+    return vmsix_table_host_base(vpci, nr) +
+           (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
+}
+
+static inline paddr_t vmsix_table_base(const struct vpci *vpci, unsigned int nr)
+{
+    return vpci->header.bars[vpci->msix->tables[nr] &
+                             PCI_MSIX_BIRMASK].guest_addr;
+}
+
+static inline paddr_t vmsix_table_addr(const struct vpci *vpci, unsigned int nr)
+{
+    return vmsix_table_base(vpci, nr) +
+           (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
+}
+
+/*
+ * Note regarding the size calculation of the PBA: the spec mentions "The last
+ * QWORD will not necessarily be fully populated", so it implies that the PBA
+ * size is 64-bit aligned.
+ */
+static inline size_t vmsix_table_size(const struct vpci *vpci, unsigned int nr)
+{
+    return
+        (nr == VPCI_MSIX_TABLE) ? vpci->msix->max_entries * PCI_MSIX_ENTRY_SIZE
+                                : ROUNDUP(DIV_ROUND_UP(vpci->msix->max_entries,
+                                                       8), 8);
+}
+
+#endif /* __XEN__ */
+
+#endif /* VPCI_PRIVATE_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -5,8 +5,9 @@
  * Author: Jiqian Chen <Jiqian.Chen@amd.com>
  */
 
+#include "private.h"
+
 #include <xen/sched.h>
-#include <xen/vpci.h>
 
 static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
                                       unsigned int reg,
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -17,8 +17,9 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "private.h"
+
 #include <xen/sched.h>
-#include <xen/vpci.h>
 #include <xen/vmap.h>
 
 /* Internal struct to store the emulated PCI registers. */
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -7,18 +7,7 @@
 #include <xen/types.h>
 #include <xen/list.h>
 
-typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
-                             void *data);
-
-typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
-                          uint32_t val, void *data);
-
-typedef struct {
-    unsigned int id;
-    bool is_ext;
-    int (* init)(struct pci_dev *pdev);
-    int (* cleanup)(const struct pci_dev *pdev, bool hide);
-} vpci_capability_t;
+#include <asm/vpci.h>
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
@@ -30,20 +19,6 @@ typedef struct {
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
-#define REGISTER_VPCI_CAPABILITY(cap, name, finit, fclean, ext) \
-    static const vpci_capability_t name##_entry \
-        __used_section(".data.rel.ro.vpci") = { \
-        .id = (cap), \
-        .init = (finit), \
-        .cleanup = (fclean), \
-        .is_ext = (ext), \
-    }
-
-#define REGISTER_VPCI_CAP(name, finit, fclean) \
-    REGISTER_VPCI_CAPABILITY(PCI_CAP_ID_##name, name, finit, fclean, false)
-#define REGISTER_VPCI_EXTCAP(name, finit, fclean) \
-    REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
-
 int __must_check vpci_init_header(struct pci_dev *pdev);
 
 /* Assign vPCI to device by adding handlers. */
@@ -52,44 +27,11 @@ int __must_check vpci_assign_device(stru
 /* Remove all handlers and free vpci related structures. */
 void vpci_deassign_device(struct pci_dev *pdev);
 
-/* Add/remove a register handler. */
-int __must_check vpci_add_register_mask(struct vpci *vpci,
-                                        vpci_read_t *read_handler,
-                                        vpci_write_t *write_handler,
-                                        unsigned int offset, unsigned int size,
-                                        void *data, uint32_t ro_mask,
-                                        uint32_t rw1c_mask, uint32_t rsvdp_mask,
-                                        uint32_t rsvdz_mask);
-int __must_check vpci_add_register(struct vpci *vpci,
-                                   vpci_read_t *read_handler,
-                                   vpci_write_t *write_handler,
-                                   unsigned int offset, unsigned int size,
-                                   void *data);
-
-int vpci_remove_registers(struct vpci *vpci, unsigned int start,
-                          unsigned int size);
-
 /* Generic read/write handlers for the PCI config space. */
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
 void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data);
 
-/* Helper to return the value passed in data. */
-uint32_t cf_check vpci_read_val(
-    const struct pci_dev *pdev, unsigned int reg, void *data);
-
-/* Passthrough handlers. */
-uint32_t cf_check vpci_hw_read8(
-    const struct pci_dev *pdev, unsigned int reg, void *data);
-uint32_t cf_check vpci_hw_read16(
-    const struct pci_dev *pdev, unsigned int reg, void *data);
-uint32_t cf_check vpci_hw_read32(
-    const struct pci_dev *pdev, unsigned int reg, void *data);
-void cf_check vpci_hw_write8(
-    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
-void cf_check vpci_hw_write16(
-    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
-
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
  * should not run.
@@ -213,9 +155,6 @@ struct vpci_vcpu {
 #ifdef __XEN__
 void vpci_dump_msi(void);
 
-/* Make sure there's a hole in the p2m for the MSIX mmio areas. */
-int vpci_make_msix_hole(const struct pci_dev *pdev);
-
 /* Arch-specific vPCI MSI helpers. */
 void vpci_msi_arch_mask(struct vpci_msi *msi, const struct pci_dev *pdev,
                         unsigned int entry, bool mask);
@@ -238,48 +177,6 @@ int __must_check vpci_msix_arch_disable_
 void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry);
 int vpci_msix_arch_print(const struct vpci_msix *msix);
 
-/*
- * Helper functions to fetch MSIX related data. They are used by both the
- * emulated MSIX code and the BAR handlers.
- */
-static inline paddr_t vmsix_table_host_base(const struct vpci *vpci,
-                                            unsigned int nr)
-{
-    return vpci->header.bars[vpci->msix->tables[nr] & PCI_MSIX_BIRMASK].addr;
-}
-
-static inline paddr_t vmsix_table_host_addr(const struct vpci *vpci,
-                                            unsigned int nr)
-{
-    return vmsix_table_host_base(vpci, nr) +
-           (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
-}
-
-static inline paddr_t vmsix_table_base(const struct vpci *vpci, unsigned int nr)
-{
-    return vpci->header.bars[vpci->msix->tables[nr] &
-                             PCI_MSIX_BIRMASK].guest_addr;
-}
-
-static inline paddr_t vmsix_table_addr(const struct vpci *vpci, unsigned int nr)
-{
-    return vmsix_table_base(vpci, nr) +
-           (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
-}
-
-/*
- * Note regarding the size calculation of the PBA: the spec mentions "The last
- * QWORD will not necessarily be fully populated", so it implies that the PBA
- * size is 64-bit aligned.
- */
-static inline size_t vmsix_table_size(const struct vpci *vpci, unsigned int nr)
-{
-    return
-        (nr == VPCI_MSIX_TABLE) ? vpci->msix->max_entries * PCI_MSIX_ENTRY_SIZE
-                                : ROUNDUP(DIV_ROUND_UP(vpci->msix->max_entries,
-                                                       8), 8);
-}
-
 static inline unsigned int vmsix_entry_nr(const struct vpci_msix *msix,
                                           const struct vpci_msix_entry *entry)
 {


