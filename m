Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA82749105B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 19:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258226.444507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9WqC-0005hi-D3; Mon, 17 Jan 2022 18:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258226.444507; Mon, 17 Jan 2022 18:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9WqC-0005b0-70; Mon, 17 Jan 2022 18:34:52 +0000
Received: by outflank-mailman (input) for mailman id 258226;
 Mon, 17 Jan 2022 18:34:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PnDA=SB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n9Wq9-0004g9-Sq
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 18:34:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 262bb5cc-77c4-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 19:34:48 +0100 (CET)
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
X-Inumbo-ID: 262bb5cc-77c4-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642444488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OEodxsk1Z+V+K/D8CnrkWqzHc3WZwn5T5qtHT3QZzcc=;
  b=HtyJ0IrzjxgEpOxTBwkbRYCon7hJMW6wKYMIVaNz9NiRdwzmT//+IcLb
   6YyZrM34Tw5LLXmTZxx56wLpzkRpySOs8eJN9kX9F+Xw+dOdmM+QZnCRL
   pg5UsYQacUaOwcoow63h89yk+bCLs0fg4eDu2m+xbOLCIIquQhKbau7LG
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dEr7Ijtrnhr/isr6azX/ft7g2zfxD0T798i33uStTPmaEHGYXKF6fn3BooN4QVHbJR8ffPJXA4
 K5kMkmrKpQXKsa9vc/LeOUIVoUzZ+BGDs/gjTxWCDiAG8Dt0YBxTYwgbqSoXfg+Pdc20nZLAwy
 8GKJbWEfjbSzvYS9q9+LaweVzMS6/IB8MUEWMILPnyT2qiBihF4dEIrh0+QQCw2m19/uJIJ+uL
 7EQKKlnRsAxt+YrGIENUxSQ3p5J7VsTf18BoZECrWAX1lQ+enPZu8ho8ymuE0LLtS4OQ2Awk8a
 tiayvXI+Sj9hQQUt/NP5VY5Y
X-SBRS: 5.2
X-MesageID: 62573949
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g4X77aNEyASi9E3vrR1ykMFynXyQoLVcMsEvi/4bfWQNrUok0zcCz
 TRNXjqHbPaDYTanKIp2bYni8htSvJ6Bn4M3SQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Es8w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYow2Iv5dxz
 uRvjKWxUjgxHKTApb8CcjANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgm1t2ZsfQae2i
 8wxMTRXZy7Jc152BXwWCLYXuvX3n0LDSmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvla8vz5bW9xhMdQD6Rqy0ojd7zvCGUktG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPuZJhKTysDA3CMqsyq7DFDFtW
 1BeyqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wKu2wufxc1bphUEdMMX
 KM1kVkMjHO0FCH7BZKbnqrrU5h6pUQePYmNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm35irUuOG8GT50n3gNK2OS/OIZ9YYQTmUwzMxP7eyOkj2
 4wBZ5LiJtQ2eLCWXxQ7BqZIfA9adiZqVMmmwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5T8/Eo
 SOwXFF20l36iSGVIAmGcCk7OrjuQYx+vTQwOil1ZQSk3H0qYICO6qYDdsRoIel7pbI7lfMkH
 eMYf8igA+hUTmiV8ToqcpSg/pdpcw6mhFzSMnP9MiQ/ZZNpWyfA5sTgIln07CALAyfu7Zk+r
 rSs2xn1W50GQwg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXj
 l/EDw0ZqO/Bp54O3OPI3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvodxT+RrwKY564e9rrNW1F05TnDCblDtAbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWvKY8L0jN7SNq+KaKDBdJNB6WhS0BdLZ4PevJG
 wv6VBL6P+BnticXDw==
IronPort-HdrOrdr: A9a23:UVeoWK9sx0VSN3TLYTtuk+DiI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re5MjztCWE8Qr5N0tQ+uxoVJPufZqYz+8Q3WBzB8bFYOCFghrLEGgK1+KLqFeMdxEWtNQtsp
 uIG5IOc+EYZmIbsS+V2meF+q4bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.88,296,1635220800"; 
   d="scan'208";a="62573949"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/4] x86/msr: Split MSR_SPEC_CTRL handling
Date: Mon, 17 Jan 2022 18:34:13 +0000
Message-ID: <20220117183415.11150-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220117183415.11150-1-andrew.cooper3@citrix.com>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, move
MSR_SPEC_CTRL handling into the new {get,set}_reg() infrastructure.

Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
The SVM path is currently unreachable because of the CPUID policy.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Rework on top of {get,set}_reg()
---
 xen/arch/x86/hvm/vmx/vmx.c |  7 +++++++
 xen/arch/x86/msr.c         | 21 +++++++++++++++++----
 xen/arch/x86/pv/emulate.c  |  9 +++++++++
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4ff92ab4e94e..c32967f190ff 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2410,6 +2410,9 @@ static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
 
     switch ( reg )
     {
+    case MSR_SPEC_CTRL:
+        return v->arch.msrs->spec_ctrl.raw;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
                __func__, v, reg);
@@ -2424,6 +2427,10 @@ static void vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 
     switch ( reg )
     {
+    case MSR_SPEC_CTRL:
+        v->arch.msrs->spec_ctrl.raw = val;
+        break;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index b834456c7b02..fd4012808472 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -28,6 +28,7 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/msr.h>
+#include <asm/pv/domain.h>
 #include <asm/setup.h>
 
 #include <public/hvm/params.h>
@@ -265,8 +266,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_SPEC_CTRL:
         if ( !cp->feat.ibrsb )
             goto gp_fault;
-        *val = msrs->spec_ctrl.raw;
-        break;
+        goto get_reg;
 
     case MSR_INTEL_PLATFORM_INFO:
         *val = mp->platform_info.raw;
@@ -424,6 +424,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 
     return ret;
 
+ get_reg: /* Delegate register access to per-vm-type logic. */
+    if ( is_pv_domain(d) )
+        *val = pv_get_reg(v, msr);
+    else
+        *val = hvm_get_reg(v, msr);
+    return X86EMUL_OKAY;
+
  gp_fault:
     return X86EMUL_EXCEPTION;
 }
@@ -514,8 +521,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         if ( val & rsvd )
             goto gp_fault; /* Rsvd bit set? */
 
-        msrs->spec_ctrl.raw = val;
-        break;
+        goto set_reg;
 
     case MSR_PRED_CMD:
         if ( !cp->feat.ibrsb && !cp->extd.ibpb )
@@ -663,6 +669,13 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 
     return ret;
 
+ set_reg: /* Delegate register access to per-vm-type logic. */
+    if ( is_pv_domain(d) )
+        pv_set_reg(v, msr, val);
+    else
+        hvm_set_reg(v, msr, val);
+    return X86EMUL_OKAY;
+
  gp_fault:
     return X86EMUL_EXCEPTION;
 }
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index ae049b60f2fc..0a7907ec5e84 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -92,12 +92,16 @@ void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip)
 
 uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
 {
+    const struct vcpu_msrs *msrs = v->arch.msrs;
     struct domain *d = v->domain;
 
     ASSERT(v == current || !vcpu_runnable(v));
 
     switch ( reg )
     {
+    case MSR_SPEC_CTRL:
+        return msrs->spec_ctrl.raw;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
                __func__, v, reg);
@@ -108,12 +112,17 @@ uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
 
 void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
+    struct vcpu_msrs *msrs = v->arch.msrs;
     struct domain *d = v->domain;
 
     ASSERT(v == current || !vcpu_runnable(v));
 
     switch ( reg )
     {
+    case MSR_SPEC_CTRL:
+        msrs->spec_ctrl.raw = val;
+        break;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
-- 
2.11.0


