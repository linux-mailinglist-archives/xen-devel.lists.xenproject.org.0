Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29EEAB9936
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986703.1372249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrdp-0006G4-Dj; Fri, 16 May 2025 09:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986703.1372249; Fri, 16 May 2025 09:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrdp-0006EO-AS; Fri, 16 May 2025 09:46:09 +0000
Received: by outflank-mailman (input) for mailman id 986703;
 Fri, 16 May 2025 09:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFrdo-0005Zo-AE
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:46:08 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96213000-323a-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 11:46:06 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7410c18bb00so2717139b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 02:46:06 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-742a9709293sm1141408b3a.37.2025.05.16.02.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 02:45:58 -0700 (PDT)
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
X-Inumbo-ID: 96213000-323a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747388764; x=1747993564; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOJBhBPo4a9LrsqKDMKYH/ap103lQmBfKYXtkZwpVQM=;
        b=lF1H26g0NjmL8Xsk7CwvKILANCnq9cPSX0/Htkat8BpfZvBq7MkNSgF/fCMNpulVcm
         F3032Yv9py+r9hlKMUYB5pejICtMvYPDokM9BzU+yPNekJpfk2m7mtGkhH7KdjpA08YO
         5Yxo2o67NPmFp9PJ0/7V8mSPZZAjRIUefOfjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388764; x=1747993564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOJBhBPo4a9LrsqKDMKYH/ap103lQmBfKYXtkZwpVQM=;
        b=eRIMrtSit8vnAVBSPBPdis6HZaYf9LuVTU7tgukK9BQ7l0QNwxeupoAFkWe+wIvWVq
         2MSBIq9lfvGebcN4WQJd5lNEGSujrdFV6caoJNpvIDbicM4R1Q3IwSTmKdICW9czIEAh
         wLagqfVJIEZCkf2xUZ6q+Vw50BSQyPMWAYVpRAID7Euvue6/O+TYHlvpRodKwgRAruRZ
         /02ug+72u8xmu3Detym9MQFP0JQUiovKgjasg2GF2ui6yB2qUihNeo7qXp7KNbi47zUC
         /mUwoljSY558NM/M1BfaRCFXOje6pv27L64Uj/hU5I8Qp5J3p7gSp921j8nFcqc4dWfn
         hDdA==
X-Gm-Message-State: AOJu0Yx39W7RM93LrGOXJcV1AqDKKqkEJbRsfd5iefqfvnIrIazUqWET
	BqdbpFtsiAZ808ZQs5TZV5tGSCnFRU5w3nNik5JPKUxeXgpHdpS59WDofx5xN+HtAhjyv1ycp7c
	vOW7/
X-Gm-Gg: ASbGncs3+O2oIpadSLCzqMI3j7/VYmhCGblTXsOTT9mPTid6msXVAy8I8fOJ7Sw4ZUc
	GkEkPJrtNmaINg3t96HAYpDx/kJltvAiTLq7pLhjU2ng/ZDRojBonjrudR5b7p7x2w9SVykitRL
	WLPe2Iv6f/yk4pYj+UhYl5Mc6HNmoLKohvLREZLE83sclZhWXnzcla17ATcFng17+bIfp1JtDEl
	z8ONs9tI/gl3+xBk/QgpltXkQp8KEQRU32jmESZtjUaAW6h8it9wOIi91Z/c7ZjHDdKllF8r2Sn
	jzkQIh2JxPXCXR7IxmssYfuyjjJL1QN36T3FWShyXOQ+20+zdXnLzVKXUpgbkX0P7TWwUxGKfLG
	9AYA952LVKOlZ5oiHLH8=
X-Google-Smtp-Source: AGHT+IHHiGctnGUQIkWjGc9bS9CAz9UCC2o2b/09UUWBjbv+6+SIV7qCKFJl17nbgqyZ0iDG0A/WWw==
X-Received: by 2002:a05:6a00:9168:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-742acce71d9mr2490679b3a.14.1747388758729;
        Fri, 16 May 2025 02:45:58 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/6] x86/gnttab: do not implement GNTTABOP_cache_flush
Date: Fri, 16 May 2025 11:45:31 +0200
Message-ID: <20250516094535.63472-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250516094535.63472-1-roger.pau@citrix.com>
References: <20250516094535.63472-1-roger.pau@citrix.com>
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
---
Changes since v1:
 - Introduce Kconfig option.
 - Introduce CHANGELOG entry.
---
 CHANGELOG.md                        |  3 +++
 xen/arch/x86/include/asm/flushtlb.h | 19 -------------------
 xen/common/Kconfig                  |  5 +++++
 xen/common/grant_table.c            |  6 ++++++
 4 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1ea06524db20..21d7be0aa389 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,6 +24,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
     - Ability to enable stack protector
 
 ### Removed
+ - On x86:
+   - GNTTABOP_cache_flush: it's unused on x86 and the implementation is
+     broken.
 
 ## [4.20.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0) - 2025-03-05
 
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
index 6d43be2e6e8a..563b036474c0 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -35,6 +35,11 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config HAS_GRANT_CACHE_FLUSH
+	bool
+	depends on GRANT_TABLE
+	default ARM
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
2.48.1


