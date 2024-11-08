Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053399C25FB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832777.1248108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7u-0001Ex-7U; Fri, 08 Nov 2024 19:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832777.1248108; Fri, 08 Nov 2024 19:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7u-0001A2-1r; Fri, 08 Nov 2024 19:58:38 +0000
Received: by outflank-mailman (input) for mailman id 832777;
 Fri, 08 Nov 2024 19:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7r-0008TY-OG
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:35 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4f1db93-9e0b-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 20:58:32 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a99eb8b607aso355544466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:32 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:30 -0800 (PST)
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
X-Inumbo-ID: d4f1db93-9e0b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ0ZjFkYjkzLTllMGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDk1OTEyLjgwNjY3NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095911; x=1731700711; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+Sj7fLqtLlYMTst58VusJVJ11oM18S4VDVx3DGpYgc=;
        b=cnmim8IgrX77bUd4N651Ed0MK7wWhtsWdadquSMzsih38NmdHU6S3niflAwgrYSp+j
         nHRaIbghcFa4AmpkI1GIvNYMu4hOw90lTxJB6ejtJ9LjDgD16yw1zHsDCu88OuvvPUUr
         /tKpcvEGxzCxRzkFYHqmLp0iYhUQ7pr3v53TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095911; x=1731700711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+Sj7fLqtLlYMTst58VusJVJ11oM18S4VDVx3DGpYgc=;
        b=KEpbMIEa5Hsxemr6IN9uMc647la0LQ8qAMoT8q92dd6lUep0hUGbDx6qyypmomeEk8
         BgJoi7eEc6tgYZrTd7bOQCWp7R6CpE43gsld23IsdNypy0EyltJq1SL8lRNJXQej7ZGA
         bHF9K/CN994Tp4wEh4U+rgbyddTS3S47dwxfDcmjMP6ZZwb115GiyymlabufGP3QIzUv
         JD5x/JWsMcQ0sEPu3pwa45fHu6Ue/0wzejLfYnCaJ68v9ovcuKMG0wczCTfwSO21qsIa
         q+fTvFdqFuL6DJxFa1ImT/MyKei4Ae67swbg32C6bBOT/3ur8AFOx4sew9ft6OJbKzNu
         uLsA==
X-Gm-Message-State: AOJu0YzrsSNBKeElfNFxFOt+k/D5pkSNKcTt8EiR5MtgxnFwdfo1jfEm
	pSSe4ZrmYmdhqGQ0PSZAIvSlM5mDcbFViHpQggWftdl71jN/Bfef1tUVU5p29kvPcyFS9b4DbUc
	C
X-Google-Smtp-Source: AGHT+IEN4P6UyfNPOw3vCYe1Veh/DK4NTalWMNlzUMfZW1t3VfRK37PAGzQr1hTa51LcRzqaABQFtQ==
X-Received: by 2002:a17:907:7f1f:b0:a9a:9ab:6233 with SMTP id a640c23a62f3a-a9eeff44cfcmr446772166b.34.1731095911424;
        Fri, 08 Nov 2024 11:58:31 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 04/10] x86/mach-apic: Drop apic_id_registered()
Date: Fri,  8 Nov 2024 19:58:14 +0000
Message-Id: <20241108195820.789716-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108195820.789716-1-andrew.cooper3@citrix.com>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's an unnecessary wrapper.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/apic.c                               | 3 +--
 xen/arch/x86/include/asm/mach-generic/mach_apic.h | 6 ------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 254ab5d388dc..9f3a374e9581 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -495,8 +495,7 @@ void setup_local_APIC(bool bsp)
     /*
      * Double-check whether this APIC is really registered.
      */
-    if (!apic_id_registered())
-        BUG();
+    BUG_ON(!physid_isset(get_apic_id(), phys_cpu_present_map));
 
     /*
      * Intel recommends to set DFR, LDR and TPR before enabling
diff --git a/xen/arch/x86/include/asm/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
index 50f39b72ccfb..3cf58d5f6b90 100644
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
@@ -45,12 +45,6 @@ static inline int multi_timer_check(int apic, int irq)
  * really not sure why, since all local APICs should have distinct physical
  * IDs, and we need to know what they are.
  */
-static inline int apic_id_registered(void)
-{
-	return physid_isset(get_apic_id(),
-			    phys_cpu_present_map);
-}
-
 static inline void ioapic_phys_id_map(physid_mask_t *map)
 {
 	*map = phys_cpu_present_map;
-- 
2.39.5


