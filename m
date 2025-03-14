Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C745A61978
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 19:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915301.1320831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9r4-0005gI-Qx; Fri, 14 Mar 2025 18:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915301.1320831; Fri, 14 Mar 2025 18:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9r4-0005ep-O6; Fri, 14 Mar 2025 18:33:58 +0000
Received: by outflank-mailman (input) for mailman id 915301;
 Fri, 14 Mar 2025 18:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt9r3-0005eJ-1w
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 18:33:57 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0a4b8ec-0102-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 19:33:52 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab771575040so668255066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 11:33:52 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147efb0csm260071866b.65.2025.03.14.11.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 11:33:50 -0700 (PDT)
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
X-Inumbo-ID: e0a4b8ec-0102-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741977231; x=1742582031; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHmDSBBFV7FBw7IEwYSqIeuIHgrmNgrKBbLTlCs3zHI=;
        b=W4tJc6UnIqf8DE4Up6o34w/+JIX6RvI7TiKWCc6fqHnxW6xuzdFYmIcy7jOXkfc/ar
         u3oD0/rnYpvKgI5wlqLx1GBGIRszFWNkTfdu/FMcleHqnuqJuLCk6wIptI9hv3EOdN/s
         vZ8pEen87VmHcwsuFcol/9ZVDfHPxu2y4B8lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741977231; x=1742582031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHmDSBBFV7FBw7IEwYSqIeuIHgrmNgrKBbLTlCs3zHI=;
        b=SW+wfjT++pwo1/+YPV6NWFJodXk93h08xz0mqAcdrmDTIOxDJyPtcIVwtKYqWq0gkA
         UhzeicyUjDHE9sbRBCP3HPRgjUTpgbxju7VhsY2YZEGCplJfCRK+RuO9sOkXAPhIOSVU
         OGkpLkHzSa2HtIeBWHhfRsPxGkxGYORyGx9V4p2aUcLtT0qagT93z0d2e3h6wIDI+Tes
         acGDtRbhlAOIKPmH9zy3vx9qQsg4BE7zfQ7uP1qvsRM+TDR/kSDBM1Io2V0G0KGxROZ+
         zYZJvaq2hkVvfLH5EfInxU6zsnMFdyKeeBe4jqDalI2VnhSnjP4TMLsjKEN+/3YWtH37
         8H1Q==
X-Gm-Message-State: AOJu0YzSOsiQf8xYw2PZSkchUoZPyeS0babuStz+Y32XvAzaC7ewXEUD
	Ma+83Xspe4xTBNFQDYq1xfbdtJg6psn6MNFtWuBvH/zg+x51FySDjLvEUE/36Fl+PKZ1vR8sOAB
	T
X-Gm-Gg: ASbGnctwiGkPgaf2HAahMXqgbRDAiwTpBcnXxFKNHqk/qcjzH0ruxT6Rvnf265O/C2/
	zZliv8qqxiAF+bZMmIpY71oV0Xzhr36KPx4OIHk2egGJeALdEKzzEoO+WVK9Lm/95sI3Hi1I/M5
	Ot7PXZyi9pmxhfq5WnBG6XnWatIfe1jLFd1Z7jYZ+KQsjDU0a7YoFAjW+dPUy2nAXMRy7WBjESj
	xT9asZSJ2+DPDCgBf7irURsGEsHAwzxu/OFnw/8b/Xm3YmLYxs80mrO5zkACDtwdbxhhtFNB57j
	Vx15o8ktBMqJWUPtaZ+rzh6rWbjy3zkgZMhwyEXpfCYqWPAiIfN0OKM1CI5CM32bwLTpd8pDqLF
	E2EgYvj5FBlOORh8s55ox6pR2
X-Google-Smtp-Source: AGHT+IFr5LV87pDfDV00iTKNTng4IRZ/DXvBGigFYQbOTKWfJNFrQZuqdr/4ND68uwqIoe07/2k/Pw==
X-Received: by 2002:a17:907:c5cd:b0:abf:6d1c:8f4a with SMTP id a640c23a62f3a-ac3124b248bmr798303166b.18.1741977231250;
        Fri, 14 Mar 2025 11:33:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/traps: Drop incorrect BUILD_BUG_ON() and comment in load_system_tables()
Date: Fri, 14 Mar 2025 18:33:46 +0000
Message-Id: <20250314183346.77356-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is only the hardware task switching mechanism which cares about a TSS being
at least 0x67 bytes long.  Furthermore, since this check was added, the limit
is now 0x6b if CET-SS is active.  Nevertheless, task switches, being a relic
of the 32-bit days, aren't relevant to Xen.

LTR is is perfectly possible to load a shorter TSS, and indeed we will be
doing so with FRED active.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

In principle this is Fixes: 788844062561 ("x86/xpti: Don't leak TSS-adjacent
percpu data via Meltdown"), but I don't feel it's really a correct tag to
give.
---
 xen/arch/x86/cpu/common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index e8d4ca3203be..698abb7086d8 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -900,8 +900,6 @@ void load_system_tables(void)
 		wrmsrl(MSR_INTERRUPT_SSP_TABLE, (unsigned long)ist_ssp);
 	}
 
-	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
-
 	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
 			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
 	if ( IS_ENABLED(CONFIG_PV32) )
-- 
2.39.5


