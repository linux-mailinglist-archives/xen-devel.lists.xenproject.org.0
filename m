Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDElLFT2umlvdgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 20:00:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C742C1B92
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 20:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256523.1551102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2w7B-0000EM-No; Wed, 18 Mar 2026 18:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256523.1551102; Wed, 18 Mar 2026 18:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2w7B-0000CN-Km; Wed, 18 Mar 2026 18:59:33 +0000
Received: by outflank-mailman (input) for mailman id 1256523;
 Wed, 18 Mar 2026 18:59:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SizD=BS=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1w2w79-0000CH-Ov
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 18:59:31 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97f884a0-22fc-11f1-b164-2bf370ae4941;
 Wed, 18 Mar 2026 19:59:30 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b97e5956208so13057666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2026 11:59:30 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.197])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-667b12ade0dsm2392839a12.30.2026.03.18.11.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 11:59:28 -0700 (PDT)
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
X-Inumbo-ID: 97f884a0-22fc-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773860369; x=1774465169; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9vYhoGM8dW0LVBBOLhz8aVHBpT/7+h1R1jT8z35yWA=;
        b=BJYN68P/pN0SWXWDtztB64RGftbv7FXIJFuKuyuqwZr9VWIi0GqvL7QEtMxV+G7BUI
         XtQ8y4jIVisNVqUTbXrKEeMzPzUFyryHjE+yQZd7JfCbumYSowu0O0Io9awbjuteKz+u
         a2KSZeEvOnjTTaRK/5d+HOufJSnT1ft6V23EPQg6HmftkXDIZuJoYbGBSB7zywVqyWdZ
         CI3Qz1Yml7gc/7Bn+bc/6fXgmA4CzQu71OIL4eEV4VLgRlT5FOBjGs6ZZHTdBxhYYx92
         wKL/6RWMMfi21ZAUjEROoihMLjW8tRzyowt5GGRueiyHB44BMeHQPJ88LccV+mA2A+Ux
         ESYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860369; x=1774465169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9vYhoGM8dW0LVBBOLhz8aVHBpT/7+h1R1jT8z35yWA=;
        b=C9zTeRWXvcjrhigXVQc2W4rrL8ijEx6tJxdYJQfdoRGwe9egjJcURjP2nPGZc46zWS
         h3WCggf06incICAj5hB9oYFXwuN2vOVvWhDREQ+pjVlqG4GaTSEhqmy93mV/FAwchuxw
         jlvDOrBmXh3CfovlvZ+mDhNVbS1MUI/W5J7tzzPmrb+B82qRtFihvC3fMYmQxXQBgT2D
         PJxqn7nLvSjAnH0XFzIxIZ6bADttXKpNJ1coMjEFYldpPzH78E+c7I3JbJL5odwlVfjp
         Hg/NNcWZO/q6lCC1rnroagy/WtCTdfPcoEZ/54tL6YKXd6PO6gBaV5eelJMdG97Xhvu4
         2oFQ==
X-Gm-Message-State: AOJu0YyfS5z3IdSDnQgquYSvzQjh2R3fMkk6J2f6Ik99gbNI6MFeL2XG
	k3l91sWF/CwPxDykqIxewu2cw+VSnVx+Bb+eMCCAlrtYHOMnhGYWsF6h3LpP/w==
X-Gm-Gg: ATEYQzxOqTi3nHqtf5dSYoDFUmsp4qiPlLEr5GQCtD3yXL3s5EtyIJ6NLdhlif9D/u0
	8V8pgNmrekF5U05e+SnZz+gAnB7wAgUtIEIkkvNZZogGKyffrS1XvzQsMbyi56glsue23sjkL73
	ldGhLdRXB+bnJUnnTaz77DZ8JP3JDuz25rkGmImSXBCnnK/5mypDQTOJguFA6rZxBqG3r3HpZDC
	mxWf2WvjYkV2JCydprPg7hr9yzUH+/pF+fkMNRSwdD8l3Jp7aK1/BVNtt8rSp5UdSnvg75pjliQ
	XHttrxHKTJSSULhh91AnWep5t/OjfP20qlhNTkOJzRfGzk+9ZAIuRSB07DfMje64XzsGBOg+WS9
	PGZBd8XMNQxrAOFUSsY+gNjSFhKsA8/SSCzmQOWYo0Kwsbd23frDjrgsNojr7kEhoFrKtc0v1tI
	GfVCbB8xrxtMQW7BeV3igizk24Naw=
X-Received: by 2002:a17:907:8e96:b0:b97:acca:fcf4 with SMTP id a640c23a62f3a-b97f4796681mr259901566b.11.1773860369067;
        Wed, 18 Mar 2026 11:59:29 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI arguments
Date: Wed, 18 Mar 2026 20:56:11 +0200
Message-ID: <3a3180b0f77d815e92c0c232a8f854d34ab7c2ea.1773860069.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E4C742C1B92
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

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Link to discussion: https://patchew.org/Xen/cover.1751020456.git.mykola._5Fkvach@epam.com/072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola._5Fkvach@epam.com/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org
---
 xen/arch/arm/vpsci.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 7ba9ccd94b..1e844ed571 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -303,9 +303,10 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
     case PSCI_0_2_FN32_CPU_ON:
     case PSCI_0_2_FN64_CPU_ON:
     {
-        register_t vcpuid = PSCI_ARG(regs, 1);
-        register_t epoint = PSCI_ARG(regs, 2);
-        register_t cid = PSCI_ARG(regs, 3);
+        bool smc32 = (fid == PSCI_0_2_FN32_CPU_ON);
+        register_t vcpuid = smc32 ? PSCI_ARG32(regs, 1) : PSCI_ARG(regs, 1);
+        register_t epoint = smc32 ? PSCI_ARG32(regs, 2) : PSCI_ARG(regs, 2);
+        register_t cid = smc32 ? PSCI_ARG32(regs, 3) : PSCI_ARG(regs, 3);
 
         perfc_incr(vpsci_cpu_on);
         PSCI_SET_RESULT(regs, do_psci_0_2_cpu_on(vcpuid, epoint, cid));
@@ -315,9 +316,10 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
     case PSCI_0_2_FN32_CPU_SUSPEND:
     case PSCI_0_2_FN64_CPU_SUSPEND:
     {
+        bool smc32 = (fid == PSCI_0_2_FN32_CPU_SUSPEND);
         uint32_t pstate = PSCI_ARG32(regs, 1);
-        register_t epoint = PSCI_ARG(regs, 2);
-        register_t cid = PSCI_ARG(regs, 3);
+        register_t epoint = smc32 ? PSCI_ARG32(regs, 2) : PSCI_ARG(regs, 2);
+        register_t cid = smc32 ? PSCI_ARG32(regs, 3) : PSCI_ARG(regs, 3);
 
         perfc_incr(vpsci_cpu_suspend);
         PSCI_SET_RESULT(regs, do_psci_0_2_cpu_suspend(pstate, epoint, cid));
@@ -327,7 +329,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
     case PSCI_0_2_FN32_AFFINITY_INFO:
     case PSCI_0_2_FN64_AFFINITY_INFO:
     {
-        register_t taff = PSCI_ARG(regs, 1);
+        bool smc32 = (fid == PSCI_0_2_FN32_AFFINITY_INFO);
+        register_t taff = smc32 ? PSCI_ARG32(regs, 1) : PSCI_ARG(regs, 1);
         uint32_t laff = PSCI_ARG32(regs, 2);
 
         perfc_incr(vpsci_cpu_affinity_info);
-- 
2.43.0


