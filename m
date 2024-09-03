Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469E1969E9D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789151.1198700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBx-0007xH-9V; Tue, 03 Sep 2024 13:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789151.1198700; Tue, 03 Sep 2024 13:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBx-0007uk-5O; Tue, 03 Sep 2024 13:03:29 +0000
Received: by outflank-mailman (input) for mailman id 789151;
 Tue, 03 Sep 2024 13:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slTBw-0006aM-3A
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:03:28 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8395ab8-69f4-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 15:03:26 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42c2e50ec13so28047775e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:03:26 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374cd905b7csm4693774f8f.74.2024.09.03.06.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 06:03:23 -0700 (PDT)
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
X-Inumbo-ID: e8395ab8-69f4-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725368605; x=1725973405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlrST8NQvTpSHZQ00XsEmEMoHSo3pwtZjz9imQntHpo=;
        b=NvLhFVYljyQEoi+jFHz9CHkzXqKlVr7SBzUU+xIb4WQPXQKE0hBGz2GaU06c5Suxpo
         K6hR3kGq84scZe+ungZKCC3rTithQ/MXhg1sGG+5FqFF/gRA+oHWtMISAZFRbSro5UD1
         y+nJqmVrq7RFHNGjo771Xh6s3ukC5SO5k3QJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368605; x=1725973405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlrST8NQvTpSHZQ00XsEmEMoHSo3pwtZjz9imQntHpo=;
        b=qJoB6/kbj+uDjzhgGqFiTj1vJht838ea6VHK3zOwtkj7o9kbDGWPoyqZ1YynA3HLlr
         gdv4fnjGhZn28d+0yVk0Fisc8afyEFsj92fJWrXg9I6qDZPcdyA6YPXDpaFcaaod4RVk
         cdyQ5jmVjjn5J805QDX4jilmjSoeJHT+uQtLs/NMukOWC8zmi+VhFXvrCMffmjLeup7X
         kFYWidvLhIg7gSiIqCUZPJUzrC7ct1Rm/+NmtBsu4LHhbRF3TYdr4LHEw9vxh+VyGSr0
         mfh7H69OJDYz5Res9DK0nMs4I6eBAfQhfkx3y91KzJvzY17atYM8jI6Tp8Sfoyqfutho
         zOwg==
X-Gm-Message-State: AOJu0Yzu3tq/WdpDzOfMv1KalZxZFEApGpHoFdXYx7kk9/NNjKWpvbcQ
	F6CZ/ua1ITJqDUBJxqyy8sUjIecVW9pejHpyIggYtvZm+NUiE9UVsZ2qrgvvkkjXngcGEAnMGjW
	3
X-Google-Smtp-Source: AGHT+IFzWZBGZftFOWyrL5F4RCE5uzSTQrWk0vWZ5ly8Ds6AQmLr0wxsyAouBwF5cLw80yg3+0RO6g==
X-Received: by 2002:adf:eac7:0:b0:374:cbe8:6f43 with SMTP id ffacd0b85a97d-374cbe8703bmr4119624f8f.33.1725368604675;
        Tue, 03 Sep 2024 06:03:24 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 3/7] x86/time: split CMOS read and probe logic into function
Date: Tue,  3 Sep 2024 15:02:59 +0200
Message-ID: <20240903130303.71334-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903130303.71334-1-roger.pau@citrix.com>
References: <20240903130303.71334-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic to probe for the CMOS RTC is open-coded in get_cmos_time(),
move it to a separate function that both serves the purpose of testing for the
CMOS RTC existence and returning its value.

The goal is to be able to split the probing and the reading logic into separate
helpers, and putting the current logic in a separate function helps simplifying
further changes.

A transient *rtc_p variable is introduced as a parameter to the function, that
will be removed by further changes.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/time.c | 59 +++++++++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 2a64687bf45b..10840757b22c 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1292,45 +1292,32 @@ static bool __get_cmos_time(struct rtc_time *rtc)
     return t1 <= SECONDS(1) && t2 < MILLISECS(3);
 }
 
-static unsigned long get_cmos_time(void)
+static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
 {
-    unsigned long res;
-    struct rtc_time rtc;
     unsigned int seconds = 60;
-    static bool __read_mostly cmos_rtc_probe;
-    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
-
-    if ( efi_enabled(EFI_RS) )
-    {
-        res = efi_get_time();
-        if ( res )
-            return res;
-    }
-
-    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
-        cmos_rtc_probe = false;
-    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
-        panic("System with no CMOS RTC advertised must be booted from EFI"
-              " (or with command line option \"cmos-rtc-probe\")\n");
 
     for ( ; ; )
     {
-        bool success = __get_cmos_time(&rtc);
+        bool success = __get_cmos_time(rtc_p);
+        struct rtc_time rtc = *rtc_p;
 
-        if ( likely(!cmos_rtc_probe) || !success ||
+        if ( likely(!cmos_rtc_probe) )
+            return true;
+
+        if ( !success ||
              rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
              !rtc.day || rtc.day > 31 ||
              !rtc.mon || rtc.mon > 12 )
-            break;
+            return false;
 
         if ( seconds < 60 )
         {
             if ( rtc.sec != seconds )
             {
-                cmos_rtc_probe = false;
                 acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
+                return true;
             }
-            break;
+            return false;
         }
 
         process_pending_softirqs();
@@ -1338,7 +1325,31 @@ static unsigned long get_cmos_time(void)
         seconds = rtc.sec;
     }
 
-    if ( unlikely(cmos_rtc_probe) )
+    ASSERT_UNREACHABLE();
+    return false;
+}
+
+static unsigned long get_cmos_time(void)
+{
+    unsigned long res;
+    struct rtc_time rtc;
+    static bool __read_mostly cmos_rtc_probe;
+    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
+
+    if ( efi_enabled(EFI_RS) )
+    {
+        res = efi_get_time();
+        if ( res )
+            return res;
+    }
+
+    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
+        cmos_rtc_probe = false;
+    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
+        panic("System with no CMOS RTC advertised must be booted from EFI"
+              " (or with command line option \"cmos-rtc-probe\")\n");
+
+    if ( !cmos_probe(&rtc, cmos_rtc_probe) )
         panic("No CMOS RTC found - system must be booted from EFI\n");
 
     return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
-- 
2.46.0


