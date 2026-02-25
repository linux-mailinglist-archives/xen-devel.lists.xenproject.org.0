Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIv8JlvgnmmCXgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:43:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D09196C1D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240607.1541927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDIR-00029C-0j; Wed, 25 Feb 2026 11:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240607.1541927; Wed, 25 Feb 2026 11:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDIQ-00026n-U9; Wed, 25 Feb 2026 11:43:14 +0000
Received: by outflank-mailman (input) for mailman id 1240607;
 Wed, 25 Feb 2026 11:43:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvDIO-00026d-JT
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 11:43:12 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25231154-123f-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 12:43:04 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso57168005e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 03:43:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfbb465bsm24281275e9.3.2026.02.25.03.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:43:03 -0800 (PST)
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
X-Inumbo-ID: 25231154-123f-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772019783; x=1772624583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d/bYJNCMrXcDk4+lvsUiKd0KIHHaZPQTZxJdb8c+n/Q=;
        b=NSbhNsX3J5ohKHVscD9xBCQ81R++IoQGCW4xoZxRKolGXuJcL9eJBTexw0urhlUYk3
         k3nO5OZtQcyKksLN86YfMiLcVchxgdRMW1WsBckg11qmqfki4Mt1u3sEZfDPcrz4cX/w
         5TFMhjGUlvO3DWLtvihnxyayeCNOCBhT82r8fQbUXT0kVTYvGTVC2/JMUB8+48tyvjXw
         3+YTykAF414oDgTRmdsOc2zGovI5R38GvzBAwpbuyCTyeyArN5TgAhepCJGl8ds54Ueg
         zPk1mnuY4XZGV/0CgW2X/n4MqdoKVh3Xt2OultZvf+CAQaRV4hTHRmGPVHFgF9bDsahw
         YpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019783; x=1772624583;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/bYJNCMrXcDk4+lvsUiKd0KIHHaZPQTZxJdb8c+n/Q=;
        b=SV6ary24wX3Qzb3VnX70RGhZjVW5qaJ6B7/yB1CxSzOxC+jADLakL3zBE5kG0ugmOZ
         hXoClCOAbYXYRvoJlTzdMNdeg/q62MhGckMMNhMXP4Z9X/uvuWO3V/30gSv9SVcgNhLD
         tS6HueWcWYsynEFj9/BLPg0vVgrxeD+EZ5hT5vo10q8jVhepdfS2R2RLTKVVlhgpgqU3
         8VnlTJTbUsTvKPoikvksOAz5NfZgDeg+s6n8y6HlGqXaqr8xjVP3ind14PQlXIVl0Sz2
         DvEusG6LZ8UbxqFzyEliIU5NaWkDQijBHAn8vk9rkEExOU6s6kmdKVmUPOgoLAbmki1y
         g2BA==
X-Gm-Message-State: AOJu0YxB5ZSOF1wqBo8ZKwm9FBmVRb3c8mSBKSX+4ljya2CLZYZnkGDw
	yKlXbtkCuueT8fLnfACsgvu7qWI5x7y5QmUyRnWWZaC4jwdaCfPJNWtFPChnSEzFOzFHqui0sTu
	iV+M=
X-Gm-Gg: ATEYQzwpp/y0dMBYHzo0ZyKz/yML7h/Vm9OHwa++sQ9vM65v4xvi4F2SZj9cy4XP8SM
	8xJEpRtXkihdsj+EjKSAhHRxp0A944yFf5fZ6tgyn5C/wSLdGuPzbNdIvdFeTD4hCRL5ueR81v9
	mQzXIDh7pSR3yRsVPoFkMgYM6CZm2Mi8iZigay+0j8OgTESBmoGR4RW7UGt7VB7+IA57gQpcpnd
	Hu7A/pkgwPSA7Kc5GbuOPG5Cc8dyshKrRMnAfoOCCvLJRp6Ifu26wzjWLfxL56LYiPRWJMW0Zgl
	Y0akFVNcyKVGN+cDo3nEBuJ0yrWndB3Ou81bXg0gD6zt+kusrYD8vOWHgs91DsektQ6JzqbzMhG
	iL42PIN12k7klKOmDd9fW18nO55FQ57mQxWbs9bbdsQXLan2UseWY7ysxiux1EzF9OS4eb0+0lV
	WSuwPg3dfVlNw+NIo4w1+UrkbhziEQ4YnQ1TlDe1QdWHI3DbKE7U7tiUSUJAJLITALR+MzhbYya
	qucGxCFfedvEg0=
X-Received: by 2002:a05:600c:4751:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-483a963df99mr242185875e9.34.1772019783358;
        Wed, 25 Feb 2026 03:43:03 -0800 (PST)
Message-ID: <f3673515-5922-4748-a964-d4c391e937f5@suse.com>
Date: Wed, 25 Feb 2026 12:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 1/5] vPCI: introduce private header
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
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
In-Reply-To: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 09D09196C1D
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
v5: Add new generated header to test harness clean rule and to .gitignore.
    Also move vpci_init_header().
v4: New.

--- a/.gitignore
+++ b/.gitignore
@@ -154,6 +154,7 @@ tools/tests/x86_emulator/test_x86_emulat
 tools/tests/x86_emulator/x86_emulate
 tools/tests/x86_emulator/xop*.[ch]
 tools/tests/vpci/list.h
+tools/tests/vpci/private.h
 tools/tests/vpci/vpci.[hc]
 tools/tests/vpci/test_vpci
 tools/xcutils/lsevtchn
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -14,12 +14,12 @@ else
 	$(warning HOSTCC != CC, will not run test)
 endif
 
-$(TARGET): vpci.c vpci.h list.h main.c emul.h
-	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
+$(TARGET): vpci.c vpci.h list.h private.h main.c emul.h
+	$(CC) $(CFLAGS_xeninclude) -include emul.h -g -o $@ vpci.c main.c
 
 .PHONY: clean
 clean:
-	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h
+	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h private.h
 
 .PHONY: distclean
 distclean: clean
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
@@ -0,0 +1,126 @@
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
+int __must_check vpci_init_header(struct pci_dev *pdev);
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
 
@@ -30,66 +19,17 @@ typedef struct {
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
-int __must_check vpci_init_header(struct pci_dev *pdev);
-
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
 
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
@@ -213,9 +153,6 @@ struct vpci_vcpu {
 #ifdef __XEN__
 void vpci_dump_msi(void);
 
-/* Make sure there's a hole in the p2m for the MSIX mmio areas. */
-int vpci_make_msix_hole(const struct pci_dev *pdev);
-
 /* Arch-specific vPCI MSI helpers. */
 void vpci_msi_arch_mask(struct vpci_msi *msi, const struct pci_dev *pdev,
                         unsigned int entry, bool mask);
@@ -238,48 +175,6 @@ int __must_check vpci_msix_arch_disable_
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


