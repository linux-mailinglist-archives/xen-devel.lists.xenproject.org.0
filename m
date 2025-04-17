Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6CAA92172
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958060.1351050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R8V-0008NF-6B; Thu, 17 Apr 2025 15:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958060.1351050; Thu, 17 Apr 2025 15:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R8V-0008H1-1K; Thu, 17 Apr 2025 15:26:43 +0000
Received: by outflank-mailman (input) for mailman id 958060;
 Thu, 17 Apr 2025 15:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dr0F=XD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u5R8T-0008DN-Mg
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:26:41 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ba55f2f-1ba0-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 17:26:39 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so169421466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:26:39 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acb6ef49ff9sm6960166b.158.2025.04.17.08.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 08:26:38 -0700 (PDT)
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
X-Inumbo-ID: 5ba55f2f-1ba0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744903599; x=1745508399; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlVYLyYWAUO1qIZHmr5fhD6GhFwX8NqKxwynFR0F9X4=;
        b=DZPQvM1+YoqBGpkHaSMwMmZ21QeP8ACrOPAFGHUyTG05bTMtpYqoHISsMNj3stplq4
         SvlFr/piTu+z75A87bvFIUoTQxGJjLO3JoO/s3Ret9nDxNoqRoeTHR/E9Aa5QbSR7jbt
         suNFgQB8ojjTTcChke63DFnZeOQENcywlg/+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903599; x=1745508399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlVYLyYWAUO1qIZHmr5fhD6GhFwX8NqKxwynFR0F9X4=;
        b=fuLhtwiifTMIRdYI38O/DHx3dF6Alx2WIR7/SiPckDm3+sT4lc659E1isD9cF2o3c/
         mS9uyzG2K9U23GrjrvBGqmV7mrWb47x09Ei+Sm7bSnjmX3zZfNRuIJ08O0XVKPo3tFZ2
         qu9LtDzr9XSmst6oZMhgkvy989EVTFKFVzOBGdYwnQ+bMCzHWffm7LPdYbEfRH5fhCha
         GM5l0P3HTwkF/FzmJbI6Web+Ggfmlfs2ClqYpHMz42nBBfN9fdaDTCIy+l31/AuakkCG
         f/GylwCwMjae+hPrrZBPzEhNtzBoGjV6vSIwNXeTAlkG/yBmHGwymvqOb7W1wEUO+4X1
         79XQ==
X-Gm-Message-State: AOJu0YxKnQRw/iPf67OZt2Pc/PWQyEibqRoDfiOYA1Lei+20+T0W3jpp
	j+C71/3R2zM4aCp5MnjTxYdI/8/OmCO0wSV3a6KO/lWBo946vOUDIMAZQHehE7Fce2NP3ai6VvX
	F
X-Gm-Gg: ASbGnctQWuD0AB9zumxij3bMdTk0c1ewUl+GnSutxmdHRtwrMq2YROaLc2pzLmiRUME
	8qPICGTf2gIAuoSZ20l9zBFq4R+XbleBY/N8xXJPhy71+6C14zJRo7aj8dPW48tFQk5eG/4msp6
	iNLj2uyPR9t8UGMi4vzAYifjezDhLDsYlcF8NIgZ5h7X8RQpb1nNarQvinFGsdgaTSrf/F69GUN
	Ap0K49c5ZDFDKyIhiAcdiQ7csgjIzddAGI3sz/XKa5nwwfTdvah1xttdGgmFgvVs7zQj6rS/qKb
	bl9zLx9VSTS5dTMkBq/7I89E63256tGokT+gttJs9150+g==
X-Google-Smtp-Source: AGHT+IEjtDGr3KBxOOYrHt3tvSp0cCDG3W62MSRWQ3BSwNHZDAGR5nyG+qaBsUUNVt0KAK0ZN1KaZw==
X-Received: by 2002:a17:907:7b87:b0:ac7:f2b9:ec3b with SMTP id a640c23a62f3a-acb428748d0mr562364966b.4.1744903598736;
        Thu, 17 Apr 2025 08:26:38 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 3/4] x86/hvm: only register the r/o subpage ops when needed
Date: Thu, 17 Apr 2025 17:25:13 +0200
Message-ID: <20250417152514.13702-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417152514.13702-1-roger.pau@citrix.com>
References: <20250417152514.13702-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MMIO operation handlers can be expensive to process, hence attempt to
register only those that will be needed by the domain.

Subpage r/o MMIO regions are added exclusively at boot, further limit their
addition to strictly before the initial domain gets created, so by the time
initial domain creation happens Xen knows whether subpage is required or
not.  This allows only registering the MMIO handler when there are
subpage regions to handle.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Could possibly be part of the previous patch, but strictly speaking is an
improvement, as even before the previous patch subpage r/o was always
called even when no subpage regions are registered.
---
 xen/arch/x86/hvm/hvm.c        |  3 ++-
 xen/arch/x86/include/asm/mm.h |  1 +
 xen/arch/x86/mm.c             | 16 ++++++++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 6b998387e3d8..4cb2e13046d1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -692,7 +692,8 @@ int hvm_domain_initialise(struct domain *d,
 
     register_portio_handler(d, XEN_HVM_DEBUGCONS_IOPORT, 1, hvm_print_line);
 
-    register_subpage_ro_handler(d);
+    if ( subpage_ro_active() )
+        register_subpage_ro_handler(d);
 
     if ( hvm_tsc_scaling_supported )
         d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index c2e9ef6e5023..aeb8ebcf2d56 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -561,6 +561,7 @@ struct subpage_ro_range {
     void __iomem *mapped;
     DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
 };
+bool subpage_ro_active(void);
 struct subpage_ro_range *subpage_mmio_find_page(mfn_t mfn);
 void __iomem *subpage_mmio_map_page(struct subpage_ro_range *entry);
 void subpage_mmio_write_emulate(
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 927beb6f07aa..0e29bab03a95 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4922,6 +4922,11 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+bool subpage_ro_active(void)
+{
+    return !list_empty(&subpage_ro_ranges);
+}
+
 struct subpage_ro_range *subpage_mmio_find_page(mfn_t mfn)
 {
     struct subpage_ro_range *entry;
@@ -5011,6 +5016,17 @@ int __init subpage_mmio_ro_add(
          !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
         return -EINVAL;
 
+    /*
+     * Force all r/o subregions to be registered before initial domain
+     * creation, so that the emulation handlers can be added only when there
+     * are pages registered.
+     */
+    if ( system_state >= SYS_STATE_smp_boot )
+    {
+        ASSERT_UNREACHABLE();
+        return -EILSEQ;
+    }
+
     if ( !size )
         return 0;
 
-- 
2.48.1


