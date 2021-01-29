Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B50308360
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77578.140608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Iuf-0004sp-RJ; Fri, 29 Jan 2021 01:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77578.140608; Fri, 29 Jan 2021 01:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Iuf-0004s7-NF; Fri, 29 Jan 2021 01:49:29 +0000
Received: by outflank-mailman (input) for mailman id 77578;
 Fri, 29 Jan 2021 01:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5Iud-0004da-Jz
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:49:27 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94a7b5d1-73e6-4697-b6eb-9c4eddf3578f;
 Fri, 29 Jan 2021 01:49:11 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a12so10326725lfb.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:10 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:09 -0800 (PST)
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
X-Inumbo-ID: 94a7b5d1-73e6-4697-b6eb-9c4eddf3578f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jSb7x+4yQyqCLdt0Hc3olaT2zK2MLUsGOPPC0n8/O54=;
        b=LajRGJW2QNITxPoExTnsYEghUCzo33JCP7te/a3L3a9KPv9jZ6kVr3jC5qKr0sNAWf
         +cKp3lSY5XnAN8xd5WpciOkiLtbQfPQjoZ5IOPMToRyU/rk9hJnnG00pqWfAYSGlRjt+
         1M2Klr/sTgU8+onvlEw7FilR0wHfMCmsgW5XXgWoTesPF8axWAnYnOKibmYHekaw53Md
         kmZEHZF69t0Td1duoWTJA/54rKMR+hzpnW62um9DfsScfzxJKKqak9jKJdrzFazYOf7n
         fBHipjyxhEVAXhQrWqlI7KByxbuEVn52cvxuRFcmlH2A1dv5YIvqIb1MiCWfNmAb0ZaO
         ltHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jSb7x+4yQyqCLdt0Hc3olaT2zK2MLUsGOPPC0n8/O54=;
        b=a+u9EJg94cAjIr4SlSnopa4BG+XkAg0uiDTB0QY4tCSeJS11+vxmtGMuB/Pcj/0CmW
         tSdAAQukU2x/Dukm3ctAMM/PcUSUkBwhRe8jV7iqwHDei0hDwqUp381Ner38ZGslBCt2
         JQImgL0i5kFm8mJITY79R3o3NNjIhwj0ikFhARYQEOp4SmAlt5hX2E+8FDvP+0/qg2ph
         tQGwn1kOpVXPWqhzzJGQU6wfB0yAheNu+UtxaL8rm+Ej0378OGsbVLdTjLKP2k3O+6RS
         CmSxbYysSxkbmE9yXRIW7tIZPo3QyARQJHPBKnFz2Nz8eVbP6WvX3oIo1RIVW/FNX74U
         wijw==
X-Gm-Message-State: AOAM5332Suf+Zq5f8FYDuhsF/dBGsbd8nwNaaso5214pP37LSbmK/c8U
	78zgSUvyg0JxNz2ifOHdgLsfYPT0fogA0w==
X-Google-Smtp-Source: ABdhPJx0169AU/SRPkWn0JUW/nPlOzvXT7MZcyjdbLc/GxrcbLQDSLyYre/Ck4bX+arijvXLK/DAow==
X-Received: by 2002:ac2:4436:: with SMTP id w22mr855089lfl.41.1611884949760;
        Thu, 28 Jan 2021 17:49:09 -0800 (PST)
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
Subject: [PATCH V6 05/24] xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
Date: Fri, 29 Jan 2021 03:48:33 +0200
Message-Id: <1611884932-1851-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
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

Changes V5 -> V6:
   - no changes

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


