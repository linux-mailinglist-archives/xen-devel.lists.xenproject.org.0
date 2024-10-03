Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA2598F5DA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809772.1222318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQI7-0003ji-B9; Thu, 03 Oct 2024 18:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809772.1222318; Thu, 03 Oct 2024 18:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQI7-0003hU-8S; Thu, 03 Oct 2024 18:11:07 +0000
Received: by outflank-mailman (input) for mailman id 809772;
 Thu, 03 Oct 2024 18:11:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ7D-0006qR-95
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:51 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 480eaad1-81b1-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:59:49 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so182243166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:49 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:47 -0700 (PDT)
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
X-Inumbo-ID: 480eaad1-81b1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978388; x=1728583188; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1MdC3jU6tMF4gHR3lQp27v/4fUpmlKo+cCS73TVl10=;
        b=d2dTz2xP10bpnZ7Jrt4SVjpMxS0962Z6f6jWn0NLF8AXqD7mffiS541z1YkFwoCJqP
         9IjLWNXo9QRZ/qaC6Tc0UzhXOgcauJpMrawYDaVYp+gtgj0ukkzlQiQZIq4K2ijUZqI2
         CjfT5hOGRaY+4t+APiQLnvzhWK5DzXSMBdeh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978388; x=1728583188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1MdC3jU6tMF4gHR3lQp27v/4fUpmlKo+cCS73TVl10=;
        b=YW2yfDhq0opoxN2tYD5iqxgH9Tk60AIndRLIHxPYfK2ueoUjJd8jK9tB6Kv3ojpOAW
         7bnvlc08e6UrRbei+dzTsbZTkoeQCA09qcEKw19mRVRfp31Fx8Fm2pSoFhQs5JCkdKLQ
         J2SlDvv89RLJXyB06cruZMO57/W9vCqJpW33nNCD/oIekZvVhxSClONkc6RolkfSC99v
         wgKIb8TprHsYSWqD3OZ7nG/lx7fIzRb5lHdWxLPvO9JUTdHtvBLRuH2ypxsOWOqzZ20j
         qi82RIwc8utL7WLB1gkY8PRTAQ0kHxkQZ3yY4wsV5KmD1iYJKfKsDOLIHmh9Fb63azam
         FhWA==
X-Gm-Message-State: AOJu0YzDFWv1KmjakLX4gZWSHn8giWbPAoDiWKvL61TdTgsOmcGVTbzk
	dKpfsyhL/Zw50L1XvBiL0Jvo6QLiKoqX3/SM2TEvQGYgZxmx0vUQl2r4+ixendh76cDSR/lltrt
	1
X-Google-Smtp-Source: AGHT+IGe4H1o9bHWu7zBwpckZPd8tO/hShT+fcCxeqpQH5QIfsBsVtGOimT9C4zZckiaTP8qKwJZ3w==
X-Received: by 2002:a17:907:26c4:b0:a8d:3d36:3169 with SMTP id a640c23a62f3a-a991c0107d6mr16693966b.63.1727978388151;
        Thu, 03 Oct 2024 10:59:48 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 17/19] xen: Update header guards - VM event, mem access, monitor
Date: Thu,  3 Oct 2024 18:59:17 +0100
Message-Id: <20241003175919.472774-18-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to VM event, mem access AND monitor.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/hvm/monitor.h  | 6 +++---
 xen/arch/x86/include/asm/hvm/vm_event.h | 6 +++---
 xen/arch/x86/include/asm/mem_access.h   | 6 +++---
 xen/arch/x86/include/asm/monitor.h      | 6 +++---
 xen/arch/x86/include/asm/vm_event.h     | 6 +++---
 xen/include/asm-generic/monitor.h       | 6 +++---
 xen/include/asm-generic/vm_event.h      | 6 +++---
 xen/include/public/vm_event.h           | 6 +++---
 xen/include/xen/mem_access.h            | 6 +++---
 xen/include/xen/monitor.h               | 6 +++---
 xen/include/xen/vm_event.h              | 6 +++---
 11 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
index 02021be47b..8ef90a1b03 100644
--- a/xen/arch/x86/include/asm/hvm/monitor.h
+++ b/xen/arch/x86/include/asm/hvm/monitor.h
@@ -5,8 +5,8 @@
  * Arch-specific hardware virtual machine monitor abstractions.
  */
 
-#ifndef __ASM_X86_HVM_MONITOR_H__
-#define __ASM_X86_HVM_MONITOR_H__
+#ifndef ASM__X86__HVM__MONITOR_H
+#define ASM__X86__HVM__MONITOR_H
 
 #include <public/vm_event.h>
 
@@ -46,7 +46,7 @@ int hvm_monitor_vmexit(unsigned long exit_reason,
 int hvm_monitor_io(unsigned int port, unsigned int bytes,
                    bool in, bool str);
 
-#endif /* __ASM_X86_HVM_MONITOR_H__ */
+#endif /* ASM__X86__HVM__MONITOR_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/hvm/vm_event.h b/xen/arch/x86/include/asm/hvm/vm_event.h
index 506a85c774..c03df6f15e 100644
--- a/xen/arch/x86/include/asm/hvm/vm_event.h
+++ b/xen/arch/x86/include/asm/hvm/vm_event.h
@@ -5,12 +5,12 @@
  * Hardware virtual machine vm_event abstractions.
  */
 
-#ifndef __ASM_X86_HVM_VM_EVENT_H__
-#define __ASM_X86_HVM_VM_EVENT_H__
+#ifndef ASM__X86__HVM__VM_EVENT_H
+#define ASM__X86__HVM__VM_EVENT_H
 
 void hvm_vm_event_do_resume(struct vcpu *v);
 
-#endif /* __ASM_X86_HVM_VM_EVENT_H__ */
+#endif /* ASM__X86__HVM__VM_EVENT_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 1a52a10322..b774f2f8b6 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -11,8 +11,8 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
-#ifndef __ASM_X86_MEM_ACCESS_H__
-#define __ASM_X86_MEM_ACCESS_H__
+#ifndef ASM__X86__MEM_ACCESS_H
+#define ASM__X86__MEM_ACCESS_H
 
 /*
  * Setup vm_event request based on the access (gla is -1ull if not available).
@@ -44,7 +44,7 @@ int p2m_set_suppress_ve_multi(struct domain *d,
 int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
                         unsigned int altp2m_idx);
 
-#endif /*__ASM_X86_MEM_ACCESS_H__ */
+#endif /*ASM__X86__MEM_ACCESS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
index 3c64d8258f..2d0dde5041 100644
--- a/xen/arch/x86/include/asm/monitor.h
+++ b/xen/arch/x86/include/asm/monitor.h
@@ -19,8 +19,8 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __ASM_X86_MONITOR_H__
-#define __ASM_X86_MONITOR_H__
+#ifndef ASM__X86__MONITOR_H
+#define ASM__X86__MONITOR_H
 
 #include <xen/sched.h>
 
@@ -126,4 +126,4 @@ static inline void arch_monitor_cleanup_domain(struct domain *d) {}
 bool monitored_msr(const struct domain *d, u32 msr);
 bool monitored_msr_onchangeonly(const struct domain *d, u32 msr);
 
-#endif /* __ASM_X86_MONITOR_H__ */
+#endif /* ASM__X86__MONITOR_H */
diff --git a/xen/arch/x86/include/asm/vm_event.h b/xen/arch/x86/include/asm/vm_event.h
index 46e77ed6d9..bac504ba70 100644
--- a/xen/arch/x86/include/asm/vm_event.h
+++ b/xen/arch/x86/include/asm/vm_event.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
  */
 
-#ifndef __ASM_X86_VM_EVENT_H__
-#define __ASM_X86_VM_EVENT_H__
+#ifndef ASM__X86__VM_EVENT_H
+#define ASM__X86__VM_EVENT_H
 
 #include <xen/sched.h>
 #include <public/vm_event.h>
@@ -45,4 +45,4 @@ void vm_event_sync_event(struct vcpu *v, bool value);
 
 void vm_event_reset_vmtrace(struct vcpu *v);
 
-#endif /* __ASM_X86_VM_EVENT_H__ */
+#endif /* ASM__X86__VM_EVENT_H */
diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
index 1ade289099..e53f0823cb 100644
--- a/xen/include/asm-generic/monitor.h
+++ b/xen/include/asm-generic/monitor.h
@@ -9,8 +9,8 @@
  *
  */
 
-#ifndef __ASM_GENERIC_MONITOR_H__
-#define __ASM_GENERIC_MONITOR_H__
+#ifndef ASM_GENERIC__MONITOR_H
+#define ASM_GENERIC__MONITOR_H
 
 #include <xen/errno.h>
 #include <xen/lib.h>
@@ -52,7 +52,7 @@ void arch_monitor_cleanup_domain(struct domain *d)
     /* No arch-specific domain cleanup on GENERIC. */
 }
 
-#endif /* __ASM_GENERIC_MONITOR_H__ */
+#endif /* ASM_GENERIC__MONITOR_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/vm_event.h b/xen/include/asm-generic/vm_event.h
index 620c7b971c..ff538b6ba4 100644
--- a/xen/include/asm-generic/vm_event.h
+++ b/xen/include/asm-generic/vm_event.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
  */
 
-#ifndef __ASM_GENERIC_VM_EVENT_H__
-#define __ASM_GENERIC_VM_EVENT_H__
+#ifndef ASM_GENERIC__VM_EVENT_H
+#define ASM_GENERIC__VM_EVENT_H
 
 #include <xen/sched.h>
 #include <public/vm_event.h>
@@ -52,4 +52,4 @@ void vm_event_reset_vmtrace(struct vcpu *v)
     /* Nothing to do. */
 }
 
-#endif /* __ASM_GENERIC_VM_EVENT_H__ */
+#endif /* ASM_GENERIC__VM_EVENT_H */
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index 3a86f0e208..6b861b06f0 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
  */
 
-#ifndef _XEN_PUBLIC_VM_EVENT_H
-#define _XEN_PUBLIC_VM_EVENT_H
+#ifndef PUBLIC__VM_EVENT_H
+#define PUBLIC__VM_EVENT_H
 
 #include "xen.h"
 
@@ -440,7 +440,7 @@ typedef struct vm_event_st {
 DEFINE_RING_TYPES(vm_event, vm_event_request_t, vm_event_response_t);
 
 #endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
-#endif /* _XEN_PUBLIC_VM_EVENT_H */
+#endif /* PUBLIC__VM_EVENT_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 87d93b31f6..2d0e472934 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -19,8 +19,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _XEN_MEM_ACCESS_H
-#define _XEN_MEM_ACCESS_H
+#ifndef XEN__MEM_ACCESS_H
+#define XEN__MEM_ACCESS_H
 
 #include <xen/types.h>
 #include <xen/mm.h>
@@ -105,7 +105,7 @@ int mem_access_memop(unsigned long cmd,
 }
 #endif /* CONFIG_MEM_ACCESS */
 
-#endif /* _XEN_MEM_ACCESS_H */
+#endif /* XEN__MEM_ACCESS_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
index 713d54f7c1..be301826c0 100644
--- a/xen/include/xen/monitor.h
+++ b/xen/include/xen/monitor.h
@@ -19,8 +19,8 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __XEN_MONITOR_H__
-#define __XEN_MONITOR_H__
+#ifndef XEN__MONITOR_H
+#define XEN__MONITOR_H
 
 #include <public/vm_event.h>
 
@@ -32,4 +32,4 @@ void monitor_guest_request(void);
 
 int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
 
-#endif /* __XEN_MONITOR_H__ */
+#endif /* XEN__MONITOR_H */
diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
index 9a86358b42..3f2cb6fba8 100644
--- a/xen/include/xen/vm_event.h
+++ b/xen/include/xen/vm_event.h
@@ -20,8 +20,8 @@
  */
 
 
-#ifndef __VM_EVENT_H__
-#define __VM_EVENT_H__
+#ifndef XEN__VM_EVENT_H
+#define XEN__VM_EVENT_H
 
 #include <xen/sched.h>
 #include <public/vm_event.h>
@@ -98,7 +98,7 @@ void vm_event_set_registers(struct vcpu *v, vm_event_response_t *rsp);
 
 void vm_event_monitor_next_interrupt(struct vcpu *v);
 
-#endif /* __VM_EVENT_H__ */
+#endif /* XEN__VM_EVENT_H */
 
 /*
  * Local variables:
-- 
2.34.1


