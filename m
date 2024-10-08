Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DD499422D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 10:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812804.1225564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5jP-0002Kh-Re; Tue, 08 Oct 2024 08:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812804.1225564; Tue, 08 Oct 2024 08:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5jP-0002EK-La; Tue, 08 Oct 2024 08:38:11 +0000
Received: by outflank-mailman (input) for mailman id 812804;
 Tue, 08 Oct 2024 08:38:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rYz=RE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sy5jO-00027a-47
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 08:38:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a555c321-8550-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 10:38:09 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a99415adecaso443374166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 01:38:09 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994f38068fsm283632966b.40.2024.10.08.01.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 01:38:07 -0700 (PDT)
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
X-Inumbo-ID: a555c321-8550-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728376688; x=1728981488; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH4xpZLptCZ6C2dJ+MYc8/xilU4dhsL/mNlDZC0yzNk=;
        b=lMmfHfK+BndP1P3ecWm4fEoD8CAlhWHblrvOP2dZ9DU4ed996j6C7gjr4bluIHTlyl
         jnetgQGATFKT+LF9yZ4Vgo6i5QMZJBgHC5bXsmIYtPVAv/3O5X8BdYO1oxih5Lus5MCz
         GywGkfk+tNVE86QRm2pVQh7a761wslVIiDdX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728376688; x=1728981488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH4xpZLptCZ6C2dJ+MYc8/xilU4dhsL/mNlDZC0yzNk=;
        b=JYiM4oThjRS4sQ7SRtl60keBPJQS/YqmNQnDI4uc2tv5LXLgCSQWLMW2ii5ipN7Z82
         K9fZHXsGLzoeMQY9/0XIz6L0HiaA5ti+xgt9GjrO+gmSV+dlzbDFTbMum4qB4iALO6J5
         u0UpN6/KrgJFrB6kMGlXzZzv6Il04MgsB5W7FwWtaP0fO+OCZcCVroQSYWP0TrnyqsAl
         iScideLkfHPZt8yq3pQbIVRJG9IrVKm/WI8KsjcMQ18TYX8lSasEcmt6PH4MEx+2SU3j
         trZvubOnBWXR598cl65vZBtN3ldFRXG6pi/1UacimBsiL+AyyWs2+r6FxFhPKhVwKMr9
         8hYg==
X-Gm-Message-State: AOJu0Yz1D9Eut7TNeM2Mp23ehp/8Y0ElfejsywcYdVbfHjvdHN5XwqrI
	ESSQrTXHjhgfUgVxFdKadKkEy6GTwz//qzyr2YJSbYBmzfmS/fPglsmxy0RnrTJJd5ytq9WiV2r
	Y
X-Google-Smtp-Source: AGHT+IEBCg4ZG9tl9DtNzsHD5BX6MV6mwIUL7ZZuM4RoMBxzjkKMMIZ4Xa9Sh+in1pgMQZ6Xq/fgpA==
X-Received: by 2002:a17:906:6a0a:b0:a99:637c:c2e0 with SMTP id a640c23a62f3a-a99679501b7mr207715766b.31.1728376688167;
        Tue, 08 Oct 2024 01:38:08 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] x86/msr: add log messages to MSR state load error paths
Date: Tue,  8 Oct 2024 10:37:56 +0200
Message-ID: <20241008083756.72829-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241008083756.72829-1-roger.pau@citrix.com>
References: <20241008083756.72829-1-roger.pau@citrix.com>
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


