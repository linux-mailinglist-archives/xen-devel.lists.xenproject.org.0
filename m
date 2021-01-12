Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774FF2F3BEC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66041.117139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRb9-0002VM-DB; Tue, 12 Jan 2021 21:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66041.117139; Tue, 12 Jan 2021 21:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRb9-0002Ut-92; Tue, 12 Jan 2021 21:53:07 +0000
Received: by outflank-mailman (input) for mailman id 66041;
 Tue, 12 Jan 2021 21:53:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRb7-0002PK-GW
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:53:05 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81985b04-9479-48c3-84a9-d4e20d4135d5;
 Tue, 12 Jan 2021 21:52:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q18so33729wrn.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:52:55 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.52.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:52:53 -0800 (PST)
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
X-Inumbo-ID: 81985b04-9479-48c3-84a9-d4e20d4135d5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QWHMuQ5lPAzTcBVldh9Gt+8euNBZlz7bxLsK7R0b0yU=;
        b=mAT2eBES08YGIxiAlWU9l2u0NtTvOwwSfQueXSviYo2muVGEojhEDOQqmxc4TBEQDW
         4lyy7TEB43fYgHJ/JADXUYNDRsNsqf347iBSkS3fgkoycZXmJ4veRQovHf+5XqFfquX3
         uijNsIybYGEat+ofNY0hxaosScLlsJqn6S5r+EMAn7kk0MOK14n5KUD4oHZ4o0JqSBCe
         8367d6TgCJBsT+YudwG9ZDMSiN5j6R9+d4ISQ6R+84xb56EhxSLp9dEiYvOQYvEKw6Rm
         ePh9cA5PH0VVC8xnmIthzMFTFqU1Ur+gFmK99SQjjwQg9ewMEQ9GY3eAvL9gderwKEyf
         RaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QWHMuQ5lPAzTcBVldh9Gt+8euNBZlz7bxLsK7R0b0yU=;
        b=uCehEyWSMqVkg62HpyK57X71rHVjiNjNSAES7mQCg9+o0rxuIUE7XNvh+OF9Eb09Ve
         FrBfgL/M0i6OnCrrclpZpzu8ePW001SWeN6hjHrpMWQ4gIo8UkRHYdIPpxKjimzh1aLD
         vzQuJh+tt1mqw7jmlN6bhGzOGrYr1KhFoSQk1JEMBEu2IGrfjFz4zpW7dZSGVAtcRh2b
         FqMkrDnQOx5gvsHLAKTYbPi+9YboTg5sEcxJGWZNppkUUx9efCAK/i8YQV4y//LzEhVO
         3tMSpG/gZrySuavG3xgZi1w+yJ6g9mVtipACfthqlk2l8iVvg2h+ZTTCSL5Acj0k89pf
         BYEQ==
X-Gm-Message-State: AOAM533owD5gRi1WmGqa1ab82BVeTesus5zbWouaQiuV8QG4Kh7Mnitc
	6SXlyalk33pqRMgAsVf4XEKkFttsuaoYOg==
X-Google-Smtp-Source: ABdhPJw3EKSVcU+lttAR3qeElqAQOmzZ8Q/bAmZPJD/LH2QGhu+22aJk7VxRLCGkmQ1cLAezVYDemQ==
X-Received: by 2002:adf:e60f:: with SMTP id p15mr826636wrm.60.1610488374097;
        Tue, 12 Jan 2021 13:52:54 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V4 02/24] x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
Date: Tue, 12 Jan 2021 23:52:10 +0200
Message-Id: <1610488352-18494-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch continues to make some preparation to x86/hvm/ioreq.c
before moving to the common code.

Add IOREQ_STATUS_* #define-s and update candidates for moving
since X86EMUL_* shouldn't be exposed to the common code in
that form.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V2 -> V3:
 - new patch, was split from
   [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it common

Changes V3 -> V4:
 - add Alex's R-b and Jan's A-b
 - add a comment above IOREQ_STATUS_* #define-s
---
 xen/arch/x86/hvm/ioreq.c        | 16 ++++++++--------
 xen/include/asm-x86/hvm/ioreq.h |  5 +++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 468fe84..ff9a546 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -1405,7 +1405,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     pg = iorp->va;
 
     if ( !pg )
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
 
     /*
      * Return 0 for the cases we can't deal with:
@@ -1435,7 +1435,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
         break;
     default:
         gdprintk(XENLOG_WARNING, "unexpected ioreq size: %u\n", p->size);
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
     }
 
     spin_lock(&s->bufioreq_lock);
@@ -1445,7 +1445,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     {
         /* The queue is full: send the iopacket through the normal path. */
         spin_unlock(&s->bufioreq_lock);
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
     }
 
     pg->buf_ioreq[pg->ptrs.write_pointer % IOREQ_BUFFER_SLOT_NUM] = bp;
@@ -1476,7 +1476,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     notify_via_xen_event_channel(d, s->bufioreq_evtchn);
     spin_unlock(&s->bufioreq_lock);
 
-    return X86EMUL_OKAY;
+    return IOREQ_STATUS_HANDLED;
 }
 
 int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
@@ -1492,7 +1492,7 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
         return hvm_send_buffered_ioreq(s, proto_p);
 
     if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
-        return X86EMUL_RETRY;
+        return IOREQ_STATUS_RETRY;
 
     list_for_each_entry ( sv,
                           &s->ioreq_vcpu_list,
@@ -1532,11 +1532,11 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
             notify_via_xen_event_channel(d, port);
 
             sv->pending = true;
-            return X86EMUL_RETRY;
+            return IOREQ_STATUS_RETRY;
         }
     }
 
-    return X86EMUL_UNHANDLEABLE;
+    return IOREQ_STATUS_UNHANDLED;
 }
 
 unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
@@ -1550,7 +1550,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
         if ( !s->enabled )
             continue;
 
-        if ( hvm_send_ioreq(s, p, buffered) == X86EMUL_UNHANDLEABLE )
+        if ( hvm_send_ioreq(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
             failed++;
     }
 
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index 13d35e1..f140ef4 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -77,6 +77,11 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
                                      uint64_t *addr);
 void arch_ioreq_domain_init(struct domain *d);
 
+/* This correlation must not be altered */
+#define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
+#define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
+#define IOREQ_STATUS_RETRY       X86EMUL_RETRY
+
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
 
 /*
-- 
2.7.4


