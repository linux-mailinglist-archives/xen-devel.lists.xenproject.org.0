Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 321BFA05E9C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867324.1278870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4t-0007xH-6v; Wed, 08 Jan 2025 14:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867324.1278870; Wed, 08 Jan 2025 14:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4s-0007rG-Rn; Wed, 08 Jan 2025 14:30:34 +0000
Received: by outflank-mailman (input) for mailman id 867324;
 Wed, 08 Jan 2025 14:30:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4q-0005q4-SP
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:32 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cfeb909-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:31 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d437235769so10185155a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:31 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806feddfasm26366981a12.58.2025.01.08.06.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:29 -0800 (PST)
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
X-Inumbo-ID: 1cfeb909-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346630; x=1736951430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1M0fEQUOjxJ5DtJ3QRFhSAxh9S66gkWBgHELsH7AbA=;
        b=rltRehCiWHTj7fk1+hRO1zLX1JiY/qW7vG185hut9pgvKFMlfV2E9Ukxwf074hdyXk
         572LhtnTuKSNlEtuW+rYiPVY8Qs7B16e0k8acj6aRISdWl8SdC8hF1pnX5c7CvoDr9gQ
         /aix5kQsus3uKhJr2FJ8ICVdayQ4ZqOu9kbn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346630; x=1736951430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1M0fEQUOjxJ5DtJ3QRFhSAxh9S66gkWBgHELsH7AbA=;
        b=ASeYnoMsE+6efMSEe2QwwW6XHHRncrg5gL6ih1r/nMDV/H9iqnIVZtVMdpRRGJMXf3
         8z7mzWCQwPG8HzlRr0sPYRumJ67O6p+oVC1FsF/OiiTFVIqp65opXHO59Ff8oXvesuUt
         XqXdWPDS+j18XrHRCHQqyxhHG3hBgGyyjctHrpcDIF129B9TkZzg8l2PduxqcrnDH+EB
         T4M1Mr/ui67CeswJZqvNummB0vje2NvADqIZ9U7tkdxNgLk6OJ+zj0WfWmd4rwkuHuQ0
         R7FUckqKemCEs2RAZ8ebPpLH/g6y5I/ANA/3cwhjANCZjlgpIbaZ1a4cUOppVma7mgwR
         R+kg==
X-Gm-Message-State: AOJu0YzK4O7JUkBh71NZ+htkVmfzZXRUiRKKUvzGFO9ePZU1IPgykZiK
	cOmhRfcxRkol9Lokx248PwnioJidORO86XS5aEYEc6WDALwYDO5NhPb2NVszagCsNdJWLpT8ZzN
	E
X-Gm-Gg: ASbGnctLHfUPHwbekW/JezOBQtvMdFIRPS6/boD4VZdA44EdN+VLYfZY6FahRla5865
	ZBUJsfabGBdyTKetW+/Kyya8HFUh3D7TpW03LKD22hN0my0QGNL2Ea5C97ZM9HWqUuf59f/UOM9
	GFLEmBP6v9+OY2o4zH+Og7dHBglbaWlNPXIgj9atWcH0SWw8kDUEBsPGhXhzx2xmG0VGfjuezGk
	49NwgJTzvAv4dL0SRdQJIhKpvPs2/TBIIw45pLPFzXfcRf2i6vHkUoNVhA0AkE77c8=
X-Google-Smtp-Source: AGHT+IHbq/O2WwIQm3RW5r/fjZ4FHbgGEBEEu5HVGEwWYvh51/BUDNPNr9U76gO8g2/4SPxrqkwRSg==
X-Received: by 2002:a05:6402:540e:b0:5d0:b51c:8478 with SMTP id 4fb4d7f45d1cf-5d972e0e274mr2506264a12.12.1736346630352;
        Wed, 08 Jan 2025 06:30:30 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 08/18] x86/pv: remove stashing of GDT/LDT L1 page-tables
Date: Wed,  8 Jan 2025 15:26:48 +0100
Message-ID: <20250108142659.99490-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no remaining callers of pv_gdt_ptes() or pv_ldt_ptes() that use the
stashed L1 page-tables in the domain structure.  As such, the helpers and the
fields can now be removed.

No functional change intended, as the removed logic is not used.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/domain.h |  9 ---------
 xen/arch/x86/pv/domain.c          | 10 +---------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b659cffc7f81..fbe59baa82ec 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -271,8 +271,6 @@ struct time_scale {
 
 struct pv_domain
 {
-    l1_pgentry_t **gdt_ldt_l1tab;
-
     atomic_t nr_l4_pages;
 
     /* Is a 32-bit PV guest? */
@@ -506,13 +504,6 @@ struct arch_domain
 #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
 #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
 
-#define gdt_ldt_pt_idx(v) \
-      ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
-#define pv_gdt_ptes(v) \
-    ((v)->domain->arch.pv.gdt_ldt_l1tab[gdt_ldt_pt_idx(v)] + \
-     (((v)->vcpu_id << GDT_LDT_VCPU_SHIFT) & (L1_PAGETABLE_ENTRIES - 1)))
-#define pv_ldt_ptes(v) (pv_gdt_ptes(v) + 16)
-
 struct pv_vcpu
 {
     /* map_domain_page() mapping cache. */
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 32d7488cc186..dfaeeb2e2cc2 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -279,7 +279,7 @@ static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
     return create_perdomain_mapping(v->domain, GDT_VIRT_START(v),
                                     1U << GDT_LDT_VCPU_SHIFT,
-                                    v->domain->arch.pv.gdt_ldt_l1tab,
+                                    NIL(l1_pgentry_t *),
                                     NULL);
 }
 
@@ -349,8 +349,6 @@ void pv_domain_destroy(struct domain *d)
     pv_l1tf_domain_destroy(d);
 
     XFREE(d->arch.pv.cpuidmasks);
-
-    FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
 }
 
 void noreturn cf_check continue_pv_domain(void);
@@ -366,12 +364,6 @@ int pv_domain_initialise(struct domain *d)
 
     pv_l1tf_domain_init(d);
 
-    d->arch.pv.gdt_ldt_l1tab =
-        alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
-    if ( !d->arch.pv.gdt_ldt_l1tab )
-        goto fail;
-    clear_page(d->arch.pv.gdt_ldt_l1tab);
-
     if ( levelling_caps & ~LCAP_faulting &&
          (d->arch.pv.cpuidmasks = xmemdup(&cpuidmask_defaults)) == NULL )
         goto fail;
-- 
2.46.0


