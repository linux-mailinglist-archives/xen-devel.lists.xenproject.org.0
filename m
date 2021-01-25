Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B151302B20
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74297.133516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47EU-0008QS-1C; Mon, 25 Jan 2021 19:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74297.133516; Mon, 25 Jan 2021 19:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47ET-0008Pq-Ta; Mon, 25 Jan 2021 19:09:01 +0000
Received: by outflank-mailman (input) for mailman id 74297;
 Mon, 25 Jan 2021 19:09:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47ES-0008N7-Ff
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:09:00 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5de0fab-65d0-4a32-8bdd-173fcf92abf3;
 Mon, 25 Jan 2021 19:08:55 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id g10so14126339wrx.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:08:55 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.08.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:08:53 -0800 (PST)
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
X-Inumbo-ID: a5de0fab-65d0-4a32-8bdd-173fcf92abf3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OmZ68sThbF2Pr1tzxlriA0ATbzYpV+ZK7uDIZSpg8u0=;
        b=n/XDYAY3Odji1o91Ht2hy3VfnEDogmW13d3mivdQRhq9LwwlT+NNC3rctots2K5IUD
         Hig1ZLM5ddNxQJrHDBkXRo410Flanld81UvRFev5h5WBJ6k1gs3yRfq6YaZF8SOod4qk
         9Hjq2aV8MNG+Hvk3Ihtrxw2r7IvdH11x9UlZJddNQJb3Sc068tutdrsyEry0aA0eTt83
         8i7MyanlCthGsJ06nTaYTRwGwBzdQPjHg/uIYW0EWvFyEwnL9tEQAOjPrakWVJqzGhnb
         myOgwQRLJG54ZD/kXpwlqKHUQamiiSuBpMQ1dFD1AnZhicsA40CLkLS9B4TBeXIvY1Hk
         tIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OmZ68sThbF2Pr1tzxlriA0ATbzYpV+ZK7uDIZSpg8u0=;
        b=GSmXLf4UVFbRYyoB++exZyr/oA32T5/BlgusmmINwuN2q0pHSy2vgoDVQ4+v0R0n9K
         s8h2iKKC3jWV6RVyTNZNCBGuB67/mBsxA1wH1EVWgCOCT0t2Qez7WGWw8hMoY+J4YmBg
         5Anvyy0DX4bWviJr23R9RwmEXLjLHNowWZ7BWehvk8ibKqRo0NiQZG/CjIaNO7tMZreb
         UAS95wATS5hdttZXPoT8b/VEPMNcpHTaHMgzfcF2iVfs/Q/CeANuekO4idtvzJmt1oWH
         jC61EjXi5DuYMeP5mqJcn4zSqjRjLtRKecEJB//DzoKxtRP7TwfRyI8Egl/P1KIYh9nT
         mfTA==
X-Gm-Message-State: AOAM5333+I1+tNlFov16EpnbEvkUcTL8rXFdSiRvLs8fnSb7zp46Y2id
	3aGOsS007fhHUHRG53yaT/zV3CmXDvfWDw==
X-Google-Smtp-Source: ABdhPJyHFB6Lt2TWXqzfTdOccPKyoaKm+Vm5ffKwBCgxnIF7x2DXPF1Wvd2vBY/fW4W4ulc4PrKv5w==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr2617075wrw.166.1611601734390;
        Mon, 25 Jan 2021 11:08:54 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 02/22] x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
Date: Mon, 25 Jan 2021 21:08:09 +0200
Message-Id: <1611601709-28361-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
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


