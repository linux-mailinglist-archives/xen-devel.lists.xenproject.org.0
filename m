Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGspI2BJzmknmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:48:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304B387DE8
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271541.1559735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaR-0006uF-LV; Thu, 02 Apr 2026 10:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271541.1559735; Thu, 02 Apr 2026 10:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaR-0006fr-0I; Thu, 02 Apr 2026 10:47:43 +0000
Received: by outflank-mailman (input) for mailman id 1271541;
 Thu, 02 Apr 2026 10:47:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w8FaN-0006KE-Vk
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FaN-009qA7-Bp
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:47:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce493f-e002-0a2a0a5209dd-0a2a450a8a2e-32
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:39 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce494b-ee98-0a2a450a0019-d155da2fc914-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:39 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b9c3a9fe80fso90523266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:47:39 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3d028955sm76392366b.61.2026.04.02.03.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 03:47:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126858; x=1775731658; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81pZ/JS38wYFIEh/dUJCFhVaISUWS/A04krI0+LMlhc=;
        b=SDOkkIyDwrY3ZrWFPgJIw6PL8GyiWY1v5MhVp/l8F+tUoVVT/nTNpetUO+QpqS1r7K
         zVp0FZBbGrtCJBMqBNCcvsowgw4zpY8/YUEW9LeDtnsBMtWUXeO41YE3oLdFMqGqHvt1
         CP1Wya6R0lmaSa4W8qlwbgV7YGRiT5Uoug0MX+p/T/V5BeDhjvPrUP8hUHsriXHQWI89
         zQXbF1otUr7OzWXseQR0+sbz18giN8vhqxhocfzc9F7XS8gynS+P19Wkv7non3zH2veW
         O4IpKpNz5B2Dp+I9e3i8/FpyhTxtC3mH2r/U+FuHjhbiKZGp5e71qaN+2byVyCSmvRDi
         NyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126858; x=1775731658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=81pZ/JS38wYFIEh/dUJCFhVaISUWS/A04krI0+LMlhc=;
        b=jPQX7Jh21qUuiZbps5Ze29GE8Z71NPr2wQJ7qKKNDo2RFaY3Zh6l3MrMjDA5lhCIQ2
         IuY9n3ZamtEm5zF87bN0HYqFS0zdj1rDk+zbBZeCDFtqlz9hqJlKdncZj5xM0OnUxRkH
         yqLQmxfB6NIiOik8wXuyI+U4i2ey6fzd/e/M7kh4qTYJFePPLd+AZE3DiDVEU6QhXYqI
         XvxGtU3nnmyK7BjsHd1oZ/HmWk9xMgGhVFJePsb2kbRtFr0e8fTKhQ5PobBALrWtkJWe
         qIoPbulXdNr5h1fJDW6dVJthPAsra0pX5wLBiLzQ2IvBJEQRAjk/nQGSorUSFf5VIPw3
         4lEw==
X-Gm-Message-State: AOJu0YyGkOx6Tne3XBgqnG7RjihFwrKo0JtI+eoHbceW/KVhBkeQHgkM
	si+F6AC9gVRA+PSPQAhbud76IBCKxt+hbWl0Y7Ho65J4BAx+NSMscCS7Uq4sy+It
X-Gm-Gg: ATEYQzx9FrkaJ3Hf5CgmnbwtWadW6wmisEoY0mpleq6oJPr11SMkZvFMHzeNgxcuh7/
	NBmatmBV9ALkWiZ9THJNtVIAjuK5KVMT+Cs89XM0E3XjqWk7RxXl73BVwNHBpRAUg22ZPCWSDbL
	VFkNcolwKBKfFcGTzSlfnsxAou71R8POyudW5RSwiY/OEpSexywPhAg81pesMKgjXpmDkX4G+JO
	eEwLy+8z59PQFwbJTcFF9X0r0utCFsL9SuZBIbTZuehvf5+WxDi6XGvhx5ATFIaP2WGstdonS2V
	1Tayzk2mflimsLaIvEszKY42uNYwD+UhUa8migUBHB+ovhQJsnDWRiPkGpFNvFhEY3N4qiyu87W
	u25+z7xbSUIySgCzZzuWR0QQwSp5Mgs0gk2w+NNcvrtwGbd96E60otacDvOZEe8q5mA8JYAOIRl
	fGxAM+jhf2gQUFC23q0QIW5KoQGQ==
X-Received: by 2002:a17:906:a50:b0:b98:8d3a:7d26 with SMTP id a640c23a62f3a-b9c138fa8bemr342137866b.15.1775126858181;
        Thu, 02 Apr 2026 03:47:38 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 12/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
Date: Thu,  2 Apr 2026 13:45:13 +0300
Message-ID: <8767d4129cd5bc56086172e58320539be7da4059.1775125380.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1775126859-BE3510B1-A701E6B6/0/0
X-purgate-type: clean
X-purgate-size: 2949
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid,aggios.com:email];
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
X-Rspamd-Queue-Id: 4304B387DE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64 platforms.
Pass the resume entry point (hyp_resume) as the first argument to EL3. The resume
handler is currently a stub and will be implemented later in assembly. Ignore the
context ID argument, as is done in Linux.

Only enable this path when CONFIG_SYSTEM_SUSPEND is set and
PSCI version is >= 1.0.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v7:
- no changes
---
 xen/arch/arm/include/asm/psci.h |  1 +
 xen/arch/arm/psci.c             | 23 ++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 48a93e6b79..bb3c73496e 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
 void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
+int call_psci_system_suspend(void);
 
 /* Range of allocated PSCI function numbers */
 #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index b6860a7760..c9d126b195 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -17,17 +17,20 @@
 #include <asm/cpufeature.h>
 #include <asm/psci.h>
 #include <asm/acpi.h>
+#include <asm/suspend.h>
 
 /*
  * While a 64-bit OS can make calls with SMC32 calling conventions, for
  * some calls it is necessary to use SMC64 to pass or return 64-bit values.
- * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
+ * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
  * (native-width) function ID.
  */
 #ifdef CONFIG_ARM_64
 #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
+#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
 #else
 #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
+#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
 #endif
 
 uint32_t psci_ver;
@@ -60,6 +63,24 @@ void call_psci_cpu_off(void)
     }
 }
 
+int call_psci_system_suspend(void)
+{
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct arm_smccc_res res;
+
+    if ( psci_ver < PSCI_VERSION(1, 0) )
+        return PSCI_NOT_SUPPORTED;
+
+    /* 2nd argument (context ID) is not used */
+    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume), &res);
+    return PSCI_RET(res);
+#else
+    dprintk(XENLOG_WARNING,
+            "SYSTEM_SUSPEND not supported (CONFIG_SYSTEM_SUSPEND disabled)\n");
+    return PSCI_NOT_SUPPORTED;
+#endif
+}
+
 void call_psci_system_off(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
-- 
2.43.0


