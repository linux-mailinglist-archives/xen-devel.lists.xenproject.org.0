Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC68C0vyt2mfXQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 13:06:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C4C299228
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 13:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255561.1550484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w26i4-0008Gi-3d; Mon, 16 Mar 2026 12:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255561.1550484; Mon, 16 Mar 2026 12:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w26i4-0008EF-08; Mon, 16 Mar 2026 12:06:12 +0000
Received: by outflank-mailman (input) for mailman id 1255561;
 Mon, 16 Mar 2026 12:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49j5=BQ=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1w26i2-0008E9-HW
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 12:06:10 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 847d9a08-2130-11f1-b164-2bf370ae4941;
 Mon, 16 Mar 2026 13:06:09 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4855dbfc129so20868975e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 05:06:09 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4855640d915sm91540365e9.4.2026.03.16.05.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 05:06:07 -0700 (PDT)
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
X-Inumbo-ID: 847d9a08-2130-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1773662768; x=1774267568; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0rWbpJ2be8sUH/WQvbkRx6j6nRNRuf+/YSo/lRPoWO4=;
        b=lq0avIugbPVTFIkF54Y8exXm1EQFWMPdWkRBOVxCATkeOVdoNjBaWEWxEqYi2YaI/B
         cmVtEv6C8LwrfWjGWul1Fk/+InCyWYIVooKASfVAwS6otLfECAynm6MNJYCzvOpHa+Yz
         NzAEOgrFdF/YrTP1WQEqL6yzEgjPaKnwSV/RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662768; x=1774267568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rWbpJ2be8sUH/WQvbkRx6j6nRNRuf+/YSo/lRPoWO4=;
        b=VtUHVkFNgtA/EbLs5R/6l45f1DanANFGSoXuoIJS1JJyIfrOUHReCzGtyYq+7F1xJX
         UyHEoGFUutjGrteRBAIR/uyMZkF9atdNCX0A80E4wN2Ma8LgSf9iI8rx6SAf5I4yczKR
         JIm6DEuwVx7/Yiwm1+iFdbn1w73dTNweexWfQ4FRJ5h0GYEf5qFyWoYo332Ir4OVKW9l
         WF1uepKm7fZhh2mGxijhAlSq5joAPva5ShrG8bQoKvR+r9xjYzWBLJJEH/G3bspHILkG
         cLJIvDa3o1uRGv0YwYuAls1pCafj9xrfGMF18tPOD5rJq6TFq1ZJq92H6U+Fz3WuA2f9
         ZFBQ==
X-Gm-Message-State: AOJu0YyuxhWaTaJacfFPxA4wReOeR+6iQUp5isVys68UsT2wSBI152pY
	kaZWTFM4oJFjLytfuchcD6V+ODrxFNSKjkVpYkrbtGwHVW/gVUM+D+0qVUWNuRTuSs6LxdeN9ez
	hopuz
X-Gm-Gg: ATEYQzzlFjobwkQ2g9Nu0j/ExijxHkRhmkV7vJcLnsf0sYghItrhiw2aNllu2hLjE9D
	KPcTcxEmYIftyW0RqsgjhyV8aVS0OtwjSov9Edej7A2zKjXSQIo5bosXYAFnTxDTw+yxJLG52/E
	qOKA3uaRSGwNrbw2dG5EQg1/uYURJ0Q6ofZDOtdiiCGABJGIfnA+qwtUvzMUoNxmm7wXQybe3RM
	fWUYNg+eKqPaGpweC22aUxk+DQjLPZX3uICWYBrUcwbwvmJoCcxqvdJdJ8ew8v99QfpJAHbkm/4
	nDJVbjnQqAZd4n9EJMgl378R1KsflkWxeGxsgeY4GXRhZTOjOy5m17i80lcpGb5kFYGqs/DbcES
	ZZEbRVrox7GZGaO1dUSHsWB/qzEMXRNCXTV5/s77f+W+8VHHVUjSf+ef4mPzlZK/kghm5Ue9uRz
	o7jMQj/+//ZqCEYSs21oTssuoxNITbuHMNODa0LAOQ6uPZlhupuC+tkUAY5FZ/1SdUcVal4+Sms
	iMrq6JaUQ==
X-Received: by 2002:a05:600c:4fc6:b0:485:3fc8:de9c with SMTP id 5b1f17b1804b1-485566d520cmr199054845e9.12.1773662768233;
        Mon, 16 Mar 2026 05:06:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/ucode: Exclude Zen6 from entrysign mitigations
Date: Mon, 16 Mar 2026 12:06:05 +0000
Message-Id: <20260316120605.661823-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid,suse.com:email,boot_cpu_data.family:url];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A0C4C299228
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Family 0x1a covers both Zen5 and Zen6, but the latter is not believed to be
vulnerable to entrysign.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This does want backporting, but it depends on 8e4775d118c327 which collects
leaf 7a1 early enough to be used in this way.  So, it should hold off for the
moment until the FRED backports are finalised.
---
 xen/arch/x86/cpu/microcode/amd.c | 6 ++++--
 xen/arch/x86/include/asm/amd.h   | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 90f10ac8be37..2ba1fa825f2f 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -20,6 +20,7 @@
 #include <xen/mm.h> /* TODO: Fix asm/tlbflush.h breakage */
 #include <xen/sha2.h>
 
+#include <asm/amd.h>
 #include <asm/msr.h>
 
 #include "private.h"
@@ -576,7 +577,7 @@ void __init ucode_probe_amd(struct microcode_ops *ops)
      */
     if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) &&
          boot_cpu_data.family >= 0x17 && boot_cpu_data.family <= 0x1a &&
-         !opt_digest_check )
+         !is_zen6_uarch() && !opt_digest_check )
     {
         printk(XENLOG_WARNING
                "Microcode patch additional digest checks disabled\n");
@@ -618,7 +619,8 @@ void __init amd_check_entrysign(void)
     if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING)  ||
          boot_cpu_data.vendor != X86_VENDOR_AMD ||
          boot_cpu_data.family < 0x17            ||
-         boot_cpu_data.family > 0x1a )
+         boot_cpu_data.family > 0x1a            ||
+         is_zen6_uarch() )
         return;
 
     /*
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 4036dd549835..d21df0741a32 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -59,6 +59,8 @@
  * For Zen3 and Zen4 (Fam19h) the heuristic is the presence of AutoIBRS, as
  * it's Zen4-specific.
  *
+ * For Zen5 and Zen6 (Fam1ah) the heuristic is the presence of FRED.
+ *
  * The caller is required to perform the appropriate vendor/family checks
  * first.
  */
@@ -66,6 +68,8 @@
 #define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
 #define is_zen3_uarch() (!boot_cpu_has(X86_FEATURE_AUTO_IBRS))
 #define is_zen4_uarch()   boot_cpu_has(X86_FEATURE_AUTO_IBRS)
+#define is_zen5_uarch() (!boot_cpu_has(X86_FEATURE_FRED))
+#define is_zen6_uarch()   boot_cpu_has(X86_FEATURE_FRED)
 
 struct cpuinfo_x86;
 int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...);
-- 
2.39.5


