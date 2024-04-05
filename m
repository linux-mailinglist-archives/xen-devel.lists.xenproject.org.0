Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351808997E8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 10:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701155.1095334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsf19-0001De-QK; Fri, 05 Apr 2024 08:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701155.1095334; Fri, 05 Apr 2024 08:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsf19-0001An-MX; Fri, 05 Apr 2024 08:33:47 +0000
Received: by outflank-mailman (input) for mailman id 701155;
 Fri, 05 Apr 2024 08:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZxKn=LK=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1rsf18-0001Ah-6h
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 08:33:46 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 372e452c-f327-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 10:33:45 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a51a701bc21so36751466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 01:33:45 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170906198f00b00a4e2bf2f743sm569629ejd.184.2024.04.05.01.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 01:33:42 -0700 (PDT)
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
X-Inumbo-ID: 372e452c-f327-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306024; x=1712910824; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbtbyNCk6KsAiwat1danRvLj4rWxtebP2css0h/SV0s=;
        b=gLs/ebYiXXfCvtLXu3DCGwUaXNSI9R4Te60poMWxkyHockE7kdLaQjgBS6NPfKmNpO
         k4foJjlW7/fOkKG1M6YpnpSTiPA5qaKYFsjj7wCVEBCijmhoNGf++/qosH+egBTiO2O4
         dRrMdj59gseVTwB1MmK7foY40J/2QCkRRzHsuPm/qqTv0/uoDlaCnUwWTIz3OZy6V41I
         SmkpL+bwvcdxO8cPn34pgYalaM3yVL/GiZu1WI581r4SjBaz052TOjANJtLyH9sinZbU
         4KAhN3+gD6JyiKlfBOPlBeIFeGTgBNkwWol0t2b1Jsc3My3aX8MZJIWkOSz7Z3x1LF7B
         1fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306024; x=1712910824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbtbyNCk6KsAiwat1danRvLj4rWxtebP2css0h/SV0s=;
        b=rWxDl4XdLERtblCIqq4uww+sFCslLUfmXQMBVHKBEWh9Ylo46T65Tf6lNj2hYIOiT9
         +5e+FpBx4FJfl61dCANQX1LXbHpfYl16ItWIPhQ20EfgUHI1MUwW4pqx6F/Ob1W1emaq
         jyA9qKFrMqZRgZmEvCctEvN9yZjupazviHhEqMtdV09jesh5wTGrsTkLJ1Pup+xrnsct
         N6bIMvZNeXEUyV3nXsuth3Cq+TpGqFghv7AHW2hZ5SmBT1k3MeJMZUydPOMYQqLNmcCX
         A9m7hGRWanjw93BeIIalbu9hSywGAjTX9zz1UXZ51UET937wovQAkHBi0Z33++AMI7y5
         C+Rw==
X-Gm-Message-State: AOJu0YxzHwfNHh+KVyQN1tf4hYh+KaHGWOtWBhtFE/g+Sm4oKHDbdap1
	Lmmm1t1ldhNwwj6IirpaqduP14drVqUcmSSnA9q2OrzmoPSt8I+/FgV8iKf259VmAw==
X-Google-Smtp-Source: AGHT+IEK1RsegEAenrgJrW4WSZu/82Cct3JgprPhVKTKLSfyVFRJ6BM5Hhiuzqsr/VHp0OUWzyXEIw==
X-Received: by 2002:a17:906:c102:b0:a51:abb0:a8a1 with SMTP id do2-20020a170906c10200b00a51abb0a8a1mr221604ejc.54.1712306023519;
        Fri, 05 Apr 2024 01:33:43 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] locking/x86/xen: Use try_cmpxchg() in xen_alloc_p2m_entry()
Date: Fri,  5 Apr 2024 10:32:53 +0200
Message-ID: <20240405083335.507471-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use try_cmpxchg() instead of cmpxchg(*ptr, old, new) == old.

The x86 CMPXCHG instruction returns success in the ZF flag,
so this change saves a compare after CMPXCHG.

Also, try_cmpxchg() implicitly assigns old *ptr value to "old"
when CMPXCHG fails. There is no need to explicitly assign
old *ptr value to the temporary, which can simplify the
surrounding source code.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/xen/p2m.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 9bdc3b656b2c..99918beccd80 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -555,7 +555,6 @@ int xen_alloc_p2m_entry(unsigned long pfn)
 			/* Separately check the mid mfn level */
 			unsigned long missing_mfn;
 			unsigned long mid_mfn_mfn;
-			unsigned long old_mfn;
 
 			mid_mfn = alloc_p2m_page();
 			if (!mid_mfn)
@@ -565,12 +564,12 @@ int xen_alloc_p2m_entry(unsigned long pfn)
 
 			missing_mfn = virt_to_mfn(p2m_mid_missing_mfn);
 			mid_mfn_mfn = virt_to_mfn(mid_mfn);
-			old_mfn = cmpxchg(top_mfn_p, missing_mfn, mid_mfn_mfn);
-			if (old_mfn != missing_mfn) {
-				free_p2m_page(mid_mfn);
-				mid_mfn = mfn_to_virt(old_mfn);
-			} else {
+			/* try_cmpxchg() updates missing_mfn on failure. */
+			if (try_cmpxchg(top_mfn_p, &missing_mfn, mid_mfn_mfn)) {
 				p2m_top_mfn_p[topidx] = mid_mfn;
+			} else {
+				free_p2m_page(mid_mfn);
+				mid_mfn = mfn_to_virt(missing_mfn);
 			}
 		}
 	} else {
-- 
2.44.0


