Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFmEAsFUcmkJiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF1C6A40D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211354.1522957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqc-0000o4-So; Thu, 22 Jan 2026 16:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211354.1522957; Thu, 22 Jan 2026 16:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqc-0000is-JS; Thu, 22 Jan 2026 16:47:54 +0000
Received: by outflank-mailman (input) for mailman id 1211354;
 Thu, 22 Jan 2026 16:47:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqb-0007Ij-39
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:53 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1718468b-f7b2-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:47:51 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b876f3f603eso174720766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:51 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:49 -0800 (PST)
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
X-Inumbo-ID: 1718468b-f7b2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100470; x=1769705270; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bOmIXS7ukX07+v1FZwQcpO5Pv22L8b7W5Nzbqzk3MM=;
        b=Z56vXmNe0vZFGbiPjeQexcThGbP8NxeeLpnxV6YndwGnLUxx9Q46EDgVFU9Z8M8e7s
         HynSDVdmefqwWa18Y+n9yfTSAliiSRU35bu9kGc1iGQdo06xiB6jjWoQnHRhtyN+iAvw
         ny3I4pWBT0EIsKmWypu1rL4XjTclOrM/mvGehOS+Vzv+VvtlkPOSlR7p1mnLJrNOrv14
         1UjM/ozgmm2j4one+o5LiI+KtMewX5U3RlvBA7VpXLdmrtQCRzwusQjo9/xXXgUhtUZU
         08lQNDK5RW+Pi9gSGGn/6npbyH5jEDfGZup1QNskSV0CiLDCnKio2Ju82qtHA+/jMSB6
         Y94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100470; x=1769705270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+bOmIXS7ukX07+v1FZwQcpO5Pv22L8b7W5Nzbqzk3MM=;
        b=hoxYf7+WKNChiix5c00LemQyNKebb51flxfOXlgfU64bDAN+uGDxxjZs9V1Q6zmeTN
         4ZMxP5tG20bfta5RQM80hdC+Kb0+mFHMcvNyIdSV4s649HjftRrTOsD47sxIvoKLnmM/
         f2D77zSLf/dcmTCEwjTO2tUFlqqFOt1UsFR4x+AbPECoWZXZCPTeZ40G2RqNCqM0buiD
         UeRnaqsv9TwahYrR1URiOjHUn+JUoFpuEdi+ewvyjzhjZe3P6Yg34olTYwZYOrrj+I+s
         WDBPo456RA7oR2kOb+o2bwsv5JozjF3iHGlotrevoGqMCaoT25kHvt7ZME7hiDtKLkwQ
         yrGA==
X-Gm-Message-State: AOJu0Yzd+GE3oMnbSFsrUK3shf1YN+mY1RbtwLEj9GDpCxFFhxz6CR5X
	f1AOMCf74aPUHUqmJB0dP0UpWMlWHLuYbYE1WuzgwRsIYUl+6EXFakG147me9A==
X-Gm-Gg: AZuq6aLnnmsXDCvKpq0IwcHYvjVJER95U8YgkDPQFajN9JPLDgAG7cS7Jt6uecnb50L
	P19CuGZSbqyXC1DTN3sIa843rpOTcUtEQkkrQKpXXFFrWVj6zoQ9Anmbni8wltATDqjqhaAxxjf
	HgENvcTyg5UjExuNBrMPkjVirzXrKiJ926jRZdW6B7wKikAGvJDq25VYxZPIX/WvV7QuXiKrhC/
	54BhzMb1Pmf3HrGHjnSkZ5mJtVP9S/Plcn4otzFbBvCyHPKvbPHDHNeB0w63KV0/HBeDoQX1IW8
	0OcF7CyttVKeY1PHRt2DuObjrj/rH2zSbl3MkqwR0CXdAfomEqxrGtch24eULmgLc9n5yUk34ci
	Nb2pWCWR6rSXImrhx8O4U/nmcqqZ82J5PXJvwmYJlou/LC3fT6kFx3/y827aFF3gd3fM1CGEnVW
	URixcGCFGtG4xu+LGpgQRk7CNyLP5JD1QtSmofzByIW3LRBdxUY5I8Bw==
X-Received: by 2002:a17:907:8dc3:b0:b88:587f:f594 with SMTP id a640c23a62f3a-b88587ffb0cmr29524266b.18.1769100470277;
        Thu, 22 Jan 2026 08:47:50 -0800 (PST)
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
Subject: [PATCH v2 09/16] xen/riscv: introduce vcpu_kick() implementation
Date: Thu, 22 Jan 2026 17:47:24 +0100
Message-ID: <0335a7db0343d81ce4256482a464e7ba5df1c204.1769099885.git.oleksii.kurochko@gmail.com>
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
X-Rspamd-Queue-Id: EFF1C6A40D
X-Rspamd-Action: no action

Add a RISC-V implementation of vcpu_kick(), which unblocks the target
vCPU and sends an event check IPI if the vCPU was running on another
processor. This mirrors the behavior of Arm and enables proper vCPU
wakeup handling on RISC-V.

Remove the stub implementation from stubs.c, as it is now provided by
arch/riscv/domain.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/domain.c | 14 ++++++++++++++
 xen/arch/riscv/stubs.c  |  5 -----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index e38c0db62cac..13ac384c4b76 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -1,8 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/cpumask.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
+#include <xen/smp.h>
 #include <xen/vmap.h>
 
 #include <asm/bitops.h>
@@ -240,3 +242,15 @@ void vcpu_sync_interrupts(struct vcpu *v)
 #   error "Update vsieh"
 #endif
 }
+
+void vcpu_kick(struct vcpu *v)
+{
+    bool running = v->is_running;
+
+    vcpu_unblock(v);
+    if ( running && v != current )
+    {
+        perfc_incr(vcpu_kick);
+        smp_send_event_check_mask(cpumask_of(v->processor));
+    }
+}
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index c5784a436574..1f0add97b361 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -208,11 +208,6 @@ void vcpu_block_unless_event_pending(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-void vcpu_kick(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 unsigned long
 hypercall_create_continuation(unsigned int op, const char *format, ...)
 {
-- 
2.52.0


