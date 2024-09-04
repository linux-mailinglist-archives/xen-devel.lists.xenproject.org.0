Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6545296C281
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 17:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790494.1200296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzJ-0004V6-RT; Wed, 04 Sep 2024 15:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790494.1200296; Wed, 04 Sep 2024 15:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzJ-0004Ry-OY; Wed, 04 Sep 2024 15:32:05 +0000
Received: by outflank-mailman (input) for mailman id 790494;
 Wed, 04 Sep 2024 15:32:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slrzI-0003Vv-At
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 15:32:04 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5d92f24-6ad2-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 17:32:03 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so100105766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 08:32:03 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a623c3786sm5325366b.185.2024.09.04.08.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 08:32:02 -0700 (PDT)
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
X-Inumbo-ID: d5d92f24-6ad2-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725463923; x=1726068723; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItQoxobOTKqaNEGEL3xN/mYnQHDAMZg8rUbmhpI3k9A=;
        b=Gte6u867nbUwNBVMP7EDsIW2202qaBVdZ/Tg9CF9/D3EVztXu6zAeLkxIqFFFMUJlV
         iL2M6TR0UvD5PHbBEB4xxDgC5atwV2ytPMut/kr68XuaUfR9fYG5XnTr4EAQosD4auUo
         RZzBSmIl5tUQIhg3FEFCkxdFrhVewqJmvKnuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725463923; x=1726068723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItQoxobOTKqaNEGEL3xN/mYnQHDAMZg8rUbmhpI3k9A=;
        b=skOGQgEIICabmVbZqqbjZsgdtg8lltV5C++SAzDcU3lz1kLK8JIOZA9sqqnJFeftxc
         6p5r0a2P3ap6STVtq73BfvIPu3zjV+StQ7UVE+jIxj/9z060zinHer5C4+Wk9NS33F2D
         RkgU6edfLpwBRWTAHqe/8auce/mY/4b4Hlrm7zrXMFUoECjqNbbyNJxXuyT/T2n09mW0
         BX3ghLT9PY06M0p66D9tl9Yp2EPI5cve4+VoodbJHNpx5DJy6ftZNJHRrm8A2ruGixpk
         V2P03pLOyExjU4qy7z8wRR+op3FHcdG59jgoNFrXqLCEqX0sXstglODrq08RrgydeQ89
         rGvA==
X-Gm-Message-State: AOJu0YzDkvibMB1rDFF92XH3SrpS0u+Cb0WA+opwoQ7z3mIU/EYsMHGO
	AsGeaA6QVVlu/vCS7GH/9pZUxQOnB57XgR631d+JNjOtJogBE4kVXxNP1uv1nuMhz1wb9NwnyOX
	u
X-Google-Smtp-Source: AGHT+IFoVlKxWSyraHL31SO7uY0Qy4yIGRs9TMoqYGF7fkINWk4LESaxR2wSm1JlIwuUBN6BOiu4pg==
X-Received: by 2002:a17:907:7245:b0:a86:6fb3:fda5 with SMTP id a640c23a62f3a-a8a3f24a7e8mr193811466b.32.1725463922725;
        Wed, 04 Sep 2024 08:32:02 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 4/6] x86/time: introduce probing logic for the wallclock
Date: Wed,  4 Sep 2024 17:31:49 +0200
Message-ID: <20240904153151.83995-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904153151.83995-1-roger.pau@citrix.com>
References: <20240904153151.83995-1-roger.pau@citrix.com>
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
Changes since v3:
 - Remove ASSERT from cmos_read().
 - Change indentation of panic message arguments in probe_wallclock().
 - Add __init attribute.

Changes since v2:
 - New in this version.
---
 xen/arch/x86/time.c | 118 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 94 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 1e3c13fc7360..9ebeee61b987 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1291,14 +1291,23 @@ static bool __get_cmos_time(struct rtc_time *rtc)
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
@@ -1328,28 +1337,12 @@ static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
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
+    __get_cmos_time(&rtc);
 
     return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
 }
@@ -1532,12 +1525,85 @@ void rtc_guest_write(unsigned int port, unsigned int data)
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
+static const char *__init wallclock_type_to_string(void)
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
+          !cmos_rtc_probe
+              ? "Try with command line option \"cmos-rtc-probe\"\n"
+              : !efi_enabled(EFI_RS)
+                  ? "System must be booted from EFI\n"
+                  : "");
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
@@ -2462,6 +2528,10 @@ int __init init_xen_time(void)
 
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
+    probe_wallclock();
+
+    printk(XENLOG_INFO "Wallclock source: %s\n", wallclock_type_to_string());
+
     /* NB. get_wallclock_time() can take over one second to execute. */
     do_settime(get_wallclock_time(), 0, NOW());
 
-- 
2.46.0


