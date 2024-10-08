Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ED0994239
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 10:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812815.1225578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5kK-0003Rh-6l; Tue, 08 Oct 2024 08:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812815.1225578; Tue, 08 Oct 2024 08:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5kK-0003OZ-3b; Tue, 08 Oct 2024 08:39:08 +0000
Received: by outflank-mailman (input) for mailman id 812815;
 Tue, 08 Oct 2024 08:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rYz=RE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sy5kJ-00027a-7s
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 08:39:07 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7ae4b40-8550-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 10:39:06 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso889699466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 01:39:06 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994d5fbef4sm301560066b.166.2024.10.08.01.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 01:39:05 -0700 (PDT)
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
X-Inumbo-ID: c7ae4b40-8550-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728376746; x=1728981546; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XH4xpZLptCZ6C2dJ+MYc8/xilU4dhsL/mNlDZC0yzNk=;
        b=kSgi0ZIQqibYtdaZZlOL8sNO1DIH5psPg13h+LVk3knD59zNI0KVaO+Mjm0EV8LX46
         QZTKPiLr1iGWRdvqW7YeNMBPmd6yfaTI0iyoZ2EXx0hSBAClOD7PGwrX6G1Q9Lw6X0VM
         Bh3ue62A/o7d6cZnYpN3ZW5bilf/upNGPvfq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728376746; x=1728981546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH4xpZLptCZ6C2dJ+MYc8/xilU4dhsL/mNlDZC0yzNk=;
        b=o+bf1ClzW5ROpwmRuk9iJXSrneiB/6PGd0nv8tdp4e6rgAWnbOc7jI6WA9puaMhSzd
         v+pu06NnuKTXk+g1XsvvKW8tjC5nL4NVCKLZFoOlb98kYSE+bskSpCg0HJkDZIvbJCpS
         e0U+qmfnLiCTlfBzMBSeUlEyc7pkbIa7ySZPnbc8+l3s+jHw3tfBNLIMvmQ9Hp+qfP3a
         PH34rTB8JDSicANOHMHEDnFF0IJ1dXAcuxLSKhGI9nrbL9nnHFvoZKBu0XxjQsU9V5O4
         3Pjd+kuDus1IMeri6HJPexVnpJzZ/xOydO+Rg/dqMtrQ/sU+qFXOHGjplPV+Lljs0RXr
         0oOg==
X-Gm-Message-State: AOJu0YzlgsMcEH2J7zd0IuRa5+hUkHjRYYYycNUEVu7OrLa/b4mTNa2w
	Ym+KOrvDM3jR9H3UdEr3xpzzMkYmuL3qYp87oJWbckmM4pWZh7xDpgGGbSBLolY37j1VF7X0xH8
	8
X-Google-Smtp-Source: AGHT+IEiTqV0Z7Wc62OgQfur6LtB6ahmdwOUDQuXTFad+6bufrugr/W2oDUY0dDzNfEND/ix/rixlQ==
X-Received: by 2002:a17:907:6095:b0:a99:46ff:f4e6 with SMTP id a640c23a62f3a-a9947000935mr927692166b.61.1728376745825;
        Tue, 08 Oct 2024 01:39:05 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] x86/msr: add log messages to MSR state load error paths
Date: Tue,  8 Oct 2024 10:39:01 +0200
Message-ID: <20241008083901.72850-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some error paths in the MSR state loading logic don't contain error messages,
which makes debugging them quite hard without adding extra patches to print the
information.

Add two new log messages to the MSR state load path that print information
about the entry that failed to load, for both PV and HVM.

While there also adjust XEN_DOMCTL_set_vcpu_msrs to return -ENXIO in case the
MSR is unhandled or can't be loaded, so it matches the error code used by HVM
MSR loading (and it's less ambiguous than -EINVAL).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add messages to PV MSR loading.
 - Return -ENXIO from PV loading path also.
 - Do not print the return code from guest_wrmsr(), it's not specially helpful
   given the current logic, as it will always be X86EMUL_EXCEPTION in case of
   failure.
---
 xen/arch/x86/domctl.c  | 8 ++++++++
 xen/arch/x86/hvm/hvm.c | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 96d816cf1a7d..f76de5be9437 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1166,6 +1166,7 @@ long arch_do_domctl(
                 if ( msr.reserved )
                     break;
 
+                ret = -ENXIO;
                 switch ( msr.index )
                 {
                 case MSR_SPEC_CTRL:
@@ -1174,9 +1175,16 @@ long arch_do_domctl(
                 case MSR_AMD64_DR0_ADDRESS_MASK:
                 case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
                     if ( guest_wrmsr(v, msr.index, msr.value) != X86EMUL_OKAY )
+                    {
+                        printk(XENLOG_G_ERR
+                               "%pv load MSR %#x with value %#lx failed\n",
+                               v, msr.index, msr.value);
                         break;
+                    }
                     continue;
                 }
+                printk(XENLOG_G_ERR "%pv attempted load of unhandled MSR %#x\n",
+                       v, msr.index);
                 break;
             }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 69a25571db8d..200f0a414138 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1598,10 +1598,17 @@ static int cf_check hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
             rc = guest_wrmsr(v, ctxt->msr[i].index, ctxt->msr[i].val);
 
             if ( rc != X86EMUL_OKAY )
+            {
+                printk(XENLOG_G_ERR
+                       "HVM %pv load MSR %#x with value %#lx failed\n",
+                       v, ctxt->msr[i].index, ctxt->msr[i].val);
                 return -ENXIO;
+            }
             break;
 
         default:
+            printk(XENLOG_G_ERR "HVM %pv attempted load of unhandled MSR %#x\n",
+                   v, ctxt->msr[i].index);
             return -ENXIO;
         }
     }
-- 
2.46.0


