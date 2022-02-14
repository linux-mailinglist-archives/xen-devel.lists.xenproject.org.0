Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14604B5122
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271773.466491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb43-0006eL-Gi; Mon, 14 Feb 2022 13:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271773.466491; Mon, 14 Feb 2022 13:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb43-0006WT-7E; Mon, 14 Feb 2022 13:06:47 +0000
Received: by outflank-mailman (input) for mailman id 271773;
 Mon, 14 Feb 2022 13:06:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2Y-0008IH-01
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcf89745-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:11 +0100 (CET)
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
X-Inumbo-ID: bcf89745-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cb4WkVIG42hm90giM2dEHS2eAP2rQxieWFvRijYUUxU=;
  b=FbrFc222LRIEcWeBZM7QgWdF4h0S6ZQVQtuphCeLtlitzZLzfoVVfjHA
   KjbaoxaeReZay+dPj422rQS8o1bEvzKxsR/FEcxfO2BUjjP1o6YTh6cha
   T42i+8bus38bYOGN8UWTsrd5hQ6rMjppIUeyzJ+0Eo63vlBqriLVXMghx
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wvcz5bMK2UNc6Djov4mmUECl6mDnGKEv3tUrl94xvEahsrs/JatFGMdXPJrvx3ZJIxG52eQLWL
 k346EmRYivTwBnIVonTvBAkUgmhtzIjl8qmx6/YaXC9Bd04SXSJYP7X5NLTbuKbddu3QxWO0G0
 ZKIDsqMN0LShsRLQZ1DN7aq4kWmhkQe3wLWZTYNoOTe7ovMOecYEjL5t2lE3krlE8+7C2HStlv
 2XYtdgGErsv1R4kRhxkq0/0vYqNEZe1szKr8V3fsAl3QTt9/aYrFJ9KMO8k4x4UHWVMTdIAzJO
 iQYnyMPtW5KKlSwzull1mLKp
X-SBRS: 5.1
X-MesageID: 64149369
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MBRlNapPvE+CF00xvMzhsXynCJ5eBmIkYhIvgKrLsJaIsI4StFCzt
 garIBnQPfzcYmX2KNxwOY22oxhU6peDy9AwQQo4+H00Qy9Bo5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnY2BUQF3IKHDo+8MAwlzQygjbIFA3aCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZZANWs0MkWojxtnJ0w3Grslg8uS33TDKjBVuQqRjLBuyj2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajk4HtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUr2RmLlLTY7D2SFzgUZW5INY0KsuopEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWBhRqjBNzAJrVkg
 JTjs5LAhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvG0hdBc0b55dImWBj
 KrvVeR5vsE7AZdXRfUvP9LZ5zoCkcAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3aZfUlUUFDbGWj+u+2dd7EG3m5EMTXfjew/G7vMbZSua/MG1+WfLX3507fIlpw/ZcmuvSp
 ynvUU5E0lvvw3bALFzSOHxkbbruW7d5rG46YnNwbQr5hSB7bNb99robers2YaIjqL5pw8lrQ
 qRXYM6HGPlOFGjKomxPcZnnoYV+Xx23ngbSbTG9aT0ycsc4FQzE89PpZCX18ywKAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIUzcn7/lP46Jc0IOC7v/DrC2
 lbEGwocqMnMv5QxrIvDi5ebotr7COB5BEdbQTXWtO7kKSnA82O/6oZcS+LULyvFXWb59aj+N
 +VYy/bwbK8OkFpQ6tcuFr9qyeQ15sf1pq8cxQNhRS2ZY1OuA7JmA3+HwcgQ6fEdmu4H4VO7C
 hCV591XGbSVI8e0QlceKT0sYvmHyfxJyCLZ6u44IRmi6SJ6lFZdvZ6+4/VYZPRhEYZI
IronPort-HdrOrdr: A9a23:MNCOx62XGtYMj2syZTLDUgqjBLAkLtp133Aq2lEZdPRUGvb3qy
 nOpoVj6faaslYssR0b9exofZPwJE80lqQFh7X5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtsp
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149369"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 64/70] x86: Introduce helpers/checks for endbr64 instructions
Date: Mon, 14 Feb 2022 12:51:21 +0000
Message-ID: <20220214125127.17985-65-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... to prevent the optimiser creating unsafe code.  See the code comment for
full details.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Fix include to let the header be standalone
 * Add earlyclobber to asm
v1.1:
 * New
---
 xen/arch/x86/include/asm/endbr.h | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 xen/arch/x86/include/asm/endbr.h

diff --git a/xen/arch/x86/include/asm/endbr.h b/xen/arch/x86/include/asm/endbr.h
new file mode 100644
index 000000000000..6b6f46afaf29
--- /dev/null
+++ b/xen/arch/x86/include/asm/endbr.h
@@ -0,0 +1,53 @@
+/******************************************************************************
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Copyright (c) 2021-2022 Citrix Systems Ltd.
+ */
+#ifndef XEN_ASM_ENDBR_H
+#define XEN_ASM_ENDBR_H
+
+#include <xen/types.h>
+
+/*
+ * In some cases we need to inspect/insert endbr64 instructions.
+ *
+ * The naive way, mem{cmp,cpy}(ptr, "\xf3\x0f\x1e\xfa", 4), optimises unsafely
+ * by placing 0xfa1e0ff3 in an imm32 operand, and marks a legal indirect
+ * branch target as far as the CPU is concerned.
+ *
+ * gen_endbr64() is written deliberately to avoid the problematic operand, and
+ * marked __const__ as it is safe for the optimiser to hoist/merge/etc.
+ */
+static inline uint32_t __attribute_const__ gen_endbr64(void)
+{
+    uint32_t res;
+
+    asm ( "mov $~0xfa1e0ff3, %[res]\n\t"
+          "not %[res]\n\t"
+          : [res] "=&r" (res) );
+
+    return res;
+}
+
+static inline bool is_endbr64(const void *ptr)
+{
+    return *(const uint32_t *)ptr == gen_endbr64();
+}
+
+static inline void place_endbr64(void *ptr)
+{
+    *(uint32_t *)ptr = gen_endbr64();
+}
+
+#endif /* XEN_ASM_ENDBR_H */
-- 
2.11.0


