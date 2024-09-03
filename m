Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C0969E9F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789152.1198710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBy-0008Ew-Jy; Tue, 03 Sep 2024 13:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789152.1198710; Tue, 03 Sep 2024 13:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBy-0008CP-Dj; Tue, 03 Sep 2024 13:03:30 +0000
Received: by outflank-mailman (input) for mailman id 789152;
 Tue, 03 Sep 2024 13:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slTBx-0006aM-3H
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:03:29 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8e5a12c-69f4-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 15:03:27 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42c5347b2f7so29258975e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:03:27 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb27fsm170548455e9.10.2024.09.03.06.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 06:03:25 -0700 (PDT)
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
X-Inumbo-ID: e8e5a12c-69f4-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725368606; x=1725973406; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYHgwNobacqZEEFEfRPcZZVej2rQvaVSJz+xtblHyy0=;
        b=ZSIwY4jreM0sA11hcb3EEBDcR5EbUv0scM2J+KGmN9iTBkjVD8mXnFHMAD8e+D4PWT
         V8lYJfp1olhEvVDdUkElhmnxksfDwdp7mHK+nEfvmpVT90FwNHvyyTiYFNZgW29NPOHF
         MW5e5rY3lESowRT8YE3w2Z+1YNkTJO15QaYz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368606; x=1725973406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYHgwNobacqZEEFEfRPcZZVej2rQvaVSJz+xtblHyy0=;
        b=G2b9MNiRBtMSPVZdvfaWLHnvI9DH5zN+OicrzZ8Ke9cSB8kph1cJxT1XvLOcopclby
         jQIpNNOxBGPZ6DGVyhdfxjD4Bbqi/N4YlADStr/2t3GQ4VIHqvrfszmdoSIQ8iqD6u2Y
         LmIwZwplVTw8GOLUzO+cDQ6nyUrEW3lne1LxzrvzOqRduCCBmJLw54nsG1Eo9bbmKJx6
         /A9V0DZ0R1T2ymB7mlfT+uwayVqp9cHrTfhO+491LBAIJufLNo6u7rMjUmFH+ROgLd4i
         fViSNgPSuhp0VKzvCCnUd0VKzTxKeZsUveRu12rttWdPHnrScp5NUonjnbIBPcz/DyrQ
         5j1A==
X-Gm-Message-State: AOJu0YxB2YRfXMkP3sCP3bO934BW25TEkkczN+bSZ9kLGD2OP0dGy700
	QIO+lkAkpTwAYLVrPN7zxwSLhCtBmHLy3ZVRhaXZNbAmJMEYYo9ShJsFkaGJ+sRhZiB5PUS0AOh
	V
X-Google-Smtp-Source: AGHT+IHEaPSP4/6SwxNG7VslKvx6IVaH+TNN7/+zQWQ3nl5upfg1dKtLEqkFPOcBzsURkDvR92GVLw==
X-Received: by 2002:a05:600c:1389:b0:426:6326:4cec with SMTP id 5b1f17b1804b1-42bb01e6befmr120507635e9.29.1725368605780;
        Tue, 03 Sep 2024 06:03:25 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 4/7] x86/time: introduce probing logic for the wallclock
Date: Tue,  3 Sep 2024 15:03:00 +0200
Message-ID: <20240903130303.71334-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903130303.71334-1-roger.pau@citrix.com>
References: <20240903130303.71334-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding such probing allows to clearly separate init vs runtime code, and to
place the probing logic into the init section for the CMOS case.  Note both
the Xen shared_info page wallclock, and the EFI wallclock don't really have any
probing-specific logic.  The shared_info wallclock will always be there if
booted as a Xen guest, while the EFI_GET_TIME method probing relies on checking
if it returns a value different than 0.

The panic message printed when Xen is unable to find a viable wallclock source
has been adjusted slightly, I believe the printed guidance still provides the
same amount of information to the user.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/time.c | 116 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 92 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 10840757b22c..8402131d7b6a 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1292,14 +1292,23 @@ static bool __get_cmos_time(struct rtc_time *rtc)
     return t1 <= SECONDS(1) && t2 < MILLISECS(3);
 }
 
-static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
+static bool __initdata cmos_rtc_probe;
+boolean_param("cmos-rtc-probe", cmos_rtc_probe);
+
+static bool __init cmos_probe(void)
 {
     unsigned int seconds = 60;
 
+    if ( !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) )
+        return true;
+
+    if ( !cmos_rtc_probe )
+        return false;
+
     for ( ; ; )
     {
-        bool success = __get_cmos_time(rtc_p);
-        struct rtc_time rtc = *rtc_p;
+        struct rtc_time rtc;
+        bool success = __get_cmos_time(&rtc);
 
         if ( likely(!cmos_rtc_probe) )
             return true;
@@ -1329,28 +1338,13 @@ static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
     return false;
 }
 
-static unsigned long get_cmos_time(void)
+
+static unsigned long cmos_read(void)
 {
-    unsigned long res;
     struct rtc_time rtc;
-    static bool __read_mostly cmos_rtc_probe;
-    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
+    bool success = __get_cmos_time(&rtc);
 
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
-
-    if ( !cmos_probe(&rtc, cmos_rtc_probe) )
-        panic("No CMOS RTC found - system must be booted from EFI\n");
+    ASSERT(success);
 
     return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
 }
@@ -1533,12 +1527,82 @@ void rtc_guest_write(unsigned int port, unsigned int data)
     }
 }
 
-static unsigned long get_wallclock_time(void)
+static enum {
+    WALLCLOCK_UNSET,
+    WALLCLOCK_XEN,
+    WALLCLOCK_CMOS,
+    WALLCLOCK_EFI,
+} wallclock_source __ro_after_init;
+
+static const char *wallclock_type_to_string(void)
 {
+    switch ( wallclock_source )
+    {
+    case WALLCLOCK_XEN:
+        return "XEN";
+
+    case WALLCLOCK_CMOS:
+        return "CMOS RTC";
+
+    case WALLCLOCK_EFI:
+        return "EFI";
+
+    case WALLCLOCK_UNSET:
+        return "UNSET";
+    }
+
+    ASSERT_UNREACHABLE();
+    return "";
+}
+
+static void __init probe_wallclock(void)
+{
+    ASSERT(wallclock_source == WALLCLOCK_UNSET);
+
     if ( xen_guest )
+    {
+        wallclock_source = WALLCLOCK_XEN;
+        return;
+    }
+    if ( efi_enabled(EFI_RS) && efi_get_time() )
+    {
+        wallclock_source = WALLCLOCK_EFI;
+        return;
+    }
+    if ( cmos_probe() )
+    {
+        wallclock_source = WALLCLOCK_CMOS;
+        return;
+    }
+
+    panic("No usable wallclock found, probed:%s%s%s\n%s",
+          !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
+          cmos_rtc_probe ? " CMOS" : "",
+          efi_enabled(EFI_RS) ? " EFI" : "",
+          !cmos_rtc_probe ? "Try with command line option \"cmos-rtc-probe\"\n"
+           : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n" : "");
+}
+
+static unsigned long get_wallclock_time(void)
+{
+    switch ( wallclock_source )
+    {
+    case WALLCLOCK_XEN:
         return read_xen_wallclock();
 
-    return get_cmos_time();
+    case WALLCLOCK_CMOS:
+        return cmos_read();
+
+    case WALLCLOCK_EFI:
+        return efi_get_time();
+
+    case WALLCLOCK_UNSET:
+        /* Unexpected state - handled by the ASSERT_UNREACHABLE() below. */
+        break;
+    }
+
+    ASSERT_UNREACHABLE();
+    return 0;
 }
 
 /***************************************************************************
@@ -2463,6 +2527,10 @@ int __init init_xen_time(void)
 
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
+    probe_wallclock();
+
+    printk(XENLOG_INFO "Wallclock source: %s\n", wallclock_type_to_string());
+
     /* NB. get_wallclock_time() can take over one second to execute. */
     do_settime(get_wallclock_time(), 0, NOW());
 
-- 
2.46.0


