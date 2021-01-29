Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34F0308364
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77576.140585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5IuV-0004j6-7j; Fri, 29 Jan 2021 01:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77576.140585; Fri, 29 Jan 2021 01:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5IuV-0004iY-3N; Fri, 29 Jan 2021 01:49:19 +0000
Received: by outflank-mailman (input) for mailman id 77576;
 Fri, 29 Jan 2021 01:49:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5IuT-0004da-K0
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:49:17 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e77de284-e38c-4502-956a-7f7051c4f7bc;
 Fri, 29 Jan 2021 01:49:07 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id q8so10278768lfm.10
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:07 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:05 -0800 (PST)
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
X-Inumbo-ID: e77de284-e38c-4502-956a-7f7051c4f7bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eVg5M4etOTkPCRrhhB/tZ1LxBY8S4/I31OBuPL+kszA=;
        b=SnsAdkI7w/4suM1BajLM2B0yDdJYVDJtuS4pRcawrStCwJ9nbDD5ISYIgevIrAL4aR
         LEMufQa7USXEPtWaiMUjBQFAMYYOP+TmXIFNWhoflAFTZuzRmnY9v/hDBZGajmCm8Qht
         GAqAekaNW10GZIPbISs8Sw3iscErYoHl6xbJCPW+RoTz/N5IgvToYeIz6nujapzdYGwL
         z41Pgxp01tQQp51heQmzctSl0DRty+io47+r/BhUoA/ibBqYkzf39/6vdpRthhTYEX5r
         Nh1cxDQZr7seGOTNhl2wuFmoVxH8mUMTU7oeJXdf9sVc0Qc1q3vflG/1mqCbJ640LQhC
         X47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eVg5M4etOTkPCRrhhB/tZ1LxBY8S4/I31OBuPL+kszA=;
        b=YPk8HTld7gYKQM9/3QZR/WEc4jKkYlb6kmsy+M+Yv0A6Ii3lLVorivkwl4H0OVEABR
         o8fqhwutTFi7r/LxsFiU4yRXlPnwJqVRjNChIBpMXEsrtaAVpwCZUxI6A3Dt57aM1ZsJ
         u3E7VjY+qt57sZnrXBQVS2CE079Y357o0HcPuZGOBQbUuwnemO9iodUJwGB/4cj22MyG
         a5vdfJZR34U7ggYQcae4l3KCezN8eZbsGcnrua8cOumiss+DkGHCw8iHqZJCzZvZHPBV
         KhO3tgCcg1R8IV8V4LOMoXjVnJtMAwDNyn5I6PyAfllHQBOJWerwQfihlBl+9I02Geog
         pv3Q==
X-Gm-Message-State: AOAM530VCyRZoSftN+tOU7WZU/IMMO33xoeALmG3xUSyRqh46XMoHEsj
	4yRZpPbgv/00R0oC+Ea+sUJsXZ0e7nu+lg==
X-Google-Smtp-Source: ABdhPJzqFTraBQXJFYDWt9vD37z9aQXC3uo1ytiF2ICvA+tZEIreCO3mwxcE6x2pH61VcMtcCOdTrA==
X-Received: by 2002:a05:6512:1311:: with SMTP id x17mr895642lfu.307.1611884946190;
        Thu, 28 Jan 2021 17:49:06 -0800 (PST)
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
Subject: [PATCH V6 02/24] x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
Date: Fri, 29 Jan 2021 03:48:30 +0200
Message-Id: <1611884932-1851-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
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
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
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

Changes V4 -> V5:
 - rebase
 - add Julien's and Paul's R-b

Changes V5 -> V6:
 - no changes
---
---
 xen/arch/x86/hvm/ioreq.c        | 16 ++++++++--------
 xen/include/asm-x86/hvm/ioreq.h |  5 +++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 3c3c173..27a4a6f 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -1401,7 +1401,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     pg = iorp->va;
 
     if ( !pg )
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
 
     /*
      * Return 0 for the cases we can't deal with:
@@ -1431,7 +1431,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
         break;
     default:
         gdprintk(XENLOG_WARNING, "unexpected ioreq size: %u\n", p->size);
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
     }
 
     spin_lock(&s->bufioreq_lock);
@@ -1441,7 +1441,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     {
         /* The queue is full: send the iopacket through the normal path. */
         spin_unlock(&s->bufioreq_lock);
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
     }
 
     pg->buf_ioreq[pg->ptrs.write_pointer % IOREQ_BUFFER_SLOT_NUM] = bp;
@@ -1472,7 +1472,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     notify_via_xen_event_channel(d, s->bufioreq_evtchn);
     spin_unlock(&s->bufioreq_lock);
 
-    return X86EMUL_OKAY;
+    return IOREQ_STATUS_HANDLED;
 }
 
 int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
@@ -1488,7 +1488,7 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
         return hvm_send_buffered_ioreq(s, proto_p);
 
     if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
-        return X86EMUL_RETRY;
+        return IOREQ_STATUS_RETRY;
 
     list_for_each_entry ( sv,
                           &s->ioreq_vcpu_list,
@@ -1528,11 +1528,11 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
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
@@ -1546,7 +1546,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
         if ( !s->enabled )
             continue;
 
-        if ( hvm_send_ioreq(s, p, buffered) == X86EMUL_UNHANDLEABLE )
+        if ( hvm_send_ioreq(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
             failed++;
     }
 
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index e2588e9..df0c292 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -55,6 +55,11 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
 
 void hvm_ioreq_init(struct domain *d);
 
+/* This correlation must not be altered */
+#define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
+#define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
+#define IOREQ_STATUS_RETRY       X86EMUL_RETRY
+
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
 
 /*
-- 
2.7.4


