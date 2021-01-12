Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380062F3BEB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66043.117164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRbJ-0002fb-7l; Tue, 12 Jan 2021 21:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66043.117164; Tue, 12 Jan 2021 21:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRbJ-0002em-2D; Tue, 12 Jan 2021 21:53:17 +0000
Received: by outflank-mailman (input) for mailman id 66043;
 Tue, 12 Jan 2021 21:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRbH-0002PK-Gx
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:53:15 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9aef448b-8509-4bca-94d2-3be8ac9a3e61;
 Tue, 12 Jan 2021 21:52:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t16so25233wra.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:52:58 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.52.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:52:57 -0800 (PST)
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
X-Inumbo-ID: 9aef448b-8509-4bca-94d2-3be8ac9a3e61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ur2doLrkeRpzHl0V4SmQjygeSJuG5lvaFuMWECBZE/g=;
        b=j0JH2Q7Pqr+Nlcd7z70B4l6w9OQVeUrKSz6mp03amsHqY60VN1YhbWaotnag8U0U6G
         XKPLOITHy4uPhoirirJpHUEODPvm00TfxPWan8474o66z6weWFDTH2PvwZNsk+Ks/91e
         wyz5O7Ovy+FhXCZIWCkLlCCjCT06oa4vyq2tYlIPM3uj7+/dnnzFgFtqU/4OvxVH6QyM
         atgsXYBTeGw+JPLq4AXWtZIjYc1uNw3T/0suUqqxOYwRtmpwnqc/Lgr28n6W5gIWwRFm
         KJ58vUE3Kk3cOQIojxIYmGFQoxghBuPi0CFIfwFP6hJ5pOvWcf4Yddlq8reCuBpcb9Wx
         NylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ur2doLrkeRpzHl0V4SmQjygeSJuG5lvaFuMWECBZE/g=;
        b=HvEptg5Z9AS6ciGPrHRvkDEc8r+OxoR8pSlccfSakgHZOz3K1/0Rh3GaR/3WfgXyiR
         sQzsyeGGAicQeE555LAHG8vmKyr4Cp5JoGt84xF+EusPIKmytydc/3fUk85+uV7n0WYo
         w8a7VSlkHY/nPcTtBfazgYMmxEUQ8lg2Vmw/KITsKVP4/kQAnFk9hzhxeTH2QNtCXBeW
         uG0HaGARdZ2arPB4LduCfoNcIiVWuBH4h+rqxs+Jzd+UdHXDpmkDwUeKUKIC5imjHswk
         PNgVLJPN4xB+pDIJ4BFVGzRik81T4qIvcWZ6Vy+0uxsUNlbW/uOF3Jo1rvhMv10YI+hL
         G9Cg==
X-Gm-Message-State: AOAM533JkqkqUxXlOJ4zQ8jVZnzS5ZkaIh/E7DHp8jkcFKjCToDhCC3Q
	UrOWe15BOaD4spByvPT45Cy1nmHx8qKXvg==
X-Google-Smtp-Source: ABdhPJxDeSvoUS2azXxLK8tOUVZiMgutPZ1BiNLWw/t4zed1QNO/dgtADzJJUl5U0cxvFfRqetMnSg==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr813289wrw.247.1610488377620;
        Tue, 12 Jan 2021 13:52:57 -0800 (PST)
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
Subject: [PATCH V4 05/24] xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
Date: Tue, 12 Jan 2021 23:52:13 +0200
Message-Id: <1610488352-18494-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

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
index 8a004c4..47e38b6 100644
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
index 7b67950..750d884 100644
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


