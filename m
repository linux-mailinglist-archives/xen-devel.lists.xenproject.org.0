Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1971D56C0
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 18:53:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZdaF-0001pa-2E; Fri, 15 May 2020 16:53:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjd2=65=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jZdaD-0001pF-9i
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 16:53:13 +0000
X-Inumbo-ID: 8e6510f2-96cc-11ea-a5a3-12813bfff9fa
Received: from mail-il1-f195.google.com (unknown [209.85.166.195])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e6510f2-96cc-11ea-a5a3-12813bfff9fa;
 Fri, 15 May 2020 16:53:09 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id q10so3264451ile.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2020 09:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jt1CDv42jbXBvQwTwsCwnePoxzMUg9bAOQny9395qek=;
 b=LEVXgLxXJBHHw0dcVcpUNYBjENXF7i3ETBSZI/+Z0EoHXTlWBJkHloWVv2WGMuj9L4
 DoQRdfLqxYxFASwj4VeP+76GutLSCkox1Yv6YiD3iIZ8Ab47uMgvG4L+ADxZj2NXMupZ
 4DrKHyNk+5FVPELF+3RwEzSqxH845cv6y8HkCTYHMrxR6eNHwUXW67h/j70tDdn+3l50
 QFKSkm/Qegq5vmSZ7W1DSYSDpytcXZ4FU8o4vTwc9jZJQr8Uqq9EiNzjOCPVUK9/FLkJ
 uLVqkrYpCds9P1a/yAPdFsNgeyt0jWCbPBQSrfs61SeqUnEmDIt3vPq93jRNxgrNuVKu
 Jikw==
X-Gm-Message-State: AOAM531HNHa7mGSrrAALdYmyI2PHUyG6A6gZsbsilKTWvGNjfrRfTs9I
 9zAs38BMaJU+M2NB5Uu2iRvxG6n+
X-Google-Smtp-Source: ABdhPJwOm/mJrPEyejLSbaZbRPEYr43yHgbWuONTakvkvCRA7qod90BxOnWL1cGETaMDIyqLHWvdMQ==
X-Received: by 2002:a92:3607:: with SMTP id d7mr2608056ila.222.1589561588859; 
 Fri, 15 May 2020 09:53:08 -0700 (PDT)
Received: from t0.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.googlemail.com with ESMTPSA id f17sm932136iol.26.2020.05.15.09.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 09:53:08 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 2/3] xen/vm_event: add vm_event_check_pending_op
Date: Fri, 15 May 2020 10:53:01 -0600
Message-Id: <0b282dc0a59459da4db0c53b13508e1ff39d70b9.1589561218.git.tamas@tklengyel.com>
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
index 848d69c1b0..558b7da4b1 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -297,6 +297,29 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
     };
 }
 
+bool vm_event_check_pending_op(struct vcpu *v)
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
index 14d1d341cc..5cbc9c6dc2 100644
--- a/xen/include/asm-arm/vm_event.h
+++ b/xen/include/asm-arm/vm_event.h
@@ -58,4 +58,11 @@ void vm_event_sync_event(struct vcpu *v, bool value)
     /* Not supported on ARM. */
 }
 
+static inline
+bool vm_event_check_pending_op(struct vcpu *v)
+{
+    /* Not supported on ARM. */
+    return false;
+}
+
 #endif /* __ASM_ARM_VM_EVENT_H__ */
diff --git a/xen/include/asm-x86/vm_event.h b/xen/include/asm-x86/vm_event.h
index 785e741fba..9c5ce3129c 100644
--- a/xen/include/asm-x86/vm_event.h
+++ b/xen/include/asm-x86/vm_event.h
@@ -54,4 +54,6 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp);
 
 void vm_event_sync_event(struct vcpu *v, bool value);
 
+bool vm_event_check_pending_op(struct vcpu *v);
+
 #endif /* __ASM_X86_VM_EVENT_H__ */
-- 
2.26.1


