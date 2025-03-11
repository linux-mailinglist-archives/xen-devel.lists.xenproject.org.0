Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B9FA5C028
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 13:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908021.1315198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryO7-0005qU-UH; Tue, 11 Mar 2025 12:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908021.1315198; Tue, 11 Mar 2025 12:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryO7-0005ny-R9; Tue, 11 Mar 2025 12:07:11 +0000
Received: by outflank-mailman (input) for mailman id 908021;
 Tue, 11 Mar 2025 12:07:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tryO6-0005a1-Du
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 12:07:10 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ab14304-fe71-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 13:07:08 +0100 (CET)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-300f92661fcso2269130a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 05:07:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2ff4e773dddsm11737657a91.12.2025.03.11.05.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 05:07:06 -0700 (PDT)
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
X-Inumbo-ID: 5ab14304-fe71-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741694827; x=1742299627; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jErcxw8hXwlteixzxl0LBLAgfAmaGdNXQV4dueoQeA=;
        b=mxmuypI8V+xpxTKO2mU0bpCyRDtODasePgLM5GBEHR4r+3SIVF0QS4nBObVFehvGzU
         Ni/FqKv49n1iMfmy3wWOqi3edQcMit3mGANDmxA7lBGMIIVw0z8uTdcFy3CPpfNqqm6b
         U01qZnL4oej+xZluhA6CtlM9uzlVjR8vBvP4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741694827; x=1742299627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jErcxw8hXwlteixzxl0LBLAgfAmaGdNXQV4dueoQeA=;
        b=hFNRSyvw5rw82+uoWzMS7cN2Y9dM0mqSCkbpu5Btqm9q8wi6eta85QN4GVlKRgSorz
         MwGWRGhMRXb0gQcpU+CIyv2xVLZqqaxyBeXajNZ+Vf1ia1++giLnbDTp0KTXYCvwLcz6
         hTGJSC7DZntDtURyITyFoILuZzNA36+4M5/L5DELY4PaJ8vYhEwk1W0aw+BZ0IK/g0J0
         AOegbtdJx/lM5VvXiIodBMVgg93kSnHUcR9gysXiOtDfchf6b85l3ySHNpoEavEGxmp0
         dPvtT4HoH6+Ck2i3mQh6Ln56iJqOaWSFTuPmz5v6B1a4NFZUiG4mxz7iCfExAbEMPJ8N
         t1bw==
X-Gm-Message-State: AOJu0Yx4N3xhyFK7MLDC83lr7/TBLIeBRuPhs7SBjO+aIp3aV0PQqRDA
	RCCMr78rLTaLHijtRE+thQY/X1pk5lfqqfWmXdZd4+YV2S/CkwEphgEYRd3WNWdmvTRINcRlr1/
	B
X-Gm-Gg: ASbGncvqMkPyazv86oZy7rPPFtn5YhNN9ijtGGOwZttNKwHkg/CgW7tWsf2en6arVJW
	FfvMCs7KnnQRhlwX0P0jGw0BQXs70V9ojfeHNfbxknB7/phjtZUkHknIMRlo00h1iye7yuIsLaT
	BqWAf4pXyq1Uzokp1lSaAs6Z6P8Dcb9iwMzIc2lFNgT2Y/LteuWZXs+A3rb2oxp651H4NzkdMwu
	/JnE5b6398pFuhl3KG6A8kkSHSYE9MIS/tc4IjckijPcT/m0jiNW2Jc+f7u8IY8X8lREuTpkev+
	8SWvS0oHNaGnEXNQlwumNq/VDpid8bg4po/vWwSJoyXNWnjOKL04KTI=
X-Google-Smtp-Source: AGHT+IEckJW2JtOIBmxT4Hmkwecoki/J7UEiV+z216vrUg+iTQcfRhZ/wdd465edtUY+ZOJlGiV+rg==
X-Received: by 2002:a17:90a:d605:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-2ff7cf128cdmr24469073a91.30.1741694826779;
        Tue, 11 Mar 2025 05:07:06 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 1/3] x86/vmx: fix posted interrupts usage of msi_desc->msg field
Date: Tue, 11 Mar 2025 13:06:50 +0100
Message-ID: <20250311120652.61366-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311120652.61366-1-roger.pau@citrix.com>
References: <20250311120652.61366-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current usage of msi_desc->msg in vmx_pi_update_irte() will make the
field contain a translated MSI message, instead of the expected
untranslated one.  This breaks dump_msi(), that use the data in
msi_desc->msg to print the interrupt details.

Fix this by introducing a dummy local msi_msg, and use it with
iommu_update_ire_from_msi().  vmx_pi_update_irte() relies on the MSI
message not changing, so there's no need to propagate the resulting msi_msg
to the hardware, and the contents can be ignored.

Fixes: a5e25908d18d ('VT-d: introduce new fields in msi_desc to track binding with guest interrupt')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - New in this version.
---
 xen/arch/x86/hvm/vmx/vmx.c     | 9 ++++++++-
 xen/arch/x86/include/asm/msi.h | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0241303b4bf4..c407513af624 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -396,6 +396,13 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
     const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
     struct irq_desc *desc;
     struct msi_desc *msi_desc;
+    /*
+     * vmx_pi_update_irte() relies on the IRTE already being setup, and just
+     * updates the guest vector, but not the other IRTE fields.  As such the
+     * contents of msg are not consumed by iommu_update_ire_from_msi().  Even
+     * if not consumed, zero the contents to avoid possible stack leaks.
+     */
+    struct msi_msg msg = {};
     int rc;
 
     desc = pirq_spin_lock_irq_desc(pirq, NULL);
@@ -415,7 +422,7 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
 
     ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
 
-    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
+    return iommu_update_ire_from_msi(msi_desc, &msg);
 
  unlock_out:
     spin_unlock_irq(&desc->lock);
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 378b85ee947b..975d0f26b35d 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -124,7 +124,7 @@ struct msi_desc {
     int irq;
     int remap_index;         /* index in interrupt remapping table */
 
-    struct msi_msg msg;      /* Last set MSI message */
+    struct msi_msg msg;      /* Last set MSI message (untranslated) */
 };
 
 /*
-- 
2.48.1


