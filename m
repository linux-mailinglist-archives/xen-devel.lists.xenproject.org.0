Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7030C81A010
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:44:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657803.1026914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFws2-0003Z7-1i; Wed, 20 Dec 2023 13:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657803.1026914; Wed, 20 Dec 2023 13:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFws1-0003W8-Us; Wed, 20 Dec 2023 13:44:21 +0000
Received: by outflank-mailman (input) for mailman id 657803;
 Wed, 20 Dec 2023 13:44:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFws0-0003Gg-41
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 13:44:20 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dff00579-9f3d-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 14:44:19 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c3f68b69aso52860885e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 05:44:19 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b0040c31bb66dcsm7358017wmq.20.2023.12.20.05.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 05:44:18 -0800 (PST)
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
X-Inumbo-ID: dff00579-9f3d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703079859; x=1703684659; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zpl/pvdAy8I8bWYC4wJLs2ijp/eL3QlGcKk+qyRQerA=;
        b=kDQlau0wZiiBYgVozWyESQ92D6TBhtDU8WSUeJI0QMfPNJEb7IMSN3HUmdwkBwIU+U
         SkeyR1Jermk4WppxRFWJDESdXbUFUs1jr1qLRaV+xcJ/OKf9c/p4zNGe5gkccZ5nB/Nw
         hd8JaSnPDtRbnidsPOVAtesmKze87YrXkqeJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703079859; x=1703684659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zpl/pvdAy8I8bWYC4wJLs2ijp/eL3QlGcKk+qyRQerA=;
        b=n2Ax0z5gvdwBlTjUR8TSu8JIRcwAgnRpkjpy6ywLM8iXZFATOYzmPKuC8kMwi0818w
         47PTkVaTd3u18wMvWaZ05T3RUIB4p/i67o1ID4a9xGN59fQtXTYIUlfIv5DlUl147T1u
         +J1rm3U2M1TLC+1PC0C3/cS0quJLOTvDs9E8o3fzd1dqcHawbRnnUNbrKEdMm09kZ2pG
         jyD/aSX+n9OWh6pm6bwRVFVAS8avv8CrV3D+XHoz4EnG+3aXb9bKUnBCOYhjxaypbZLH
         47KRjlmxkQxhY7vD3e6k+CTOouaPAskXvuZC3DQLqDUwpnrqjmJ7taxC32qbzDOShdpq
         SfbQ==
X-Gm-Message-State: AOJu0YznZtIDAveDsfyzbNCxkpIddksl1bv3UZaOoTPzHVg1Frj06IB9
	P9+dAmMTFMR68uPw8N/JFvj2daf8czZGEwVXmno=
X-Google-Smtp-Source: AGHT+IGaL4PDOlk862SoqaXg6gAIMGnT4q/dB5L8eKzSmHI0ZJOyu/L0M49PPpwy3+Z2dV1dCBMSHw==
X-Received: by 2002:a05:600c:3411:b0:409:79df:7f9c with SMTP id y17-20020a05600c341100b0040979df7f9cmr13537926wmp.36.1703079858702;
        Wed, 20 Dec 2023 05:44:18 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/6] x86/p2m: move and rename paging_max_paddr_bits()
Date: Wed, 20 Dec 2023 14:43:41 +0100
Message-ID: <20231220134346.22430-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220134346.22430-1-roger.pau@citrix.com>
References: <20231220134346.22430-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The function also supports non-paging domains, and hence it being placed in
p2m.h and named with the paging_ prefix is misleading.

Move to x86 domain.c and rename to domain_max_paddr_bits().  Moving to a
different header is non trivial, as the function depends on helpers declared in
p2m.h.  There's no performance reason for the function being inline.

Note the function is safe to use against PV or system domains, as it does check
whether the domain is using external paging, and if not the returned physical
address width is the host (native) value.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Expand changelog.

Changes since v2:
 - New in this version.
---
 xen/arch/x86/cpu-policy.c         |  2 +-
 xen/arch/x86/domain.c             | 21 +++++++++++++++++++++
 xen/arch/x86/include/asm/domain.h |  3 +++
 xen/arch/x86/include/asm/paging.h | 22 ----------------------
 4 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 423932bc13d6..76efb050edf7 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -864,7 +864,7 @@ void recalculate_cpuid_policy(struct domain *d)
 
     p->extd.maxphysaddr = min(p->extd.maxphysaddr, max->extd.maxphysaddr);
     p->extd.maxphysaddr = min_t(uint8_t, p->extd.maxphysaddr,
-                                paging_max_paddr_bits(d));
+                                domain_max_paddr_bits(d));
     p->extd.maxphysaddr = max_t(uint8_t, p->extd.maxphysaddr,
                                 (p->basic.pae || p->basic.pse36) ? 36 : 32);
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 3712e36df930..8a31d18f6967 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2552,6 +2552,27 @@ static int __init cf_check init_vcpu_kick_softirq(void)
 }
 __initcall(init_vcpu_kick_softirq);
 
+unsigned int domain_max_paddr_bits(const struct domain *d)
+{
+    unsigned int bits = paging_mode_hap(d) ? hap_paddr_bits : paddr_bits;
+
+    if ( paging_mode_external(d) )
+    {
+        if ( !IS_ENABLED(CONFIG_BIGMEM) && paging_mode_shadow(d) )
+        {
+            /* Shadowed superpages store GFNs in 32-bit page_info fields. */
+            bits = min(bits, 32U + PAGE_SHIFT);
+        }
+        else
+        {
+            /* Both p2m-ept and p2m-pt only support 4-level page tables. */
+            bits = min(bits, 48U);
+        }
+    }
+
+    return bits;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 4b6b7ceab1ed..622d22bef255 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -777,6 +777,9 @@ static inline void pv_inject_sw_interrupt(unsigned int vector)
 struct arch_vcpu_io {
 };
 
+/* Maxphysaddr supportable by the paging infrastructure. */
+unsigned int domain_max_paddr_bits(const struct domain *d);
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 76162a9429ce..8a2a0af40874 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -336,28 +336,6 @@ static inline bool gfn_valid(const struct domain *d, gfn_t gfn)
     return !(gfn_x(gfn) >> (d->arch.cpuid->extd.maxphysaddr - PAGE_SHIFT));
 }
 
-/* Maxphysaddr supportable by the paging infrastructure. */
-static always_inline unsigned int paging_max_paddr_bits(const struct domain *d)
-{
-    unsigned int bits = paging_mode_hap(d) ? hap_paddr_bits : paddr_bits;
-
-    if ( paging_mode_external(d) )
-    {
-        if ( !IS_ENABLED(CONFIG_BIGMEM) && paging_mode_shadow(d) )
-        {
-            /* Shadowed superpages store GFNs in 32-bit page_info fields. */
-            bits = min(bits, 32U + PAGE_SHIFT);
-        }
-        else
-        {
-            /* Both p2m-ept and p2m-pt only support 4-level page tables. */
-            bits = min(bits, 48U);
-        }
-    }
-
-    return bits;
-}
-
 #endif /* XEN_PAGING_H */
 
 /*
-- 
2.43.0


