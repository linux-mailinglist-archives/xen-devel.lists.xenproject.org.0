Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA29814A56
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 15:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655136.1022883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92c-0000Fr-8J; Fri, 15 Dec 2023 14:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655136.1022883; Fri, 15 Dec 2023 14:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92c-00006o-3p; Fri, 15 Dec 2023 14:19:50 +0000
Received: by outflank-mailman (input) for mailman id 655136;
 Fri, 15 Dec 2023 14:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE92a-0007Jp-7Z
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 14:19:48 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df8f4edd-9b54-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 15:18:52 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c236624edso7547545e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 06:18:52 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 k20-20020a5d5254000000b003365b5df349sm190650wrc.93.2023.12.15.06.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 06:18:51 -0800 (PST)
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
X-Inumbo-ID: df8f4edd-9b54-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702649931; x=1703254731; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i40rODJO/X0LXQNlEUFaGjc3uP8fUKGEa0LahLnFqZ4=;
        b=OwkYD66IIPftCSkkiC1fwKj9Pgye/tPEMWK4sQx6dsS6e6DR00aNHXEanAIiOh+J+y
         piI5fQ3icHQREdTygqb/LQKQ7LQW8bcuzIHnPyAyK1Me1WjBh8ws1uuwNc4uY4w1yiRN
         MCLO460EiIwYS67XG6kl8Qmzr5FkJ3ohQ5I4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702649931; x=1703254731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i40rODJO/X0LXQNlEUFaGjc3uP8fUKGEa0LahLnFqZ4=;
        b=hr+nvWUMZM6Pn1a6xEQIvssbyasAgj/qHNnl5GcLtX+pd8WCftF4imDeWlr+u5FRnm
         j/F9U5cI/RRIRtCanAP7r9CGlTRkBMi7v2Ry//jLaDTXcHa93lkT0IWuqreGE3NHzuCx
         X0MZrl1kAU1aWdiKSDod3l9jdm/xwNoixpIYYdKx1/yJibSmizgO7d7k1YMvQe5HJd6w
         8cvhiBqu07lIVLLT2/gJlyiiDDrE4uI/pZO/nxCsZyez7gVOn3XJnKBvN9aiLox6DTJ1
         tuzHUsRV5tFi1M36AAeCOk/gx+/JvAQWvXREiXAMCQrkAa0LGH/koK2RUpM9w1e8kejp
         xidw==
X-Gm-Message-State: AOJu0Yz0ixUG1Rx26OwG4rB0YTTwwSLzEwP057qRp4GUvEvjGjE0wcsW
	JY/fUsSBevrGAJx8IJwB61kO+qafPn4SskPmWlU=
X-Google-Smtp-Source: AGHT+IHolaIVqpjYAMNLgKYfrrXCOS+fc4hUrxfSN2XF9Ny4iN8pmO3vuABTOUeCM7ux/KAzFMr1uw==
X-Received: by 2002:a05:600c:6cf:b0:40c:5777:da1a with SMTP id b15-20020a05600c06cf00b0040c5777da1amr2998869wmn.113.1702649931612;
        Fri, 15 Dec 2023 06:18:51 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/7] x86/p2m: move and rename paging_max_paddr_bits()
Date: Fri, 15 Dec 2023 15:18:27 +0100
Message-ID: <20231215141832.9492-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215141832.9492-1-roger.pau@citrix.com>
References: <20231215141832.9492-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The function also supports non-paging domains, and hence it being placed in
p2m.h and named with the paging_ prefix is misleading.

Move to x86 domain.c and rename to domain_max_paddr_bits().  Moving to a
different header is non trivial, as the function depends on helpers declared in
p2m.h.  There's no performance reason for the function being inline.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
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


