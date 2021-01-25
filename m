Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1E8302B25
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74300.133553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47Ej-0000ER-5V; Mon, 25 Jan 2021 19:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74300.133553; Mon, 25 Jan 2021 19:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47Ej-0000Dc-1S; Mon, 25 Jan 2021 19:09:17 +0000
Received: by outflank-mailman (input) for mailman id 74300;
 Mon, 25 Jan 2021 19:09:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47Eh-0008N7-GQ
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:09:15 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bfbffa9-99bf-4ce0-b91f-f14539646bd1;
 Mon, 25 Jan 2021 19:08:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c128so545130wme.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:08:58 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.08.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:08:57 -0800 (PST)
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
X-Inumbo-ID: 9bfbffa9-99bf-4ce0-b91f-f14539646bd1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xxdxnb18IQZyQw5ZgPoetsUdOChDIHKtZYMdcL56th8=;
        b=FsIzJwtHTH9vW8AnlkAXm3RWhRKHKLoV3ChKDtQIyyVp9HApSkaPDBbVf+22GvQUXS
         r0STc8tkCt8xceA4kpvHyuN+wDv4BOvnYUEqCq6rWN0JDOhS0ACrB+SJdzjdgT5KLAdz
         YLeFVTIJMsxgZorparLXgB4uz5EZ3n1qI/iBTv0U5mvEPjh8e+OPtXDoD4meLPz9PpUe
         WFLKtWsTyQFrrMvnpNWC20Ev6Hys/VeLLAD9mUXHXR+Q8yu+4Rz48YwJHaT2rRSQTeK9
         hZaDdw90kP1B66BjPsPWj2xDt0Fmt+rYGg8NJaPzZ0BL3pVTbHsILYRZmeMMJBhIp0+k
         kx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xxdxnb18IQZyQw5ZgPoetsUdOChDIHKtZYMdcL56th8=;
        b=HpbGx1oM0LGYizOqDnCBP+LIuAPeAjMNwf4hDrIJfpLHkNtGsaRh0WCvJSPbpY5L0L
         ijoa3bdRY4g/yrkr1bc0I1WzsJl73IuNr4MzlugZQ7MFucYr00HjDbc5rZJNe1To+VBE
         DK4w6jWjxy5/ymj2/TaECmia1vkuTtN7YVlCZie6YB7TowZETPSIGypo/J/g+82qlIEv
         xCkp5lXXF0zLadIjD8WILb+13/UAuIFnlTzETsA8ChKdOIpPPGc5zVzQSBEk1x2+yGS+
         k+5iSn85tDtyU1mQ3YNyvHAMegAVHrWCE63qP0XaCLZlJouyDBsr+OnG0WYe4yjK+6ff
         JS9A==
X-Gm-Message-State: AOAM532A1avjb9LUV/vHI/G5Hw6Q46FPI8chWr7HAeNsMuNlFKIql4cJ
	WxyQ7q0s+0d4XG5N85mgRieYdk9o8W3CMg==
X-Google-Smtp-Source: ABdhPJxB5/BXkVwijZ/Ht81JLw1VC6Ay7ZTXnKX9A4yseCn/W0p+qmB1wA/DCz69LvKD68FDmipp9A==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr1415480wma.35.1611601737842;
        Mon, 25 Jan 2021 11:08:57 -0800 (PST)
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
Subject: [PATCH V5 05/22] xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
Date: Mon, 25 Jan 2021 21:08:12 +0200
Message-Id: <1611601709-28361-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and this helper will be used
on Arm as is. Move it to xen/ioreq.h and remove "hvm" prefix.

Although PIO handling on Arm is not introduced with the current series
(it will be implemented when we add support for vPCI), technically
the PIOs exist on Arm (however they are accessed the same way as MMIO)
and it would be better not to diverge now.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

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

Changes V3 -> V4:
   - add Jan's A-b

Changes V4 -> V5:
   - rebase
   - add Julien's and Alex's R-b
---
---
 xen/arch/x86/hvm/emulate.c     | 4 ++--
 xen/arch/x86/hvm/io.c          | 2 +-
 xen/common/ioreq.c             | 4 ++--
 xen/include/asm-x86/hvm/vcpu.h | 7 -------
 xen/include/xen/ioreq.h        | 7 +++++++
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 60ca465..c3487b5 100644
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
index 11e007d..ef8286b 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -135,7 +135,7 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
 
     rc = hvmemul_do_pio_buffer(port, size, dir, &data);
 
-    if ( hvm_ioreq_needs_completion(&vio->io_req) )
+    if ( ioreq_needs_completion(&vio->io_req) )
         vio->io_completion = HVMIO_pio_completion;
 
     switch ( rc )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 4e7d91b..61ddd54 100644
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
index 430fc22..e957b52 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -23,6 +23,13 @@
 
 #include <public/hvm/dm_op.h>
 
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


