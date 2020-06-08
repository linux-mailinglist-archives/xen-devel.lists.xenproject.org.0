Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCF61F15D3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 11:47:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiEMM-0000oo-1F; Mon, 08 Jun 2020 09:46:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=53kk=7V=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jiEMK-0000oj-Lr
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 09:46:24 +0000
X-Inumbo-ID: ea075dea-a96c-11ea-ba62-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea075dea-a96c-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ld9XxbJQbqjIS+vT5vM4ejftqmMQqf5yzJIBL3/b5XM=; b=Hq6u7DFac5Vhq7LUGGDBfgUhdq
 q3fTmHw9A2sWQ8bVETriBrjcZ8IR2iGFE4krRF1s3WXkDv0QuL0LdygF3DXbcZHhOfthtcWEF9w5B
 4OJAxKgEztpVDrjjslEOcgCYvhq1KqswqdC1+/PGzn3OvJ+P0gqIf18BeRlHPRnidKvo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jiEMJ-0002L8-BL; Mon, 08 Jun 2020 09:46:23 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jiEMJ-0005vc-29; Mon, 08 Jun 2020 09:46:23 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH-for-4.14] ioreq: handle pending emulation racing with ioreq
 server destruction
Date: Mon,  8 Jun 2020 10:46:19 +0100
Message-Id: <20200608094619.28336-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

When an emulation request is initiated in hvm_send_ioreq() the guest vcpu is
blocked on an event channel until that request is completed. If, however,
the emulator is killed whilst that emulation is pending then the ioreq
server may be destroyed. Thus when the vcpu is awoken the code in
handle_hvm_io_completion() will find no pending request to wait for, but will
leave the internal vcpu io_req.state set to IOREQ_READY and the vcpu shutdown
deferall flag in place (because hvm_io_assist() will never be called). The
emulation request is then completed anyway. This means that any subsequent call
to hvmemul_do_io() will find an unexpected value in io_req.state and will
return X86EMUL_UNHANDLEABLE, which in some cases will result in continuous
re-tries.

This patch fixes the issue by moving the setting of io_req.state and clearing
of shutdown deferral (as will as MSI-X write completion) out of hvm_io_assist()
and directly into handle_hvm_io_completion().

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---

This should be incorporated into 4.14 and also be backported to stable
releases
---
 xen/arch/x86/hvm/ioreq.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index c55c4bc4bc..724007016d 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -109,15 +109,7 @@ static void hvm_io_assist(struct hvm_ioreq_vcpu *sv, uint64_t data)
     ioreq_t *ioreq = &v->arch.hvm.hvm_io.io_req;
 
     if ( hvm_ioreq_needs_completion(ioreq) )
-    {
-        ioreq->state = STATE_IORESP_READY;
         ioreq->data = data;
-    }
-    else
-        ioreq->state = STATE_IOREQ_NONE;
-
-    msix_write_completion(v);
-    vcpu_end_shutdown_deferral(v);
 
     sv->pending = false;
 }
@@ -209,6 +201,12 @@ bool handle_hvm_io_completion(struct vcpu *v)
         }
     }
 
+    vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
+        STATE_IORESP_READY : STATE_IOREQ_NONE;
+
+    msix_write_completion(v);
+    vcpu_end_shutdown_deferral(v);
+
     io_completion = vio->io_completion;
     vio->io_completion = HVMIO_no_completion;
 
-- 
2.20.1


