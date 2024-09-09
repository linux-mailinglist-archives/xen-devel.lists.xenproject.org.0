Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C05C971D42
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794628.1203653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfnT-00042R-LA; Mon, 09 Sep 2024 14:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794628.1203653; Mon, 09 Sep 2024 14:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfnT-000415-HX; Mon, 09 Sep 2024 14:55:19 +0000
Received: by outflank-mailman (input) for mailman id 794628;
 Mon, 09 Sep 2024 14:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snfnS-0003YR-En
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:55:18 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8683bcce-6ebb-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 16:55:16 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so118987766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 07:55:16 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25a43370sm352479166b.96.2024.09.09.07.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 07:55:14 -0700 (PDT)
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
X-Inumbo-ID: 8683bcce-6ebb-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725893716; x=1726498516; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xfpm3WHLIJFmf39gbtVp4szeZd8QNXu+ehi7rpOFEyM=;
        b=tEj449eb6olpMGnYEq5kxk3UEQY5/lRW1oh/3b2cKZs8BxBWcfR/9W2nwo6RZTgsBq
         GE7psQnQtPSnNMMWHkrswLOwwwx407LBejzg+9NEvTrqrfpZz0qy0hg4QrhkReKOBome
         bfXZ8ZZLhtg2oe6nkX3gPkuLvyQsfKRdWITU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725893716; x=1726498516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xfpm3WHLIJFmf39gbtVp4szeZd8QNXu+ehi7rpOFEyM=;
        b=m29vx92MehmoZkKpdU5qurdLT6b/9KYAyv0u87voxzB7oC/x9wzdPURgjbJYQhFHJA
         4eMeLn9HaXsg3CTRHcOFG8veq2WhQpRwSTd7JLiLPxDyxkYHRAQSivdPF29lG8TquOvH
         Dol0ZspTpEx7rnQmpEwRgzmcDHa03rcvEOa5MwhcQ2rmC2rLEEz5UpirzveC5iesa0WB
         UshT7G8G/WzKBpOjMxZGBu4c/bpUP8b98Y47muipevWLCSWdue95wLM1sqrOfEJE6NyL
         Efk/7S0JZehYylvCQnz64KyrQpFcwnR8LfB5yAE9WfgI5CjeYCCCwIZNOuzpUW7Hfq9f
         00Ug==
X-Gm-Message-State: AOJu0YxbmFx2s24ZJ1gwqKTszLrb/gEKaR7ZrVy74EPMp7805cIXlQC1
	iRWhQe/mRu0iRqqCyo7gaEuiMvA05mijRCLWqj7R2l0L0L8YXzz8FzQDwcae0aBK3qsZhmDwU7q
	S
X-Google-Smtp-Source: AGHT+IGI89/WnGR2jms/WaYozqbIjByY6fMxe8cuiwWRtN9ti1u0miKWi7/EySN9f0CfVngBcTToyA==
X-Received: by 2002:a17:907:94d5:b0:a8d:5e1a:8d80 with SMTP id a640c23a62f3a-a8d5e1a8f3fmr276508466b.40.1725893715237;
        Mon, 09 Sep 2024 07:55:15 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 2/4] x86/time: introduce probing logic for the wallclock
Date: Mon,  9 Sep 2024 16:54:53 +0200
Message-ID: <20240909145455.7517-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909145455.7517-1-roger.pau@citrix.com>
References: <20240909145455.7517-1-roger.pau@citrix.com>
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
 xen/arch/x86/time.c | 118 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 92 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index ec48805a2239..1dcbd9f520f5 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1291,20 +1291,23 @@ static bool __get_cmos_time(struct rtc_time *rtc)
     return t1 <= SECONDS(1) && t2 < MILLISECS(3);
 }
 
-static bool __read_mostly opt_cmos_rtc_probe;
+static bool __initdata opt_cmos_rtc_probe;
 boolean_param("cmos-rtc-probe", opt_cmos_rtc_probe);
 
-static bool cmos_rtc_probe(struct rtc_time *rtc_p)
+static bool __init cmos_rtc_probe(void)
 {
     unsigned int seconds = 60;
 
+    if ( !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) )
+        return true;
+
+    if ( !opt_cmos_rtc_probe )
+        return false;
+
     for ( ; ; )
     {
-        bool success = __get_cmos_time(rtc_p);
-        struct rtc_time rtc = *rtc_p;
-
-        if ( likely(!opt_cmos_rtc_probe) )
-            return true;
+        struct rtc_time rtc;
+        bool success = __get_cmos_time(&rtc);
 
         if ( !success ||
              rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
@@ -1331,26 +1334,12 @@ static bool cmos_rtc_probe(struct rtc_time *rtc_p)
     return false;
 }
 
-static unsigned long get_cmos_time(void)
+
+static unsigned long cmos_rtc_read(void)
 {
-    unsigned long res;
     struct rtc_time rtc;
 
-    if ( efi_enabled(EFI_RS) )
-    {
-        res = efi_get_time();
-        if ( res )
-            return res;
-    }
-
-    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
-        opt_cmos_rtc_probe = false;
-    else if ( system_state < SYS_STATE_smp_boot && !opt_cmos_rtc_probe )
-        panic("System with no CMOS RTC advertised must be booted from EFI"
-              " (or with command line option \"cmos-rtc-probe\")\n");
-
-    if ( !cmos_rtc_probe(&rtc) )
-        panic("No CMOS RTC found - system must be booted from EFI\n");
+    __get_cmos_time(&rtc);
 
     return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
 }
@@ -1533,12 +1522,85 @@ void rtc_guest_write(unsigned int port, unsigned int data)
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
+{
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
 {
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
+    if ( cmos_rtc_probe() )
+    {
+        wallclock_source = WALLCLOCK_CMOS;
+        return;
+    }
+
+    panic("No usable wallclock found, probed:%s%s%s\n%s",
+          !opt_cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
+          opt_cmos_rtc_probe ? " CMOS" : "",
+          efi_enabled(EFI_RS) ? " EFI" : "",
+          !opt_cmos_rtc_probe
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
+        return cmos_rtc_read();
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
@@ -2463,6 +2525,10 @@ int __init init_xen_time(void)
 
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
+    probe_wallclock();
+
+    printk(XENLOG_INFO "Wallclock source: %s\n", wallclock_type_to_string());
+
     /* NB. get_wallclock_time() can take over one second to execute. */
     do_settime(get_wallclock_time(), 0, NOW());
 
-- 
2.46.0


