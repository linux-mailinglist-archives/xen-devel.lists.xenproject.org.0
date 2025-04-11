Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD49A85A8E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947032.1344793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1h-0000w8-J5; Fri, 11 Apr 2025 10:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947032.1344793; Fri, 11 Apr 2025 10:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1h-0000sa-CC; Fri, 11 Apr 2025 10:54:25 +0000
Received: by outflank-mailman (input) for mailman id 947032;
 Fri, 11 Apr 2025 10:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u3C1e-00006D-UF
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:54:22 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53807e62-16c3-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 12:54:22 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso1272803f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 03:54:22 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f23572c43sm82403165e9.25.2025.04.11.03.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:54:21 -0700 (PDT)
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
X-Inumbo-ID: 53807e62-16c3-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744368862; x=1744973662; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFhz/3cflKTytjOy30j+Pi6jdQU9sMKV9FECJ7J0Ano=;
        b=Ni+fVMoCQ9nt9H2ozIjd0Wv0GypwFdAaBt96TuuMdhc4mBWeMUMIpk6SfhPR2DFipM
         7FJWPY2Ch5EpqV1SiBvNszHwnmR/UlZyIA/8VnKTLSvxDOajfLDNbM1IzQ8QtZCIAKTH
         M7fu/ZO536nLXBvjhY/VA/ERyaj20Wx/VlJnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368862; x=1744973662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFhz/3cflKTytjOy30j+Pi6jdQU9sMKV9FECJ7J0Ano=;
        b=evSWsJhjyoEayctY5I4obERNwPBs1/X1JyAb1jU8yHTcdVki111S2LJ0mdCcF98p3Q
         4C7D6cMP9mQubsw3lEkc0hlhGypmvvapq2qYnVLh2kAkUTyFhFfknQJxaZ2VHFVYlx0H
         +RRuC/0MPk4v7tgkDKnBhozl/HTR3vY0zK5jyp5/QslYwhn47Aa8jdTMXeUtSuT489kB
         PeMcebdshjabMMiTbY7Ht4eCrrhv0GDY00OGY47A8mp2GOLEDsAc8oUUctGyImHKm/Uw
         3ulLCl3qtqDnnd6MlMTOPxrEcIguZviWlbacs8Y1dTJxXtBTaEiGdx9YP81NDLaiYUqf
         PfEA==
X-Gm-Message-State: AOJu0YwuLbHeoFoftQbwKgDB8DbQE+7PfggYJUhFfdyEBB/rQzZdFTYs
	Qn979/8vHLdULVfu4H+i5escx/YtbfHUTD7IRLk4Bjej0jRRemr1srXglJYzXXeCNtogBl3fWFZ
	h
X-Gm-Gg: ASbGncvEpU6BBYsCiu17XZ551ZuUaEiLN/qS6Wjto5/zsOwnO9clVA4FjYZvyJcS9ay
	dRncuIOFh5icCJQB16Nsaz6MmWnTX54HriBB7wJ2IyiQorhW6OxldDLWWNmpt3EAPHCOX6OQfnC
	raBDqnlQ3LZTMDceSQUfvS9qmFrhcyUtryqCCc56NtiwUCOpCauL8LToFAUIrBmzr+qGRFXDdDR
	9EsRoCDLcNzGmuTR9nqfwXzNMY8oUptcqvQq1RiwzDtqRoy3DXYg7JE/p6Ej5fle2Kq10LTVUaT
	jhaj6j4PAdzZOeqFWbTz3YqLM2b9EfXut/qWF6acFbtIbw==
X-Google-Smtp-Source: AGHT+IEbyOBim1v2/GKVwjHB+iS4/e2fy+s9USNITR5vi4Tk/b0C1eOSXzyhtYa89axBqOagWFkDew==
X-Received: by 2002:a05:6000:420d:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39d8f4dbfd5mr5817723f8f.24.1744368861666;
        Fri, 11 Apr 2025 03:54:21 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 4/5] x86/hvm: only register the r/o subpage ops when needed
Date: Fri, 11 Apr 2025 12:54:10 +0200
Message-ID: <20250411105411.22334-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411105411.22334-1-roger.pau@citrix.com>
References: <20250411105411.22334-1-roger.pau@citrix.com>
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
---
Could possibly be part of the previous patch, but strictly speaking is an
improvement, as even before the previous patch subpage r/o was always
called even when no subpage regions are registered.
---
 xen/arch/x86/hvm/hvm.c        |  5 +++--
 xen/arch/x86/include/asm/mm.h |  1 +
 xen/arch/x86/mm.c             | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 21f005b0947c..1a5dfc07813d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -764,8 +764,9 @@ int hvm_domain_initialise(struct domain *d,
 
     register_portio_handler(d, XEN_HVM_DEBUGCONS_IOPORT, 1, hvm_print_line);
 
-    /* Handler for r/o MMIO subpage accesses. */
-    register_mmio_handler(d, &subpage_mmio_ops);
+    if ( subpage_ro_active() )
+        /* Handler for r/o MMIO subpage accesses. */
+        register_mmio_handler(d, &subpage_mmio_ops);
 
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


