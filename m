Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318072C8236
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:32:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40804.73769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTc-0000b4-66; Mon, 30 Nov 2020 10:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40804.73769; Mon, 30 Nov 2020 10:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTc-0000aR-1x; Mon, 30 Nov 2020 10:32:12 +0000
Received: by outflank-mailman (input) for mailman id 40804;
 Mon, 30 Nov 2020 10:32:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgTa-0000Uu-Bt
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:32:10 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c79e6e20-71f7-4aeb-9f98-f5e9636a98a0;
 Mon, 30 Nov 2020 10:32:00 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u19so20609196lfr.7
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:00 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.31.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:31:58 -0800 (PST)
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
X-Inumbo-ID: c79e6e20-71f7-4aeb-9f98-f5e9636a98a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DAVWNnxNI+etFFRHAWRdvvzFJ2BAef63O413YzD2Bp8=;
        b=HoKpwzrYIldx9hYT5rofXiD7iYq8fpH+km86eXPPvxLKEk0zVaLE5FUaNY6lxP7au2
         t4VQAGseGeBfRcpgYEy5/dFGyPQEr08bYNjwPJ+MFM9VKs4MbOKSRv9LJx2iYXLCdWuS
         kaWsKSDcowlOa9TlN5pyIYRzAhuYA6TvfrR1fpImak01PW13ZNTc4fbEYHzXDBjbNBSk
         GWgcWqntuS7xR5Frw4jGZG3oqwHJN1gDyLPRWmDy/28QmhN3jc0vKZq//xOgdOSToO0w
         22ETbEgDw5lCoqpLLOblmIILWVigeb/ne3+kQ4VZjBN0SG7XBibIeB2D3yJM4QXLd2EB
         RA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DAVWNnxNI+etFFRHAWRdvvzFJ2BAef63O413YzD2Bp8=;
        b=Hnszf4u4uZL1s8M89P8Xa7VagIUTLvX66I391bZeUSslXyrA8HgMzl7Puczz+48Gh3
         B9hi0bSdbiuYVFTGLnz6YOXqYIcOW09oHxyegoLM+rxQlmfPPRb+scgf6Uqiu8VIcYGL
         IRrcc1i5FDSqLpz7QJYvN65ZyTrBMopXVb2srWi4fta5m7QaNEycnBsK7HOGdFsYbph7
         EDxLuEFV7kWRu8UTrvdNqWpeBpO+/pk+pYyf+VEEyhJHVHPU8ncC0/6Glva2hi4K/6aG
         dFvRfwnyTYDLrpBBSOygOzUII8DB8r5R9lQDXKnlYUCNd3KJiRq/JoEAoCU2mDfDvhOM
         olew==
X-Gm-Message-State: AOAM531AselRB8BDmxQjHAkt/clfTTNa+zhH14dhLyc2n1ILpbG7KE4X
	kxyhTpWmduxAH7yUuUDPZzPhnsz+WWujUQ==
X-Google-Smtp-Source: ABdhPJzJZ7NsJA4nffR8QNtTSSiXN0wYjOa8ZqEK32XZp02Z4ytCpN1Glbo+EebOv8yWpCrpb2wrAQ==
X-Received: by 2002:a19:6551:: with SMTP id c17mr9075180lfj.46.1606732319305;
        Mon, 30 Nov 2020 02:31:59 -0800 (PST)
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
Subject: [PATCH V3 02/23] x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
Date: Mon, 30 Nov 2020 12:31:17 +0200
Message-Id: <1606732298-22107-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch continues to make some preparation to x86/hvm/ioreq.c
before moving to the common code.

Add IOREQ_STATUS_* #define-s and update candidates for moving
since X86EMUL_* shouldn't be exposed to the common code in
that form.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V2 -> V3:
 - new patch, was split from
   [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it common
---
---
 xen/arch/x86/hvm/ioreq.c        | 16 ++++++++--------
 xen/include/asm-x86/hvm/ioreq.h |  4 ++++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index e3dfb49..9525554 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -1400,7 +1400,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     pg = iorp->va;
 
     if ( !pg )
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
 
     /*
      * Return 0 for the cases we can't deal with:
@@ -1430,7 +1430,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
         break;
     default:
         gdprintk(XENLOG_WARNING, "unexpected ioreq size: %u\n", p->size);
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
     }
 
     spin_lock(&s->bufioreq_lock);
@@ -1440,7 +1440,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     {
         /* The queue is full: send the iopacket through the normal path. */
         spin_unlock(&s->bufioreq_lock);
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
     }
 
     pg->buf_ioreq[pg->ptrs.write_pointer % IOREQ_BUFFER_SLOT_NUM] = bp;
@@ -1471,7 +1471,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     notify_via_xen_event_channel(d, s->bufioreq_evtchn);
     spin_unlock(&s->bufioreq_lock);
 
-    return X86EMUL_OKAY;
+    return IOREQ_STATUS_HANDLED;
 }
 
 int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
@@ -1487,7 +1487,7 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
         return hvm_send_buffered_ioreq(s, proto_p);
 
     if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
-        return X86EMUL_RETRY;
+        return IOREQ_STATUS_RETRY;
 
     list_for_each_entry ( sv,
                           &s->ioreq_vcpu_list,
@@ -1527,11 +1527,11 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
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
@@ -1545,7 +1545,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
         if ( !s->enabled )
             continue;
 
-        if ( hvm_send_ioreq(s, p, buffered) == X86EMUL_UNHANDLEABLE )
+        if ( hvm_send_ioreq(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
             failed++;
     }
 
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index cc79285..e9c8b2d 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -74,6 +74,10 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
 
 void hvm_ioreq_init(struct domain *d);
 
+#define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
+#define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
+#define IOREQ_STATUS_RETRY       X86EMUL_RETRY
+
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
 
 /*
-- 
2.7.4


