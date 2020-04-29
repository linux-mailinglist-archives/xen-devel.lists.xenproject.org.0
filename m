Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E2E1BD9E2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 12:41:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTkA1-000849-VS; Wed, 29 Apr 2020 10:41:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoNI=6N=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jTkA0-000844-O5
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 10:41:48 +0000
X-Inumbo-ID: 06b917fc-8a06-11ea-ae69-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06b917fc-8a06-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 10:41:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y24so1462622wma.4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2020 03:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DftQOi/0ZZ65kQGBjKhjDE6NVGdkGHPGvh7+6NEfCIE=;
 b=JB0u8o+ofud/6GLH1aBjwGbjh2F72l2MzXQLgSGL/S7l3W9R9rAy1fGRThc2w6R2r5
 PJ9CQfqM50uRhUY3iOAqZN+1nvaTJU8Hm0UFWQltCAZzQLpLKR2UeoSVDsJnf3dlSBh/
 zJNCbwM41L4S6L3OB4gcJyq01oDVJGQnaNsDec5TgR16Zj+5mfjih5FzpVSH9tYS1OqH
 oJixayzSK/reIVDYgKM7lCPcJb2pMml/DZvkqGfG67iTXuC/gkbRz76v2tk1ofTLGeP7
 TkWtTXRsnQsDEyFkJw1TRW0u3okUmeNYOw48YaB6BZUH0/M0WCwBTaX1qyn3F68UxsDv
 ZjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DftQOi/0ZZ65kQGBjKhjDE6NVGdkGHPGvh7+6NEfCIE=;
 b=cFq5lAgDyvCY/GWt1wdUncvSoHg/IYN65XmwFSiUNXyfgFjUIuR+LFpu26QZeNVthh
 VVgT9NAG1B5XFkE8xMayAeBCeZE/Fu9xmuRk4mIu3CWcfUBta34Z+Q4zq17Hqn3Ui7Jv
 90vRIqQgEXAcZPVpwNcZqvhV+orPQF58nQa+YlwUygiK+YoETH6ehZ14WmJDWBqZliDb
 7hFI6zMGj3GzPXKlI8lWhGBBELxliSR2EFKctmcAvpeEM8EyDCTt6SoE2Va/Y6gC4T7K
 Nm+z4UpklUIO8ZMzUNdQpC0xEMJ8Kw9h8F90Z/p488q+6aK+o0zSAgTOB2HCkxJq4mgB
 m9pA==
X-Gm-Message-State: AGi0PubUNICGv81LTheFsdD97JyRD/YJz/lTlwnzQvxuotEjv8EO6SE9
 e/+d+HbJViHFOnCgl8xi6AEoSxOtv8s=
X-Google-Smtp-Source: APiQypIJ5yNPYFk1U3Xqscn/+94PcbzPa7A42oLwYxfRYauXgdOAK26PwiTzw/sDX9Y1yTxs1j+mCg==
X-Received: by 2002:a1c:4304:: with SMTP id q4mr2738653wma.152.1588156907008; 
 Wed, 29 Apr 2020 03:41:47 -0700 (PDT)
Received: from localhost.localdomain (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id
 n2sm30270332wrq.74.2020.04.29.03.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 03:41:46 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/hyperv: stash and use the configured max VP index
Date: Wed, 29 Apr 2020 11:41:44 +0100
Message-Id: <20200429104144.17816-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The value returned from CPUID is the maximum number for virtual
processors supported by Hyper-V. It could be larger than the maximum
number of virtual processors configured.

Stash the configured number into a variable and use it in calculations.

Signed-off-by: Wei Liu <liuwe@microsoft.com>
---
 xen/arch/x86/guest/hyperv/hyperv.c  | 4 ++++
 xen/arch/x86/guest/hyperv/private.h | 1 +
 xen/arch/x86/guest/hyperv/tlb.c     | 2 +-
 xen/arch/x86/guest/hyperv/util.c    | 2 +-
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index 91a6782cd986..84221b751453 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -33,6 +33,7 @@ DEFINE_PER_CPU_READ_MOSTLY(void *, hv_input_page);
 DEFINE_PER_CPU_READ_MOSTLY(void *, hv_vp_assist);
 DEFINE_PER_CPU_READ_MOSTLY(unsigned int, hv_vp_index);
 
+unsigned int __read_mostly hv_max_vp_index;
 static bool __read_mostly hcall_page_ready;
 
 static uint64_t generate_guest_id(void)
@@ -143,6 +144,9 @@ static int setup_hypercall_pcpu_arg(void)
     rdmsrl(HV_X64_MSR_VP_INDEX, vp_index_msr);
     this_cpu(hv_vp_index) = vp_index_msr;
 
+    if ( vp_index_msr > hv_max_vp_index )
+        hv_max_vp_index = vp_index_msr;
+
     return 0;
 }
 
diff --git a/xen/arch/x86/guest/hyperv/private.h b/xen/arch/x86/guest/hyperv/private.h
index 354fc7f685a7..fea3e291e944 100644
--- a/xen/arch/x86/guest/hyperv/private.h
+++ b/xen/arch/x86/guest/hyperv/private.h
@@ -28,6 +28,7 @@
 DECLARE_PER_CPU(void *, hv_input_page);
 DECLARE_PER_CPU(void *, hv_vp_assist);
 DECLARE_PER_CPU(unsigned int, hv_vp_index);
+extern unsigned int hv_max_vp_index;
 
 static inline unsigned int hv_vp_index(unsigned int cpu)
 {
diff --git a/xen/arch/x86/guest/hyperv/tlb.c b/xen/arch/x86/guest/hyperv/tlb.c
index 1d723d6ee679..0a44071481bd 100644
--- a/xen/arch/x86/guest/hyperv/tlb.c
+++ b/xen/arch/x86/guest/hyperv/tlb.c
@@ -166,7 +166,7 @@ int hyperv_flush_tlb(const cpumask_t *mask, const void *va,
         {
             unsigned int vpid = hv_vp_index(cpu);
 
-            if ( vpid >= ms_hyperv.max_vp_index )
+            if ( vpid >= hv_max_vp_index )
             {
                 local_irq_restore(irq_flags);
                 return -ENXIO;
diff --git a/xen/arch/x86/guest/hyperv/util.c b/xen/arch/x86/guest/hyperv/util.c
index bec61c2afd87..2c5f421b7bd9 100644
--- a/xen/arch/x86/guest/hyperv/util.c
+++ b/xen/arch/x86/guest/hyperv/util.c
@@ -33,7 +33,7 @@ int cpumask_to_vpset(struct hv_vpset *vpset,
 {
     int nr = 1;
     unsigned int cpu, vcpu_bank, vcpu_offset;
-    unsigned int max_banks = ms_hyperv.max_vp_index / 64;
+    unsigned int max_banks = hv_max_vp_index / 64;
 
     /* Up to 64 banks can be represented by valid_bank_mask */
     if ( max_banks > 64 )
-- 
2.20.1


