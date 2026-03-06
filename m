Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBhOBP0Bq2m4ZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057BE22500A
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247986.1546422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7i-00066r-E7; Fri, 06 Mar 2026 16:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247986.1546422; Fri, 06 Mar 2026 16:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7i-0005vK-5j; Fri, 06 Mar 2026 16:33:58 +0000
Received: by outflank-mailman (input) for mailman id 1247986;
 Fri, 06 Mar 2026 16:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7e-00030j-Uc
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:54 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43d443d0-197a-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 17:33:54 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439ce3605ecso1560842f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:54 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:53 -0800 (PST)
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
X-Inumbo-ID: 43d443d0-197a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814833; x=1773419633; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYzV7pV3IRuCnaF6MoayYG+rthZpT+FdfN6FzWyJXSQ=;
        b=Mgr8bq7+BcKVYbV63vadXQqQXTgoOwBQ9IBlF0hMKa93o8qGy4qIji+jmtD/pdlFuH
         p2jkAGYOReA0SISIr9+1Z0ifVUGPYkRiQ41p6ixNluXCvCKOstsmtRpW8/XR+h3w1Wyh
         +1oJy6pX2V8mYNPgu3RTRnDmosxm7L4Lhp1SHINneYlk2k99ylwZ5UBRaXbt7PqlsxrU
         y75o3R9oJqQKagApicWodfk7cDaAanHQoUHbrzTCv92eleY1hJjRHiIjzFw1aTpEp7PZ
         mDG4izOm53IVbsdlRXVNsNH+0ea7QYSlE5x+YDjmwM7kxLUFWOw2BoNsiZXWJI6xfDNP
         ZYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814833; x=1773419633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYzV7pV3IRuCnaF6MoayYG+rthZpT+FdfN6FzWyJXSQ=;
        b=aVNUQlTM3gEckrmDFoPihEUquAU0xu8QA7hu5gg9tDRQqkc1gS3jZLJuZg/MaJSNrO
         rxmXrp0JGs43ZccrfdJ3fbrNlGYJr3zvN6EmxHxA6tGdfN7IUucVDIVyI/1mHIfKZMHo
         W9k4NUGHjfLxLv8CIkIMCo8Nap/oP3ZOnnoL2MXLNIJN17ggoa2WhUT8SAiizZyX86Wj
         2EO5ts5MPggPiZ+v32B8CdC0ky91XEeCNR2Q99ZKaSjunw+AUpNE++rKoWvS77FiqcH8
         NkcsxJGID9GhLqqRAdLmfBJo8fzqtb2blcRe8GPaLGYdtFbIqfV25nI6b03aFC2uUZU8
         SBzg==
X-Gm-Message-State: AOJu0YxItaX774536MO8Azl3Md/pkDXfr6W1elLI78KdbJXfSacFpXa/
	dCG4A4R9MgSZISlVz58Hsz+pvTniIr2IbYDS5avmo7zQE4dGgxhdkqF0TZhq8w==
X-Gm-Gg: ATEYQzwSTiay9VRfHdnqaipDf+bk3FvZiESIE5a3SncTn8suqTRPJ0wx3OxwxnlTxhR
	vtSRMN9T9LYCM9lB5HQupxpWZIDLruNf9SWyLK+U5pEwvFKsWBV7yXrNnAVWk/jK8S+XuoWS5eT
	pOdzEoA+Di6LGjcTgKc4kCiSiii/txnptSsK2Q65FzqKi7xakiewzqr6gROekdv2c9bZdFQQKX3
	NmM9x+oeyvAkSJh5Qj+5Lvt3/cxxmW0ClVi6Hgh1QqIz5sqmnsv8JM9rntT/zB+0F5H0Zsg9Gi/
	86qkieeIfvgsQl/eY7e8rbNdg927Ym/mMsRJ2dnkJTE4DkN+OudXslkf0HBIM4v81uCftKse84T
	M+QtQiCLGYQrmDV00wKUrjIKEXF8oeQynunr4S6o98IlVURlLa2I83mKQex+HFSbOiDC3L0kxH1
	lU2fhar8I+wjr9pHVa2ORRPFCtLiLa8tMi1PP1Z85o/StB5tF22+zVqa4aMp1kVDC7jw==
X-Received: by 2002:a05:6000:1846:b0:439:b7b5:b1d1 with SMTP id ffacd0b85a97d-439da65d6e4mr4835532f8f.18.1772814833266;
        Fri, 06 Mar 2026 08:33:53 -0800 (PST)
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
Subject: [PATCH v7 13/14] xen/riscv: implement sync_vcpu_execstate()
Date: Fri,  6 Mar 2026 17:33:30 +0100
Message-ID: <bc83449f00f113d1b60856f4981bb1e86ec11e65.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 057BE22500A
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

The scheduler may call this function to force synchronization of given
vCPU's state. RISC-V does not support lazy context switching, so nothing
is done in sync_vcpu_execstate() and sync_local_execstate().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6-v7:
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
index c8ce1efa884d..7e3070101714 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -278,6 +278,16 @@ void vcpu_kick(struct vcpu *v)
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


