Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEkZErmEwmkAegQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:34:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC92C30850E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260639.1553915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50x1-0005k4-2R; Tue, 24 Mar 2026 12:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260639.1553915; Tue, 24 Mar 2026 12:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50x0-0005gS-VI; Tue, 24 Mar 2026 12:33:38 +0000
Received: by outflank-mailman (input) for mailman id 1260639;
 Tue, 24 Mar 2026 12:33:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <soumyajyotisarkar23@gmail.com>) id 1w50wy-0005dz-UH
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:33:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50wy-006OfX-A7
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:33:36 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c2849b-bab6-0a2a0a5309dd-0a2a4505ea44-40
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:33:36 +0100
Received: from [209.85.216.66] (helo=mail-pj1-f66.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c2849e-5aeb-0a2a45050019-d155d842a439-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:33:36 +0100
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-35a1d4a095bso3177885a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:33:35 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c031ed04esm2215792a91.12.2026.03.24.05.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 05:33:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774355614; x=1774960414; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/EFfTLPPvtpKfYbDxMVwQU9jDgu7ScMy19tpR6gQjI=;
        b=gMIWUa7uwCC9TMeUOldNRKNCQ5mmAtOCr51KtRqFcKQPgOEaOwQWMir2feHE6bYBiX
         iOyppAN9vlFmomvhbjsG+qrsEOcWdaeuGqN+b1ItkHY/8zJvuJqKM1lnUN+8accZPnB1
         21NRjtOOhCbA2KWwWSZKJX6pbRE5UvUhizfrQalnrFGIRU84LIV1STugqgIPqwqMo9cR
         DQANL1/iTIq5+2B+Ya9XosR03KdnJpAjvWLEpUiRF+NZJInRM5jHN+I1OfoSYIkWUpXS
         Fe+wc4ctNUeFu06V36xn1YYdbeUwFw0AMu8VuTgPikn8re+eYY9beJBHCuPinclJAcw8
         BkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355614; x=1774960414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/EFfTLPPvtpKfYbDxMVwQU9jDgu7ScMy19tpR6gQjI=;
        b=Ev9D62IsymfQteD1zN1QMsOEBUwlezEpC4J6dhcYCQAmUXJ7gpVFvmlA4Fo1b5Nk4U
         fOoKOx6ATcgsBw+3ffJV1Xw8b3pLlqiDPjoKgHRYZhNLy6QgDzeFif2oiFciSt1wWxuc
         l3fQORk7mCYYpL6ndEH0ldlozEpnWi3KllMsDLw51LGCew6SktKJ8Q48wYWOKTx6DYd1
         MtDPmb5rkIY/083loCgAis+YQw+lnSc5Dqvnywjb1mc77nnjRic4vTd2WCEhOKkM3sn4
         Hpg6YxquiCy5L43o58G8Qm+Thbzr1Ihp4sWDdRcuQOyRP+IktEiXdgrBhD9DWg+AWgp1
         TvgA==
X-Forwarded-Encrypted: i=1; AJvYcCU8peUw3/j6DS1vCOl90O8OIYlO6488I3b80Pr7wjaQ5/f5ED10a1UXwZXUXRWOXo1+DB4oqCjAesw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRDbXjmFkcFI0R0uh/XlU0vOVqAcbKZme5s9f0l212lVUqwnmM
	WmvbTE4ZHkeA45ZH6Y/IXbcrbKjrUa2aZf2tm/JVidOmN6fmEjZMZ/KIL5eWfnSn
X-Gm-Gg: ATEYQzySL70rFRDa3K8RGeSoNr5iX/GwJeYG9IUUrKeK3vDhOGiKQ0bZFY+6Q++14kp
	Y5wgFit3IvyOk4yMH97mwB9N+IGybtQLUx6ctr/+xCUkgtF28QYSJvfunsEu3tsYuImrucEBNJ+
	wEHcL8Yxcz2d222ePPY1P/hZHq5XblFZXGIWDoVFfbq3sMFNBXoMxwu22yqLmo0lgDuV9jii45m
	2ms35TeHT1br1ROI5QmOQfOqxa94hSoYsBb+GU3o74Wf8mhNT/Usf/O3PmGxxKfZ73NQcJVO7Eg
	l1UaaukNNCmueoCTVR3yO3EP+06z8ATWq2ZT9hepv9dzh58mzYtY4NB9s2+JteVr8BEm+H5JR0v
	wxpAXRAWrE/VMtqqDH10jnsUpn1giSV8QzXzz2eMlFSVhTG7Vhwqd434ac1KDTbBZdIE3RR6CjH
	FY3PGRS8vbZJnDoL+1Dq0IbZd7CEEf6H82G/gUoS+8Y1UW2O50V9llIwQa63xIULFQFo/ZouVao
	Au6KbZl4hWFGXBTDr/JRBVdI7BYc5Q/Z7vOU364UkjPMrMcsqBDQ37WNMiQJxDXKjvkayRaKQ==
X-Received: by 2002:a17:90b:1e44:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-35c0083302cmr2487364a91.8.1774355613938;
        Tue, 24 Mar 2026 05:33:33 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: sarkarsoumyajyoti23@gmail.com,
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v5 3/3] x86/efi: Add opt-out mechanism for BGRT preservation
Date: Tue, 24 Mar 2026 18:03:12 +0530
Message-ID: <20260324123312.11076-4-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774355616-82759488-AE5003A6/0/0
X-purgate-type: clean
X-purgate-size: 3800
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,apertussolutions.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CC92C30850E
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


