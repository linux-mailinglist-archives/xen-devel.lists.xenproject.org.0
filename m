Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD66BlY1oGkqgwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:58:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF7A1A5750
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241586.1542617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vva0D-0005Nf-Gb; Thu, 26 Feb 2026 11:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241586.1542617; Thu, 26 Feb 2026 11:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vva0D-0005Kr-Ds; Thu, 26 Feb 2026 11:57:57 +0000
Received: by outflank-mailman (input) for mailman id 1241586;
 Thu, 26 Feb 2026 11:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZuD-0006EH-2R
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:45 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84fdef89-1309-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 12:51:43 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so7372105e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:43 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:42 -0800 (PST)
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
X-Inumbo-ID: 84fdef89-1309-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106702; x=1772711502; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pu3ONN1y8CnzVPPPqwVx01znDwKu8x6AESEnaYZMJ9s=;
        b=Q55DSSMxraHRy7VcTNID2XI8TY6x676cdTOzNAOP5OHe7mZAsfjVKhIq2qvfXQWnON
         IM/KYhvuy2xXxl4ON4o3Kj2Rekkw3cwtDSGZ6oNg7F8XcWiPAbmQA3yBarrsjR1GKq7W
         su0EnUalICO7LpgpHyPrVK8gUaq/5S+5yPMxwmM3H4395UVtpUdbrs7IrRTMvbC0YYdY
         EYUR/r9DDAjE/tcIkC7kovuc4zOx9o/z/Czt7uT7PkFQZm6SzSDw/dfzFvsH5WlfQQbB
         A3KBcSxg59aybm3WBt3g8jMJGzkOc+YRpHRCfFmYb/CI7r63BW4MYVR8I++fn8ge7OcH
         oZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106702; x=1772711502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pu3ONN1y8CnzVPPPqwVx01znDwKu8x6AESEnaYZMJ9s=;
        b=qBOeUKxZpjHBGYzGFQD515EAN6sSXznSpotaausb0b+HuHdnTcgUwFnOJe5+05a5hK
         d8x4+pUaAmJ8+qTzAJE3L5oQzt6U0aNqaoQmurrjtwdxFwO+kUQs1TC5Zmmw47Eo0qGM
         +9RZs05KobGecxNPrWDSdqO0YMeS6vRKa70pYzRMxg1vU4uTYg3RBaL/zJpmqfv8ZkKz
         jMeDguVkKpCkktxZio5YfIQanr0wCjkBYGltb1bnLacBb9jDUhtuIfBLBt6zXhLGtL5Z
         4Gjb+KZLEC2UUuKDdMDVCypgGEdYifqBMNt+fvbC/QBIviT2Y7wUlYzXN7oyRznXtLKI
         VOLA==
X-Gm-Message-State: AOJu0Yy7tYO8OsoN/W0GPJX6l4QA+GRBj7hHZdrr8MkyyT8FeK/ABrRj
	TsaPlFKgUcL6FnxKiFV8XJr1ljDgBJm6hEKcSa+wqOgrqH4ZQxqjjDBXyXmclg==
X-Gm-Gg: ATEYQzyc4ywa/5ZfVE704iMmmtv/n27V7JSxwh0fXxcYbSfr3do9KvZvEis2NKmjZcj
	l8zuynT5haoGWNSUOwngHujeILq1oPDLG1CsfwEZfo2vG+PwL+mpRoKk/VfOGAm5HO8UDwJNFW8
	+PU+T7ZlzLxEb1Zn5e/p9O/jkn0Wq3DeNW/dPBFOxpAEncmUVdR1Ly9DpLktOVVolyE2FSGG99v
	NfnrzKAzN1WkxnTqJVxEiDiMRkUcD5ARCA7HnQ6PMpvIdr6KTZ1sfm61CU7D3PEauyzCt1rlmGC
	Y/jbmj5RsNVtkjcg9GjV3pdD7W0JRGMZl/tKkymyxhd2iwyhEUZc6x0GQxGx55mBgodzhqA46dd
	fBGOivSxJvnBiHlYeAKJDE9PBnUqxWnLln5KiRTzS+nHJpdhSM1f+qiM6R/SaEZR3KXWz2E/M6a
	TBNOPGn7yE9dJlC5md3P93atDShloL4h/GdZOKwdPxf2hhTRzRTxMmzP4mkDcMBF9ZZat+yw==
X-Received: by 2002:a05:600c:8183:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-483a962e3d4mr287053045e9.19.1772106702486;
        Thu, 26 Feb 2026 03:51:42 -0800 (PST)
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
Subject: [PATCH v6 14/14] xen/riscv: implement sync_vcpu_execstate()
Date: Thu, 26 Feb 2026 12:51:14 +0100
Message-ID: <9572c925ccbed3fa391b3a0c9d8eddad87c49ab7.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772016457.git.oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BCF7A1A5750
X-Rspamd-Action: no action

The scheduler may call this function to force synchronization of given
vCPU's state. RISC-V does not support lazy context switching, so nothing
is done in sync_vcpu_execstate() and sync_local_execstate().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - It was something wrong with prev. rebase. Drop stubs for
   sync_local_execstate() and sync_vcpu_execstate() in this patch.
---
Changes in v4:
 - Drop footer as [PATCH] sched: move vCPU exec state barriers
   is merged to upstream/staging.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v3:
 - Align sync_vcpu_execstate() with patch:
     [PATCH] sched: move vCPU exec state barriers
---
Changes in v2:
 - New patch.
---
 xen/arch/riscv/domain.c | 10 ++++++++++
 xen/arch/riscv/stubs.c  | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index fda8cff90f6a..6e852d3b71c2 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -279,6 +279,16 @@ void vcpu_kick(struct vcpu *v)
     }
 }
 
+void sync_local_execstate(void)
+{
+    /* Nothing to do -- no lazy switching */
+}
+
+void sync_vcpu_execstate(struct vcpu *v)
+{
+    /* Nothing to do -- no lazy switching */
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 2f3a0ce76af9..acbb5b9123ea 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -91,16 +91,6 @@ void continue_running(struct vcpu *same)
     BUG_ON("unimplemented");
 }
 
-void sync_local_execstate(void)
-{
-    BUG_ON("unimplemented");
-}
-
-void sync_vcpu_execstate(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 void startup_cpu_idle_loop(void)
 {
     BUG_ON("unimplemented");
-- 
2.53.0


