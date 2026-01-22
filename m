Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMvbB8hUcmnpfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B16A44A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211360.1522995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqh-00020r-Vj; Thu, 22 Jan 2026 16:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211360.1522995; Thu, 22 Jan 2026 16:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqh-0001t0-Fv; Thu, 22 Jan 2026 16:47:59 +0000
Received: by outflank-mailman (input) for mailman id 1211360;
 Thu, 22 Jan 2026 16:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqf-0007Ij-3e
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:57 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17c12453-f7b2-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:47:52 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so162748366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:52 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:51 -0800 (PST)
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
X-Inumbo-ID: 17c12453-f7b2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100472; x=1769705272; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bossoBnEH4JNpm3EBQfuiRI4dS6yLi1VOSzTCCzzE2k=;
        b=ajLOboWcatoihKUlCyAOFvjWaybErVFl6cMz/RNu6GmVGCuXlmZ0cK9RQCPgEWGNmc
         HYBLyP+t9mODCJ0HnzZIkS6R3UkJvuTqCHyrLSJCXdvzcLb+1X5fXLXNnps/AxgEbr0b
         81y+lNVE/FnF+YQzlO5YWXpHmY9p+71yTQkMRTx3oq9QTzhbdm/ThUJEV8kQ2/De8eke
         GEUx5SpguF0lWb54lsi+XxRa1vrztdOCUOvKbtI5qQ0nEMnn9pOJgUpcT5oDiK0N0ks0
         PgH3+rcCxBYa4PyMKI1DhWglPNmqIVq5VnHRQtaGnPt+AaULMxRUH0C0puGV7PfBV88V
         AQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100472; x=1769705272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bossoBnEH4JNpm3EBQfuiRI4dS6yLi1VOSzTCCzzE2k=;
        b=XU3UDJiA/higxnfdlrGQsQOX4bBcgVh9q6NfF7W9J/Kfo8dZC0xhcffiUB/jGT+CP2
         SZuINAxx+2k2FIWMnnZiwoRa/bismN+EzBNOufRLWTCE1arIEA/vyIciZEvtvQ3Rp7EB
         PJxesCQx/Rfsve5dfcy4MZUtnlo84dEyzQC266ODd3aVPQw99gFiGNCE1UT2O7NJqACy
         Li3Wc3qz2qdT8QXWyWSpCI2VVeZVeB71iZJ+W6YuncDmswLBd0/j9cYThPuxQP66I/+X
         9y4QIPEf/2kQ3SACFCX3L1cLadGiG/483a3m+PMWDmdw5FbMCPy/Pe8j+E5pMmGT4wx3
         sb0g==
X-Gm-Message-State: AOJu0YwE3338lL1xbgE2FeiW+C42UQwUNK4seGiX9cPowfA0oo/OS8fv
	iQQJLGV79hXt2q+HzV3+usKBbN+Qba94wCsuEsjhFnThXzAMmW7dEtxaBFl6fA==
X-Gm-Gg: AZuq6aJ/t3xAAFRzUOVvfzTRSBixsKeVxahr/AwYCvtO28ccYYrfYkmqB19M1rUnFYS
	dPFarajGt4EHZeOvlkCr1X3LVSpbpDvairl9AY6QIEuK1weNZqhCrz+OH6IsZX+Gl+Jpt74BdkD
	ybXvdbmbWEmDCt3VePGoYGzVRFurRM7dv6MF6VY+XFrsF93ynOOZ0um0SSFvFSJrILZUlT+4oD2
	5H/O3sCL3lMZIVQVAHTZrMFl/Bi5WHVayVENmcZfBCUqvQxfFJM/9Czy4HJGOe13Qc2RyPDW3fY
	6ctr/3AflOvrBr0p5f1jfoTskdBRtb1iouhQUOIs6r42eWCcKevMFxow7oxhkBSJFFhqYvJt0lb
	7SFlxBS83OPi/+YOxmkMAS7dwprciKszrOg7ozdx8CB9y05vPPljjXVTx+rWlCo+6fPxuPNfXk2
	nuEvVZ3FoQT9pW8vCnZ213h3PKyCgKstXigHgeRiNnh/iBEV/fTjzK4A==
X-Received: by 2002:a17:906:f5a5:b0:b80:149b:badd with SMTP id a640c23a62f3a-b8800342b42mr751480066b.37.1769100471595;
        Thu, 22 Jan 2026 08:47:51 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 10/16] xen/riscv: add vtimer context switch helpers
Date: Thu, 22 Jan 2026 17:47:25 +0100
Message-ID: <fb6be3d3f576f7b362af69e57d2dfd1da3554439.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CA7B16A44A
X-Rspamd-Action: no action

Introduce vtimer_ctx_switch_from() and vtimer_ctx_switch_to() to handle
virtual timer state across vCPU context switches.

At present, vtimer_ctx_switch_from() is a no-op because the RISC-V SSTC
extension, which provides a virtualization-aware timer, is not yet
supported. Xen therefore relies the virtual (SBI-based) timer.

The virtual timer uses Xen's internal timer infrastructure and must be
associated with the pCPU on which the vCPU is currently running so that
timer events can be delivered efficiently. As a result, vtimer_ctx_switch_to()
migrates the timer to the target pCPU when a vCPU is scheduled in.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 0d1555511755..52b7fb7b1cbb 100644
--- a/xen/arch/riscv/include/asm/vtimer.h
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -17,4 +17,7 @@ void vcpu_timer_destroy(struct vcpu *v);
 
 void vtimer_set_timer(struct vtimer *t, uint64_t ticks);
 
+void vtimer_ctx_switch_from(struct vcpu *p);
+void vtimer_ctx_switch_to(struct vcpu *n);
+
 #endif /* ASM__RISCV__VTIMER_H */
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
index b6599fa383b8..6dfd6d836260 100644
--- a/xen/arch/riscv/vtimer.c
+++ b/xen/arch/riscv/vtimer.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/sched.h>
 #include <xen/timer.h>
 
@@ -71,3 +72,17 @@ void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
     migrate_timer(&t->timer, smp_processor_id());
     set_timer(&t->timer, expires);
 }
+
+void vtimer_ctx_switch_from(struct vcpu *p)
+{
+    ASSERT(!is_idle_vcpu(p));
+
+    /* Nothing to do at the moment as SSTC isn't supported now. */
+}
+
+void vtimer_ctx_switch_to(struct vcpu *n)
+{
+    ASSERT(!is_idle_vcpu(n));
+
+    migrate_timer(&n->arch.vtimer.timer, n->processor);
+}
-- 
2.52.0


