Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 321498D34AE
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 12:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731782.1137481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCGgv-0007YL-QF; Wed, 29 May 2024 10:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731782.1137481; Wed, 29 May 2024 10:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCGgv-0007V8-NN; Wed, 29 May 2024 10:37:57 +0000
Received: by outflank-mailman (input) for mailman id 731782;
 Wed, 29 May 2024 10:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mTS/=NA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCGgv-0007V2-3n
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 10:37:57 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 821e871e-1da7-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 12:37:55 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6519c6ec7bso55371066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 03:37:55 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6556c5240dsm27935166b.59.2024.05.29.03.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 03:37:54 -0700 (PDT)
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
X-Inumbo-ID: 821e871e-1da7-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716979074; x=1717583874; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=viiDxHEW1YNwELQ0IFmBJyKxI1/XuOHmb/mN59Za2XA=;
        b=HOF5y+xkHELEF6A8IMhBD2pNjRMAiPGTvbHnWgmsfgI7qk+a36CEakPEU+LPVq2DFE
         xsSFGzWCvIASx89wjtwsZLeBZSY2mHF2ft7tsiz0J70fqoU37h4+Z3NZCvR8IOMayOax
         oaRFtaoLM+rexXT7qi0wBt0j34d2JsyVcEbx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716979074; x=1717583874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viiDxHEW1YNwELQ0IFmBJyKxI1/XuOHmb/mN59Za2XA=;
        b=q5xHWQzeAThX6KhSRrak3B0x60kGwU9WwwAQPIktHWhuZ1kUBuYF9tEx8IUrahRcwJ
         Npy7J/CqNg/TDNa1n6eUNHhwP2TRGVX+T9aU47pFzMRH7Vi8X3wT0G5DHpqqqs+PXiV1
         IGyyBgRO2GafaP4DltcBkHQ4HDm/hSjGz3fGaTHKQxanKC6OpADUxg020Llc/kl9mwB8
         aa7D+GlqY7UCDxYWucOxidaN2AYparwkjn3asFutmCnij24epFTv0xkVMqjDAEsyMjUN
         UKVadLMHAcS66gZAyfbNr8pblZpIqpFVD0almpLz/xIww/HgMKfrKSwk6rNBFLkJUFt3
         /uFQ==
X-Gm-Message-State: AOJu0Yy/PbyK7UTSpzrEzznHaQIgnNfcpRDn1dTZP+8UVlP9mos8sxYf
	gUfbc/Ph7v0gHsJPKK2/UBIi/HC1wcxWRqclSUKHSnxJlwJrlz+4dbwq+/BAHjBwQUpb5hCz2RO
	aHog=
X-Google-Smtp-Source: AGHT+IGQUTw+UzXBYE2EkuiStKI4dCdxBr0jpT4bP+Fzc7MHiqgxTHRyqcYmFPl934h3emAAqbEMkQ==
X-Received: by 2002:a17:907:cb1b:b0:a5a:1b60:7c9a with SMTP id a640c23a62f3a-a62651565f9mr1284404766b.71.1716979074472;
        Wed, 29 May 2024 03:37:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] Partial revert of "x86/MCE: optional build of AMD/Intel MCE code"
Date: Wed, 29 May 2024 11:37:52 +0100
Message-Id: <20240529103752.1431366-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

{cmci,lmce}_support are written during S3 resume, so cannot live in
__ro_after_init.  Move them back to being __read_mostly, as they were
originally.

Link: https://gitlab.com/xen-project/xen/-/jobs/6966698361
Fixes: 19b6e9f9149f ("x86/MCE: optional build of AMD/Intel MCE code")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

We're past feature freeze and this was a silent change in a patch, which was
also untested.  A 30s look at mcheck_init() shows clearly that it's not a 30s
job to fix.
---
 xen/arch/x86/cpu/mcheck/mce.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 1664ca6412ac..32c1b2756b90 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -38,10 +38,10 @@ DEFINE_PER_CPU_READ_MOSTLY(unsigned int, nr_mce_banks);
 unsigned int __read_mostly firstbank;
 unsigned int __read_mostly ppin_msr;
 uint8_t __read_mostly cmci_apic_vector;
-bool __ro_after_init cmci_support;
+bool __read_mostly cmci_support;
 
 /* If mce_force_broadcast == 1, lmce_support will be disabled forcibly. */
-bool __ro_after_init lmce_support;
+bool __read_mostly lmce_support;
 
 DEFINE_PER_CPU_READ_MOSTLY(struct mca_banks *, poll_bankmask);
 DEFINE_PER_CPU_READ_MOSTLY(struct mca_banks *, no_cmci_banks);

base-commit: 0840bc5ea114f536a4bdfb2ca095b79f2069aae6
-- 
2.30.2


