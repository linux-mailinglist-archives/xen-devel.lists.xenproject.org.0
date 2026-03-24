Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Bk+L9liwmmecAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:09:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770F43063D4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260231.1553605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yhL-0001tt-Qx; Tue, 24 Mar 2026 10:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260231.1553605; Tue, 24 Mar 2026 10:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yhL-0001rV-NZ; Tue, 24 Mar 2026 10:09:19 +0000
Received: by outflank-mailman (input) for mailman id 1260231;
 Tue, 24 Mar 2026 10:09:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJqO=BY=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1w4yhK-0001Nh-7r
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:09:18 +0000
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 835e60d7-2769-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Mar 2026 11:09:16 +0100 (CET)
Received: by mail-pf1-f196.google.com with SMTP id
 d2e1a72fcca58-82c4b5dfe6cso948241b3a.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 03:09:16 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c74665ca206sm11377434a12.18.2026.03.24.03.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 03:09:13 -0700 (PDT)
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
X-Inumbo-ID: 835e60d7-2769-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774346954; x=1774951754; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7lJOGAyXgWXm5RAImeMolbrvF/QPjaKzs3OuvcIdvo=;
        b=YxPwxc2SlyXElmo7X+3rbbmq6Fu192D7n9jpOa/CKoJ99PbxKGW6xRGzHYBIkY4mKi
         UdNVLkHXgvbRGoN0kAAUp179XYDxMDGxSZylGLmE0sQ4NV24WJdoRLghpUfMTyKbGoQJ
         TreSwjGP1P09OjE/Mze1R9pWeIlPi+6ojeuItg+zLJpzTGRZrqFOO5RCQnMYtUNOlYTS
         YfGGIhsh09dwyJExrXaDeG9gRuIPNivqlEuw71xj2/pOExJ4UTCvO20/AzlQaQ5VzZOu
         jb0r9sM1cOgLaVDQofyQr7UymDRXxI4INhi8D/B5y4tsVgwa3kQ75UTWLzLFf2slR1el
         h9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346954; x=1774951754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S7lJOGAyXgWXm5RAImeMolbrvF/QPjaKzs3OuvcIdvo=;
        b=k7NUA7GFf1V5HfRli0bqEeoPOqm89+Txi5Xhh7rRJ6TK9V4qsHJMNgag8QXtjaHqgd
         A7Y4ev/P4skjKQzy6UCYo1djJZ1bMTMzJQhuP0oGbVjHiYw77nvNBScfevj0WB3f7Alu
         EjCLoHRRqRUCtFGnX4+1XDmQrv6uxIxwgPifttK3KrkOZaCmOOg4Gt1/gPO94F3qJ6Dp
         udSsxbAwMzEqAXsTIk+ig6mYSKPNHpGzMfD6GMkwtgSbaKFiaN4UY01kxXvGt+d5mucu
         fIQWk/6HUj4+avl/9kmNwgrNQ3jHjnR2XuW/AwUYXvrWLy2uwnZAT/ZGFdufhap/Xhdr
         6HeQ==
X-Gm-Message-State: AOJu0YwKmUKIfYXw6mMeLV+Ns2Dk1hRnZdbzuSkcDWBq0MYIauQXdyTT
	KxsHzd/OfCKFD/zQdXydA8UCUzD70ZPMTXyIDWGos85+Jj/U80e6ZzwhcnW7qGFv
X-Gm-Gg: ATEYQzy1XVYnw11RFNBwPZ5bP/eLiwdZPdLkd3tHwkEDugbjcKJPDxUCB2gI8VEBgkx
	Jcqz4kIbvnP2LLQZ/TjDoztpuswzPlKv2nFUjUx45Civ8V2Q9KWVTCCXskbhKUQngUHsP5Y8931
	NwVb1ERA3ppSzZsvqhFRwao8lBzOuX1+29v+d9UCcuCH2GwU/qKgp/+8mqsZhQT0jyXy8nQyYXb
	JWLdVe/shIJWxhbO7s7/F2Rn0t1BU6OA6EI4RmbgeBZoR8OSb7auaZjEQfjDcPlapTU4h8Acg4O
	rdARZMZos8DYtWyJ9XfcWUhdcsReOR15MFeBrsYksenMcnj4HvYzlkB9PO+4sCSwa8H4Hj+m4Of
	WOq1bpTU6iL0xnNBpv2TotLtjxgaleKnq0w1WlNMAj5iIvW+o4O8Bes7eQuE4bAkiDYObdbAB1D
	J2+uTFYsmCnInfDt1GcxngKGOwIm2Bn3j6xLRUebVEfPmwkfOub2zt6UMpA/nqW05qv9/pieQEs
	5f3irhZOBehlMbvabhvWHeQYX0oFG4IOFJM1erlnVz0Z/Pk8ashgNmqRDpvRTzico0HWtvNjw==
X-Received: by 2002:a05:6a20:9189:b0:398:c170:1c7 with SMTP id adf61e73a8af0-39bcea27c41mr14127397637.26.1774346954322;
        Tue, 24 Mar 2026 03:09:14 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v4 2/3] x86/acpi: Integrate BGRT preservation with status reporting
Date: Tue, 24 Mar 2026 15:38:55 +0530
Message-ID: <20260324100856.6691-3-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324100856.6691-1-soumyajyotisarkar23@gmail.com>
References: <20260324100856.6691-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[apertussolutions.com,citrix.com,suse.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 770F43063D4
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
index 47d5b9b2a8..e22a42c15b 100644
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


