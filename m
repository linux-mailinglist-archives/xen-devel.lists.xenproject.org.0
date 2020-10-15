Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D89428F70D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7572.19928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6NG-00055C-Lf; Thu, 15 Oct 2020 16:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7572.19928; Thu, 15 Oct 2020 16:45:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6NG-00054h-HX; Thu, 15 Oct 2020 16:45:06 +0000
Received: by outflank-mailman (input) for mailman id 7572;
 Thu, 15 Oct 2020 16:45:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6NF-0004yr-54
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:05 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57abc5f2-97a3-41c2-8c74-148dd32caf9d;
 Thu, 15 Oct 2020 16:44:56 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id c141so4370022lfg.5
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:56 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:44:54 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6NF-0004yr-54
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:05 +0000
X-Inumbo-ID: 57abc5f2-97a3-41c2-8c74-148dd32caf9d
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 57abc5f2-97a3-41c2-8c74-148dd32caf9d;
	Thu, 15 Oct 2020 16:44:56 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id c141so4370022lfg.5
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mmqWLOWImzeNp56Irm3zs3dKXoDrkJx4SfyF9oEDLUs=;
        b=ZsOiFQnpPnZdCYSQBVWu3vFDVo/kvZhqIi2OHTmpT5tDFt99YhqKH/TTcZ2CmHnvT/
         j+ie9IoJGAMqfAnD7BO4U9HVeu5a1tz8O+qkaP6ETO1Dq0KY6FL0rMWiJhWNFq30gRRP
         f6NnvRtAot/LJ68p4cMTYOKKI01Ki1/v5/qLYmIMzQTwjs+Qe4CVbS3ZI6blpFSuq3La
         knvLm2FlC7vCBLYhWPhJtGuBFSKeb76qg5H7YSOpPQzZnIBOCPxHvgXzEopSM1iYGnVl
         W10ihqrjlvYE4AiawmqyIUKaVJDUo6CdwyEF3/1ddzxDIBk6yOyem5tnwsWhuMPE+clD
         3+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mmqWLOWImzeNp56Irm3zs3dKXoDrkJx4SfyF9oEDLUs=;
        b=koR69UWYrvIDJAwXrafEG34W9LbwtPc732jE4KyayubzVJCoftIif2oQ/5IPoj1w0z
         7dbUBYwp7kqXjQ22owbN0Z2cumgeO3GJwjl/S71luwMXOy/JNgnD1MGj0y+tvMHe/yCv
         I2AygLM3duQzcvlSq9+zWqEm5ufm/MHY0HTSvlQ9Uqc1QGx72soOp8WLLc/gOWeOIB56
         Sx23zMddAdpkICeUrT0yoOBNRnfAsE2o1GZss+HR+hyuJxBXuIciAdLZaAr09Fb+/U5L
         CNV9n8HMpSuvxFTcNOYg58tfdyEIGXjNxYd9qGnsqDQTZl4TNdLakB3L4M9n+jsVQVSg
         f2JQ==
X-Gm-Message-State: AOAM533waJkx7bqfe+y66XDkQTgwP0nyaXfvjcc7/dPm/7k3WpbL2OYu
	FbBqj6CF84jvPAzXsgmfRVRqCpEorEshlA==
X-Google-Smtp-Source: ABdhPJy6EuL1uoUXZSQ5V/dK7lmolV1NcGlO5kNY6cD6uQs/KAZrdgDN68W8RZBxYvyVnopQ63KKng==
X-Received: by 2002:ac2:5699:: with SMTP id 25mr1486368lfr.396.1602780295173;
        Thu, 15 Oct 2020 09:44:55 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:44:54 -0700 (PDT)
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
Subject: [PATCH V2 03/23] xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
Date: Thu, 15 Oct 2020 19:44:14 +0300
Message-Id: <1602780274-29141-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and this helper will be used
on Arm as is. Move it to xen/ioreq.h and remove "hvm" prefix.

Although PIO handling on Arm is not introduced with the current series
(it will be implemented when we add support for vPCI), technically
the PIOs exist on Arm (however they are accessed the same way as MMIO)
and it would be better not to diverge now.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch, was split from:
     "[RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common"

Changes V1 -> V2:
   - remove "hvm" prefix
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
index d3433d7..c89df7a 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -159,7 +159,7 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
     }
 
     p = &sv->vcpu->arch.hvm.hvm_io.io_req;
-    if ( hvm_ioreq_needs_completion(p) )
+    if ( ioreq_needs_completion(p) )
         p->data = data;
 
     sv->pending = false;
@@ -185,7 +185,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
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
index 6db4392..8e1603c 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -24,6 +24,13 @@
 struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
                                           unsigned int id);
 
+static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
+{
+    return ioreq->state == STATE_IOREQ_READY &&
+           !ioreq->data_is_ptr &&
+           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
+}
+
 bool hvm_io_pending(struct vcpu *v);
 bool handle_hvm_io_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
-- 
2.7.4


