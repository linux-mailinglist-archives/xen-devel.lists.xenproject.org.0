Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ/2OXAd2WnVmQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CB3D9E19
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279422.1563899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECX-0008Ux-Em; Fri, 10 Apr 2026 15:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279422.1563899; Fri, 10 Apr 2026 15:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECX-0008SG-4V; Fri, 10 Apr 2026 15:55:21 +0000
Received: by outflank-mailman (input) for mailman id 1279422;
 Fri, 10 Apr 2026 15:55:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECV-0007xm-6l
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECU-00DRfX-Io
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d5e-5cb7-0a2a0a5109dd-0a2a450183fa-18
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:18 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d66-6fc9-0a2a45010019-d1558030c4d2-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:18 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488c2690057so21734005e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:18 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775836518; x=1776441318; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4qhZ+8GYYcp7jmfiAyFTdQWpQtMp/eabTrs/ZmAwow=;
        b=pjSsxaFKtWTHxQ/sRV6fUzOTfKcWByj49lHDgoRo7NJx7KJHtcSDnUX5SOdTjhK5Uj
         UpMOgELMNUBUjiELa09Mc625OeqglUYEJJoTo0nzSKtrbzvv/KLeqU78PtJ80Cxl6U4q
         y4uMDM7JEhl45B/sMrHt+nPUtJop1Vf9D9idOP4zeeLLTWSbJiwzOxvCM5MvelGKGohr
         Jek5RQNDjgzkHDy4zZDJ8z15DdrKhkVOV2zf38PupwO2Q92cvlf0vJ74daNqMVwilEXT
         4rjE58cwlpwi/rw8n1eqAcnnwm+19AbFRx3qxDBwQXZK+NOukSulCYqrN5syGakQADLD
         FD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836518; x=1776441318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4qhZ+8GYYcp7jmfiAyFTdQWpQtMp/eabTrs/ZmAwow=;
        b=Qhe+/wDInL3gDiYnSPOQ360OoRAxT8rwdGf0KJVE4E+5He1v09pOnzJTQ48HHFqCHl
         ljagoaJ+ggnelIT7ItbDiJT6EKqdq8TIoHygCeA3Lq+53UGQ2qLO87FlgUhjxPxYFJRg
         vEQn/LoFHUBl7huQTE23AKwT6f6c5/zH6REQWFqvaiyyoqIuDsaktNUnPkR4ZPpAITMR
         jEwRBYkaCYwc6oH+Wukgy460p3ykKy2Dzs7fA7sI9fZ6PE+Kshc/tVTYHwr8f2iPDs29
         MQ7ECrUJ/DSXY0tr8EQSU1vE4mt7NMYkNLehsEOQ4+utGVSjPecAf1HAGASbqV0yRC77
         Qm/Q==
X-Gm-Message-State: AOJu0YzQMeEqe+q2h6ft032AIj0a8TUfViJ5uDmV090kOszlxp0xpVwT
	euPXpA/ivRoYpS4ybkYk0vZCVxnvHBeV3U2uyasNnFyyNgXq6CWZRdh7c/9m0g==
X-Gm-Gg: AeBDievIVYZHwTP2Xv3NqZgs92eaN9wYNODsa2+L2V86LiKjwjudOJP1MIUeeFxDg35
	pHViMzp8PjwCdCJiRI41OiGLagehV2AAbEvkDr/QjoqL+A9LKrx2e6u0PFSwHRAq0fJ2b2JW02X
	CMnuo19Bx1EOyyqCiLUPHV1FlDt+iq7Ubr0NVoG75S/audCFdStYMrRbmzS/avTrvSpRTeCYbfe
	JPME+JmdNqEiryIQAslKapPYN8CQ8+3j6e4trOJgsiB+RDlyiUgaFgJQdhxWqBQ4T3kQZf4nMbY
	0qdCpcXHyFDoNA1y1ri0ZLi1F1kDlHjqWdGB7H20qLvKDG3kH3G+/b8ZP4sXXOM0GzHkJ27bEoF
	XVbD4NseqXWdFOj+7/9C7mBGAz3c9kXISU2T1yfMjAAEaPYEM2bDLAbhFEJd716plZnnANFTGCd
	JR5uGe+o3MQtw3l9LgeZGtfFqnVYIidGAhge957/RdpFR8wl0J7NpWaonvdiJhFkPBAQ==
X-Received: by 2002:a05:600c:4e4d:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-488d6808507mr49943295e9.3.1775836517625;
        Fri, 10 Apr 2026 08:55:17 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 07/12] xen: introduce domain-layout.h with common domain_use_host_layout()
Date: Fri, 10 Apr 2026 17:54:53 +0200
Message-ID: <2057380b431df202adedf852ad492dd0f156f863.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1775836518-154EE185-F1932820/10/73395122804
X-purgate-type: spam
X-purgate-size: 5440
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
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
X-Rspamd-Queue-Id: 920CB3D9E19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop/
[2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271742400.3148344@ubuntu-linux-20-04-desktop/
[3] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271750190.3148344@ubuntu-linux-20-04-desktop/

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/common/device-tree/domain-build.c |  1 +
 xen/include/xen/domain-layout.h       | 28 +++++++++++++++++++++++++++
 5 files changed, 31 insertions(+), 14 deletions(-)
 create mode 100644 xen/include/xen/domain-layout.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6c17a84b2633..60a7cbf915a5 100644
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
index ffe5d0d9f0a6..f95ad1285e6e 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -30,20 +30,6 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
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
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 540627b74e96..e706a6173ba6 100644
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
index 000000000000..15cbb1813c8a
--- /dev/null
+++ b/xen/include/xen/domain-layout.h
@@ -0,0 +1,28 @@
+#ifndef __XEN_DOMAIN_LAYOUT_H__
+#define __XEN_DOMAIN_LAYOUT_H__
+
+#include <xen/domain.h>
+#include <xen/paging.h>
+#include <xen/sched.h>
+
+/*
+ * Is a domain using the host memory layout?
+ *
+ * domain_use_host_layout() is always False for PV guests.
+ *
+ * Direct-mapped domains (autotranslated domains with memory allocated
+ * contiguously and mapped 1:1 so that GFN == MFN) are always using the
+ * host memory layout to avoid address clashes.
+ *
+ * The hardware domain will use the host layout (regardless of
+ * direct-mapped) because some OS may rely on specific address ranges
+ * for the devices. PV Dom0, like any other PV guests, has
+ * domain_use_host_layout() returning False.
+ */
+static inline bool domain_use_host_layout(const struct domain *d)
+{
+    return paging_mode_translate(d) &&
+           (is_domain_direct_mapped(d) || is_hardware_domain(d));
+}
+
+#endif /* __XEN_DOMAIN_LAYOUT_H__ */
-- 
2.53.0


