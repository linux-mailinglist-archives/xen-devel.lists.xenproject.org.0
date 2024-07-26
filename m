Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1793D625
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765511.1176139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMuu-0000Nj-1I; Fri, 26 Jul 2024 15:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765511.1176139; Fri, 26 Jul 2024 15:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMut-0000M7-Ty; Fri, 26 Jul 2024 15:31:35 +0000
Received: by outflank-mailman (input) for mailman id 765511;
 Fri, 26 Jul 2024 15:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMut-00084Z-0f
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:35 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23a1d1c0-4b64-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:31:34 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7a1d066a5daso54328585a.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:34 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d7435509sm186366385a.84.2024.07.26.08.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:32 -0700 (PDT)
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
X-Inumbo-ID: 23a1d1c0-4b64-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007893; x=1722612693; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrZv9tGqnq3TAI08DUcqWZ+fCYOfSGrET03dF6dNqU8=;
        b=LWAZeWxM1RrL3oPCtb/SlPeV3IUT8Y/eIxtOTRRWgRsIs2h/NFMsJ/NoAfJyAfwAl/
         GNC+SCQBOzU0VCS/Usu+txSi5OnEoyFHEr66tLliUmOrttD6sR6FWW909sKdNohckBMD
         /K47COWDH369FaK/nfYYjHjx0pqooqmpwWKrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007893; x=1722612693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrZv9tGqnq3TAI08DUcqWZ+fCYOfSGrET03dF6dNqU8=;
        b=bYyhwcTbZJq75L364o62P+3fTbw8nzO9PjjG2jtuG3B8fMliTpZ2t5lOKJ4ELqfu12
         4UFw+i6uNpVlSJzeLk4bzNLIhSBqd6F5dLdiv4MW+RQa3UrYH1QzuKOBp0ex/51FCqPC
         GyUtexGnPAyA3fJ7m1F2hOjNPHR774qRuM7umFzP/cLDpOhvhtBe44sc2kogBhWicLbb
         NQB3EoldSSZHeZHxRXjZADxyDWcP0tG8Yo/JpMHJp1K76/36zbSl9zYSvJ9mk1TYxtC9
         ZP3d3/xOLL2B+JAPcpxZutO7J39E+h480bl17i3n0ITO3vRlhbBE9/geK24D8esWPW8H
         hJ1g==
X-Gm-Message-State: AOJu0YweFinyxLbWH0nRkJlFTkPVGVnqAfJ4WWalaYdOclFBB+rKucGG
	KYweSxPfOfl0zjkCKoQSIhI+HnvuQbvQxQNjyVE1GvIRGYYbvbIljSGOGeDPdNX6KAz9mKBLvmH
	Z
X-Google-Smtp-Source: AGHT+IGyDtkAcj5IZPqhstlPoxGGp6hPgDdq+Y1SNHkmt0iu6GWc2+FI5Kc9gUzSMVGbOCdn/uQB2g==
X-Received: by 2002:a05:620a:f11:b0:79f:1869:11fe with SMTP id af79cd13be357-7a1e52b5ecbmr6452485a.52.1722007892781;
        Fri, 26 Jul 2024 08:31:32 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 03/22] x86/dom0: only disable SMAP for the PV dom0 build
Date: Fri, 26 Jul 2024 17:21:47 +0200
Message-ID: <20240726152206.28411-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PVH dom0 builder doesn't switch page tables and has no need to run with
SMAP disabled.

Put the SMAP disabling close to the code region where it's necessary, as it
then becomes obvious why switch_cr3_cr4() is required instead of
write_ptbase().

Note removing SMAP from cr4_pv32_mask is not required, as we never jump into
guest context, and hence updating the value of cr4_pv32_mask is not relevant.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/dom0_build.c | 13 ++++++++++---
 xen/arch/x86/setup.c         | 17 -----------------
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index d8043fa58a27..41772dbe80bf 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -370,6 +370,7 @@ int __init dom0_construct_pv(struct domain *d,
     unsigned long alloc_epfn;
     unsigned long initrd_pfn = -1, initrd_mfn = 0;
     unsigned long count;
+    unsigned long cr4;
     struct page_info *page = NULL;
     unsigned int flush_flags = 0;
     start_info_t *si;
@@ -814,8 +815,14 @@ int __init dom0_construct_pv(struct domain *d,
     /* Set up CR3 value for switch_cr3_cr4(). */
     update_cr3(v);
 
+    /*
+     * Temporarily clear SMAP in CR4 to allow user-accesses when running with
+     * the dom0 page-tables.  Cache the value of CR4 so it can be restored.
+     */
+    cr4 = read_cr4();
+
     /* We run on dom0's page tables for the final part of the build process. */
-    switch_cr3_cr4(cr3_pa(v->arch.cr3), read_cr4());
+    switch_cr3_cr4(cr3_pa(v->arch.cr3), cr4 & ~X86_CR4_SMAP);
     mapcache_override_current(v);
 
     /* Copy the OS image and free temporary buffer. */
@@ -836,7 +843,7 @@ int __init dom0_construct_pv(struct domain *d,
              (parms.virt_hypercall >= v_end) )
         {
             mapcache_override_current(NULL);
-            switch_cr3_cr4(current->arch.cr3, read_cr4());
+            switch_cr3_cr4(current->arch.cr3, cr4);
             printk("Invalid HYPERCALL_PAGE field in ELF notes.\n");
             return -EINVAL;
         }
@@ -978,7 +985,7 @@ int __init dom0_construct_pv(struct domain *d,
 
     /* Return to idle domain's page tables. */
     mapcache_override_current(NULL);
-    switch_cr3_cr4(current->arch.cr3, read_cr4());
+    switch_cr3_cr4(current->arch.cr3, cr4);
 
     update_domain_wallclock_time(d);
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eee20bb1753c..bc387d96b519 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -955,26 +955,9 @@ static struct domain *__init create_dom0(const module_t *image,
         }
     }
 
-    /*
-     * Temporarily clear SMAP in CR4 to allow user-accesses in construct_dom0().
-     * This saves a large number of corner cases interactions with
-     * copy_from_user().
-     */
-    if ( cpu_has_smap )
-    {
-        cr4_pv32_mask &= ~X86_CR4_SMAP;
-        write_cr4(read_cr4() & ~X86_CR4_SMAP);
-    }
-
     if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
-    if ( cpu_has_smap )
-    {
-        write_cr4(read_cr4() | X86_CR4_SMAP);
-        cr4_pv32_mask |= X86_CR4_SMAP;
-    }
-
     return d;
 }
 
-- 
2.45.2


