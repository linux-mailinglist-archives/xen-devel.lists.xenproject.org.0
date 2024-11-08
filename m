Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED339C25F4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832779.1248128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7w-0001oF-8R; Fri, 08 Nov 2024 19:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832779.1248128; Fri, 08 Nov 2024 19:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7w-0001k0-2d; Fri, 08 Nov 2024 19:58:40 +0000
Received: by outflank-mailman (input) for mailman id 832779;
 Fri, 08 Nov 2024 19:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7u-0008TY-Jq
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:38 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6820324-9e0b-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 20:58:35 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c9c28c1ecbso3208821a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:35 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:33 -0800 (PST)
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
X-Inumbo-ID: d6820324-9e0b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ2ODIwMzI0LTllMGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDk1OTE1LjQ1MjczLCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095914; x=1731700714; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYLPSJ4LnDxE4PBKWdzigEqbbkS/YUzGMHz1cObbzSM=;
        b=eBifqC7RNAJMGsWO7CQudZZviiY2nS6g/+7/m7BSi3Z5kzyjYf/oJ37ACQ5n465jCS
         2VUotdoAXM9/k/hVPjSN7uiKJYuN64arypaYXAkXZ/Xk8htrHU2YkX+KX4vikohYcd3D
         r8Ez2/D5Mz+jtIraj79Dya+qjjgjzvUjUE+4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095914; x=1731700714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYLPSJ4LnDxE4PBKWdzigEqbbkS/YUzGMHz1cObbzSM=;
        b=mRprT2knvG6XqjHca5W6s3/oS4xGw3RNYit1HXeCJ5hvJzTB+Du3IntSarZnOELpKk
         ckvh9+Hx8WBqX3Tyk9STrY2BmKwKRiy//OJQHV6G+QMZUZ25BjYMa4GESQNdcNupEqsO
         ZghUZRfvldJDkcEeammTI2IDsIJktHLNXHMDmPG5VWQVBuxpKKdB8+FGSFoDjGYiwAy6
         PxE1D4DILVYoA5oGf9jNcEp3J0lY4ybDQ/J3i6xA7CLWwTlbpLat925fgB2AOMCC7Azc
         zW3KxB0BjJJx880FdXwvGGuMB9OrSdFt4Q1e8LCpBBGZH1yoXLczcfdt1PyzDgemwAX9
         282Q==
X-Gm-Message-State: AOJu0YwJMgoTqM7B8nOYfSEFiINkpCLa7lqKqXFuU6Jw3HsualqcAMNz
	oAYfZu+r3Vu3QARHcqt3n8H3UnbcyYxVlAB3seXZU3LkQhKYnO60QrHzJsGO4pXKklH1YYOpejU
	u
X-Google-Smtp-Source: AGHT+IElLsSjvElF2qNR+EDaQMrF6EoirLU7rCR/THkONc3tstOEx2T9+EaQ1ce4ezkwyEMa0wfgnA==
X-Received: by 2002:a17:907:7b88:b0:a9e:441c:f74d with SMTP id a640c23a62f3a-a9eefee456bmr320848366b.16.1731095914232;
        Fri, 08 Nov 2024 11:58:34 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 07/10] x86/mach-apic: Drop check_apicid_present()
Date: Fri,  8 Nov 2024 19:58:17 +0000
Message-Id: <20241108195820.789716-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108195820.789716-1-andrew.cooper3@citrix.com>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's an unnecessary wrapper.

It's also the only reason that smpboot.c includes mach_apic.h, other than for
transitive dependencies.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/mach-generic/mach_apic.h | 5 -----
 xen/arch/x86/smpboot.c                            | 6 ++++--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
index c8e0637f4424..7940c0234cb9 100644
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
@@ -45,11 +45,6 @@ static inline int multi_timer_check(int apic, int irq)
  * really not sure why, since all local APICs should have distinct physical
  * IDs, and we need to know what they are.
  */
-static inline int check_apicid_present(int apicid)
-{
-	return physid_isset(apicid, phys_cpu_present_map);
-}
-
 static inline void set_apicid(int phys_apicid, physid_mask_t *map)
 {
 	physid_set(phys_apicid, *map);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 9e79c1a6d6e6..42272a9844fa 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -20,6 +20,9 @@
 #include <xen/serial.h>
 #include <xen/numa.h>
 #include <xen/cpu.h>
+
+#include <asm/apic.h>
+#include <asm/io_apic.h>
 #include <asm/cpuidle.h>
 #include <asm/current.h>
 #include <asm/mc146818rtc.h>
@@ -37,7 +40,6 @@
 #include <asm/tboot.h>
 #include <asm/trampoline.h>
 #include <irq_vectors.h>
-#include <mach_apic.h>
 
 unsigned long __read_mostly trampoline_phys;
 enum ap_boot_method __read_mostly ap_boot_method = AP_BOOT_NORMAL;
@@ -1193,7 +1195,7 @@ void __init smp_prepare_cpus(void)
      * CPU too, but we do it for the sake of robustness anyway.
      * Makes no sense to do this check in clustered apic mode, so skip it
      */
-    if ( !check_apicid_present(boot_cpu_physical_apicid) )
+    if ( !physid_isset(boot_cpu_physical_apicid, phys_cpu_present_map) )
     {
         printk("weird, boot CPU (#%d) not listed by the BIOS.\n",
                boot_cpu_physical_apicid);
-- 
2.39.5


