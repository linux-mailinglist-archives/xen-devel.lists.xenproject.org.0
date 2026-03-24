Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H5/AtpiwmmecAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:09:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95E3063D5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260233.1553614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yhP-0002Ao-3m; Tue, 24 Mar 2026 10:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260233.1553614; Tue, 24 Mar 2026 10:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yhO-00027y-VY; Tue, 24 Mar 2026 10:09:22 +0000
Received: by outflank-mailman (input) for mailman id 1260233;
 Tue, 24 Mar 2026 10:09:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <soumyajyotisarkar23@gmail.com>) id 1w4yhN-00026j-QF
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:09:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4yhN-00DoZ0-5o
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:09:21 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c262cc-5cb7-0a2a0a5109dd-0a2a4501c010-38
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:09:21 +0100
Received: from [209.85.215.195] (helo=mail-pg1-f195.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c262cf-6400-0a2a45010019-d155d7c3b9bd-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:09:20 +0100
Received: by mail-pg1-f195.google.com with SMTP id
 41be03b00d2f7-b6ce6d1d3dcso1718830a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 03:09:20 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c74665ca206sm11377434a12.18.2026.03.24.03.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 03:09:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774346958; x=1774951758; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/EFfTLPPvtpKfYbDxMVwQU9jDgu7ScMy19tpR6gQjI=;
        b=iO+M95tGN3SrZhIKEBrDAqOk/orMML6o2EbcUwCf/L1IM34n6/fZWyf5ow4qI+4QNa
         ZFCBdM0aSHOKHX/FxfnQ2uEHkdBoaelXzCqT8oT0gbq6bjvLV+JF+1dgGnXkVfNHshND
         O97Lj6vvvG0jH+9e+vVAspUyQs58xolJ2Jef6DmjnhtGO2M1XhCRhf2tWJD9GMRYEbj3
         qFLDmtBvKQgsf0Mh0j+CYnHsZZIPTxC/Z3kkr75TqXQnTMOGwsXNOj+2HtMmagEC9Uw/
         RXDRh2/guUl2liKb2ypyGe0spXpgIqCG8hG8NGcfSmHK2tTkAQW8AYjyIAcBYWzB7kqN
         +B6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346958; x=1774951758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/EFfTLPPvtpKfYbDxMVwQU9jDgu7ScMy19tpR6gQjI=;
        b=sjTXw13tI9AVwLnexsBk/e2y2dgIhqBJV4eSHvi+0cljgOPYx62hwoeDggAX9N34t4
         emx58Jpr3gtBO7mpUGrFG4RBMPOKCReH2TtpWqnvJDpO7FrbEsR+1Y+fuSdk6S/FkJUm
         HkLyILadEkbssjS+dcdmpFDDakeTjjriDhYsqagRllG3rrBjQdZU3sTL9Erxute3XCOH
         WIwXG18XqAbPl3HaiG5drhTh73rDII2vky51ktRTg8h+848wgexRtZcH/ZyZX2VXjOZa
         zTElHpwO5y8P4bCe6WhLtWL6Dnit0KOqy4aoBsR5lo8D7fCoaUR/S5FDAg4Py9sMtrVa
         tE7g==
X-Gm-Message-State: AOJu0YyhtKJ3P5jr6HLzTATpcFWpvf+y59J9sbqxcPzlWf5Vg6GOThS8
	1qVDvDt6SSs2YymTfuWkrNv8Zjvm1xIee4GFP+II4PDAzJ5JJxPE8gkmja0xNjee
X-Gm-Gg: ATEYQzxP7bzNAxburHvsVx39c46QRA1UCAaSP3e/i9MFN7zaEG4zFMp2+Pc0pqz0Teg
	j2AH6oUYd4EMZA5gaEBO25s31Q5r3jK+93BLYpmCRI1xCxmSbbqwjTJCqINNb3V+8a1H7KBeqVX
	QLiNJRvJ62Sq3ACSDKnjwcfETx5jTbBVxAKxfeqrbxAbKtTTTodaikmopMqJ0h0N2z8+YWq32u2
	4RL9ZwfrMfKvvw68/57n1wvbtuH64m16xQCg1QUeRnkm8pawD2a0XU9axnr+zosp0Y2SIkTL05q
	Tgm/KMj5biCN5KWy/iOv9YJeCyb9sT9Wmc1Nk+42wjNLQvgq0iA5RN+lLzEfT8htfbJ2/26++9K
	DU0w6OW8mEI9Bs+n1yVsPw+SjiEnrmuCkxWte1RejNslzB3I6+dmXMmOvAP04GbKVIRI0jCPhpk
	xJhRenIWqh9eNH3Z2Xqp1/hbPbfVnpf0v4e0XBWwjokjvLhKk4XAXzgxlZwYOKOTjkwC1WKVgFj
	MMzYxGw1QsR0p41jmfri7j5ZpuapHafl/HoNIjtqWlS+zMKT3Y4za3fRl6inhB2Rzx/ZHZHaD/z
	hmcvit4r
X-Received: by 2002:a05:6a20:431c:b0:398:9ae9:710f with SMTP id adf61e73a8af0-39bce9b4fecmr13718713637.13.1774346958490;
        Tue, 24 Mar 2026 03:09:18 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v4 3/3] x86/efi: Add opt-out mechanism for BGRT preservation
Date: Tue, 24 Mar 2026 15:38:56 +0530
Message-ID: <20260324100856.6691-4-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324100856.6691-1-soumyajyotisarkar23@gmail.com>
References: <20260324100856.6691-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774346961-204F7DF3-C8C0A6EB/0/0
X-purgate-type: clean
X-purgate-size: 3800
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AF95E3063D5
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
index e22a42c15b..a4db7ee516 100644
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


