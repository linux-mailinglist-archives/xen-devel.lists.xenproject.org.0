Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E21A390A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 19:41:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMbB3-0005pp-QT; Thu, 09 Apr 2020 17:41:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Iid=5Z=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jMbB1-0005pJ-VG
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 17:41:19 +0000
X-Inumbo-ID: 4d2034fa-7a89-11ea-b58d-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d2034fa-7a89-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 17:41:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e26so605420wmk.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 10:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fc9JPgSv78+xCG8xAroRJyffb4ZlYuUW9C+bIDq7Dig=;
 b=b6jNlZ9zleAiNfWsT/73k8KaW+Vtjqmo7KQIln61Cd/lVRDilYJeC3KsqZ5WDjViWu
 J0tB2ZylSKq7ZZGlS/85n/hMuuJtI0XVqO+semrQKFYQzQtL7iiF2jERcux9jdbCFpm7
 hsn+l9Gn3CixYI1FRnYBQ/Xw66atQbOor+BCbprih1tOn9lAmQOFfEfFF+/LlcDWPb6y
 Jma0lC/AD9k0kUao5a62qAzAmCg9Ju34YuUn2kxFuSroQN6IPkerfDjb8TVFXMenZbHT
 ycQpKiNXxbI8DAAAdXamGMpzUhNLqd1wsG1lOHL8pejBTa+Oix+UaUv9J7XwCQvi2+La
 7V3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Fc9JPgSv78+xCG8xAroRJyffb4ZlYuUW9C+bIDq7Dig=;
 b=SAToBnAGZBDIxb98yn7H4XXckn20ibYcBZbkyDkHPS5VcZi65ENEvN3R/4yXhrHsEn
 o9b5jLCbDydyNV3Olqti06gTRIBaKnmnjN91Ia2aZbEuz7G/vuI4GTjR70/JNGK7lLOk
 /UTpxr12T5T47J0m5jpxxkdbyWwcnA+iJBEBA8PbkMnKRqSA1nZ8KMTa4TaZPryL7WxP
 Tj+BkC7I3yW25uyecVFnyoI52WjW7LBY2/K5Nx0bSQA7gdapg4oCJEZchKRouku2g56q
 GR6CBRAAH6jK2QpX8b7Ml6DlSJAyzMLXKMw+qLwwIyxpF9+WGww9f3B4wpXW4GaqJTKf
 lnTA==
X-Gm-Message-State: AGi0PuYOVRR1HidSIqL+GGNjZHU/YlJ2P7yCIzTjLCZSAGSV8rWkLw/K
 0L0G4p3eTGgPAiT0ZXNqI5FgZNoq
X-Google-Smtp-Source: APiQypL6APmlptFTWAB/yog5obeCEbBAMDRInyAVp2hItq5HRAsKod8iunumJ0Cum0i49tgkkqpkLQ==
X-Received: by 2002:a1c:dc8b:: with SMTP id t133mr935246wmg.117.1586454070535; 
 Thu, 09 Apr 2020 10:41:10 -0700 (PDT)
Received: from localhost.localdomain (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id
 c18sm40086006wrx.5.2020.04.09.10.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 10:41:10 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH v5 2/3] x86/hyperv: skeleton for L0 assisted TLB flush
Date: Thu,  9 Apr 2020 18:41:03 +0100
Message-Id: <20200409174104.23946-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409174104.23946-1-liuwe@microsoft.com>
References: <20200409174104.23946-1-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Implement a basic hook for L0 assisted TLB flush. The hook needs to
check if prerequisites are met. If they are not met, it returns an error
number to fall back to native flushes.

Introduce a new variable to indicate if hypercall page is ready.

Signed-off-by: Wei Liu <liuwe@microsoft.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Paul Durrant <pdurrant@amazon.com>
---
v3:
1. Change hv_hcall_page_ready to hcall_page_ready
---
 xen/arch/x86/guest/hyperv/Makefile  |  1 +
 xen/arch/x86/guest/hyperv/hyperv.c  | 17 ++++++++++++
 xen/arch/x86/guest/hyperv/private.h |  4 +++
 xen/arch/x86/guest/hyperv/tlb.c     | 41 +++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 xen/arch/x86/guest/hyperv/tlb.c

diff --git a/xen/arch/x86/guest/hyperv/Makefile b/xen/arch/x86/guest/hyperv/Makefile
index 68170109a9..18902c33e9 100644
--- a/xen/arch/x86/guest/hyperv/Makefile
+++ b/xen/arch/x86/guest/hyperv/Makefile
@@ -1 +1,2 @@
 obj-y += hyperv.o
+obj-y += tlb.o
diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index 5ad16cf0fe..91a6782cd9 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -33,6 +33,8 @@ DEFINE_PER_CPU_READ_MOSTLY(void *, hv_input_page);
 DEFINE_PER_CPU_READ_MOSTLY(void *, hv_vp_assist);
 DEFINE_PER_CPU_READ_MOSTLY(unsigned int, hv_vp_index);
 
+static bool __read_mostly hcall_page_ready;
+
 static uint64_t generate_guest_id(void)
 {
     union hv_guest_os_id id = {};
@@ -119,6 +121,8 @@ static void __init setup_hypercall_page(void)
     BUG_ON(!hypercall_msr.enable);
 
     set_fixmap_x(FIX_X_HYPERV_HCALL, mfn << PAGE_SHIFT);
+
+    hcall_page_ready = true;
 }
 
 static int setup_hypercall_pcpu_arg(void)
@@ -199,11 +203,24 @@ static void __init e820_fixup(struct e820map *e820)
         panic("Unable to reserve Hyper-V hypercall range\n");
 }
 
+static int flush_tlb(const cpumask_t *mask, const void *va,
+                     unsigned int flags)
+{
+    if ( !(ms_hyperv.hints & HV_X64_REMOTE_TLB_FLUSH_RECOMMENDED) )
+        return -EOPNOTSUPP;
+
+    if ( !hcall_page_ready || !this_cpu(hv_input_page) )
+        return -ENXIO;
+
+    return hyperv_flush_tlb(mask, va, flags);
+}
+
 static const struct hypervisor_ops __initconstrel ops = {
     .name = "Hyper-V",
     .setup = setup,
     .ap_setup = ap_setup,
     .e820_fixup = e820_fixup,
+    .flush_tlb = flush_tlb,
 };
 
 /*
diff --git a/xen/arch/x86/guest/hyperv/private.h b/xen/arch/x86/guest/hyperv/private.h
index 956eff831f..509bedaafa 100644
--- a/xen/arch/x86/guest/hyperv/private.h
+++ b/xen/arch/x86/guest/hyperv/private.h
@@ -22,10 +22,14 @@
 #ifndef __XEN_HYPERV_PRIVIATE_H__
 #define __XEN_HYPERV_PRIVIATE_H__
 
+#include <xen/cpumask.h>
 #include <xen/percpu.h>
 
 DECLARE_PER_CPU(void *, hv_input_page);
 DECLARE_PER_CPU(void *, hv_vp_assist);
 DECLARE_PER_CPU(unsigned int, hv_vp_index);
 
+int hyperv_flush_tlb(const cpumask_t *mask, const void *va,
+                     unsigned int flags);
+
 #endif /* __XEN_HYPERV_PRIVIATE_H__  */
diff --git a/xen/arch/x86/guest/hyperv/tlb.c b/xen/arch/x86/guest/hyperv/tlb.c
new file mode 100644
index 0000000000..48f527229e
--- /dev/null
+++ b/xen/arch/x86/guest/hyperv/tlb.c
@@ -0,0 +1,41 @@
+/******************************************************************************
+ * arch/x86/guest/hyperv/tlb.c
+ *
+ * Support for TLB management using hypercalls
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Copyright (c) 2020 Microsoft.
+ */
+
+#include <xen/cpumask.h>
+#include <xen/errno.h>
+
+#include "private.h"
+
+int hyperv_flush_tlb(const cpumask_t *mask, const void *va,
+                     unsigned int flags)
+{
+    return -EOPNOTSUPP;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.20.1


