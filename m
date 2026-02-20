Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +2U8KZuJmGlwJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FE2169429
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237333.1539689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTDw-0000ZN-7t; Fri, 20 Feb 2026 16:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237333.1539689; Fri, 20 Feb 2026 16:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTDw-0000SD-1E; Fri, 20 Feb 2026 16:19:24 +0000
Received: by outflank-mailman (input) for mailman id 1237333;
 Fri, 20 Feb 2026 16:19:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTDu-0000Q4-BJ
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:22 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8b2aab6-0e77-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 17:19:19 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so1559300f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:19 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:18 -0800 (PST)
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
X-Inumbo-ID: e8b2aab6-0e77-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604359; x=1772209159; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGHRmL2iWDUaQ6x5sen7QQ6MZAJ2q1tuNN96Ty+TTdE=;
        b=ZQLrgv8eFLYDpJg95KnrAGIIavZTmeLkRnxv06MDoVAzytzIjfz9He51eiBQBZPA/+
         sW6KJO9Ej/pkMXWYJA7xDt0DtgVxx8vJ0ZIsIKfpqqNKaUIbZ2LccySj3sZZH5UITa7V
         YvqVT07i9gBRMAdLzD5KPrwa6TEOm0bmfHPa4ZsEgz14RjsoeHASsbMflfs0jwHbfwJP
         4uYYctL4sS/u8g+Tf4cdBIFQqCJ7AqT9J6ypk9P/MR3w5WB47GFX4jcQ4cGgWve9XGc3
         tRjawvmvPmWL7W2qXTuWNKT+WLmUBZmYHbKfxXRHCX74bxBuqcizNtSFhlbvFJhyFVe3
         jngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604359; x=1772209159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGHRmL2iWDUaQ6x5sen7QQ6MZAJ2q1tuNN96Ty+TTdE=;
        b=Bwoh3DQ2B2ZCGboU76Mr25XXZdOke4rQ2eTzcFNbuHVjXDbBA0gqoU5JeWbVy0evtd
         taig8jAVlSw96ml3XmNUhV8OB0F3241jCeeObcQ0cEGRkhUj/opYyw2WSpW2jCuIbJnt
         EVgK252e1N1qpudxwgc5qfIT67V7RH61hlrnwyy5o1YZdPOojaNS9IqLqKcdCPaiK88s
         LSLZ8AqYVJF0qj/tv9CUevIlSe0hw2sT+9xQ2Fc/DhiAM9SJltIZShttuCQHZfgm6Vng
         fF+KpJqpTVudZKKk7LjOK12RHLXFeHMKVKhmgMsmPqP0VFsOaFLhzY2uAlLW26IWKdN8
         L+6g==
X-Gm-Message-State: AOJu0YyQrFhcZoAnSBuH8sspuEHAzUmKvFeqJD4Q4JPecDpqEQy3AAog
	ssHTBs8+IKljHgNYzYal9BlQmK6jjIUyIJQykuav6ebpPLDV9x2kieICfZ3JzQ==
X-Gm-Gg: AZuq6aIpCwDzsomnfPtG/qmgUgtGeWIiplgi50mrmbN/GUOnAnw8wmZ1O8JsZZ3XaP5
	2WaLP3Gfav3111EEgdWBTjDL4jtcARcJ7EU9jKNFBQm9LQuKMNR0nkMbhP9u0orTr9Y6GUFwgQp
	IvE83iK/P8braeEC8WRvqua0fwyW6mDqyVxG7ld07bu3YbKbaS8KdQRRK42dqidRZ/Ub7Zes5sF
	v3pFaA47OUVpeME4b+ejjO1ak1Z/LkRLCaji5jSLoc8+IuFYTIKWexJTHAkDKSpV+ePtaVwiVfd
	k+lvLg/XsvVER92TB1EatL1edCTO3eUsxkGddPLvbToSLrxbBRbDlg4acy1ZCsCvS8bNnD6A9HY
	BrKIOuwJsEjEauCVfpXRrOi/vcgz4nelcrma5h3YMZwkMYkaL7Adm2TdLP+lomt7MN/ljcBECt9
	u+IdckcDy/sE7zSf79qsB8x7vWSXWUNzzv1gmZ8IiYR6C5zdwcg6nGXss23cTZ+czD2A==
X-Received: by 2002:a05:6000:26cd:b0:436:369f:39f9 with SMTP id ffacd0b85a97d-4396f1a70b5mr756546f8f.57.1771604358526;
        Fri, 20 Feb 2026 08:19:18 -0800 (PST)
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
Subject: [PATCH v5 01/14] xen/riscv: detect and store supported hypervisor CSR bits at boot
Date: Fri, 20 Feb 2026 17:18:56 +0100
Message-ID: <4f36d83e58bfba807660ebc1fc48e71ae056805a.1771590794.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 59FE2169429
X-Rspamd-Action: no action

Some hypervisor CSRs expose optional functionality and may not implement
all architectural bits. Writing unsupported bits can either be ignored
or raise an exception depending on the platform.

Detect the set of writable bits for selected hypervisor CSRs at boot and
store the resulting masks for later use. This allows safely programming
these CSRs during vCPU context switching and avoids relying on hardcoded
architectural assumptions.

Note that csr_set() is used instead of csr_write() to write all ones to
the mask, as the CSRRS instruction, according to the RISC-V specification,
sets only those bits that are writable (note that the quote consider only
non-read-only CSRs as writing to read-only CSRs according to the spec.
will raise an exception):
    Any bit that is high in rs1 will cause the corresponding bit to be set
    in the CSR, if that CSR bit is writable.
In contrast, the CSRRW instruction does not take CSR bit writability into
account, which could lead to unintended side effects when writing all ones
to a CSR.

Masks are calculated at the moment only for hedeleg, henvcfg, hideleg,
hstateen0 registers as only them are going to be used in the follow up
patch.

If the Smstateen extension is not implemented, hstateen0 cannot be read
because the register is considered non-existent. Instructions that attempt
to access a CSR that is not implemented or not visible in the current mode
are reserved and will raise an illegal-instruction exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Move everything related to csr_masks to domain.c and make it static.
 - Move declaration of old variable in init_csr_masks() inside INIT_CSR_MASK.
 - Use csr_swap() in INIT_CSR_MASK().
---
Changes in V4:
 - Move csr_masks defintion to domain.c. Make it static as at the moment
   it is going to be used only in domain.c.
 - Rename and refactor X macros inside init_csr_masks().
---
Changes in V3:
 - New patch.
---
 xen/arch/riscv/domain.c            | 30 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/setup.h |  2 ++
 xen/arch/riscv/setup.c             |  2 ++
 3 files changed, 34 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index b60320b90def..8b05f0f23b77 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -2,9 +2,39 @@
 
 #include <xen/init.h>
 #include <xen/mm.h>
+#include <xen/sections.h>
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/cpufeature.h>
+#include <asm/csr.h>
+
+struct csr_masks {
+    register_t hedeleg;
+    register_t henvcfg;
+    register_t hideleg;
+    register_t hstateen0;
+};
+
+static struct csr_masks __ro_after_init csr_masks;
+
+void __init init_csr_masks(void)
+{
+#define INIT_CSR_MASK(csr, field) do { \
+    register_t old; \
+    old = csr_read(CSR_##csr); \
+    csr_set(CSR_##csr, ULONG_MAX); \
+    csr_masks.field = csr_swap(CSR_##csr, old); \
+} while (0)
+
+    INIT_CSR_MASK(HEDELEG, hedeleg);
+    INIT_CSR_MASK(HENVCFG, henvcfg);
+    INIT_CSR_MASK(HIDELEG, hideleg);
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+        INIT_CSR_MASK(HSTATEEN0, hstateen0);
+}
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
     BUG_ON("unimplemented\n");
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index c9d69cdf5166..2215894cfbb1 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -11,6 +11,8 @@ void setup_mm(void);
 
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
+void init_csr_masks(void);
+
 #endif /* ASM__RISCV__SETUP_H */
 
 /*
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 9b4835960d20..bca6ca09eddd 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -137,6 +137,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     riscv_fill_hwcap();
 
+    init_csr_masks();
+
     preinit_xen_time();
 
     intc_preinit();
-- 
2.53.0


