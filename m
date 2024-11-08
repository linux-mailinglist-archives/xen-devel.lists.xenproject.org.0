Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEC39C25F7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832780.1248139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7y-0002AD-KY; Fri, 08 Nov 2024 19:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832780.1248139; Fri, 08 Nov 2024 19:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7y-00027h-Bg; Fri, 08 Nov 2024 19:58:42 +0000
Received: by outflank-mailman (input) for mailman id 832780;
 Fri, 08 Nov 2024 19:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7w-0008TS-Sr
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:40 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d86dd1cd-9e0b-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 20:58:38 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9ed7d8c86cso445809066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:38 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:35 -0800 (PST)
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
X-Inumbo-ID: d86dd1cd-9e0b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ4NmRkMWNkLTllMGItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk1OTE4LjYxNzMzNywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095916; x=1731700716; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8X0HqMtDZiLrdBUx5d/OQYZukjUCR6KuzOBHabB77Y=;
        b=Gxxqe+rPQ60TkUJkNTPX1HrJyZVk4w1gSNN6R12jipRhZwDH/w5Ijm5L/n0xlpJmxx
         EmVxur2p8NSN8eS8WEOIrKqwhPL8vnFrF1s6wvnDR4wKOPzhj/QmJIfVjB7qlu03JpLN
         75/bot+PFuDUo+xaeKoPv3WhC8HFjH1GPosF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095916; x=1731700716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8X0HqMtDZiLrdBUx5d/OQYZukjUCR6KuzOBHabB77Y=;
        b=HJcBAihf+poLj1CwfhSwgMmnNyOE3LiyT/twd2vWNCtPP6nCcWxb8vPeSsRhU6BoEz
         i92DhyUiCZiDm8yw1siqlkTGTLePAd6OOlpUeIkLXKBuL2UlmoOnJw3IreRig8VonrGM
         FQBNMQfSCmmP1lZRbba++Ag3Pbb5qxERSoy2Q2HeyK1mO2k7rUMFUiysDV4sYevNITW5
         c89xDpxQXdptzF4BByXf2KLugN9IfWYEjhiuqht6EusdpB40FiSth772yILRH5npeeNn
         7IXM+c5FnASnq/vo5zikEL4+8g33FOgYN1zffuxo9XY1T6iycyWxzULpH7hAjHXFI+aC
         acxA==
X-Gm-Message-State: AOJu0Yy1kOALwWuXOI4NmGXCx1azN7V+dGeK+PMdY2gC3JLdb8e+aqCQ
	1ERWGQ8rPPoCs8EWhaLzq1lFmhsfkjAr0MsBzLZqy5gyEg7R6/HcuHLiw/ax56WcDPrVhechFfL
	d
X-Google-Smtp-Source: AGHT+IGIq/AzlAScjGBIlnMvhuRaeruqGMKX3YDhzKpMJQ1Cd05P4q9EtKkfOePceh4UoLnR/A0Baw==
X-Received: by 2002:a17:907:3d9f:b0:a9a:6633:3a90 with SMTP id a640c23a62f3a-a9eefeb157bmr395505966b.8.1731095916338;
        Fri, 08 Nov 2024 11:58:36 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 09/10] x86/mach-apic: Move the genapic wrappers to genapic.h
Date: Fri,  8 Nov 2024 19:58:19 +0000
Message-Id: <20241108195820.789716-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108195820.789716-1-andrew.cooper3@citrix.com>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This a better place for them to live.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/genapic.h             | 17 +++++++++++++++++
 .../x86/include/asm/mach-generic/mach_apic.h   | 18 ------------------
 xen/arch/x86/irq.c                             |  6 +++++-
 xen/arch/x86/msi.c                             |  6 +++++-
 4 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index 6c8845d17d27..cf36d48f3b07 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -37,6 +37,23 @@ struct genapic {
 	.name = aname, \
 	.probe = aprobe
 
+#define INT_DELIVERY_MODE (genapic.int_delivery_mode)
+#define INT_DEST_MODE (genapic.int_dest_mode)
+#define TARGET_CPUS ((const typeof(cpu_online_map) *)&cpu_online_map)
+#define init_apic_ldr() alternative_vcall(genapic.init_apic_ldr)
+#define cpu_mask_to_apicid(mask) ({ \
+	/* \
+	 * There are a number of places where the address of a local variable \
+	 * gets passed here. The use of ?: in alternative_call<N>() triggers an \
+	 * "address of ... is always true" warning in such a case with at least \
+	 * gcc 7 and 8. Hence the seemingly pointless local variable here. \
+	 */ \
+	const cpumask_t *m_ = (mask); \
+	alternative_call(genapic.cpu_mask_to_apicid, m_); \
+})
+#define vector_allocation_cpumask(cpu) \
+	alternative_call(genapic.vector_allocation_cpumask, cpu)
+
 extern struct genapic genapic;
 extern const struct genapic apic_default;
 extern const struct genapic apic_bigsmp;
diff --git a/xen/arch/x86/include/asm/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
index b4a2f0a0b068..3e17c271d9ac 100644
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
@@ -6,24 +6,6 @@
 #include <asm/genapic.h>
 #include <asm/smp.h>
 
-/* The following are dependent on APIC delivery mode (logical vs. physical). */
-#define INT_DELIVERY_MODE (genapic.int_delivery_mode)
-#define INT_DEST_MODE (genapic.int_dest_mode)
-#define TARGET_CPUS ((const typeof(cpu_online_map) *)&cpu_online_map)
-#define init_apic_ldr() alternative_vcall(genapic.init_apic_ldr)
-#define cpu_mask_to_apicid(mask) ({ \
-	/* \
-	 * There are a number of places where the address of a local variable \
-	 * gets passed here. The use of ?: in alternative_call<N>() triggers an \
-	 * "address of ... is always true" warning in such a case with at least \
-	 * gcc 7 and 8. Hence the seemingly pointless local variable here. \
-	 */ \
-	const cpumask_t *m_ = (mask); \
-	alternative_call(genapic.cpu_mask_to_apicid, m_); \
-})
-#define vector_allocation_cpumask(cpu) \
-	alternative_call(genapic.vector_allocation_cpumask, cpu)
-
 static inline void enable_apic_mode(void)
 {
 	/* Not needed for modern ES7000 which boot in Virtual Wire mode. */
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 0001e93ba8ac..6340cd6dd73d 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -21,10 +21,14 @@
 #include <xen/trace.h>
 #include <xen/softirq.h>
 #include <xsm/xsm.h>
+
+#include <asm/apic.h>
+#include <asm/genapic.h>
+#include <asm/io_apic.h>
 #include <asm/msi.h>
 #include <asm/current.h>
 #include <asm/flushtlb.h>
-#include <asm/mach-generic/mach_apic.h>
+
 #include <irq_vectors.h>
 #include <public/physdev.h>
 
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 677fd83218d4..68d6e25178a9 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -21,13 +21,17 @@
 #include <xen/iocap.h>
 #include <xen/keyhandler.h>
 #include <xen/pfn.h>
+
+#include <asm/apic.h>
+#include <asm/genapic.h>
 #include <asm/io.h>
+#include <asm/io_apic.h>
 #include <asm/smp.h>
 #include <asm/desc.h>
 #include <asm/msi.h>
 #include <asm/fixmap.h>
 #include <asm/p2m.h>
-#include <mach_apic.h>
+
 #include <io_ports.h>
 #include <irq_vectors.h>
 #include <public/physdev.h>
-- 
2.39.5


