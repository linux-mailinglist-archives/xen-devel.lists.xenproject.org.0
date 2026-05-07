Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM7mEmlU/GmKOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47AE4E55DF
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302332.1576313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZc-00033N-Cy; Thu, 07 May 2026 08:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302332.1576313; Thu, 07 May 2026 08:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZc-0002zR-6v; Thu, 07 May 2026 08:59:12 +0000
Received: by outflank-mailman (input) for mailman id 1302332;
 Thu, 07 May 2026 08:59:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZa-0002q9-Jj
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZa-00CM1g-0R
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5457-5cb7-0a2a0a5109dd-0a2a45019b40-36
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:09 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc545d-c1f2-0a2a45010019-d155da31a8e7-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:09 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-bc1f0830f44so329054066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:09 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778144349; x=1778749149; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yM+vLILbE6Jc00UTwsrRi/KBPqAZVlEYVO70OjvNObQ=;
        b=rf55Qbtn8FqUcg0DvITB5nEH3I0tTdTzQre1pTWb4hTfnnvl4xnuJCVcjoT8CcIRxr
         Wp1lJvl8ff9wA7TsC2vIDHmhiTo7pefqMm372iIE+WwW3bqhcFZS9zdf5b55sUOUkLHR
         bjOUkahdLZFpSDRkyk133MFRFX3hsUE0yzID6MWnTDNxKz7Bq+ElV9ZOXTPjnpgtc/o7
         Yl5ASPx4nuxbrgGo7GEFfZJah/cUhg5Xc5b4AjDnd+OeTNUYMCwrFTxt2bWCa1l2W47Q
         CUP2NY9QXizhoeNIOYMg931ikggKygwJ7U98b7IGOtnT/Gls6M6I5ealm6rks9N+sO2R
         WXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144349; x=1778749149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yM+vLILbE6Jc00UTwsrRi/KBPqAZVlEYVO70OjvNObQ=;
        b=Yu4okDBODMv33xzWBLtLf6qWP6tRq9No0SsII+QqP1nkTkSb6Lnen3qJ6c9UTfojbz
         /cKPPz52tcjqDZqe9+r8t5YTwezsGjyOH8T+bNgJw2OGMYZ55VBAqU6N4iYo9IWtIedM
         ywEwoZWjUp877JR1QMuO8ElVdz/ikBVeSaKBfyJsmBFF644UWdx3gXNzvXrDy16VGsNx
         hFrNcRMWobCkunCTa9R9QyHAGC8LQDBDXSTnk4ya6BwnJXgyVzqI2fY+HShZrLSp/XYU
         G8PFCYl2KP0yf5NHFka0pZBsFsnL2BYiKRym1WK7qZuNOJduv/SO+1+j8UO87wY7beXf
         7Vlw==
X-Gm-Message-State: AOJu0Yz0Ue1yKkvgAzLEaeo7Pg50Cl0UCeQqUacXfQ1z7oAHviR7BWfJ
	bzcvKVitdUx3uULpVxZhGU6g4KbcWurhKOimmNx2VS3Zyu9eWF3NmOmezGnBlg==
X-Gm-Gg: AeBDievw9t5gcD2WoGvI7B+amy+4x7uIvl0DdlUUbZwTh3J9fg0XIT2Nk7zGaMRCZAr
	rrsZCa4np66TsZD+VGrYNVja4/YgKsasp/8avPb35hiOC2Fhwr8kgpOIjLUaz7tovq9j3gcbQcx
	HVDbO2X4XUDJF4DGxW+Gd0x4qLbVPSlchd9WAZBK1QZPy+bp7gU0RstTtemmHa0ca8t+R3z83WZ
	8bccRpJtlE0z1hz/SzxejvuoSNS1kWxwpOH+cSt5elH7axrRFY/qJ57NUqI3qLDbloQbE31/m7V
	8F5FO0Kw7VBwO/Llpezxt+4fhuG1KFIdwBTrXetgy1IWXdURC99DG5pDKulUAEv4tyCcbWMtm0o
	QPMehxIyky++Ap/EVoyS42YdgCPpSQWnEbMh1TDqU7aea1wTbviCeBr9fHC1sXu1S0Urzpnq44G
	eYDxCwxpiFdWkS/PyKxB76ykUfUyRup7g2byVY2Woqm+t2Ffawmdh1OE8FmkWGttEBAc9QQbQuF
	x8p
X-Received: by 2002:a17:907:6d1e:b0:ba3:7d65:c373 with SMTP id a640c23a62f3a-bc85c2b36demr103325966b.10.1778144348790;
        Thu, 07 May 2026 01:59:08 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v5 04/11] xen: introduce domain-layout.h with common domain_use_host_layout()
Date: Thu,  7 May 2026 10:58:43 +0200
Message-ID: <a95e0968d4213a07984ac112c178ff72d03eaf96.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778140240.git.oleksii.kurochko@gmail.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778144349-AD545FF4-EF64164F/10/73395122804
X-purgate-type: spam
X-purgate-size: 6850
X-Rspamd-Queue-Id: C47AE4E55DF
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:luca.fancellu@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com];
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

domain_use_host_layout() is not architecture-specific and may be needed
on x86 [1]. Replace the ARM-specific macro in asm/domain.h with a common
static inline in a new dedicated header, xen/domain-layout.h.

xen/domain.h would be the natural home, but placing it there would
require including xen/paging.h (for paging_mode_translate()) and
xen/sched.h (for is_hardware_domain()), which would introduce circular
dependencies. A separate header that callers opt into avoids this.

Adjust the implementation to take paging_mode_translate() into account
so it works correctly for all architectures, including x86. Some extra
details about implementation [2] and [3].

To avoid the following compilation issue:

In file included from ./include/xen/paging.h:4,
                 from ./include/xen/domain-layout.h:6,
                 from common/device-tree/domain-build.c:4:
./arch/riscv/include/asm/paging.h:17:48: error: 'struct page_info'
declared inside parameter list will not be visible outside of this
definition or declaration [-Werror]
   17 | void paging_free_page(struct domain *d, struct page_info *pg);

add the forward declaration of struct page_info to RISC-V's asm/paging.h.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop/
[2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271742400.3148344@ubuntu-linux-20-04-desktop/
[3] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271750190.3148344@ubuntu-linux-20-04-desktop/

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Add /* SPDX-License-Identifier: GPL-2.0-only */ to xen/domain-layout.h.
 - s/__XEN_DOMAIN_LAYOUT_H__/XEN_DOMAIN_LAYOUT_H.
 - Drop inclusion of xen/domain.h as it is included in xen/sched.h.
 - Add forward declaration of page_info in asm/paging.h to fix compilation
   issue occured after drop inclusion of xen/domain.h.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v4:
 - Update the comment above domain_use_host_layout().
---
Changes in v3:
 - Make argument of domain_use_host_layout() const.
 - Create a separate header to avoid circular heder dependecy and making
   domain_use_host_layour() as static inline.
 - Rework domain_use_host_layout() to be protected by paging_mode_translate().
 - Update the commit message.
---
Changes in v2:
 - Drop ifdef around defintion of domain_use_host_layout() as it
   was suggested generic version. It could be returned back when
   the real use case for it will appear.
 - Add Suggested-by: and update the commit message.
 - Make domain_use_host_layout() function instead of macros to
   avoid ciclular header dependecies. Look at more details in
   the commit message.
---
 xen/arch/arm/domain_build.c           |  1 +
 xen/arch/arm/include/asm/domain.h     | 14 --------------
 xen/arch/arm/vgic-v3.c                |  1 +
 xen/arch/riscv/include/asm/paging.h   |  1 +
 xen/common/device-tree/domain-build.c |  1 +
 xen/include/xen/domain-layout.h       | 28 +++++++++++++++++++++++++++
 6 files changed, 32 insertions(+), 14 deletions(-)
 create mode 100644 xen/include/xen/domain-layout.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index ad665cd3c045..1efddc60ef0a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2,6 +2,7 @@
 #include <xen/init.h>
 #include <xen/bootinfo.h>
 #include <xen/compile.h>
+#include <xen/domain-layout.h>
 #include <xen/dom0less-build.h>
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index b24f02d269be..46a5cdc0c800 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -18,20 +18,6 @@ struct hvm_domain
     uint64_t              params[HVM_NR_PARAMS];
 };
 
-/*
- * Is the domain using the host memory layout?
- *
- * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
- * To avoid any trouble finding space, it is easier to force using the
- * host memory layout.
- *
- * The hardware domain will use the host layout regardless of
- * direct-mapped because some OS may rely on a specific address ranges
- * for the devices.
- */
-#define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
-                                   is_hardware_domain(d))
-
 struct vtimer {
     struct vcpu *v;
     int irq;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 77aab5c3c293..77517c303061 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -10,6 +10,7 @@
  */
 
 #include <xen/bitops.h>
+#include <xen/domain-layout.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index c1d225d02b50..e487c89a4ccd 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -4,6 +4,7 @@
 #include <asm-generic/paging.h>
 
 struct domain;
+struct page_info;
 
 int paging_domain_init(struct domain *d);
 
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index c51520ebadf9..6949203dacdc 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/bootinfo.h>
+#include <xen/domain-layout.h>
 #include <xen/fdt-domain-build.h>
 #include <xen/init.h>
 #include <xen/lib.h>
diff --git a/xen/include/xen/domain-layout.h b/xen/include/xen/domain-layout.h
new file mode 100644
index 000000000000..cc5e56c9da47
--- /dev/null
+++ b/xen/include/xen/domain-layout.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_DOMAIN_LAYOUT_H
+#define XEN_DOMAIN_LAYOUT_H
+
+#include <xen/paging.h>
+#include <xen/sched.h>
+
+/*
+ * Is a domain using the host memory layout?
+ *
+ * domain_use_host_layout() is always False for PV domains (including Dom0).
+ *
+ * Direct-mapped domains (autotranslated domains with memory allocated
+ * contiguously and mapped 1:1 so that GFN == MFN) must use the host
+ * memory layout since GFN == MFN by definition.
+ *
+ * The hardware domain will use the host layout (regardless of
+ * direct-mapped) because some OS may rely on specific address ranges
+ * for the devices.
+ */
+static inline bool domain_use_host_layout(const struct domain *d)
+{
+    return paging_mode_translate(d) &&
+           (is_domain_direct_mapped(d) || is_hardware_domain(d));
+}
+
+#endif /* XEN_DOMAIN_LAYOUT_H */
-- 
2.54.0


