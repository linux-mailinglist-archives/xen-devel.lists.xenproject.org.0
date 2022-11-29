Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A063B817
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 03:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449223.705887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozqYw-00005F-0c; Tue, 29 Nov 2022 02:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449223.705887; Tue, 29 Nov 2022 02:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozqYv-0008UK-Sm; Tue, 29 Nov 2022 02:41:33 +0000
Received: by outflank-mailman (input) for mailman id 449223;
 Tue, 29 Nov 2022 02:41:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pSa6=35=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1ozqYt-0007YF-OH
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 02:41:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5458ae15-6f8f-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 03:41:30 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FA52D6E;
 Mon, 28 Nov 2022 18:41:36 -0800 (PST)
Received: from a015971.shanghai.arm.com (unknown [10.169.188.104])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A39943F73B;
 Mon, 28 Nov 2022 18:41:27 -0800 (PST)
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
X-Inumbo-ID: 5458ae15-6f8f-11ed-91b6-6bf2151ebd3b
From: Jiamei Xie <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/2] xen/arm: vpl011: drop redundancy in mmio_write/read
Date: Tue, 29 Nov 2022 10:39:35 +0800
Message-Id: <20221129023935.1576133-3-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129023935.1576133-1-jiamei.xie@arm.com>
References: <20221129023935.1576133-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit is to drop redundancy in the function vpl011_mmio_write
and vpl011_mmio_read:
- In vpl011_mmio_read switch block, all cases have a return. So the
  outside one can be removed.
- Each switch case checks access by the same if statments. So we can
  just use one and put it before the switch block.
- The goto label bad_width and read_as_zero is used only once, put the
  code directly

Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
---
 xen/arch/arm/vpl011.c | 66 +++++++++++++------------------------------
 1 file changed, 19 insertions(+), 47 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 1bf803fc1f..80b859baed 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -354,11 +354,15 @@ static int vpl011_mmio_read(struct vcpu *v,
     struct domain *d = v->domain;
     unsigned long flags;
 
+    if ( !vpl011_reg32_check_access(dabt) ) {
+        gprintk(XENLOG_ERR, "vpl011: bad read width %d r%d offset %#08x\n",
+                dabt.size, dabt.reg, vpl011_reg);
+        return 0;
+    }
+
     switch ( vpl011_reg )
     {
     case DR:
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         if ( vpl011->backend_in_domain )
             *r = vreg_reg32_extract(vpl011_read_data(d), info);
         else
@@ -366,31 +370,23 @@ static int vpl011_mmio_read(struct vcpu *v,
         return 1;
 
     case RSR:
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         /* It always returns 0 as there are no physical errors. */
         *r = 0;
         return 1;
 
     case FR:
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         VPL011_LOCK(d, flags);
         *r = vreg_reg32_extract(vpl011->uartfr, info);
         VPL011_UNLOCK(d, flags);
         return 1;
 
     case RIS:
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         VPL011_LOCK(d, flags);
         *r = vreg_reg32_extract(vpl011->uartris, info);
         VPL011_UNLOCK(d, flags);
         return 1;
 
     case MIS:
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         VPL011_LOCK(d, flags);
         *r = vreg_reg32_extract(vpl011->uartris & vpl011->uartimsc,
                                 info);
@@ -398,40 +394,25 @@ static int vpl011_mmio_read(struct vcpu *v,
         return 1;
 
     case IMSC:
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         VPL011_LOCK(d, flags);
         *r = vreg_reg32_extract(vpl011->uartimsc, info);
         VPL011_UNLOCK(d, flags);
         return 1;
 
     case ICR:
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         /* Only write is valid. */
         return 0;
 
     default:
         gprintk(XENLOG_ERR, "vpl011: unhandled read r%d offset %#08x\n",
                 dabt.reg, vpl011_reg);
-        goto read_as_zero;
-    }
-
-    return 1;
-
-read_as_zero:
-    if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
-    VPL011_LOCK(d, flags);
-    *r = 0;
-    VPL011_UNLOCK(d, flags);
-    return 1;
-
-bad_width:
-    gprintk(XENLOG_ERR, "vpl011: bad read width %d r%d offset %#08x\n",
-            dabt.size, dabt.reg, vpl011_reg);
-    return 0;
 
+        /* Read as zero */
+        VPL011_LOCK(d, flags);
+        *r = 0;
+        VPL011_UNLOCK(d, flags);
+        return 1;
+    }
 }
 
 static int vpl011_mmio_write(struct vcpu *v,
@@ -446,14 +427,18 @@ static int vpl011_mmio_write(struct vcpu *v,
     struct domain *d = v->domain;
     unsigned long flags;
 
-    switch ( vpl011_reg )
+   if ( !vpl011_reg32_check_access(dabt) ) {
+       gprintk(XENLOG_ERR, "vpl011: bad write width %d r%d offset %#08x\n",
+               dabt.size, dabt.reg, vpl011_reg);
+       return 0;
+   }
+
+   switch ( vpl011_reg )
     {
     case DR:
     {
         uint32_t data = 0;
 
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         vreg_reg32_update(&data, r, info);
         data &= 0xFF;
         if ( vpl011->backend_in_domain )
@@ -464,8 +449,6 @@ static int vpl011_mmio_write(struct vcpu *v,
     }
 
     case RSR: /* Nothing to clear. */
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         return 1;
 
     case FR:
@@ -474,8 +457,6 @@ static int vpl011_mmio_write(struct vcpu *v,
         goto write_ignore;
 
     case IMSC:
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         VPL011_LOCK(d, flags);
         vreg_reg32_update(&vpl011->uartimsc, r, info);
         vpl011_update_interrupt_status(v->domain);
@@ -483,8 +464,6 @@ static int vpl011_mmio_write(struct vcpu *v,
         return 1;
 
     case ICR:
-        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
-
         VPL011_LOCK(d, flags);
         vreg_reg32_clearbits(&vpl011->uartris, r, info);
         vpl011_update_interrupt_status(d);
@@ -498,14 +477,7 @@ static int vpl011_mmio_write(struct vcpu *v,
     }
 
 write_ignore:
-    if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
     return 1;
-
-bad_width:
-    gprintk(XENLOG_ERR, "vpl011: bad write width %d r%d offset %#08x\n",
-            dabt.size, dabt.reg, vpl011_reg);
-    return 0;
-
 }
 
 static const struct mmio_handler_ops vpl011_mmio_handler = {
-- 
2.25.1


