Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8A1DC537
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 04:32:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbb06-0000FN-0x; Thu, 21 May 2020 02:32:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsrW=7D=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jbb04-0000FB-Jb
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 02:32:00 +0000
X-Inumbo-ID: 3f3f565c-9b0b-11ea-aac4-12813bfff9fa
Received: from mail-ot1-f66.google.com (unknown [209.85.210.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f3f565c-9b0b-11ea-aac4-12813bfff9fa;
 Thu, 21 May 2020 02:31:59 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z3so4359263otp.9
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 19:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Ow8fbLTVv346fUNfXtdLXKcBCHvqTr422Z5j3+Oz/U=;
 b=JhBGCIVcf5xcsJJVIlQUu3WTdn1O8+x9cRS+ZH3eeIhkzUK+8UctL4Vk+YQj5LWpyP
 UnNoNu4e+FAVYw9xfHPZ8kuhFFxIh6Gy4XLJMNQBHeZ0HDef7Agq/jhgjkhDgQqrl4V7
 C7nVq45+smAMkqfgrTji+TB46IcHTW7Skbj9c/Swc/jX25KgWjqYlqlarj7W8K45OdkK
 lZnOdtu4XjWETRxgT7hOiE+dO27ZhhTX9U1x4Ow1fKyrgPKPWA6Az0hz8a7SFUnvc05k
 vQrycbvVXhFrg43mwENavy7C9yuliZ5wjOEgomGcYKATPwlkNxhGBGXyx+usFsepcFMW
 WLZg==
X-Gm-Message-State: AOAM533s4cWjL7jDyOGXSY/JApHrBjzVcjncvzjBtKcE5tEKrDHz67w7
 X/7yiKKbazlKeTURzq4ubh51Qz31UO4=
X-Google-Smtp-Source: ABdhPJyFeLElcRnr7TE7cCAmcA9TvgH5Chz90ASlGNCYFdu2paAWRUkURzFw3aRpYskqrdgMbdQVwQ==
X-Received: by 2002:a9d:3a7:: with SMTP id f36mr5760174otf.197.1590028318891; 
 Wed, 20 May 2020 19:31:58 -0700 (PDT)
Received: from t0.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.googlemail.com with ESMTPSA id r17sm1312480ooq.2.2020.05.20.19.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 19:31:58 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
Date: Wed, 20 May 2020 20:31:52 -0600
Message-Id: <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <cover.1590028160.git.tamas@tklengyel.com>
References: <cover.1590028160.git.tamas@tklengyel.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Extend the monitor_op domctl to include option that enables
controlling what values certain registers are permitted to hold
by a monitor subscriber.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/hvm/hvm.c       | 25 ++++++++++++++++---------
 xen/arch/x86/monitor.c       | 10 +++++++++-
 xen/include/asm-x86/domain.h |  1 +
 xen/include/public/domctl.h  |  1 +
 4 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 09ee299bc7..e6780c685b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2263,7 +2263,8 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
     {
         ASSERT(v->arch.vm_event);
 
-        if ( hvm_monitor_crX(CR0, value, old_value) )
+        if ( hvm_monitor_crX(CR0, value, old_value) &&
+             v->domain->arch.monitor.control_register_values )
         {
             /* The actual write will occur in hvm_do_resume(), if permitted. */
             v->arch.vm_event->write_data.do_write.cr0 = 1;
@@ -2362,7 +2363,8 @@ int hvm_set_cr3(unsigned long value, bool may_defer)
     {
         ASSERT(v->arch.vm_event);
 
-        if ( hvm_monitor_crX(CR3, value, old) )
+        if ( hvm_monitor_crX(CR3, value, old) &&
+             v->domain->arch.monitor.control_register_values )
         {
             /* The actual write will occur in hvm_do_resume(), if permitted. */
             v->arch.vm_event->write_data.do_write.cr3 = 1;
@@ -2443,7 +2445,8 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
     {
         ASSERT(v->arch.vm_event);
 
-        if ( hvm_monitor_crX(CR4, value, old_cr) )
+        if ( hvm_monitor_crX(CR4, value, old_cr) &&
+             v->domain->arch.monitor.control_register_values )
         {
             /* The actual write will occur in hvm_do_resume(), if permitted. */
             v->arch.vm_event->write_data.do_write.cr4 = 1;
@@ -3587,13 +3590,17 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
 
         ASSERT(v->arch.vm_event);
 
-        /* The actual write will occur in hvm_do_resume() (if permitted). */
-        v->arch.vm_event->write_data.do_write.msr = 1;
-        v->arch.vm_event->write_data.msr = msr;
-        v->arch.vm_event->write_data.value = msr_content;
-
         hvm_monitor_msr(msr, msr_content, msr_old_content);
-        return X86EMUL_OKAY;
+
+        if ( v->domain->arch.monitor.control_register_values )
+        {
+            /* The actual write will occur in hvm_do_resume(), if permitted. */
+            v->arch.vm_event->write_data.do_write.msr = 1;
+            v->arch.vm_event->write_data.msr = msr;
+            v->arch.vm_event->write_data.value = msr_content;
+
+            return X86EMUL_OKAY;
+        }
     }
 
     if ( (ret = guest_wrmsr(v, msr, msr_content)) != X86EMUL_UNHANDLEABLE )
diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
index bbcb7536c7..1517a97f50 100644
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -144,7 +144,15 @@ int arch_monitor_domctl_event(struct domain *d,
                               struct xen_domctl_monitor_op *mop)
 {
     struct arch_domain *ad = &d->arch;
-    bool requested_status = (XEN_DOMCTL_MONITOR_OP_ENABLE == mop->op);
+    bool requested_status;
+
+    if ( XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS == mop->op )
+    {
+        ad->monitor.control_register_values = true;
+        return 0;
+    }
+
+    requested_status = (XEN_DOMCTL_MONITOR_OP_ENABLE == mop->op);
 
     switch ( mop->event )
     {
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 5b6d909266..d890ab7a22 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -416,6 +416,7 @@ struct arch_domain
          * This is used to filter out pagefaults.
          */
         unsigned int inguest_pagefault_disabled                            : 1;
+        unsigned int control_register_values                               : 1;
         struct monitor_msr_bitmap *msr_bitmap;
         uint64_t write_ctrlreg_mask[4];
     } monitor;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 1ad34c35eb..cbcd25f12c 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1025,6 +1025,7 @@ struct xen_domctl_psr_cmt_op {
 #define XEN_DOMCTL_MONITOR_OP_DISABLE           1
 #define XEN_DOMCTL_MONITOR_OP_GET_CAPABILITIES  2
 #define XEN_DOMCTL_MONITOR_OP_EMULATE_EACH_REP  3
+#define XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS 4
 
 #define XEN_DOMCTL_MONITOR_EVENT_WRITE_CTRLREG         0
 #define XEN_DOMCTL_MONITOR_EVENT_MOV_TO_MSR            1
-- 
2.26.1


