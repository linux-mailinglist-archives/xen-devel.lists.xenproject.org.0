Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMjbBmzF8GkpYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C554870BE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296332.1572781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVd-0006Bq-FQ; Tue, 28 Apr 2026 14:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296332.1572781; Tue, 28 Apr 2026 14:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVd-00068g-Bo; Tue, 28 Apr 2026 14:33:57 +0000
Received: by outflank-mailman (input) for mailman id 1296332;
 Tue, 28 Apr 2026 14:33:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVb-0005q2-KS
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:33:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVb-000RTW-06
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:33:55 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c548-2eae-0a2a0a5409dd-0a2a4501d626-32
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:54 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c552-c1f2-0a2a45010019-d1558030e130-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:54 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso159479825e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:33:54 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:33:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777386834; x=1777991634; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJckSt8P9RqMXs+Zl/HaWVhTtv7+MRR8ow5oSeYh3yY=;
        b=aJC1bUhZBM9AD45Wb3MiNlGtFtG7eDZCQM2oAj2ssWcEV7FEjGug8IPJsNKFKf73CZ
         0rvc9jIDmDQMmruswVfd0sZ7ueWKE8bQVwK2y4lA0Y9faeRgVDGZAqZmyEySayLck4dX
         oWp+wB+IMLGN3WCrJwXbyGWRK9vdbCgon3Hh2n76fk6FlJ+UH4GO5+6q5JXLUMGzFffl
         XyFkwLm6N9nSI04U7oVBtzKuv4mvKt2205KD1Yzu0P2B44XT/J9D1gW9UWszsJzVWuKP
         ncriXmvR/E9xN2kKrDE+My20XvM7uvThOqO3N31Og7RY0n6AybjeIcdKYzs6I1YmO7+i
         UEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386834; x=1777991634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HJckSt8P9RqMXs+Zl/HaWVhTtv7+MRR8ow5oSeYh3yY=;
        b=RA67P6BElqwmNTG69n/r7QXsgAPYv0KtCf8IgnQr4yyvuA7C0KNuxI3aYvfBIDj2E6
         4o5XIn5loUghxa9RLiMAYIYBTTLDO36Wubax6tfjeURJHiFAYRdrsiZEDMf7DUQiWrmG
         1tRPaij6byl4BAT8P+zVJZwg5eOUKy0JurzWWb+moPtlWbKtBUwZ7BduY8zgYJK5shu9
         cM59jUKny9IMD9ZflOxxP0UMui7NKT6VPlgtOOIDIlVo2FusS9e+QMcz3gm2HchFseaM
         XgzuUUaTuB75qjHHaGa8EtPYXtbo1Pyj1B+o++NXDBYKQ3KFDaWIR9LYdlK8oYnBli/0
         nUeA==
X-Gm-Message-State: AOJu0YxDTPtSSovlmWF6ItfOMXEfhWXT/qjS7Nvd6TJqD59HocWmXUUm
	i/bdN+hGjIlFnyemY+6P7fOlOFlsulmWQeqkDE5tH0S40foVyjx8z2WEeNYTdw==
X-Gm-Gg: AeBDievu8oOpC2LX+h55udKrwlbZppy0Vhg5Z3gDOE8dwOttHsh+xIUiJeJh4275hRJ
	ijA9dgULWk97bJzt6gUa3Ppwm+/nKtb3YtDzQnaYrk6kWGwQek4OVxdrIWLdyndHFft3UNu9vVr
	pnNP1Pj3lgnI5Fku7f18sWrAZe/KYvlONqwwijNZss0Ad/x8ckgIwrgj/aJMc9sxYb7iX8yhbi2
	DlE3Vd0SDbUtpbV4H06VOoa5U54aoiQR8eI8GnPOGqXQ+CV8tB6D7Ssm3orLj5vc0oEC1p/YMDh
	GYNVBj9B/ZTLTZJkdOfHGsHVXHErWV3SjZZtiz1+2nYoYl+xiKg+rVeF80H5X+aBOfG8zCWe8Bk
	RTOhA1alY+kmt0zwLsqglZckOjh7ocaXhGj4ZZlu0FS/v8/jUa9u9xl6NQdtuVdrnsE/7N6yqPZ
	9KZwDN5XZC+8kIAHURd/1oRI3Q0mRUJAWmOwcoBzzUdO34POZBG2c8kab7BjMojkyAHJuKbGfWC
	HHVNuvHdvnVWZM=
X-Received: by 2002:a05:600c:3b15:b0:488:9439:881a with SMTP id 5b1f17b1804b1-48a77ae5448mr61360215e9.2.1777386833911;
        Tue, 28 Apr 2026 07:33:53 -0700 (PDT)
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
Subject: [PATCH v4 04/11] xen: introduce domain-layout.h with common domain_use_host_layout()
Date: Tue, 28 Apr 2026 16:33:33 +0200
Message-ID: <2577e757d32f85fb8b3308863e6d7a53d70636dc.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1777386834-BC410FF4-DCFBBF00/10/73395122804
X-purgate-type: spam
X-purgate-size: 5464
X-Rspamd-Queue-Id: A6C554870BE
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.243];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

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
---
 xen/arch/arm/domain_build.c           |  1 +
 xen/arch/arm/include/asm/domain.h     | 14 --------------
 xen/arch/arm/vgic-v3.c                |  1 +
 xen/common/device-tree/domain-build.c |  1 +
 xen/include/xen/domain-layout.h       | 27 +++++++++++++++++++++++++++
 5 files changed, 30 insertions(+), 14 deletions(-)
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
index 000000000000..0532a27b44ce
--- /dev/null
+++ b/xen/include/xen/domain-layout.h
@@ -0,0 +1,27 @@
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
+#endif /* __XEN_DOMAIN_LAYOUT_H__ */
-- 
2.53.0


