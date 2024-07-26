Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7361F93D62A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765519.1176199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMv9-0002W1-Df; Fri, 26 Jul 2024 15:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765519.1176199; Fri, 26 Jul 2024 15:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMv9-0002Nc-89; Fri, 26 Jul 2024 15:31:51 +0000
Received: by outflank-mailman (input) for mailman id 765519;
 Fri, 26 Jul 2024 15:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMv7-00084T-IB
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:49 +0000
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b975213-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:31:47 +0200 (CEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7093abb12edso645859a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:47 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3faf858csm17506806d6.128.2024.07.26.08.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:45 -0700 (PDT)
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
X-Inumbo-ID: 2b975213-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007906; x=1722612706; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oS3y4Ocny/CCyKe8xJHGMa6gk6B7qtxm6NZOH5KyGFA=;
        b=FweycZPOEeJWazdD7sZvnpe5b2hxzBOz9JV55v4lpo3KnNJVIr3kBlJCJv2aLTIKEF
         R9p5fiQTIcUBP4c9kSxkrMo2b8QfMb6+PIaHIhEggeisOvYXXGCaqd5uKfd8Et546XB2
         /2hEWHETZgVex5ho7aD42df2Ri2FdNzw9K+jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007906; x=1722612706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oS3y4Ocny/CCyKe8xJHGMa6gk6B7qtxm6NZOH5KyGFA=;
        b=s2hVURYr8jyDsHUTXuL53bUEdfyb7DzqD733k2oEawwrnOg6WJooD2DxOhQx0TziGA
         wtVu82uomwsletNTd9QGSCWo1Pv5zlY+bOhRpvuvaCHTDeTzrVf66QTxvxWHmhzRelHD
         BZRxGPMY4sjt786ODRyUctXJnklHL9EK2QTvh2rwkQpEWO4Xu+DDxB4fSJE143m68xB6
         M2VAT4UALiRUrrBUFJyBgdp7LKyYvNptZk6SQYrQ6q/ibBL09fwpJK7qeifngGmLlpM4
         TXFvA4f7I4kV3jHRF5PbQP0FxWm6JR2lrdHnF5nfNdjQfLHkW6I3Gq40GMAHxeb4YZuD
         NyDg==
X-Gm-Message-State: AOJu0YwzxYsEATVJWUA/aZh98A2CoNHtzm3ToUL/9gPwM/7xfq4X5KdP
	ho2Fu2DK4jf7WN0NXjSGmz84RjdolHFlhBwCtzeA0KqM7MymcsESaTbIY+cwJguUqdoZrIBbuAs
	0
X-Google-Smtp-Source: AGHT+IEI/SmxM1OVVQwG596ftYXa8ugL3WbsTaRvUruPRnqPk3jpUVflDTDvv9TDG0yYGgBR1OTsCQ==
X-Received: by 2002:a05:6830:668b:b0:703:5c2d:56a7 with SMTP id 46e09a7af769-7093248b4b5mr6952622a34.24.1722007906135;
        Fri, 26 Jul 2024 08:31:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 09/22] x86/pv: untie issuing FLUSH_ROOT_PGTBL from XPTI
Date: Fri, 26 Jul 2024 17:21:53 +0200
Message-ID: <20240726152206.28411-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic gates issuing flush TLB requests with the FLUSH_ROOT_PGTBL
flag to XPTI being enabled.

In preparation for FLUSH_ROOT_PGTBL also being needed when not using XPTI,
untie it from the xpti domain boolean and instead introduce a new flush_root_pt
field.

No functional change intended, as flush_root_pt == xpti.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/domain.h   | 2 ++
 xen/arch/x86/include/asm/flushtlb.h | 2 +-
 xen/arch/x86/mm.c                   | 2 +-
 xen/arch/x86/pv/domain.c            | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index f5daeb182baa..9dd2e047f4de 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -283,6 +283,8 @@ struct pv_domain
     bool pcid;
     /* Mitigate L1TF with shadow/crashing? */
     bool check_l1tf;
+    /* Issue FLUSH_ROOT_PGTBL for root page-table changes. */
+    bool flush_root_pt;
 
     /* map_domain_page() mapping cache. */
     struct mapcache_domain mapcache;
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index bb0ad58db49b..1b98d03decdc 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -177,7 +177,7 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
 
 #define flush_root_pgtbl_domain(d)                                       \
 {                                                                        \
-    if ( is_pv_domain(d) && (d)->arch.pv.xpti )                          \
+    if ( is_pv_domain(d) && (d)->arch.pv.flush_root_pt )                 \
         flush_mask((d)->dirty_cpumask, FLUSH_ROOT_PGTBL);                \
 }
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c01b6712143e..a1ac7bdc5b44 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4167,7 +4167,7 @@ long do_mmu_update(
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
                     if ( !rc )
                         flush_linear_pt = true;
-                    if ( !rc && pt_owner->arch.pv.xpti )
+                    if ( !rc && pt_owner->arch.pv.flush_root_pt )
                     {
                         bool local_in_use = false;
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 6ff71f14a2f2..46ee10a8a4c2 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -384,6 +384,8 @@ int pv_domain_initialise(struct domain *d)
 
     d->arch.ctxt_switch = &pv_csw;
 
+    d->arch.pv.flush_root_pt = d->arch.pv.xpti;
+
     if ( !is_pv_32bit_domain(d) && use_invpcid && cpu_has_pcid )
         switch ( ACCESS_ONCE(opt_pcid) )
         {
-- 
2.45.2


