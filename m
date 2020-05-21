Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A941DC53A
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 04:32:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbb0A-0000G5-GN; Thu, 21 May 2020 02:32:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsrW=7D=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jbb09-0000Fu-Ji
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 02:32:05 +0000
X-Inumbo-ID: 40174f9e-9b0b-11ea-aac4-12813bfff9fa
Received: from mail-ot1-f68.google.com (unknown [209.85.210.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40174f9e-9b0b-11ea-aac4-12813bfff9fa;
 Thu, 21 May 2020 02:32:01 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id x22so4382150otq.4
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 19:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAJ2F4WcFZUpTGHDJjHpvcdiKzqA1QwBYP6YeTTN2xA=;
 b=trw9u8caOYW5eF3wYbyTdCbUE5+W6Xzwh84I3eQzZEuF7l/BuuW+YA/GILGJdeYijr
 914WBBt8SzLt1nDxJOCsCLpLs8o3gUpSdTzkktvvazr9LqW3jGNLMesFeYnU7bFFkf/R
 07mPaFvYWLkEgnBQwxtcCFNuwCk9yp+SvzOlH2qNGypXu+3IN1Wq4794/ZAx+zZWNzaD
 lXufyR8femby7rg+WymPv3Uiqgy3iCaFfdWAG3CfVvND7LQRxV5FVBL0yftVwOFnkU96
 ePRZHA/TG2vbN+HXLCHa6c+QkvFlS+pgKldmEoRwmU7Bduf0U7YDxS+WGU6Hn1sKVZay
 5Y9Q==
X-Gm-Message-State: AOAM531fgnWXr/n7rMzKlRwICOVQAP93fcExn/HJIoM5ARktRYJbhJcj
 P1ABzbUFeYrhEycGqbE8P/+z0xSc8pk=
X-Google-Smtp-Source: ABdhPJyQJj0ZOz8w1ZTZHCbS7aBVzXmfSTHCOdfzxNPmjTi6gGNMTmXlrLX26xIuNU7kfnzl5fPkfg==
X-Received: by 2002:a05:6830:10c5:: with SMTP id
 z5mr5574207oto.325.1590028320358; 
 Wed, 20 May 2020 19:32:00 -0700 (PDT)
Received: from t0.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.googlemail.com with ESMTPSA id r17sm1312480ooq.2.2020.05.20.19.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 19:31:59 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 for-4.14 2/3] xen/vm_event: add vm_event_check_pending_op
Date: Wed, 20 May 2020 20:31:53 -0600
Message-Id: <52492e7b44f311b09e9a433f2e5a2ba607a85c78.1590028160.git.tamas@tklengyel.com>
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
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Perform sanity checking when shutting vm_event down to determine whether
it is safe to do so. Error out with -EAGAIN in case pending operations
have been found for the domain.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/vm_event.c        | 23 +++++++++++++++++++++++
 xen/common/vm_event.c          | 17 ++++++++++++++---
 xen/include/asm-arm/vm_event.h |  7 +++++++
 xen/include/asm-x86/vm_event.h |  2 ++
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index 848d69c1b0..a23aadc112 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -297,6 +297,29 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
     };
 }
 
+bool vm_event_check_pending_op(const struct vcpu *v)
+{
+    struct monitor_write_data *w = &v->arch.vm_event->write_data;
+
+    if ( !v->arch.vm_event->sync_event )
+        return false;
+
+    if ( w->do_write.cr0 )
+        return true;
+    if ( w->do_write.cr3 )
+        return true;
+    if ( w->do_write.cr4 )
+        return true;
+    if ( w->do_write.msr )
+        return true;
+    if ( v->arch.vm_event->set_gprs )
+        return true;
+    if ( v->arch.vm_event->emulate_flags )
+        return true;
+
+    return false;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 127f2d58f1..2df327a42c 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -183,6 +183,7 @@ static int vm_event_disable(struct domain *d, struct vm_event_domain **p_ved)
     if ( vm_event_check_ring(ved) )
     {
         struct vcpu *v;
+        bool pending_op = false;
 
         spin_lock(&ved->lock);
 
@@ -192,9 +193,6 @@ static int vm_event_disable(struct domain *d, struct vm_event_domain **p_ved)
             return -EBUSY;
         }
 
-        /* Free domU's event channel and leave the other one unbound */
-        free_xen_event_channel(d, ved->xen_port);
-
         /* Unblock all vCPUs */
         for_each_vcpu ( d, v )
         {
@@ -203,8 +201,21 @@ static int vm_event_disable(struct domain *d, struct vm_event_domain **p_ved)
                 vcpu_unpause(v);
                 ved->blocked--;
             }
+
+            if ( vm_event_check_pending_op(v) )
+                pending_op = true;
         }
 
+        /* vm_event ops are still pending until vCPUs get scheduled */
+        if ( pending_op )
+        {
+            spin_unlock(&ved->lock);
+            return -EAGAIN;
+        }
+
+        /* Free domU's event channel and leave the other one unbound */
+        free_xen_event_channel(d, ved->xen_port);
+
         destroy_ring_for_helper(&ved->ring_page, ved->ring_pg_struct);
 
         vm_event_cleanup_domain(d);
diff --git a/xen/include/asm-arm/vm_event.h b/xen/include/asm-arm/vm_event.h
index 14d1d341cc..978b224dc3 100644
--- a/xen/include/asm-arm/vm_event.h
+++ b/xen/include/asm-arm/vm_event.h
@@ -58,4 +58,11 @@ void vm_event_sync_event(struct vcpu *v, bool value)
     /* Not supported on ARM. */
 }
 
+static inline
+bool vm_event_check_pending_op(const struct vcpu *v)
+{
+    /* Not supported on ARM. */
+    return false;
+}
+
 #endif /* __ASM_ARM_VM_EVENT_H__ */
diff --git a/xen/include/asm-x86/vm_event.h b/xen/include/asm-x86/vm_event.h
index 785e741fba..97860d0d99 100644
--- a/xen/include/asm-x86/vm_event.h
+++ b/xen/include/asm-x86/vm_event.h
@@ -54,4 +54,6 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp);
 
 void vm_event_sync_event(struct vcpu *v, bool value);
 
+bool vm_event_check_pending_op(const struct vcpu *v);
+
 #endif /* __ASM_X86_VM_EVENT_H__ */
-- 
2.26.1


