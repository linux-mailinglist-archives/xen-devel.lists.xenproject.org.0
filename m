Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B898BFD5A
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 14:40:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718777.1121277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaA-0002oG-3V; Wed, 08 May 2024 12:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718777.1121277; Wed, 08 May 2024 12:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4ga9-0002ha-Sc; Wed, 08 May 2024 12:39:37 +0000
Received: by outflank-mailman (input) for mailman id 718777;
 Wed, 08 May 2024 12:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nIi=ML=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s4ga8-0002b0-Io
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 12:39:36 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06a4974f-0d38-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 14:39:35 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso82820181fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 05:39:35 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 uj4-20020a170907c98400b00a599f876c28sm5984439ejc.38.2024.05.08.05.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 05:39:33 -0700 (PDT)
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
X-Inumbo-ID: 06a4974f-0d38-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715171974; x=1715776774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1Ga1HBZRTHKI6NaCRCof9WPNhoGPFDq14GP1TJIEi4=;
        b=BHV9QNW2x0qZztkc5PVqx/fyWqk4cKREUIPyFLbTbO3/mqjEmTsbsvbdxUoYLqg3Xr
         YgkY7xf6sE1PaLSkm+QRKI6F/2mCVsBOvSICXZx5sW2SAx9p0sYDA0Nzy12AdzIvEipt
         mTkPGwcLccNm/jMcKX+DxzfgOPFyXcLVSlkGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171974; x=1715776774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1Ga1HBZRTHKI6NaCRCof9WPNhoGPFDq14GP1TJIEi4=;
        b=iPbKKupU/JH/J/P3CC4e1rQ/+oIzgggFy8afZ+D7o+38fjA/0ElxyLNZlkVG6SBqHM
         8WSaHEVjgtDv+LuOYq9tOwI4KV+LV6xwKBiZH9BXn1B/DoR2Vr+oTvmrq3guZA0QMSZf
         piFWjeYii/Z1iEaA7j8V9s+sVnbSnR9uZspvdIEdWuW5VHZwVNAdgOnxXGcXSrCGoI42
         XKbi6ubW2FrmTijPRBMc7BC5V1FcLjbJfkjRfdjpI20UtHK0jXz1mNfzgPsX9rz5KbiP
         m/3sYfAvxmQzclPqXHPsd2pMLGyM3xGCeSkN93MB2IMt6lercpWDXdKpbikI7FUMMcmq
         Tsvw==
X-Gm-Message-State: AOJu0YzI6kozmeRt4lCcqMhJul6Kg5YhLkkY6VxP2VnvF1lPjnvxdKuw
	tYe85I10SCBm/haulTFpnayUcO2Ox4Cz5IYDj2B5yIHMxLTGGcA6dtfsxmck1ZPtD7No7uSCa5p
	k
X-Google-Smtp-Source: AGHT+IEsG9Cq9YdVt5/5FaGqvZELl/kornKj55RPE+pogIXnucFJ/moPPpMWOe3cSMbfkfmVqhtlVQ==
X-Received: by 2002:a2e:a6a1:0:b0:2d8:8fb6:a53d with SMTP id 38308e7fff4ca-2e4476995aamr17025641fa.42.1715171974299;
        Wed, 08 May 2024 05:39:34 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/8] x86/vlapic: Move lapic_load_hidden migration checks to the check hook
Date: Wed,  8 May 2024 13:39:22 +0100
Message-Id: <499e029a7d2fce4fb9118b1e508313f369b37c79.1715102098.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715102098.git.alejandro.vallejo@cloud.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While at it, add a check for the reserved field in the hidden save area.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * New patch. Addresses the missing check for rsvd_zero in v1.
---
 xen/arch/x86/hvm/vlapic.c | 41 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 8a244100009c..2f06bff1b2cc 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1573,35 +1573,54 @@ static void lapic_load_fixup(struct vlapic *vlapic)
                v, vlapic->loaded.id, vlapic->loaded.ldr, good_ldr);
 }
 
-static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
+static int cf_check lapic_check_hidden(const struct domain *d,
+                                       hvm_domain_context_t *h)
 {
     unsigned int vcpuid = hvm_load_instance(h);
-    struct vcpu *v;
-    struct vlapic *s;
+    struct hvm_hw_lapic s;
 
     if ( !has_vlapic(d) )
         return -ENODEV;
 
     /* Which vlapic to load? */
-    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
+    if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no apic%u\n",
                 d->domain_id, vcpuid);
         return -EINVAL;
     }
-    s = vcpu_vlapic(v);
 
-    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
+    if ( hvm_load_entry_zeroextend(LAPIC, h, &s) )
+        return -ENODATA;
+
+    /* EN=0 with EXTD=1 is illegal */
+    if ( (s.apic_base_msr & (APIC_BASE_ENABLE | APIC_BASE_EXTD)) ==
+         APIC_BASE_EXTD )
+        return -EINVAL;
+
+    /*
+     * Fail migrations from newer versions of Xen where
+     * rsvd_zero is interpreted as something else.
+     */
+    if ( s.rsvd_zero )
         return -EINVAL;
 
+    return 0;
+}
+
+static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
+{
+    unsigned int vcpuid = hvm_load_instance(h);
+    struct vcpu *v = d->vcpu[vcpuid];
+    struct vlapic *s = vcpu_vlapic(v);
+
+    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
+        BUG();
+
     s->loaded.hw = 1;
     if ( s->loaded.regs )
         lapic_load_fixup(s);
 
-    if ( !(s->hw.apic_base_msr & APIC_BASE_ENABLE) &&
-         unlikely(vlapic_x2apic_mode(s)) )
-        return -EINVAL;
-
     hvm_update_vlapic_mode(v);
 
     return 0;
@@ -1643,7 +1662,7 @@ static int cf_check lapic_load_regs(struct domain *d, hvm_domain_context_t *h)
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden, NULL,
+HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden, lapic_check_hidden,
                           lapic_load_hidden, 1, HVMSR_PER_VCPU);
 HVM_REGISTER_SAVE_RESTORE(LAPIC_REGS, lapic_save_regs, NULL,
                           lapic_load_regs, 1, HVMSR_PER_VCPU);
-- 
2.34.1


