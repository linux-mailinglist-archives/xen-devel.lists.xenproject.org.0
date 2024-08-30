Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6546A965D71
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786339.1195940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyJG-00021j-Uk; Fri, 30 Aug 2024 09:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786339.1195940; Fri, 30 Aug 2024 09:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyJG-0001yd-Py; Fri, 30 Aug 2024 09:52:50 +0000
Received: by outflank-mailman (input) for mailman id 786339;
 Fri, 30 Aug 2024 09:52:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDj5=P5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjyJF-0001wc-VH
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:52:49 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d662550-66b5-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 11:52:48 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5bec4e00978so1717653a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 02:52:48 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a399sm1745361a12.8.2024.08.30.02.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 02:52:46 -0700 (PDT)
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
X-Inumbo-ID: 9d662550-66b5-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725011567; x=1725616367; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUv2AnrjlmtsO6HtyrpSxryNAtOQVlYXS0leiTHoEDs=;
        b=wPhHJXQpfZxysDs86M1sj3az1obft2YRwMvGmXEVWcLZJktbo1uFt0yjd9pmHhE8Ow
         bjXPCZhQCNJoz0qfYjhr2WwNmPaVTXYw7or8WtluHKcnHwUcjG5KbY+GK4H1eDNZ5oVh
         g0b5ww1/6hyiXugfFIbfIB2fV9XJdTHag7Y20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725011567; x=1725616367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUv2AnrjlmtsO6HtyrpSxryNAtOQVlYXS0leiTHoEDs=;
        b=HV+S/E2Nz4Erk5v3Y34DP0PQAdPFPorq1o7DS4zBz07ZvVKxBZ2bVdbJ/68CZTpc+p
         ua7/pzqwKYqAnwRqt9iLT6HiF87fW2bi82ZjJZjpCai4D/qnbsZ1r9o2wSwOYTAVIebp
         45NO3sJ7o4CirPYDRtnbSMhyyHrRjyQWTbrFqX+J+T+6gEczHVe8e3e51FQ+gbODcA8l
         ovZ5RiDIEimUAzR8N+VlFbek1qkdAu6ppn2SZR9wd8pydUlrKqn6tuZtxv8mukS0hDEe
         /RIUWeS9wRFZbeShC2EBsVDaJYuWS/4zdkSBpWYmUmlN5J2gBhN/+lhfUsqq8fIbz2G8
         MIbA==
X-Gm-Message-State: AOJu0Yygw5nAmUXhbiEcPe/bLmC3+tgYoZwlPALIJ4edzf2y8Zb5/yFX
	rZvdNg9gbcqfdbsYS8PnhVai1xhRTCiShNoBreh65+XUOP5gdCTv8DR04Satue5oQ7L+g891mzd
	l
X-Google-Smtp-Source: AGHT+IG90mdLnqMxXpywPpfTEaRFhM+hkLnjtbl1iKjcoL7hGmRpCUtGYyjNmSkHeUjTNfxLqveMBA==
X-Received: by 2002:a05:6402:2791:b0:5be:cfb1:ceb8 with SMTP id 4fb4d7f45d1cf-5c21ed3fd25mr4797240a12.13.1725011567001;
        Fri, 30 Aug 2024 02:52:47 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/2] x86/time: split CMOS time fetching into wrapper
Date: Fri, 30 Aug 2024 11:52:19 +0200
Message-ID: <20240830095220.49473-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830095220.49473-1-roger.pau@citrix.com>
References: <20240830095220.49473-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the logic that deals with probing and fetching the CMOS time into a
separate helper.  While moving the code also take the opportunity to reduce the
scope of some local variables.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/time.c | 72 +++++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index a97d78484105..272ca2468ea6 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1245,29 +1245,14 @@ static void __get_cmos_time(struct rtc_time *rtc)
         rtc->year += 100;
 }
 
-static unsigned long get_cmos_time(void)
+/* Returns true when fetching time from CMOS is successful. */
+static bool read_cmos_time(struct rtc_time *rtc, bool cmos_rtc_probe)
 {
-    unsigned long res, flags;
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
+        unsigned long flags;
         s_time_t start, t1, t2;
 
         spin_lock_irqsave(&rtc_lock, flags);
@@ -1285,33 +1270,56 @@ static unsigned long get_cmos_time(void)
         } while ( (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
                   t2 < MILLISECS(3) );
 
-        __get_cmos_time(&rtc);
+        __get_cmos_time(rtc);
 
         spin_unlock_irqrestore(&rtc_lock, flags);
 
-        if ( likely(!cmos_rtc_probe) ||
-             t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
-             rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
-             !rtc.day || rtc.day > 31 ||
-             !rtc.mon || rtc.mon > 12 )
-            break;
+        if ( likely(!cmos_rtc_probe) )
+            return true;
+
+        if ( t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
+             rtc->sec >= 60 || rtc->min >= 60 || rtc->hour >= 24 ||
+             !rtc->day || rtc->day > 31 ||
+             !rtc->mon || rtc->mon > 12 )
+            return false;
 
         if ( seconds < 60 )
         {
-            if ( rtc.sec != seconds )
-            {
-                cmos_rtc_probe = false;
+            if ( rtc->sec != seconds )
                 acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
-            }
-            break;
+            return true;
         }
 
         process_pending_softirqs();
 
-        seconds = rtc.sec;
+        seconds = rtc->sec;
     }
 
-    if ( unlikely(cmos_rtc_probe) )
+    ASSERT_UNREACHABLE();
+    return false;
+}
+
+static unsigned long get_cmos_time(void)
+{
+    struct rtc_time rtc;
+    static bool __read_mostly cmos_rtc_probe;
+    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
+
+    if ( efi_enabled(EFI_RS) )
+    {
+        unsigned long res = efi_get_time();
+
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
+    if ( unlikely(!read_cmos_time(&rtc, cmos_rtc_probe)) )
         panic("No CMOS RTC found - system must be booted from EFI\n");
 
     return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
-- 
2.46.0


