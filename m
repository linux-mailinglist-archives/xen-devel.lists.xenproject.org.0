Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1663A3095B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:02:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885348.1295173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho2B-0005v4-Cv; Tue, 11 Feb 2025 11:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885348.1295173; Tue, 11 Feb 2025 11:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho2B-0005t5-8r; Tue, 11 Feb 2025 11:02:31 +0000
Received: by outflank-mailman (input) for mailman id 885348;
 Tue, 11 Feb 2025 11:02:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tho29-0005b1-9j
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:02:29 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae576bee-e867-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 12:02:27 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab7e80c4b55so59360166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 03:02:27 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7891ec1d1sm917211966b.178.2025.02.11.03.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:02:26 -0800 (PST)
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
X-Inumbo-ID: ae576bee-e867-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739271746; x=1739876546; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hz+OhDxpJGlsAiQTmB4CHYwsH6eGxQU6/VCoJv9HR8=;
        b=hKrZxS25HXTpaCUFx9ZQAEEybbhiEObUX+IBNWCju0uhYHETeBS8JDhzWbaO67dXRv
         EsLaBp7gbgPOkpsZZXrkJE7DYrD1lDjDRctu0OXE7Fjf+MKSPMVMOYASGVTYTZQkj1p8
         NfXPanktqjUVvk+8K9lWJHRoIfkkJ7EWFzyx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271746; x=1739876546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hz+OhDxpJGlsAiQTmB4CHYwsH6eGxQU6/VCoJv9HR8=;
        b=O4QMEuufStacQhX0OYwS7l+0xgKQlR0oVi4lsCXpyhkhqXQKZkiTIIwjd3iJ3bBR36
         J0ckLPZvrPBhz77IanwMjrXdaCRoaiBQzgPxGSCEaacATsE8TKSg3ILD3zCameW2IaWJ
         KolIewG3I0EA6yrvWb4IiYrnAz6z775fjq463ov/XIFNU2q2UFIcUMNBH2ZtMZpywsnC
         20iCrqTM9NTnvyJq3SDldPzfWYarZyJTAYRH1BooSFANrpGOtcks+GvPuH53LXted+RQ
         JTAFYBEEIXjFF9JAAHy8oZc6w+NPLqbb3knZQKGp9QEspdiuHKi3yAwp7/tZVZlKn851
         izsw==
X-Gm-Message-State: AOJu0YxhayncO0abSwLg+4J1mZxKmNZaDzygKWx0C98dzjYYvFwspny6
	PIBuCwmHnomyWUEYQ8v6Ayixqx7rTC4M4rJj+8l4XduH2tS8F2R2szZLB2lbXxDPAPLqBy1ubJN
	9
X-Gm-Gg: ASbGncuEI3ZE0z8N2UxPMNRUmbk7W7KVOh/vCMny8+yMpU5YUTYf1i+QCXPZh7SbU1L
	GRYFQbm6Zi7/Z4/fZxkj2Rj1Dw92dQoOUVyWZ4a62MZbSF8tsZ9oemy9DxUf4wWoGBVuteZ2zcf
	Y0DTY56RHeUi+ROjG45IBVRO0hMWtE36qdh/7pcBwo+tKZXMxgSTALToj7KVU9vmUajVd/eL1Dm
	FP3TnVgZwUp/6iUJ7/5L6mn1+N68yKA2xI13K1kp6bg2M30iuRPQh3GHbe2E8f4t//+l8lKa1An
	UcqfwVxqiRwuaA+V+41q
X-Google-Smtp-Source: AGHT+IFMzcod2hqrPr9eTWZJ1IMuNk4JJYS0VNVKmNsvvOEGEx51d3W1D4X5AUfAiwpEM6f6WeDbdQ==
X-Received: by 2002:a17:907:9404:b0:ab7:e52a:1467 with SMTP id a640c23a62f3a-ab7e52a1685mr156435866b.30.1739271746415;
        Tue, 11 Feb 2025 03:02:26 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.20 v3 3/5] x86/smp: perform disabling on interrupts ahead of AP shutdown
Date: Tue, 11 Feb 2025 12:02:07 +0100
Message-ID: <20250211110209.86974-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250211110209.86974-1-roger.pau@citrix.com>
References: <20250211110209.86974-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the disabling of interrupt sources so it's done ahead of the offlining
of APs.  This is to prevent AMD systems triggering "Receive accept error"
when interrupts target CPUs that are no longer online.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 1d3878826f07..4d29a09a9a95 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -374,6 +374,8 @@ void smp_send_stop(void)
         smp_call_function(stop_this_cpu, &stop_aps, 0);
 
     local_irq_disable();
+    disable_IO_APIC();
+    hpet_disable();
 
     if ( num_online_cpus() > 1 )
     {
@@ -389,8 +391,6 @@ void smp_send_stop(void)
 
     if ( cpu_online(cpu) )
     {
-        disable_IO_APIC();
-        hpet_disable();
         __stop_this_cpu();
         x2apic_enabled = (current_local_apic_mode() == APIC_MODE_X2APIC);
     }
-- 
2.46.0


