Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGbOMOVkwmmecAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:18:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3408530655E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260277.1553650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ypW-0005fk-Iu; Tue, 24 Mar 2026 10:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260277.1553650; Tue, 24 Mar 2026 10:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ypW-0005ed-Dh; Tue, 24 Mar 2026 10:17:46 +0000
Received: by outflank-mailman (input) for mailman id 1260277;
 Tue, 24 Mar 2026 10:17:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <soumyajyotisarkar23@gmail.com>) id 1w4ypV-0005ck-9l
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:17:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4ypT-008Ntf-44
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:17:44 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c264bc-5cb7-0a2a0a5109dd-0a2a45048a58-28
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:17:44 +0100
Received: from [209.85.216.67] (helo=mail-pj1-f67.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c264c7-c823-0a2a45040019-d155d843a56e-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:17:44 +0100
Received: by mail-pj1-f67.google.com with SMTP id
 98e67ed59e1d1-35b88a4f123so2545909a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 03:17:43 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c031412f2sm1939382a91.7.2026.03.24.03.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 03:17:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774347462; x=1774952262; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7lJOGAyXgWXm5RAImeMolbrvF/QPjaKzs3OuvcIdvo=;
        b=oaSCFT8H5Eo46cbTddQidd7PgV2YPdTRKX9hGjN59sPMuaAhDQH7ohF6K2NSEa/2/Y
         Ts4d6B6NxhhGtNSE9mKf0znqnrhxqqjzYxeE2RhODNkDQat7gnsJUKT0qF+f8vIOMju+
         71L2VpJHl7hjQCAJDTsDIfV6EE5BJyPC2Wn1nA7U4MP8LHlJIOfPNdPQ81hAkMEsSV5U
         krATnXDDwsWa1DRRMUARN51YGqmY71+PM6DDb1BZTPlIW4LNEku5B9/VKzNGCkU7YtM7
         IJWdShJqyHD2oI5v8gKxnV1DQOM+9nMavvrB/Lt2Sx6c5KoXMBEyzDGeMMknzcuPAnqs
         OqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774347462; x=1774952262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S7lJOGAyXgWXm5RAImeMolbrvF/QPjaKzs3OuvcIdvo=;
        b=GkhP64fCKalzHfv4Gja0acbuUanCJcAZK/cWcNlH+ON/8w7tzF9dGYgDei5pehVqjB
         wBXzXJ7cZpU5oyGtuV0A/mDQYhB251R9Cqdph8PEl5jeBPnM69QgDXToI+u1Xmsc9XvZ
         rjFfAb5nPAxcL8Q0vVXYmVIuIkoE+6n28P39Ytmn6KXrPh9Q5Qz/seTy3hitrC5Lp+SX
         4NB0HAzSp7t2ITMgSUQslT30+Do9jC7o7DvXZljl0b2T88m9z7dJEZuOUfHOgGk5XPwg
         ePI2Gg+sE/sLhSzGtbCFke2Qp5JOrwJiG0RRysSxFKFnrn3EgRjDHvVFu7hoGhHF2+DQ
         W4tw==
X-Gm-Message-State: AOJu0YwgK4vCoJL5vEt3ZyWfeU6MAtbBsoNcvsHn6bdtePWKxUtnFIFX
	koa4WaPYnhhBoGB47htzQt2D0RgrfsJ70Izh/ECAePFroav3YZSI3nOywFhbh2y6
X-Gm-Gg: ATEYQzxw/vPBMibGRupDgX6u25Ru8u+ciaDryZldIhO++CGQrAktYFroKHjDaLPLLpJ
	rffgRLq9Yxofa73PwlPoVG7vXFeB8ZmlFG8XBl/AHmXoBNNFzP8zcOS8E/J6xAgFST9UyjrVnzY
	ZdkSDfuDb8zj5T3xM9Z17LzkPveJzD0m/isSRMQLaudiaxBG1GfAUNl4/P/j3dxAGXD1jjPks2G
	N/TrYq7notyHwwx8wadz6Ewx/tXg9xTcTi7dyqzGPW/BMlHZ92rfgRUTKzzZP2b5dsLOdQKHiiU
	dTvR7fD0OGU+vyO4bfCfuQZLd4OWMUPzctKGfPB1MsNd4dK5ZfRCZ/BvWu6CKKt2eKz0aHMDbtX
	4E4ZiL398h8SpUz1MXuVviLTGs+ta/Ntth+IEvlOKxXvm6M3wk2ZnYYQQxqgzhGl6euWKDgCYfq
	Ivip3EwT5yQz09LPZApb05mm4tvZGDBgljBVshXJFCS/iOuATXMqmrPEqzWZlfCLbSkIrj4ST7q
	BWocstk4xNAykWrZ83BR7WKgFzRM7wH/i2aQPpy16CKcahsEFnvrzLMoWFXqCHx67DLaBPKIw==
X-Received: by 2002:a17:90b:1fc4:b0:35b:92ba:66e4 with SMTP id 98e67ed59e1d1-35c008311e5mr1936050a91.7.1774347462028;
        Tue, 24 Mar 2026 03:17:42 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v4 2/3] x86/acpi: Integrate BGRT preservation with status reporting
Date: Tue, 24 Mar 2026 15:47:25 +0530
Message-ID: <20260324101726.6929-3-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324101726.6929-1-soumyajyotisarkar23@gmail.com>
References: <20260324101726.6929-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774347464-B9C819D1-A61567DF/0/0
X-purgate-type: clean
X-purgate-size: 3168
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,apertussolutions.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3408530655E
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


