Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF468AABE06
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 11:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976893.1364005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCEAM-0006dx-Lk; Tue, 06 May 2025 09:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976893.1364005; Tue, 06 May 2025 09:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCEAM-0006bF-Ix; Tue, 06 May 2025 09:00:42 +0000
Received: by outflank-mailman (input) for mailman id 976893;
 Tue, 06 May 2025 09:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCEAL-0006b9-2R
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 09:00:41 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9561280a-2a58-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 11:00:40 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ace94273f0dso251252266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 02:00:40 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099ae34e2sm12632186f8f.24.2025.05.06.01.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:34:48 -0700 (PDT)
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
X-Inumbo-ID: 9561280a-2a58-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746522039; x=1747126839; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+W9lEzZ3YPqEiQclAW6B381YvWea5VfolcXUQFEZ2o=;
        b=WAgbHJofF7HgM3TMPI8TiQstYkTEQQwtthrPWF58srf1m8N5cb6pV0eLFI+tf8Xi8a
         4tFBhyZp9yg0272GIGPEcVO6l6HfoUSp8/fkLlsCjKiYBiIbsNmD3ZAZDw7AW7whoEa4
         +3mZZToVGaJZ3zzUkQVZGWkF8TazU6zB7DPOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522039; x=1747126839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+W9lEzZ3YPqEiQclAW6B381YvWea5VfolcXUQFEZ2o=;
        b=ULECoRQa5H+GO103fTqwpdPlnboMArrWMUl0iZOM8SKwQpuGw1jhed81V5Fxh9NkWG
         o+AMuiFEbt2x4KerQ8o8ltAMMnnN8V4pfoLSVL5wV5y3Az3412OO+7tmyDlYT/lhlw7g
         kZrCNdpuyWqVhRp/DniaOmnsYyx0gEmdQS8t8qwVUKN1seyPKd6s5j5PwAlTxGQ7Mn4w
         u2l3RBD0wib9RRa16fV0evGFYJzzOXXypnNfBJlRWyG6ZUW0jAnHXamVUgvyl14hgny5
         U7P88MnY1ETAdX5qV/ytfZ7Xg8dQm2z3wsqS2dI7U7auOIc7/cU74sDYn0KD5RH6le6m
         R/tw==
X-Gm-Message-State: AOJu0YxhAgsGxRhMMo0CY2EXd0WM96LnfmFgqQ+UHQbkXZ8vaEoisJEt
	X7y9+4lhcWQLcpDHtYuuohQw9/gfQWoKsWMzjW8H37Cs5hNWXgRrM0RQJr9ACCgxocaU/obKkYm
	g
X-Gm-Gg: ASbGncvUe163xnv2zbm6U4d6TWb/BgQrrTp6e69uErJ3QiZjaW4wBHFY41XrV41ht1a
	gewdQa/1vyq/om+WyjB5Kr9LNAESRiShFbrGobR9UpaTjNkuCwRjtCRfr5WqjmbZkwNf9emTHRP
	iMHhKCehn4O73maQY6FmYZYz5LbFKXVHRluPmziU4N/gXEzG9tgphhdAgjsdnpmywTWWUjpI4Ya
	gaYHIXLcNjURMBgwhy36rDl40m5drKaGSIEinqoX3cb6EqMWD9bluA81dRNKIdf+WEptZFUGbB2
	KrRQASIOrknxN70Kzd0TzTWfgxCvNtSgVKCm0YxdKlezvA==
X-Google-Smtp-Source: AGHT+IGhxmBqCb7xdHw4VhQuhl4tgy/BOqgPbggvS46dewpZnmq+sg0FvdSOBL2lOWhwvg/D+TI0Bw==
X-Received: by 2002:a05:6000:1886:b0:39c:1f10:c736 with SMTP id ffacd0b85a97d-3a09fdbc906mr9154530f8f.43.1746520488398;
        Tue, 06 May 2025 01:34:48 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/9] x86/gnttab: do not implement GNTTABOP_cache_flush
Date: Tue,  6 May 2025 10:31:43 +0200
Message-ID: <20250506083148.34963-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506083148.34963-1-roger.pau@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
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
I've attempted to introduce a new arch_do_grant_table_op() in a separate
arch-specific file, but it required exposing too much functionality from
the common grant_table.c, ifdefying is probably better for the time being.
---
 xen/arch/x86/include/asm/flushtlb.h | 15 ---------------
 xen/common/grant_table.c            |  6 ++++++
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index bb0ad58db49b..d0c9120b5faf 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -182,21 +182,6 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
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
-    return clean_and_invalidate_dcache_va_range(p, size);
-}
 
 unsigned int guest_flush_tlb_flags(const struct domain *d);
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index d874ac5f1241..cc7c7d004065 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -940,6 +940,7 @@ static void reduce_status_for_pin(struct domain *rd,
         gnttab_clear_flags(rd, clear_flags, status);
 }
 
+#ifdef CONFIG_ARM
 static struct active_grant_entry *grant_map_exists(const struct domain *ld,
                                                    struct grant_table *rgt,
                                                    mfn_t mfn,
@@ -975,6 +976,7 @@ static struct active_grant_entry *grant_map_exists(const struct domain *ld,
 
     return ERR_PTR(-EINVAL);
 }
+#endif /* CONFIG_ARM */
 
 union maptrack_node {
     struct {
@@ -3520,6 +3522,7 @@ gnttab_swap_grant_ref(XEN_GUEST_HANDLE_PARAM(gnttab_swap_grant_ref_t) uop,
     return 0;
 }
 
+#ifdef CONFIG_ARM
 static int _cache_flush(const gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
 {
     struct domain *d, *owner;
@@ -3631,6 +3634,7 @@ gnttab_cache_flush(XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) uop,
 
     return 0;
 }
+#endif /* CONFIG_ARM */
 
 long do_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
@@ -3773,6 +3777,7 @@ long do_grant_table_op(
         break;
     }
 
+#ifdef CONFIG_ARM
     case GNTTABOP_cache_flush:
     {
         XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) cflush =
@@ -3794,6 +3799,7 @@ long do_grant_table_op(
         }
         break;
     }
+#endif
 
     default:
         rc = -ENOSYS;
-- 
2.48.1


