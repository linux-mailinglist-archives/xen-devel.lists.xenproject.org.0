Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EB857A80E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 22:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371145.602980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDtW5-0005hz-VM; Tue, 19 Jul 2022 20:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371145.602980; Tue, 19 Jul 2022 20:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDtW5-0005gB-Sk; Tue, 19 Jul 2022 20:08:25 +0000
Received: by outflank-mailman (input) for mailman id 371145;
 Tue, 19 Jul 2022 20:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYTG=XY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oDtW4-0005g5-5M
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 20:08:24 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a42efc0-079e-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 22:08:23 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id m16so7909192qka.12
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 13:08:23 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:b68c:61:1ba8:65b6])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a05620a40c300b006b5ee4de4fbsm5789509qko.37.2022.07.19.13.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 13:08:20 -0700 (PDT)
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
X-Inumbo-ID: 8a42efc0-079e-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vk644Lja/mvPWFdI7/cp75V/rxQwtcwBZ/WnM74etDI=;
        b=NslfdsnjmFJgi4tud+4/p+a+4qFgyVz5ao0zTmxhBEpQUI8JUesTnEn9KP/Eaiv52i
         anPLl99GDLAdyawp2Bz4ogBTmeazEuX45VAn7m28nWiwXPDQFMqgjjpZpO+xPfgvDCaV
         58YmO7alnnJJlIeVE+0GQY9tXb41qC6XtxdfVd+X1A3GioFCT2N5V8DTmStGKKTFLeHt
         Y8+pNYT4ZnFaoiC3FhF9WH9jsuFl00CjMXuEZoGkHCRjbzaifjDiIbCZ0i8zdC3yRh2b
         Xg6S9Jmw/800mLiwnoOb9/OKC5X5ukrpp8sOgY5x3tGiMnvCRCUD1RNI1BEhEtKuJLTH
         Zm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vk644Lja/mvPWFdI7/cp75V/rxQwtcwBZ/WnM74etDI=;
        b=e/UKfKHyC22IyRU+rzv/TrmvYypTgEquqJWbPs9vZo8m+WArekHrAFtM0sYIg1Cep+
         OSr8zvlfOSrQc2HtnTJZ1rGPr1jMjSp7xE3pX+OBQxHyuQDiuEMcxVbYnGudI+NpdG6n
         lU7aYXhc6FE7KfZvmJlh755R8VPuv16DyUX7s1M4PEJSvoSkuGCUMqhN/c0evMxwDKCk
         sAzhwikgFP0HvDfJXLWJRmUXZjBj37m6/EBbxLrTy4CdkE+YstHam9lWdlyMy5gZf/Et
         au8zB+eEqT9BG6gIrSGNgO2UnU4t9BQ13h+3imsbCaAHFdJyih/oWuN0HRl8kZLjqVm7
         6ruQ==
X-Gm-Message-State: AJIora/AqrZh1qHtxRetc++YZ6JA3kinVsi2QC6/fVN+sBjTkO8wJGEq
	2grjzCP4sWVidiWYL0kpu5JfXmSpvcQ=
X-Google-Smtp-Source: AGRyM1turHQnSVWDYwsKayK4cI+X2TFxzbe8/wcxb/GlnmcMMdDoofJ65IDk1BAqD2sDp8Vbod3wPg==
X-Received: by 2002:a37:b241:0:b0:6b5:5eb6:3f9f with SMTP id b62-20020a37b241000000b006b55eb63f9fmr21436100qkf.299.1658261301520;
        Tue, 19 Jul 2022 13:08:21 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86: Expose more MSR_ARCH_CAPS to hwdom
Date: Tue, 19 Jul 2022 16:08:15 -0400
Message-Id: <20220719200815.69884-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit e46474278a0e ("x86/intel: Expose MSR_ARCH_CAPS to dom0") started
exposing MSR_ARCH_CAPS to dom0.  More bits in MSR_ARCH_CAPS have since
been defined, but they haven't been exposed.  Update the list to allow
them through.

As one example, this allows a linux Dom0 to know that it has the
appropriate microcode via FB_CLEAR.  Notably, and with the updated
microcode, this changes dom0's
/sys/devices/system/cpu/vulnerabilities/mmio_stale_data changes from:
"Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state
unknown"
to:
"Mitigation: Clear CPU buffers; SMT Host state unknown"

This ecposes the MMIO Stale Data and Intel Branch History Injection
(BHI) controls as well as the page size change MCE issue bit.

Fixes: commit 2ebe8fe9b7e0 ("x86/spec-ctrl: Enumeration for MMIO Stale Data controls")
Fixes: commit cea9ae062295 ("x86/spec-ctrl: Enumeration for new Intel BHI controls")
Fixes: commit 59e89cdabc71 ("x86/vtx: Disable executable EPT superpages to work around CVE-2018-12207")

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
This is the broader replacement for "x86: Add MMIO Stale Data arch_caps
to hardware domain".

It wasn't discussed previously, but ARCH_CAPS_IF_PSCHANGE_MC_NO is added
as well.

This patch can't be directly backported because cea9ae062295 was not
backported.

 xen/arch/x86/msr.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 6206529162..170f041793 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -72,7 +72,9 @@ static void __init calculate_host_policy(void)
     mp->arch_caps.raw &=
         (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
          ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
-         ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_TAA_NO);
+         ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_TAA_NO |
+         ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO | ARCH_CAPS_PSDP_NO |
+         ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA | ARCH_CAPS_BHI_NO);
 }
 
 static void __init calculate_pv_max_policy(void)
@@ -161,7 +163,10 @@ int init_domain_msr_policy(struct domain *d)
 
         mp->arch_caps.raw = val &
             (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
-             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_TAA_NO);
+             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_IF_PSCHANGE_MC_NO |
+             ARCH_CAPS_TAA_NO | ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO |
+             ARCH_CAPS_PSDP_NO | ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA |
+             ARCH_CAPS_BHI_NO);
     }
 
     d->arch.msr = mp;
-- 
2.36.1


