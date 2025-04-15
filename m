Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308CBA8A2D0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 17:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954136.1348490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iIx-0005Wf-Gl; Tue, 15 Apr 2025 15:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954136.1348490; Tue, 15 Apr 2025 15:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iIx-0005TW-Dd; Tue, 15 Apr 2025 15:34:31 +0000
Received: by outflank-mailman (input) for mailman id 954136;
 Tue, 15 Apr 2025 15:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4iIv-0005R7-Tk
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 15:34:29 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d5f11a7-1a0f-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 17:34:27 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso7616678b3a.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 08:34:27 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73bd22f12dbsm8943887b3a.102.2025.04.15.08.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:34:25 -0700 (PDT)
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
X-Inumbo-ID: 1d5f11a7-1a0f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744731266; x=1745336066; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlqZUNPuLv+pOnZTQp+GI/8I93asdoKxzx2oKrG7xfI=;
        b=IT4CGOAToZ0c0T1c5fnU5rrOfAF2LdYaiNUrek0Voma5R6iSG81+Iv6c8vKF90c6/v
         K740w8ki6U9Ytz9Vd6j4TmWQR+j9TPiDcj/6Sq93Il5lWwgLGNSvhGXajA79k9oj37gl
         TngUOwspQ3HQ+4w7FAI1Ai69K32P4iPCegzM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731266; x=1745336066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlqZUNPuLv+pOnZTQp+GI/8I93asdoKxzx2oKrG7xfI=;
        b=O6xkjfdReLkwz2OV/rAYOPIhqSaWLTbg59eXFDsxIAZ9j3MatPJL9gFPMYYl1v+OhU
         lXpm/EFxf/AiNzNvLYQ/ixP7vhr8W1qEG4NXJIRDpN+nea+UJnubStuHLH3krEjxaL+J
         XNublJD4UXQZiVpjiRnzZ8A5hzfL9PEC+Q7fKSFoCr+6E/EH4HAcO5C0Ib+lb1O6r27C
         2qRoId48CyEfCidVug8/wP4883u59VhF5TDxZlJMhz9WXe4LuC0HVuQhQBJmAQYHhOAn
         Wu80/P2pq96nVc92NPTbLiwfXqLTET9EKPMUaQN2CEx8pyusaL+gCYiqo9KKRw0rvEsR
         afeA==
X-Gm-Message-State: AOJu0YxyZlpT2j1mwQxOpDpqoglBd7nB7OrHGZecZbY5OH6RtgeLr8NL
	5KsFGaGzsKOpmcw/uStlqjntrsxUCK4cNpK1WTYdHF1E0ggVUSm2ojGEkwxouhQYOSKnmJNe0Va
	F
X-Gm-Gg: ASbGncvdMq6B/2cWGNQfu+hhCCgSvuYbJrDKlzVoYfGQ7/6gvqDk3dNyd9+6L7u1S+b
	RzhbhwjRIcCYk7ZPUp1gIjp63UobUxK19d6uVC9Cnd7zfYQB0K85UbTd64Ow9d9mg8Cr5GbYvke
	1Cufwq9uGrZtgOhZkUEy2ygAStGBIbGSkc4uL8/6Qbt1LHF1LagO3FNeUuzhpZ+qKj8VohC8Opx
	1e2R4uUv+919jGQ+pA3aLTyHhRSSt6wlezjraCdVuBV5LBDD4H6jbi4qA2FQaksgk/4wvIsaAmi
	uj02S9nzS4CCWZuiCgLAJS0wqvyjGtF0UX2Pi/SKb7ISnw==
X-Google-Smtp-Source: AGHT+IElxls2EyiXwPCSrQoV4cONCV3AT4jTecXt3mh7u3UVlqgLDfD1OJbNLGN7BfPksU0uWUj4tg==
X-Received: by 2002:a05:6a00:2348:b0:736:a77d:5412 with SMTP id d2e1a72fcca58-73bd12003b7mr23579608b3a.12.1744731265695;
        Tue, 15 Apr 2025 08:34:25 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 3/4] x86/hvm: only register the r/o subpage ops when needed
Date: Tue, 15 Apr 2025 17:32:45 +0200
Message-ID: <20250415153246.81688-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415153246.81688-1-roger.pau@citrix.com>
References: <20250415153246.81688-1-roger.pau@citrix.com>
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
index f59c7816fba5..3bc6304d831c 100644
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


