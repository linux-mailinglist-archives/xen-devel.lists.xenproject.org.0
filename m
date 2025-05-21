Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFD9ABEF45
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 11:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991642.1375489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHfVG-00069n-OF; Wed, 21 May 2025 09:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991642.1375489; Wed, 21 May 2025 09:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHfVG-00067Y-LW; Wed, 21 May 2025 09:12:46 +0000
Received: by outflank-mailman (input) for mailman id 991642;
 Wed, 21 May 2025 09:12:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Cb8=YF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHfVF-00067S-8W
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 09:12:45 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfb0d1d9-3623-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 11:12:43 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2321c38a948so40712435ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 02:12:42 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-231d4ebcd45sm88795785ad.210.2025.05.21.02.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 02:12:39 -0700 (PDT)
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
X-Inumbo-ID: bfb0d1d9-3623-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747818760; x=1748423560; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oI9EMhWCWBlVnQwaD4envDuYNzNTvcySHJAXA4pshoU=;
        b=pZCgHxL/2IHbbYxyI0EBn2YUqliriksKHCmffPKkZsMTQo/pXFExiUh3Lhste9+e2x
         Gwy/BcCmUNb9Zp5SuSLLoTekXByz8gBx9ktTgVzJmQMnSUkoCTL8BvO0AGdualIKyqsg
         Zs5Q2z9JfrjaNDFKya+wAizYtrm9p5VirUkeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747818760; x=1748423560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oI9EMhWCWBlVnQwaD4envDuYNzNTvcySHJAXA4pshoU=;
        b=OIxg3/RNflax1N0PzuVM9OtrUG3oGjkRNlgxW+4e9HEhIHeti1hfSszsSTvCXsEIrt
         oEIMlsvDox7XikFaZbuimnO0dXylymBEDK0y3QulY42A0I2FepLFJ5Fc2ejVFmIPTacv
         PVsd1SCJvmcHO4J1uBW+1kIGuA64HXRiH2DaBDHq4zvrsOzVVAzq3Td6FFfkgm4AXk0d
         B70aX4YWaojNNaJbQiXVN6sgdcq4D+OlqNmV2xIuliag1uSlIdjxZg6MMb/294W/l/Qp
         11NnlVPSBJssSozibP2Vc0wtU+IHj+meL9G+49/kEMgasGRDGPEjoDdsssBxLcLiEMzH
         Gv0w==
X-Gm-Message-State: AOJu0YxTFpcPEyyfpu6iJwZjxVL2T/bnzMqR60cmg7+23gDKQNWpjrho
	urvOrkrBPQNMTuo4gadxNYIblYhL5TSSinAVVBH0hoHcc/tfu03njug69zPc5O3VYMwR5fhCc6H
	LTTF/
X-Gm-Gg: ASbGncu7aSEH2ZEoPuWO17RFHM8s21GCnaqKFRhOQKZ6AYAXnNoEdJZ1Cgwrr4HCnkf
	N7tmkHjKUf3GQhQc4oWWixuOkQxf4A+vuIb0F9wxTmol9qjFqKSnd/gwtgGB44jahK9ttBGIUGp
	/qBgER+ny1MMvmcc+BZRSworq0hrOgRYqwzvMOek8TDc1EqaB3uVKJZPRbbzaBncHfh6avB+AEO
	R9dRckrteyYkj1ExR9QETPz8nx280NJuER3CgTELY10JFWioEhhHCcO43NeGkpiHa4M1GtJ8aD2
	4aqgKM+WpeCJEJWEhwYksbYZESFm1Yiijz9zDPxsOHt0q6vRG6nOHlW2KXv7nJgcPU2w4gZmT4i
	JIQ5g+YlERu6e/ttrmdzfyqfq
X-Google-Smtp-Source: AGHT+IFar4zPK2S3dsLjfZ5VVzZoXPq/04DB6VQwRlCsFP5RD6xAMTazy8a531rDv+GpitylL4Ojaw==
X-Received: by 2002:a17:902:db07:b0:224:1001:677c with SMTP id d9443c01a7336-231de351468mr258572645ad.9.1747818760432;
        Wed, 21 May 2025 02:12:40 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] x86/gnttab: do not implement GNTTABOP_cache_flush
Date: Wed, 21 May 2025 11:12:25 +0200
Message-ID: <20250521091225.84597-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current underlying implementation of GNTTABOP_cache_flush on x86 won't
work as expected.  The provided {clean,invalidate}_dcache_va_range()
helpers only do a local pCPU cache flush, so the cache of previous pCPUs
where the vCPU might have run are not flushed.

However instead of attempting to fix this, make the GNTTABOP_cache_flush
operation only available to ARM.  There are no known users on x86, the
implementation is broken, and other architectures don't have grant-table
support yet.

With that operation not implemented on x86, the related
{clean,invalidate}_dcache_va_range() helpers can also be removed.

Fixes: f62dc81c2df7 ("x86: introduce more cache maintenance operations")
Fixes: 18e8d22fe750 ("introduce GNTTABOP_cache_flush")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>
---
Changes since v2:
 - Adjust how HAS_GRANT_CACHE_FLUSH gets selected.
---
 CHANGELOG.md                        |  3 +++
 xen/arch/arm/Kconfig                |  1 +
 xen/arch/x86/include/asm/flushtlb.h | 19 -------------------
 xen/common/Kconfig                  |  3 +++
 xen/common/grant_table.c            |  6 ++++++
 5 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index faf2271011f1..ec452027f54b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -28,6 +28,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
     - Ability to enable stack protector
 
 ### Removed
+ - On x86:
+   - GNTTABOP_cache_flush: it's unused on x86 and the implementation is
+     broken.
 
 ## [4.20.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0) - 2025-03-05
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 3321d8906863..a5aad97a688e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -17,6 +17,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
 	select HAS_DOM0LESS
+	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
 
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index 209ea1e62fae..cd625f911436 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -184,25 +184,6 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
 }
 
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache) {}
-static inline int invalidate_dcache_va_range(const void *p,
-                                             unsigned long size)
-{ return -EOPNOTSUPP; }
-static inline int clean_and_invalidate_dcache_va_range(const void *p,
-                                                       unsigned long size)
-{
-    unsigned int order = get_order_from_bytes(size);
-    /* sub-page granularity support needs to be added if necessary */
-    flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
-    return 0;
-}
-static inline int clean_dcache_va_range(const void *p, unsigned long size)
-{
-    unsigned int order = get_order_from_bytes(size);
-
-    /* sub-page granularity support needs to be added if necessary */
-    flush_area_local(p, FLUSH_CACHE_WRITEBACK | FLUSH_ORDER(order));
-    return 0;
-}
 
 unsigned int guest_flush_tlb_flags(const struct domain *d);
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6d43be2e6e8a..3d66d0939738 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -35,6 +35,9 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config HAS_GRANT_CACHE_FLUSH
+	bool
+
 config EVTCHN_FIFO
 	bool "Event Channel Fifo support" if EXPERT
 	default y
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index e75ff98aff1c..cf131c43a1f1 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -940,6 +940,7 @@ static void reduce_status_for_pin(struct domain *rd,
         gnttab_clear_flags(rd, clear_flags, status);
 }
 
+#ifdef CONFIG_HAS_GRANT_CACHE_FLUSH
 static struct active_grant_entry *grant_map_exists(const struct domain *ld,
                                                    struct grant_table *rgt,
                                                    mfn_t mfn,
@@ -975,6 +976,7 @@ static struct active_grant_entry *grant_map_exists(const struct domain *ld,
 
     return ERR_PTR(-EINVAL);
 }
+#endif /* CONFIG_HAS_GRANT_CACHE_FLUSH */
 
 union maptrack_node {
     struct {
@@ -3520,6 +3522,7 @@ gnttab_swap_grant_ref(XEN_GUEST_HANDLE_PARAM(gnttab_swap_grant_ref_t) uop,
     return 0;
 }
 
+#ifdef CONFIG_HAS_GRANT_CACHE_FLUSH
 static int _cache_flush(const gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
 {
     struct domain *d, *owner;
@@ -3631,6 +3634,7 @@ gnttab_cache_flush(XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) uop,
 
     return 0;
 }
+#endif /* CONFIG_HAS_GRANT_CACHE_FLUSH */
 
 long do_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
@@ -3773,6 +3777,7 @@ long do_grant_table_op(
         break;
     }
 
+#ifdef CONFIG_HAS_GRANT_CACHE_FLUSH
     case GNTTABOP_cache_flush:
     {
         XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) cflush =
@@ -3789,6 +3794,7 @@ long do_grant_table_op(
         }
         break;
     }
+#endif /* CONFIG_HAS_GRANT_CACHE_FLUSH */
 
     default:
         rc = -ENOSYS;
-- 
2.49.0


