Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319122C823A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:32:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40806.73793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTl-0000ko-Ti; Mon, 30 Nov 2020 10:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40806.73793; Mon, 30 Nov 2020 10:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTl-0000jz-PC; Mon, 30 Nov 2020 10:32:21 +0000
Received: by outflank-mailman (input) for mailman id 40806;
 Mon, 30 Nov 2020 10:32:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgTk-0000Uu-CG
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:32:20 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2805de2e-574c-4796-84cd-436d506d06e0;
 Mon, 30 Nov 2020 10:32:04 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y7so17018053lji.8
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:03 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:02 -0800 (PST)
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
X-Inumbo-ID: 2805de2e-574c-4796-84cd-436d506d06e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rGoTPdf/l+qRRLf+/W/rrPRXJCM3LTC59V6irfyoxMU=;
        b=jV/3EVtrfs9wG+IGfm6YI638irh46ArUIkqAPh0C+AWXimT1zEZ0+fzXBVgRjPUvAO
         QDkpKJxcH4xTo/N0J0itT42n1OCqn/GAvNC/5AY0a3gs+NMiHTvSWN67HA9PkqKz/IgF
         2kvOyamIEBWswBq1h8d80RinN2ccMiyTfX1b4uRpAYGPjGdedcNVyYHndK6hZaOTqURQ
         TYZmiwQsue9OqUfUy0q4wONRuwlVwiQyzgtrPJF+Bbnh3on5+h6qVaiHPDC7Vc4y4hFD
         J1AXDtEKUpUj2REvXtdBk7ZWt3EB4SHjkp2xkIhTb6klVXwtMzFfjsRfBWYMeG2cXprc
         1YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rGoTPdf/l+qRRLf+/W/rrPRXJCM3LTC59V6irfyoxMU=;
        b=fSzjwr1CnhAzcVgjG6O2YXt1HXxrsswOZh7hJV6JTrAL5/fv+XDDjgxufIVjnnRl/t
         qLCDVSfTQ6nD9UseAyepeTOLpkUwITjzG5bQLQQq5xdGgtjYp3zbq225NTNxnYkaaE/4
         14YJEP/xC0V58XAzQEDFs4dZ0kRvgECtaMYETrrkHgahuqe97x/LjarG5CYoWi36FKkD
         +P5CMBe42zRbd8ozJ278P6VeJzFIOBXPVTDhje8btOvmkreMjn9Lq/aGK3Bodvs6I3DJ
         TtLdCAyIkf6krUoPggmRQtKhSkC/saBpEqQY3nGu1ZfHTlLEQYYUNLN6GyyiyzeQJgNi
         L+kw==
X-Gm-Message-State: AOAM53105iB2Wc9H66p5sb6dw2n6tHSuXa1IP2sreOARd4y3Qxs1i7pt
	8yE1xEq1xZrYRgrwdzB8GC1l+pIkaXLWiw==
X-Google-Smtp-Source: ABdhPJy47RPNrcGD+P3/cQU3hJMi9G/IQpqMoec+hwdC5rhZFoXqEO5xPoFNlLh9h6hCaQxcwARbQQ==
X-Received: by 2002:a2e:8e81:: with SMTP id z1mr8655507ljk.316.1606732322757;
        Mon, 30 Nov 2020 02:32:02 -0800 (PST)
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
Subject: [PATCH V3 05/23] xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
Date: Mon, 30 Nov 2020 12:31:20 +0200
Message-Id: <1606732298-22107-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and this helper will be used
on Arm as is. Move it to xen/ioreq.h and remove "hvm" prefix.

Although PIO handling on Arm is not introduced with the current series
(it will be implemented when we add support for vPCI), technically
the PIOs exist on Arm (however they are accessed the same way as MMIO)
and it would be better not to diverge now.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Paul Durrant <paul@xen.org>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch, was split from:
     "[RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common"

Changes V1 -> V2:
   - remove "hvm" prefix

Changes V2 -> V3:
   - add Paul's R-b
---
---
 xen/arch/x86/hvm/emulate.c     | 4 ++--
 xen/arch/x86/hvm/io.c          | 2 +-
 xen/common/ioreq.c             | 4 ++--
 xen/include/asm-x86/hvm/vcpu.h | 7 -------
 xen/include/xen/ioreq.h        | 7 +++++++
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 24cf85f..5700274 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -336,7 +336,7 @@ static int hvmemul_do_io(
             rc = hvm_send_ioreq(s, &p, 0);
             if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
                 vio->io_req.state = STATE_IOREQ_NONE;
-            else if ( !hvm_ioreq_needs_completion(&vio->io_req) )
+            else if ( !ioreq_needs_completion(&vio->io_req) )
                 rc = X86EMUL_OKAY;
         }
         break;
@@ -2649,7 +2649,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
     if ( rc == X86EMUL_OKAY && vio->mmio_retry )
         rc = X86EMUL_RETRY;
 
-    if ( !hvm_ioreq_needs_completion(&vio->io_req) )
+    if ( !ioreq_needs_completion(&vio->io_req) )
         completion = HVMIO_no_completion;
     else if ( completion == HVMIO_no_completion )
         completion = (vio->io_req.type != IOREQ_TYPE_PIO ||
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 3e09d9b..b220d6b 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -135,7 +135,7 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
 
     rc = hvmemul_do_pio_buffer(port, size, dir, &data);
 
-    if ( hvm_ioreq_needs_completion(&vio->io_req) )
+    if ( ioreq_needs_completion(&vio->io_req) )
         vio->io_completion = HVMIO_pio_completion;
 
     switch ( rc )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 13ea959..44385ef 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -160,7 +160,7 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
     }
 
     p = &sv->vcpu->arch.hvm.hvm_io.io_req;
-    if ( hvm_ioreq_needs_completion(p) )
+    if ( ioreq_needs_completion(p) )
         p->data = data;
 
     sv->pending = false;
@@ -186,7 +186,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
     if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
         return false;
 
-    vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
+    vio->io_req.state = ioreq_needs_completion(&vio->io_req) ?
         STATE_IORESP_READY : STATE_IOREQ_NONE;
 
     msix_write_completion(v);
diff --git a/xen/include/asm-x86/hvm/vcpu.h b/xen/include/asm-x86/hvm/vcpu.h
index 5ccd075..6c1feda 100644
--- a/xen/include/asm-x86/hvm/vcpu.h
+++ b/xen/include/asm-x86/hvm/vcpu.h
@@ -91,13 +91,6 @@ struct hvm_vcpu_io {
     const struct g2m_ioport *g2m_ioport;
 };
 
-static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
-{
-    return ioreq->state == STATE_IOREQ_READY &&
-           !ioreq->data_is_ptr &&
-           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
-}
-
 struct nestedvcpu {
     bool_t nv_guestmode; /* vcpu in guestmode? */
     void *nv_vvmcx; /* l1 guest virtual VMCB/VMCS */
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index ad47c61..3cc333d 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -21,6 +21,13 @@
 
 #include <xen/sched.h>
 
+static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
+{
+    return ioreq->state == STATE_IOREQ_READY &&
+           !ioreq->data_is_ptr &&
+           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
+}
+
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
-- 
2.7.4


