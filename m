Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D209C25F5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832776.1248089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7s-0000fy-O1; Fri, 08 Nov 2024 19:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832776.1248089; Fri, 08 Nov 2024 19:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7s-0000UQ-H7; Fri, 08 Nov 2024 19:58:36 +0000
Received: by outflank-mailman (input) for mailman id 832776;
 Fri, 08 Nov 2024 19:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7r-0008TS-Bi
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:35 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d53e1047-9e0b-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 20:58:33 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso417234366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:33 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:31 -0800 (PST)
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
X-Inumbo-ID: d53e1047-9e0b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ1M2UxMDQ3LTllMGItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk1OTEzLjI3OTA3MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095912; x=1731700712; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL3v6pBQgxthivHZltyBUNUpaHsfqdVQAfCymchp+Ls=;
        b=GPeGSjLNbMmKBkXbP3vf2ejXol5CH9kq7AXzreEtaCzeRvz4QOB4X4UZmyKMuztSzv
         gHadao1wWAiT/gcvmOsoNnPJHbbNAzo8fwcgQZlp6E5nrVzDPuVwW4eAKAjby7eW1eoQ
         E1v/8hYM2XfeUFHwZ1S8TxPdbHfeDJ1XiA39E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095912; x=1731700712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AL3v6pBQgxthivHZltyBUNUpaHsfqdVQAfCymchp+Ls=;
        b=dLTPYz8Geu+Rpet6y9D6djQ3qaJU9HeSuYmGMRwVFz+xHFA4KvbVdxtwkKvMuYU7zN
         fqQG8rrCcRl1TeY78hT0Q0m4qnGzTGunaCrc9sLH3bxFUn0t6y7ZtK7s7jRrzs1vSCSD
         g11GbeDYT2cZn2rbkFhEn9A8dac4Yr8yetOWPuwWn/cZd/NBP0MmM0lh++KU2QCiQQTW
         4EE0ufr9TepZGev5UU1iF814h32Alvf7+8QoIJeimlKrYWeFfzK8wst+6WMm+3IBPuxn
         RlOwrXZtGWssU7c9useGwPk77bIjxW2CJdrdMN+JHqXPY1lao24aaCtkhwoBQ+74LDKo
         uprA==
X-Gm-Message-State: AOJu0YxxniZZSwL+EMFG6A6sT0zcPm1HPM+uMQ6IZD2YQhSAZwCD3Oox
	WQ6PH9eG3zVYZlkQhUeLbuJv9T4FHKT2agZNq2R+pBCub0HpFaBhfhB04GERYd0Cb9GkiwwIzFw
	m
X-Google-Smtp-Source: AGHT+IHbxuNfLi3G8lUvZ+uWqI+pNZ9bkTPQHxt/iYne9UQjXwO0hWdMlmtUs9MHI5xVGNOJP9kFww==
X-Received: by 2002:a17:906:c112:b0:a99:f4fd:31c8 with SMTP id a640c23a62f3a-a9eeff0e9b4mr368661666b.22.1731095912116;
        Fri, 08 Nov 2024 11:58:32 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 05/10] x86/mach-apic: Drop ioapic_phys_id_map()
Date: Fri,  8 Nov 2024 19:58:15 +0000
Message-Id: <20241108195820.789716-6-andrew.cooper3@citrix.com>
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
 xen/arch/x86/include/asm/mach-generic/mach_apic.h | 5 -----
 xen/arch/x86/io_apic.c                            | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
index 3cf58d5f6b90..b3e9ea6600ef 100644
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
@@ -45,11 +45,6 @@ static inline int multi_timer_check(int apic, int irq)
  * really not sure why, since all local APICs should have distinct physical
  * IDs, and we need to know what they are.
  */
-static inline void ioapic_phys_id_map(physid_mask_t *map)
-{
-	*map = phys_cpu_present_map;
-}
-
 static inline int check_apicid_used(const physid_mask_t *map, int apicid)
 {
 	return physid_isset(apicid, *map);
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 11b74d3eaf8a..0123edab649b 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1491,7 +1491,7 @@ static void __init setup_ioapic_ids_from_mpc(void)
      * This is broken; anything with a real cpu count has to
      * circumvent this idiocy regardless.
      */
-    ioapic_phys_id_map(&phys_id_present_map);
+    phys_id_present_map = phys_cpu_present_map;
 
     /*
      * Set the IOAPIC ID to the value stored in the MPC table.
@@ -2237,7 +2237,7 @@ int __init io_apic_get_unique_id (int ioapic, int apic_id)
      */
 
     if (physids_empty(apic_id_map))
-        ioapic_phys_id_map(&apic_id_map);
+        apic_id_map = phys_cpu_present_map;
 
     spin_lock_irqsave(&ioapic_lock, flags);
     reg_00.raw = io_apic_read(ioapic, 0);
-- 
2.39.5


