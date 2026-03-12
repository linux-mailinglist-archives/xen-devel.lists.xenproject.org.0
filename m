Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPueHCOgsmkOOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:14:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F690270B61
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:14:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252017.1548824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dzx-0002yH-2A; Thu, 12 Mar 2026 11:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252017.1548824; Thu, 12 Mar 2026 11:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dzw-0002vO-Uw; Thu, 12 Mar 2026 11:14:36 +0000
Received: by outflank-mailman (input) for mailman id 1252017;
 Thu, 12 Mar 2026 11:14:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7O7=BM=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1w0dzv-0002tK-79
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:14:35 +0000
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [2607:f8b0:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4e39ee7-1e04-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 12:14:33 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-2ab39b111b9so4112565ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:14:32 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae34eaacsm49271645ad.49.2026.03.12.04.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 04:14:30 -0700 (PDT)
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
X-Inumbo-ID: a4e39ee7-1e04-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314071; x=1773918871; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cDGQruln6tADqd5GJFoKiZEDSzQNLfuESS4cK4O5GU=;
        b=i/Y93/TheXEqQDXW/9BrSmZcO5qI5NuQlvONMeYLP/QMZGOz+s8b7FoRfVKvZQhiOT
         HxnV4WfgXmb7MaIWDC4nKRecpGhUHygB6ugUFJ0SuKEW3MIrn3lrAGKxCrmNJcqn80Fp
         EvXNPT027RCDiUE3tDQYt+N8edG65scxFGZ3d/y9jme+RnIQv7cte8/OI0yEmfGiVOvN
         BvnWrr2i/xL+YMSoYjRA2d3Gjy1ZmuTjSSuZtFHHaQonWZsBzOr0hbSJNIPGorzJakL3
         0PcfBD4qX8Qka+is1mbVC6VYfxD+CZBjusMe/R+2fCyvSMmlaQIis8rKN89tXa3KirNd
         CjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314071; x=1773918871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1cDGQruln6tADqd5GJFoKiZEDSzQNLfuESS4cK4O5GU=;
        b=HlYNMcwnZLGoi47kEwvhtCMp35hIJB/EhRS8UeFvbqo0q2qiszJujckA6A2QHtykA0
         ha45VfDNPDh7pG8QXsp5BS3GovUW94jIj9R7fH6T1R/5tazZDaVlz+NXWhu6TpeZ5skU
         cGiTCMItm5E0EwKBi5DNtvKqnbSKVEKRHQaAp6djdEftDyAXdagcL+0XtJdQOJmgH9Es
         imeHEjY2LN1IDNH4Z+ta58npU4Ap3WlGQDidhAjZXvPZY9YStBsscg93YVgn/x1w3jG5
         FnQslpsNFxvntXDKna5bPKh/5TYGujlrqZQxJyywzeLaQ00nujxoA/MviXg8fBFSHZRH
         hHhw==
X-Gm-Message-State: AOJu0Yw3iRPoRmR61WVoDv/dZhVKZGa2Umu+6y5/z4u3jnBxn4uVcYUB
	FsPrPcqOwqsDNCTXpN+jgtaOd8zaiAWUHqMZoEIg7OdDhtbr1RYUUoMlANDrn4C8
X-Gm-Gg: ATEYQzy4SxhvbE6I4Zx3CXPUVLF6j1BV+BgaIghZPlqRUWbtnnmUzZdsFxNeIej516f
	WxeAdy2rwmg/PbASzZgQprIeuasgzs3L9zmk8oQs/tg8MNnSjItvXy2tkwyrCvrSBzLrKidzuwy
	jEBj4TtfmsOLLWkYphmc+XpJXveniK/7Gh8DyNkVpRQok63n5eaHr6lDuOX2yjkWN95UND+bxvy
	9ZWf/yz3BnD3gifyOqkAbeP5qsQ3IHWLprGCD1uRxCGfAws4PJM4jbKqDwHckmaGtglICjgZzYX
	ftc3+/7vDdq8XsnbVlafDTbn2tda5XQLYc3ztmW7rPG14y5CdaLdeG63JBhRhC9kftV/lUBoo+f
	J1Tyn+aD53GWLAMybvAK/KbKvvSlvio7a4RMrJCQXsQe7YkA7xoVIeu6aypdv8yzyCicZjQA0oJ
	UnagT44FGnBHEvlbZ9MUVegZfrRs1tpxD0XzFFFk2bTWqn5f2JBh2+DJK0p/sVQyr+LqR5+txCG
	sQH7xBQTH3mlcaFm05HKO+NrKgxReX+FIMIPChUZx10G/fRaGPYXTP5aYS+ZvC4Tf7SbKrhAQ==
X-Received: by 2002:a17:902:f68d:b0:2ae:5ec4:2f80 with SMTP id d9443c01a7336-2aeae8eaf1emr54731745ad.47.1773314070986;
        Thu, 12 Mar 2026 04:14:30 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [RFC PATCH v3 3/3] x86/efi: Add opt-out mechanism for BGRT preservation
Date: Thu, 12 Mar 2026 16:44:14 +0530
Message-ID: <20260312111414.17808-4-soumyajyotisarkar23@gmail.com>
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
X-Rspamd-Queue-Id: 1F690270B61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

BGRT preservation is now enabled by default to fix ACPI corruption
for desktop/workstation systems (similar to ESRT).

As described in the task:
https://github.com/QubesOS/qubes-issues/issues/10764

Add an opt-out parameter to allow disabling BGRT preservation on
systems where the ~1MB memory overhead is not desired.

The opt-out is implemented through two boot paths with early parsing
during the EFI boot phase before preservation runs:

1. xen.efi direct boot: '-nobgrt' command line option (parsed in
   efi_start())
2. Multiboot2 (GRUB): 'efi=no-bgrt' peeked from mb2 cmdline tag
   using get_option() in efi_multiboot2()

The flag is checked at the start of efi_preserve_bgrt_img() to
skip preservation entirely when disabled. Status logging indicates
whether preservation was disabled, succeeded, or failed.

Usage:
  Default: BGRT preserved automatically
  xen.efi: Add '-nobgrt' option
  GRUB/MB2: Add 'efi=no-bgrt' to Xen command line

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
---
 xen/arch/x86/efi/efi-boot.h |  3 +++
 xen/common/efi/boot.c       | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 0547d845cd..6c986cf6c0 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -897,6 +897,9 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle,
         efi_arch_edid(gop_handle);
     }

+    if ( cmdline && get_option(cmdline, "efi=no-bgrt") )
+        opt_bgrt_disabled = true;
+
     efi_arch_edd();
     efi_arch_cpu();

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 68e06d707c..dc46e783f3 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -170,6 +170,7 @@ static SIMPLE_TEXT_OUTPUT_INTERFACE *__initdata StdErr;

 static UINT32 __initdata mdesc_ver;
 static bool __initdata map_bs;
+static bool __initdata opt_bgrt_disabled = false;

 static struct file __initdata cfg;
 static struct file __initdata kernel;
@@ -825,6 +826,9 @@ static void __init efi_preserve_bgrt_img(void)

     bgrt_info.preserved = false;

+    if ( opt_bgrt_disabled )
+        return;
+
     bgrt = efi_get_bgrt();
     if ( !bgrt )
     {
@@ -1582,6 +1586,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
                     base_video = true;
                 else if ( wstrcmp(ptr + 1, L"mapbs") == 0 )
                     map_bs = true;
+                else if ( wstrcmp(ptr + 1, L"nobgrt") == 0 )
+                    opt_bgrt_disabled = true;
                 else if ( wstrncmp(ptr + 1, L"cfg=", 4) == 0 )
                     cfg_file_name = ptr + 5;
                 else if ( i + 1 < argc && wstrcmp(ptr + 1, L"cfg") == 0 )
@@ -1592,6 +1598,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
                     PrintStr(L"Xen EFI Loader options:\r\n");
                     PrintStr(L"-basevideo   retain current video mode\r\n");
                     PrintStr(L"-mapbs       map EfiBootServices{Code,Data}\r\n");
+                    PrintStr(L"-nobgrt      disable BGRT preservation\r\n");
                     PrintStr(L"-cfg=<file>  specify configuration file\r\n");
                     PrintStr(L"-help, -?    display this help\r\n");
                     blexit(NULL);
@@ -1916,7 +1923,9 @@ void __init efi_bgrt_status_info(void)
     if ( !efi_enabled(EFI_BOOT) )
         return;

-    if ( bgrt_info.preserved )
+    if ( opt_bgrt_disabled )
+        printk(XENLOG_INFO "EFI: BGRT preservation disabled\n");
+    else if ( bgrt_info.preserved )
     {
         printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
                bgrt_info.size / 1024);
--
2.53.0


