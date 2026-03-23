Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEa3IH0gwWmTQwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:14:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84F62F0FE4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259204.1552510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dEI-0006yB-0v; Mon, 23 Mar 2026 11:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259204.1552510; Mon, 23 Mar 2026 11:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dEH-0006vi-Tw; Mon, 23 Mar 2026 11:13:53 +0000
Received: by outflank-mailman (input) for mailman id 1259204;
 Mon, 23 Mar 2026 11:13:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=578G=BX=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1w4dEG-0006vc-P0
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 11:13:52 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e7b389d-26a9-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 12:13:50 +0100 (CET)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b982518b73fso28664266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 04:13:50 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b98335f1747sm481243366b.33.2026.03.23.04.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 04:13:48 -0700 (PDT)
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
X-Inumbo-ID: 5e7b389d-26a9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774264429; x=1774869229; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YoQ7RjwuW9OFPwy19A2EGOrKv6UcwgAGL9kg1tUUyVk=;
        b=WI1i4vT1xV3Cf8J2rr46dnRh14LTqXIdzp9FzjKzYRyGjZgcg0rriCsTAHOkem13H0
         OJN+hu5Qha12Q1uk21zr92jqPFUMn0UfAWGCnENG0yM67F947dSnxHye6ZzY5hVFOP+b
         4is04uf81bQSfH133nwriPrKR5xqJ6R0+V6TW0CSzlW6ZBlD7f2MP2ZKSrMWdSWUSn0u
         Iu4tafpQPf1q+JqWwspm6HvdC+rP+DAOLTkPMUfDGa2jum2tqoUA+19/veJQgaDaSK69
         bygHdY5MaX4rt53bGpmP0SIH+XUNHMIbVrOiOlnfkBaT9sHAArYJlOP8TG0Cge+SaFVG
         V0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264429; x=1774869229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoQ7RjwuW9OFPwy19A2EGOrKv6UcwgAGL9kg1tUUyVk=;
        b=K6CpGf6UCcUieQjZOywmM+D5zqqovji5SCw8H2nE1R2b5N0rOPIe/6SW9nFeYu8wNk
         XoJpJyBbD4TpPOpolcQc2Ny3TjzJ9Y+v0mxo+bV0+mP5N+qkKyjMWTR4MTW5GB7djR4p
         gBIy1w/k98WDAmT7RBZQSXvRisHqMZ47LdDDbbxgeUQswIhMWbiVgLRLxDnvaRjgYDOt
         Ke46IhvfOvo4Sq0Aw1wCwRjWnxqGMZfo9dMAeK62b8xcsox5Yr/HH9LvbwOVYhHPs6pw
         aOLjQBz0YxYd332lFO7JriP83Hei3aV3PvLlCRPXVjFKL5Ad+UE9yf5tnGroxy6ueVp8
         7hcg==
X-Gm-Message-State: AOJu0YyhiGPJqm9bsxKsSocUeu/thxn6RPR1vABpfOHKjY1Z3gsBF9bW
	MCAsygKlVEBHHQZPCzHBiuxke297G18VoQc8xER/CVYBGAK+r6Roze355+C6Lw==
X-Gm-Gg: ATEYQzwiEsaOPSciRT5hG404Pd8AtjJ8OM9eFpwXAcee2OfsYC8sPRFqT2MiznHNCB0
	zCqpsDE1HaHVUeaYHTyu7x3rcxGu+7+pJ9PrBoTDF+CjUDlq0KkhchdtUIuxiETT5J/WdS9L3b8
	51C7tpHlmeqvNOV8fk7Cs4nzWIXbvnZVOZBaaxIe3xXG6EewEm09mmlJtV5EXCZFOtlUWE335Kk
	U3w0HqB75BtZFeZoNQOxANhuZBWi60paK12577NwNR20TtfL/jDpdxuEmpJ0Z+6NfRFlM/Ljxqv
	wHUqek/4650vjQkRocvYwEYr8BAqLTfllZ4bsNglRz4F77x0WerxaakQE+n9N4ly+CaSyGVrwO+
	8RWI7merqnyPf6XwshnU4pnFJa0lqfKQ7/zbvVuSox3PuK6LGGy927UZzztjrCTZzG/3El0SpeS
	AaDTAOryq+uuT9QY9RmlyQ4lhrwSo=
X-Received: by 2002:a17:906:398:b0:b98:235b:4dfa with SMTP id a640c23a62f3a-b982f4e5b0amr649260866b.47.1774264428913;
        Mon, 23 Mar 2026 04:13:48 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI arguments
Date: Mon, 23 Mar 2026 13:11:21 +0200
Message-ID: <cde430238469198082114121b14d88bce9f1ceef.1774263939.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,patchew.org:server fail,epam.com:server fail,xen.org:server fail];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,xen.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B84F62F0FE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
using Wn, only the least significant 32 bits are significant and the
upper 32 bits must be ignored by the implementation.

So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in the
argument registers as an error. Instead, they should be discarded when
decoding the arguments.

Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may be
implementation defined when entering from AArch32. Xen zeros them on
entry, but that guarantee is only relevant for 32-bit domains.

Update PSCI v0.2+ CPU_ON, CPU_SUSPEND and AFFINITY_INFO to read SMC32
arguments via PSCI_ARG32(), while keeping the SMC64 handling unchanged.

No functional change is intended for PSCI 0.1.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
v2:
 - introduce PSCI_ARG_CONV() to centralize convention-dependent argument
   decoding for PSCI v0.2+ calls;
 - use smccc_is_conv_64(fid) instead of open-coding per-call SMC32 checks;
 - keep PSCI 0.1 handling unchanged, except switch on the already-decoded
   fid instead of re-reading x0/r0.

Link to discussion: https://patchew.org/Xen/cover.1751020456.git.mykola._5Fkvach@epam.com/072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola._5Fkvach@epam.com/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org
---
 xen/arch/arm/vpsci.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 7ba9ccd94b..65dea5cf6c 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -230,13 +230,16 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
 #define PSCI_ARG32(reg, n) PSCI_ARG(reg, n)
 #endif
 
+#define PSCI_ARG_CONV(reg, n, conv_64) \
+    ((conv_64) ? PSCI_ARG(reg, n) : PSCI_ARG32(reg, n))
+
 /*
  * PSCI 0.1 calls. It will return false if the function ID is not
  * handled.
  */
 bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid)
 {
-    switch ( (uint32_t)get_user_reg(regs, 0) )
+    switch ( fid )
     {
     case PSCI_cpu_off:
     {
@@ -271,6 +274,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
      * adding/removing a function. SSSC_SMCCC_*_REVISION should be
      * updated once per release.
      */
+    bool is_conv_64 = smccc_is_conv_64(fid);
+
     switch ( fid )
     {
     case PSCI_0_2_FN32_PSCI_VERSION:
@@ -303,9 +308,9 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
     case PSCI_0_2_FN32_CPU_ON:
     case PSCI_0_2_FN64_CPU_ON:
     {
-        register_t vcpuid = PSCI_ARG(regs, 1);
-        register_t epoint = PSCI_ARG(regs, 2);
-        register_t cid = PSCI_ARG(regs, 3);
+        register_t vcpuid = PSCI_ARG_CONV(regs, 1, is_conv_64);
+        register_t epoint = PSCI_ARG_CONV(regs, 2, is_conv_64);
+        register_t cid = PSCI_ARG_CONV(regs, 3, is_conv_64);
 
         perfc_incr(vpsci_cpu_on);
         PSCI_SET_RESULT(regs, do_psci_0_2_cpu_on(vcpuid, epoint, cid));
@@ -316,8 +321,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
     case PSCI_0_2_FN64_CPU_SUSPEND:
     {
         uint32_t pstate = PSCI_ARG32(regs, 1);
-        register_t epoint = PSCI_ARG(regs, 2);
-        register_t cid = PSCI_ARG(regs, 3);
+        register_t epoint = PSCI_ARG_CONV(regs, 2, is_conv_64);
+        register_t cid = PSCI_ARG_CONV(regs, 3, is_conv_64);
 
         perfc_incr(vpsci_cpu_suspend);
         PSCI_SET_RESULT(regs, do_psci_0_2_cpu_suspend(pstate, epoint, cid));
@@ -327,7 +332,7 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
     case PSCI_0_2_FN32_AFFINITY_INFO:
     case PSCI_0_2_FN64_AFFINITY_INFO:
     {
-        register_t taff = PSCI_ARG(regs, 1);
+        register_t taff = PSCI_ARG_CONV(regs, 1, is_conv_64);
         uint32_t laff = PSCI_ARG32(regs, 2);
 
         perfc_incr(vpsci_cpu_affinity_info);
-- 
2.43.0


