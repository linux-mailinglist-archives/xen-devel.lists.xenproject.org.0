Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0F1D56C3
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 18:53:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZdaA-0001ow-Gz; Fri, 15 May 2020 16:53:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjd2=65=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jZda8-0001ol-Sw
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 16:53:08 +0000
X-Inumbo-ID: 8d9cea8c-96cc-11ea-9887-bc764e2007e4
Received: from mail-io1-f66.google.com (unknown [209.85.166.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d9cea8c-96cc-11ea-9887-bc764e2007e4;
 Fri, 15 May 2020 16:53:08 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id j8so3389551iog.13
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2020 09:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LCoqaKlszXhgdfaEb+32A9dBWLg/txZ1ajVdd1EaKUI=;
 b=Opj7CDveF5EdT5c/QAKT5cReFiT0u19RWTQ6vbaztpwmFhfdGvOfTTlXYhP5g8qyyW
 8aIpVyDfbc+vc1WyZScBfqQYIvQKNeuchsY1U1+ikI0Wdf/Of8SFDNk+Xe+clxOBwMX0
 zrQfj69S8wcUwy2SHKzMX4oSEat1J3zUgzeulzwJwjRVt/VmYe4sSHZDUy8y/TVZoRYK
 nceDgLTOek2ActZnKHbalWAGMef13Yie9WFo/0FtRWbmrpvkp/P1/DX4GOvLpdkG1x7a
 BtE99RMmpAYPCrVuMnnmxJUnkw/SmTwj3QTgfELNvpOeEqJ6gSOqvWD4oF5pxVAKJmRZ
 Pr+Q==
X-Gm-Message-State: AOAM532f8TikI3fpBQ82A3JLyo0uWA/tOOBV21kM+psOOywy3v1Or2ff
 li9Vd1DgabiRbO0RuWIKmy/EAYIZ
X-Google-Smtp-Source: ABdhPJxSkpecThAe6sZz9e5Ngtdnf6wU8HA7RM/rYMWhKrBrKtW25xrNSVuPAx+qunX4javiQ0Bnhg==
X-Received: by 2002:a5e:d506:: with SMTP id e6mr3878910iom.184.1589561587502; 
 Fri, 15 May 2020 09:53:07 -0700 (PDT)
Received: from t0.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.googlemail.com with ESMTPSA id f17sm932136iol.26.2020.05.15.09.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 09:53:06 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] xen/monitor: Control register values
Date: Fri, 15 May 2020 10:53:00 -0600
Message-Id: <72d4d282dd20b79ebdbaf1f70865ea38b075c5c0.1589561218.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <cover.1589561218.git.tamas@tklengyel.com>
References: <cover.1589561218.git.tamas@tklengyel.com>
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
 xen/arch/x86/hvm/hvm.c       | 31 +++++++++++++++++++------------
 xen/arch/x86/monitor.c       | 10 +++++++++-
 xen/include/asm-x86/domain.h |  1 +
 xen/include/public/domctl.h  |  1 +
 4 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 814b7020d8..063f8ddc18 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2263,9 +2263,10 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
     {
         ASSERT(v->arch.vm_event);
 
-        if ( hvm_monitor_crX(CR0, value, old_value) )
+        if ( hvm_monitor_crX(CR0, value, old_value) &&
+             v->domain->arch.monitor.control_register_values )
         {
-            /* The actual write will occur in hvm_do_resume(), if permitted. */
+            /* The actual write will occur in hvm_do_resume, if permitted. */
             v->arch.vm_event->write_data.do_write.cr0 = 1;
             v->arch.vm_event->write_data.cr0 = value;
 
@@ -2362,9 +2363,10 @@ int hvm_set_cr3(unsigned long value, bool may_defer)
     {
         ASSERT(v->arch.vm_event);
 
-        if ( hvm_monitor_crX(CR3, value, old) )
+        if ( hvm_monitor_crX(CR3, value, old) &&
+             v->domain->arch.monitor.control_register_values )
         {
-            /* The actual write will occur in hvm_do_resume(), if permitted. */
+            /* The actual write will occur in hvm_do_resume, if permitted. */
             v->arch.vm_event->write_data.do_write.cr3 = 1;
             v->arch.vm_event->write_data.cr3 = value;
 
@@ -2443,9 +2445,10 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
     {
         ASSERT(v->arch.vm_event);
 
-        if ( hvm_monitor_crX(CR4, value, old_cr) )
+        if ( hvm_monitor_crX(CR4, value, old_cr) &&
+             v->domain->arch.monitor.control_register_values )
         {
-            /* The actual write will occur in hvm_do_resume(), if permitted. */
+            /* The actual write will occur in hvm_do_resume, if permitted. */
             v->arch.vm_event->write_data.do_write.cr4 = 1;
             v->arch.vm_event->write_data.cr4 = value;
 
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
+            /* The actual write will occur in hvm_do_resume, if permitted. */
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


