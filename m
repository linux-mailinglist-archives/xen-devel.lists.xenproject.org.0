Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJVNOoeLmGmeJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:27:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B978169520
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237427.1539821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTLm-0000E4-P5; Fri, 20 Feb 2026 16:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237427.1539821; Fri, 20 Feb 2026 16:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTLm-0000CV-M6; Fri, 20 Feb 2026 16:27:30 +0000
Received: by outflank-mailman (input) for mailman id 1237427;
 Fri, 20 Feb 2026 16:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTE8-0000Q4-60
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:36 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f19f704f-0e77-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 17:19:34 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-436356740e6so2400953f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:34 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:33 -0800 (PST)
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
X-Inumbo-ID: f19f704f-0e77-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604374; x=1772209174; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxX3OIZ6fZxPE5LWGOGy7jniho2pldOrYX/WsQ7ZseY=;
        b=aQ+mBjmditTabdtTiLen9Nn1Q5/ciZQezC6JmoZfKBlC0/4Z/Zjjig+CAh0ZddyTTM
         76NQrtQa/gfUSq9r9TUQZZmK5pUuUhWzlZZrWmBpgYb7Szsib6/70rAuklOuuzv4Ad2G
         0u/s0bYGsa7axWWJJC7aUGD67R5yRiBZpUoJlfzzG6uAlZTGFFJ2CmTzjQI7z7LQexff
         63i0bzXWedx5peu2BOnXCxjkjeVDq8gaNVKyz+PU0hObRR12CyFN9xcFELZKFucbAISA
         uTb3gSNXBN6Iga6ivTZCtRjYsbdRaYIbbpuh06gll1c6pWhPgSKPBhpRvKXIYV9m5++P
         tHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604374; x=1772209174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxX3OIZ6fZxPE5LWGOGy7jniho2pldOrYX/WsQ7ZseY=;
        b=r5UiTyi4JQZW/eBMlFVZoFE56gNLpoUmk/Iqq6psJfArJnEoh6w5Pk44XO3n/oNlA5
         jdcJh2HjDsSd7frqkPPSSz7IdleqWFOOQoXSNenE8Ahccl0pRn2IHog7B0VQGNeNJ724
         bBJQpmHtJz+zdbLC8QcewlGWNuMKPoPJr2pkN3Cn4OmCc8SkFZGODvsyPC43HNuSlbHS
         WHvZLH3aq2FF6+dYmVUsYZy03/QZMC9jV2ZCtiqm9r4dcnv7yi8M/TnpAVKnZb9ABwyr
         vXTPN9eQ/ImOsZQGW2IVyV4oMKixN1Qc6YZ859TTrdrC3OcAu58eY94P7M3d9vseqWYr
         TKGA==
X-Gm-Message-State: AOJu0Yzqp+mN5mGxgyNirx5QnmtkZMdWtb+/hvFj3jxwtpHP0zIWLPrn
	7IvHHAaDJkXe93mErKYHG9PICCkXr95O0dcmasW2GvJy6R6flD2PcZBBQ1Jq0A==
X-Gm-Gg: AZuq6aKa4KNQu3wOGshxZKQkwuVZyLSOayqLro28fbXp/zjJxSo5FlPFFQUvRkzA+ji
	Fx6GV1uvU18RJrgu+TwLIeyOe2NzxpCeChBRKwhqWM4QyvwOhWoeP7ja81K+PuO+bRn7YRkF0gA
	TduAj1f0gOQdldsWw3q8+ReEvY+532EEJuBAjG5XcB2a5cHav4la5Pg1NcKCSh8JrDuBLTrYigW
	lurjcWBel45VG/NxQDxkXgHr9fGq9P0IinSuUuy0FUfed6t83fAEK1n/itwD4wI2R0QZdBqiVEI
	4ITzTOBiof9GV6MwWTmGy6pUP/1eLYJAoRpvDk8+sok7WAm5ij+u74EYGHPb02vPliCzRw4dQsb
	BF198VPADKPrBWJFp5QXP9mqAxbDgHuB2opyRL4JVndK/TcGJJnm5YMa9Oqy2McKdMsePNsZONs
	8JISIvQcedqa6VN6YV/zUjJWsquHqsDnG+2YxSxBMxDPsq+bArjE/eZXkG/BcSO199DOItVw==
X-Received: by 2002:a5d:5888:0:b0:436:1517:aeca with SMTP id ffacd0b85a97d-4396f157d2amr785935f8f.15.1771604373504;
        Fri, 20 Feb 2026 08:19:33 -0800 (PST)
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
Subject: [PATCH v5 14/14] xen/riscv: implement sync_vcpu_execstate()
Date: Fri, 20 Feb 2026 17:19:09 +0100
Message-ID: <db452b0d728d87220deab4d55d3141a82746bbb7.1771590794.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1771590794.git.oleksii.kurochko@gmail.com>
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
X-Rspamd-Queue-Id: 7B978169520
X-Rspamd-Action: no action

The scheduler may call this function to force synchronization of given
vCPU's state. RISC-V does not support lazy context switching, so nothing
is done in sync_vcpu_execstate() and sync_local_execstate().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index fb5c21078172..f3b22d05071d 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -265,6 +265,16 @@ void vcpu_kick(struct vcpu *v)
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


