Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HxZOSOgsmkOOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:14:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC7270B68
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:14:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252015.1548815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dzr-0002f7-RT; Thu, 12 Mar 2026 11:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252015.1548815; Thu, 12 Mar 2026 11:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dzr-0002dG-Ng; Thu, 12 Mar 2026 11:14:31 +0000
Received: by outflank-mailman (input) for mailman id 1252015;
 Thu, 12 Mar 2026 11:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7O7=BM=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1w0dzq-00028I-Bv
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:14:30 +0000
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [2607:f8b0:4864:20::644])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2c9b25f-1e04-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:14:29 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-2ae5423b02aso6538255ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:14:29 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae34eaacsm49271645ad.49.2026.03.12.04.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 04:14:26 -0700 (PDT)
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
X-Inumbo-ID: a2c9b25f-1e04-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314067; x=1773918867; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr7F9R+tUqPLczRWKCRwjM4O+ic73FL25ctZpaWIvEA=;
        b=gcLWqtKAyWpapckl7CL+iy5G8nSwyQsgMBFzDTAif4ntcsiXMFde1zXvzMEUxbgVT9
         3FjWkjM+65hrCdad0RTUuuVxwiP/JnC/AsVpNMad/a3OhWS7hT6F8ZerkoQ6nwUmMMER
         GW8E2793ZzkvSL2SqEXH09Xz2BnkG0ASk1iiDvn47UU2d/tsSJqM4vZIrTPr5Da3gHTy
         xeXlnbIZYUpOlzeW5TwCUD7M2ryEVBvFZzEct8mreDtTdssT/KuxokoPIuae6Wz52761
         kuDl2pw8e/1nDDG4eapRqSJovwOdSGG1Yqrol8Imt6sEQGrXn1ZzxruDKJ14cDf4ltLr
         cheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314067; x=1773918867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tr7F9R+tUqPLczRWKCRwjM4O+ic73FL25ctZpaWIvEA=;
        b=xPF/eJjMiOFSBhx1X1QuwF97pSyJULJp0DrOmA9qPQgDSQ1TQLRqp+iUisvGBcfv95
         33NVGncIcNnsC9A4x0O40htyJPje/1S7bUr01LRorqvAArxSNVQTqnIURHNrkFhAHh06
         qlzSRSoXNEW4IVeT2ZN+y/3H1fGaa5aUMb6ZgDRreilWSnYrPQ58n66V7zUvJHK1kdQ2
         YslMZ6YdFy6HlEaVnQrhpZYsNHfx7QPUKojjC1+IJGKFuBuh6BI7+skas+bxsvR+CVMW
         d39XzODXnAJIOSkvczq1B0dQrhbKXS6TOtE42Nao9tAeRcWJZpNUnXPNzAddnsRJ5lFc
         VgBQ==
X-Gm-Message-State: AOJu0YxFXm3HxnzG4nSoia7m1vr1A+JrO6zd6WVJDyetMc1EZ3irs/7e
	YF/9YAZf21x3P2Z0Gz8EyEI/wuEA05bgTQGyBc0sb4Dnd29WzHUOYMyvFRfpfCqm
X-Gm-Gg: ATEYQzzOdJ1+q8cg2bqE0z3iENms+VHTfegSZJf2uk8vog1hpdHXvnYibuABojbx9xU
	eL+sBBiqtq4m+q1sAI/x/UAFRb76NMSdGW7Lk3d4a3Fl2V/MftbqGVMG/zK/gof08J3Y8QFbmSt
	OaQIiiZ6RZESwSLWrm57Tie84V4/3hKNQ8OFvP8Aw9XnuYIfDIkpwlYims2TqlTAT9qK7CLVd85
	b47hpeJS8a4VywwCQLp0wyAjdMCUvSv5WTp1uaqEs3BP7N+GdsewJnCm+ZNKuHsNZ/kduO/oUdh
	TaVEMX35efmIY7GV1p24mLXnivmuPwlXw8FV7oohOXe1cDwvwjV/UscD1DXzcTncVSIfSmP7ijn
	CT+SiPS27CCox5T1+seGkJvkoYFjzZP9vLe+hSrJQZKHRBWChMgFlP0mBfoguGaOr1Xo3lmmACQ
	bX59WWX9pDS2jeGIT8iID/ADTNIes4/8khiO7AmSAdsMzVQ0r+NkDuy9yncUr4vJmkIKK8msDIj
	BX74TveDlnR9UCaixRPsT18EnF/W8CgiXLpWF5zFLg+5Llx92XtbErrXpren3+h8BLeUv6sXWFF
	LtqUJvyJ
X-Received: by 2002:a17:902:f712:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2aeae890c0amr60376925ad.28.1773314067415;
        Thu, 12 Mar 2026 04:14:27 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [RFC PATCH v3 2/3] x86/acpi: Integrate BGRT preservation with status reporting
Date: Thu, 12 Mar 2026 16:44:13 +0530
Message-ID: <20260312111414.17808-3-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312111414.17808-1-soumyajyotisarkar23@gmail.com>
References: <20260312111414.17808-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,invisiblethingslab.com,suse.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A0FC7270B68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add status reporting for BGRT preservation and integrate with Xen's
ACPI subsystem:
- efi_bgrt_status_info() prints preservation status (success/failure)
- Called from acpi_boot_init() after ACPI tables are processed
- Clarifying comment explains why invalidation code remains

The invalidation code in acpi_invalidate_bgrt() now acts as a safety
net: if preservation fails, the image remains in conventional RAM
and gets invalidated. If preservation succeeds, the image is in
EfiACPIReclaimMemory which won't match the RAM_TYPE_CONVENTIONAL
check, leaving the table valid.

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
---
 xen/arch/x86/acpi/boot.c |  8 ++++++++
 xen/common/efi/boot.c    | 16 ++++++++++++++++
 xen/include/xen/efi.h    |  1 +
 3 files changed, 25 insertions(+)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 1ca2360e00..20afe79db9 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -29,6 +29,7 @@
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/dmi.h>
+#include <xen/efi.h>
 #include <asm/fixmap.h>
 #include <asm/page.h>
 #include <asm/apic.h>
@@ -327,6 +328,11 @@ static int __init cf_check acpi_parse_hpet(struct acpi_table_header *table)
 	return 0;
 }

+/*
+ * Invalidate BGRT if image is in conventional RAM (preservation failed).
+ * If preservation succeeded, image is in EfiACPIReclaimMemory, which
+ * won't match RAM_TYPE_CONVENTIONAL check, so table remains valid.
+ */
 static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_header *table)
 {
 	struct acpi_table_bgrt *bgrt_tbl =
@@ -754,5 +760,7 @@ int __init acpi_boot_init(void)

 	acpi_table_parse(ACPI_SIG_BGRT, acpi_invalidate_bgrt);

+	efi_bgrt_status_info();
+
 	return 0;
 }
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e6451130ce..68e06d707c 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1911,6 +1911,22 @@ static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emf
     return true;
 }

+void __init efi_bgrt_status_info(void)
+{
+    if ( !efi_enabled(EFI_BOOT) )
+        return;
+
+    if ( bgrt_info.preserved )
+    {
+        printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
+               bgrt_info.size / 1024);
+        printk(XENLOG_INFO "EFI: BGRT relocated from %p to %p\n",
+               bgrt_info.old_addr, bgrt_info.new_addr);
+    }
+    else if ( bgrt_info.failure_reason[0] )
+        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
+               bgrt_info.failure_reason);
+}

 void __init efi_init_memory(void)
 {
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 723cb80852..e72ab3c6b5 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -39,6 +39,7 @@ static inline bool efi_enabled(unsigned int feature)
 extern bool efi_secure_boot;

 void efi_init_memory(void);
+void efi_bgrt_status_info(void);
 bool efi_boot_mem_unused(unsigned long *start, unsigned long *end);
 bool efi_rs_using_pgtables(void);
 unsigned long efi_get_time(void);
--
2.53.0


