Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0EC93D62B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765528.1176220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMvD-0003KZ-1f; Fri, 26 Jul 2024 15:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765528.1176220; Fri, 26 Jul 2024 15:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMvC-0003ES-Si; Fri, 26 Jul 2024 15:31:54 +0000
Received: by outflank-mailman (input) for mailman id 765528;
 Fri, 26 Jul 2024 15:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvA-00084Z-O4
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:52 +0000
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e24b3cc-4b64-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:31:52 +0200 (CEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-709340f1cb1so493262a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8fccc8sm17632336d6.46.2024.07.26.08.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:50 -0700 (PDT)
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
X-Inumbo-ID: 2e24b3cc-4b64-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007910; x=1722612710; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hWSsSoEx0LARRjSkgW9NcJZyDQpP6n7zvGlI2J4wyQ=;
        b=v7xk+VQpkTsZaEZbp0MkbxyouX2fEB72+40E+mLROAPvWNn58REHd/zvN3AquF+Ysv
         UW0racs50Rl1qNQbmjlaFIlSocIJHwphDdP0fx8CRSCwEu6ZD+YBg472Tjtfqzv2r4xt
         74/VQwUmnHAsqRTUs/4RMKofyza/wXZNQWF4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007910; x=1722612710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hWSsSoEx0LARRjSkgW9NcJZyDQpP6n7zvGlI2J4wyQ=;
        b=ROtqgqIGTXjVk5X7sc1Zr195RGha1xKHygC+WYDy6JVc+r5mOjOwjni1CAAqZu4Clo
         s32cIojzSsLMwFAtr8Qnrxwz8AJ/kUskc5pjt83O2+Xp18Kj5ZFeqDB067ettVBryHpe
         SJEqsCVMNymPZIM7VoljhJYlPgyfLBiytt7xLqIZINHVg3bsfzCDd5I7/2Yv7gsuvixV
         KosdqHo9fd1LHJC90gNEaqn0XzM0qGryrDvsz/1vJPB31Ju4Zr2ETrHAkccH/kgqjhW4
         D1H5U6JB+8vcAmNJKuB+b47zkj7ryjP01NpQnqfNRREY6731Ep94IYA8ZbOHyXf8cceL
         fAvA==
X-Gm-Message-State: AOJu0Yx8GaEeKhyrjd1l0hWKmKwiVvxLgOipinrfv6RamsXlg5QPfOE3
	y65oSTb/MPWZ3kaBvBmYYC/tJWW8KhdRQ2Mx4eHXK3lNr103FaQ1F+JEr7D7ahWEQMxbe3oV6C/
	W
X-Google-Smtp-Source: AGHT+IHxlzX8le2A7D93UfdcVgHhPUz046St0tOWOrUfJUB4rrBX2JMUFaM2f0ryExX5KYWoktrEzg==
X-Received: by 2002:a05:6830:9c3:b0:708:b2c6:bb41 with SMTP id 46e09a7af769-709321125famr6342877a34.2.1722007910496;
        Fri, 26 Jul 2024 08:31:50 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 11/22] x86/mm: split setup of the per-domain slot on context switch
Date: Fri, 26 Jul 2024 17:21:55 +0200
Message-ID: <20240726152206.28411-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's currently only used for XPTI.  Move the code to a separate helper in
preparation for it gaining more logic.

While there switch to using l4e_write(): in the current context the L4 is
not active when modified, but that could change.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c         | 4 +---
 xen/arch/x86/include/asm/mm.h | 3 +++
 xen/arch/x86/mm.c             | 7 +++++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 3d3c14dbb5ae..9cfcf0dc63f3 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1918,9 +1918,7 @@ void cf_check paravirt_ctxt_switch_to(struct vcpu *v)
     root_pgentry_t *root_pgt = this_cpu(root_pgt);
 
     if ( root_pgt )
-        root_pgt[root_table_offset(PERDOMAIN_VIRT_START)] =
-            l4e_from_page(v->domain->arch.perdomain_l3_pg,
-                          __PAGE_HYPERVISOR_RW);
+        setup_perdomain_slot(v, root_pgt);
 
     if ( unlikely(v->arch.dr7 & DR7_ACTIVE_MASK) )
         activate_debugregs(v);
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 076e7009dc99..2c309f7b1444 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -630,4 +630,7 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
 }
 
+/* Setup the per-domain slot in the root page table pointer. */
+void setup_perdomain_slot(const struct vcpu *v, root_pgentry_t *root_pgt);
+
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a1ac7bdc5b44..35e929057d21 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6362,6 +6362,13 @@ unsigned long get_upper_mfn_bound(void)
     return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
 }
 
+void setup_perdomain_slot(const struct vcpu *v, root_pgentry_t *root_pgt)
+{
+    l4e_write(&root_pgt[root_table_offset(PERDOMAIN_VIRT_START)],
+              l4e_from_page(v->domain->arch.perdomain_l3_pg,
+                            __PAGE_HYPERVISOR_RW));
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
-- 
2.45.2


