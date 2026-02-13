Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH7QKnFRj2nnPgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE7A138011
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231321.1536586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2p-00087z-3O; Fri, 13 Feb 2026 16:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231321.1536586; Fri, 13 Feb 2026 16:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2o-00085d-Kh; Fri, 13 Feb 2026 16:29:26 +0000
Received: by outflank-mailman (input) for mailman id 1231321;
 Fri, 13 Feb 2026 16:29:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2m-0005Wn-5q
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:24 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2732d33a-08f9-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 17:29:22 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso5716165e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:22 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:21 -0800 (PST)
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
X-Inumbo-ID: 2732d33a-08f9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000161; x=1771604961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hWO4jWrfrLp9yyPELp3VQAn+IIJ4GM5hz6O0oK25QU=;
        b=CCIadwNVQE/aeo301zLTi9O2azuT9S4rQGI3SHrWi8m+kDwUCPazBIQhNlXEMxdDaQ
         RfXXMe/BSyiRAhdXThU0XWsnulvi+yQIEVhyDqNfT4qlJwAeFc0LDPnR8LsClAukGfi5
         ka0kVDK0hmKiJVpkB6oc4K3yraQdwW1an5MdyFxiuPAo1IcLJgjmGfsp4p2tlrejTZtk
         QfmEilm9FYL0JlueRBNJZS0B+QCj3VdMtsgRXarCpSKjg8IN5RoC00IJswQofgoSEQVD
         7OVKIreoSYZ4aLUofrQhIVws+JdYYNh87YKYpZ8xD8TOQzygvfCuwYNOlLq2PbWIr2ov
         wpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000161; x=1771604961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hWO4jWrfrLp9yyPELp3VQAn+IIJ4GM5hz6O0oK25QU=;
        b=jj2DDOxv2IIwjKPnjBKOyujGdQak2jOmU513aIjMMIx5j5uNdKNPTp9xtaZ78HgMVu
         VaYwbZ/In/nY4vXHvYDCGY5d8Y8+Il4NEwlUdroWe29VAi3BJPvTQ4sEK6tVMGcZp6t/
         TiJpJAhOcDtgoHMVWzsVv/2wifXcPHJVkxrV5mmv48KdS3s/FcrT0zDXbFJh9xigDpyS
         F7+uTZ6dwDDnRUNZfbGRhxlmW48uGtY1DJIu6b/ydaqEzaG/IWDXfn5nXXFNbFqAt6kJ
         0fmK7F95hUxMJygt79lSw16wSsG6MGXGSleoa6lMPVQutcHi6S322VXF8q3Zn0TX/85Q
         NdqQ==
X-Gm-Message-State: AOJu0Yw6o3aVVKT8eF7VyM6vFBIchn5dgU8dcmJ6oeHa5KowngsM2n3s
	w4gl60ZVlo3OUiQIyk6CgtasU72qTYYBXeOoMkS34RkRv/ef3ftBTQjlOJOHMM38
X-Gm-Gg: AZuq6aJL1ZN6zEeASpi67PvEPIgKoc/J/IxkH8xApJR1GE0Qrk+jnpcJBfB1UQcwQ/H
	HBXzl/q7WVDOgQURO0sOAWkDmFhJ6nGiUcQR+QoHvrbR/llz4G1qAaUrYmijnOKNB7jX2SEDufV
	XOOUnPLzZPeeobRDvuDo8yyFQXnoIi6HBXCL2lQu2BjOQPjvVbJp/mQy2ojnTvLzff8UcxClIqP
	6xG2lFwJyEvdMxu18JCYFpPVOfAaS8tjN//OXMrmTIcZJJAUmDY3wTFkjynS6kjOtMqDQssX7E5
	pFM62mJ5uSjtpWm6QNxJY3x9oYzB0NwkAiH9J1y/nnUhbVeZX0HEcu5hhmvuSK5SNcbzG4TXVld
	/y0Zk7Yqem0Y2+R3mMYhDsxYy1GeXDdWCbhUpm5xfyHPtn5ImURcWl8hDpI9RMrnl8ImqNdSLSs
	Fty4yKbNt2nS4rukbvXurHdo16gC0L9mXQd5wIVtJKotZf7uUZwy1iyEBLHOPYxXXEfJWw1/wpq
	+fu
X-Received: by 2002:a05:600c:c8d:b0:480:699c:abe9 with SMTP id 5b1f17b1804b1-48373a7b3f1mr37905615e9.37.1771000161294;
        Fri, 13 Feb 2026 08:29:21 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 10/16] xen/riscv: add vtimer context switch helpers
Date: Fri, 13 Feb 2026 17:28:56 +0100
Message-ID: <a684274407a6f02fdb09f9d08e30ed8f1c09e32b.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EBE7A138011
X-Rspamd-Action: no action

Introduce vtimer_ctxt_switch_from() and vtimer_ctxt_switch_to() to handle
virtual timer state across vCPU context switches.

At present, vtimer_ctxt_switch_from() is a no-op because the RISC-V SSTC
extension, which provides a virtualization-aware timer, is not yet
supported. Xen therefore relies the virtual (SBI-based) timer.

The virtual timer uses Xen's internal timer infrastructure and must be
associated with the pCPU on which the vCPU is currently running so that
timer events can be delivered efficiently. As a result, vtimer_ctxt_switch_to()
migrates the timer to the target pCPU when a vCPU is scheduled in.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - s/vtimer_ctx_switch_to/vtimer_ctxt_switch_to
 - s/vtimer_ctx_switch_from/vtimer_ctxt_switch_from
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Align the parameters names for  vtimer_ctx_switch_from() and vtimer_ctx_switch_to() in
   declarations to match the ones in the defintions to make Misra happy.
 - s/vtimer_save/vtimer_ctx_switch_from.
 - s/vtimer_restore/vtimer_ctx_switch_to.
 - Update the commit message.
---
 xen/arch/riscv/include/asm/vtimer.h |  3 +++
 xen/arch/riscv/vtimer.c             | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
index 0d1555511755..c70b0226515e 100644
--- a/xen/arch/riscv/include/asm/vtimer.h
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -17,4 +17,7 @@ void vcpu_timer_destroy(struct vcpu *v);
 
 void vtimer_set_timer(struct vtimer *t, uint64_t ticks);
 
+void vtimer_ctxt_switch_from(struct vcpu *p);
+void vtimer_ctxt_switch_to(struct vcpu *n);
+
 #endif /* ASM__RISCV__VTIMER_H */
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
index 32d142bcdfcd..afd8a53a7387 100644
--- a/xen/arch/riscv/vtimer.c
+++ b/xen/arch/riscv/vtimer.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/sched.h>
 #include <xen/timer.h>
 
@@ -69,3 +70,17 @@ void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
     migrate_timer(&t->timer, smp_processor_id());
     set_timer(&t->timer, expires);
 }
+
+void vtimer_ctxt_switch_from(struct vcpu *p)
+{
+    ASSERT(!is_idle_vcpu(p));
+
+    /* Nothing to do at the moment as SSTC isn't supported now. */
+}
+
+void vtimer_ctxt_switch_to(struct vcpu *n)
+{
+    ASSERT(!is_idle_vcpu(n));
+
+    migrate_timer(&n->arch.vtimer.timer, n->processor);
+}
-- 
2.52.0


