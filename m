Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLrTCt0TzGmGOAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 20:35:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD7A3700C1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 20:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269237.1558323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7duU-0008IS-61; Tue, 31 Mar 2026 18:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269237.1558323; Tue, 31 Mar 2026 18:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7duU-0008Fb-2x; Tue, 31 Mar 2026 18:33:54 +0000
Received: by outflank-mailman (input) for mailman id 1269237;
 Tue, 31 Mar 2026 18:33:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w7duR-0008FF-Mh
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 18:33:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7duQ-003y83-T5
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 20:33:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69cc138c-2eae-0a2a0a5409dd-0a2a450abc7c-6
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 20:33:50 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69cc138e-1772-0a2a450a0019-d1558032e823-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 20:33:50 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso62397525e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:33:50 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf257b72dsm29583474f8f.34.2026.03.31.11.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 11:33:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774982030; x=1775586830; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr9yScUaDD+TJWaJvRWr6iRI0sI5FP2KmlYSEbZolD0=;
        b=SV/E/rd+2VRSxYzNmH9ZSBIENgtkPjh4pCYqkkC/C0QlnBj8dxJNl3L/agUVd5SbDv
         YkF8Vj6VaLyydPQRARPq++3BqxmOp1mn/I54BDjY/Q/4rngFGfWM0fy/xqHqsjy96Xov
         aYGTrwoBBY9oXBrD/cC6V50OM1wmpaPz/J/NjoCPbUjdkVnBZF0BPe90HCkGuXmV5wWS
         aQXev6x6Lin/3lCLINtsJzLPbkxk2D5oTl0F+IGYU/IRkTmZtY7IXhhdbyqfGVIRJx7l
         g6oFHhHd+b8kFFKLGdBFV8VI2Dp9f7SvqgHtdXr6zC+LwKAVc3qvKUA74Da+Y4/JSEvG
         JvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982030; x=1775586830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nr9yScUaDD+TJWaJvRWr6iRI0sI5FP2KmlYSEbZolD0=;
        b=HGXKSB42gu3OTMjO1BSCBkOTNkCkQ31oHpMZiiGZGsg/BC+0uzjgYKzeBxWKEFuaig
         PhUJ0S5ppm5rVEFF0+Vtarm4NnbSNrMB5zXu2cjllcuDkYrKuZ2QLGwQhPnJw/1Rqrm9
         7FgBstiOOEZf6b2aFQnt2dh5uFSNFyGUMAWy956aKEBigLajQ5qsz4KSJCKiROLOySSV
         3Y6DzSZsfaox6KVJFdXzFCHb9KuSctxLDFw6aaZb9IuRVCnK+tQ/r+pJigRYFX46eMg6
         R0F8fuA1aYPS9tI4eBRaliYks+wpB5mJSikP25LPLHBUSvVm97mRR7YjqF3k7FnfYbCj
         OKUA==
X-Gm-Message-State: AOJu0Yw19Wkz4OTTFKMupV2ut3aqA7z5lUJG+AoZsc25oi8YlKPTCyXY
	VfH5WQRMfJXqJHhz9FEToH8e7FHqFag/17QZ/YUl1at45fqWAoRTIYvfpKhLUQga
X-Gm-Gg: ATEYQzzIUTp7RUIVtfNhxUV9BrZxyknFUza14tjJWumXx9Uylv0YKaUVuWAp3AeBhHU
	4+5e+8SNq8lZP6y+qdIS550dpn73SjygBms3LcTt5YXvEr3tc91NQOuYV++BSmgKJS1vrI5dS4T
	fnlFcMJDcr5Tcni0ZRDksF9Ys6RouyZk0gXpA3JhSl5VXecus/a+HFH8ckPi/QFFniX7i6mItM0
	idfwtb9NR8AkNABzZtReoyMm0d8S/7sz1/tsVI30571fpcwgxtKGeK7vwdy2wAq1t06p1vlfW4C
	eFn7cIwIuRD7vA308jgEpeU10Vg+9H6SbBr3iobj8Qf1occ3WVwzwpR+IO9smlFP3cYaU4ufcyH
	GMrXz83BA6wrosLudhNQKQzUGFMHTwxhbMHm/7RKEDHEYbi2thRcz3BtV/zVAKVzvBF7DDA41cj
	5GfvfJwatFc3qDX9CJ0UJVsPdbFgJJsrs8Mhb8
X-Received: by 2002:a05:600c:848d:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-488835b78f1mr7815175e9.29.1774982029338;
        Tue, 31 Mar 2026 11:33:49 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI arguments
Date: Tue, 31 Mar 2026 21:31:29 +0300
Message-ID: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774982030-BEE95900-FD43B49B/0/0
X-purgate-type: clean
X-purgate-size: 4884
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6AD7A3700C1
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

Update PSCI v0.2+ CPU_ON, CPU_SUSPEND, AFFINITY_INFO and SYSTEM_SUSPEND
to read SMC32 arguments via PSCI_ARG32(), while keeping the SMC64
handling unchanged.

No functional change is intended for PSCI 0.1.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v3:
 - use PSCI_ARG_CONV for SYSTEM_SUSPEND

v2:
 - introduce PSCI_ARG_CONV() to centralize convention-dependent argument
   decoding for PSCI v0.2+ calls;
 - use smccc_is_conv_64(fid) instead of open-coding per-call SMC32 checks;
 - keep PSCI 0.1 handling unchanged, except switch on the already-decoded
   fid instead of re-reading x0/r0.

Link to discussion: https://patchew.org/Xen/cover.1751020456.git.mykola._5Fkvach@epam.com/072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola._5Fkvach@epam.com/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org
---
 xen/arch/arm/vpsci.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index bd87ec430d..ac6af6118f 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -305,13 +305,16 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
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
@@ -346,6 +349,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
      * adding/removing a function. SSSC_SMCCC_*_REVISION should be
      * updated once per release.
      */
+    bool is_conv_64 = smccc_is_conv_64(fid);
+
     switch ( fid )
     {
     case PSCI_0_2_FN32_PSCI_VERSION:
@@ -378,9 +383,9 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
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
@@ -391,8 +396,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
     case PSCI_0_2_FN64_CPU_SUSPEND:
     {
         uint32_t pstate = PSCI_ARG32(regs, 1);
-        register_t epoint = PSCI_ARG(regs, 2);
-        register_t cid = PSCI_ARG(regs, 3);
+        register_t epoint = PSCI_ARG_CONV(regs, 2, is_conv_64);
+        register_t cid = PSCI_ARG_CONV(regs, 3, is_conv_64);
 
         perfc_incr(vpsci_cpu_suspend);
         PSCI_SET_RESULT(regs, do_psci_0_2_cpu_suspend(pstate, epoint, cid));
@@ -402,7 +407,7 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
     case PSCI_0_2_FN32_AFFINITY_INFO:
     case PSCI_0_2_FN64_AFFINITY_INFO:
     {
-        register_t taff = PSCI_ARG(regs, 1);
+        register_t taff = PSCI_ARG_CONV(regs, 1, is_conv_64);
         uint32_t laff = PSCI_ARG32(regs, 2);
 
         perfc_incr(vpsci_cpu_affinity_info);
@@ -422,14 +427,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
     {
-        register_t epoint = PSCI_ARG(regs, 1);
-        register_t cid = PSCI_ARG(regs, 2);
-
-        if ( fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
-        {
-            epoint &= GENMASK(31, 0);
-            cid &= GENMASK(31, 0);
-        }
+        register_t epoint = PSCI_ARG_CONV(regs, 1, is_conv_64);
+        register_t cid = PSCI_ARG_CONV(regs, 2, is_conv_64);
 
         perfc_incr(vpsci_system_suspend);
         PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
-- 
2.43.0


