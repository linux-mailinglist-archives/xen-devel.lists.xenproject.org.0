Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9050987CC99
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:43:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693825.1082424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5y0-0006rS-2b; Fri, 15 Mar 2024 11:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693825.1082424; Fri, 15 Mar 2024 11:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5xz-0006ow-W2; Fri, 15 Mar 2024 11:43:15 +0000
Received: by outflank-mailman (input) for mailman id 693825;
 Fri, 15 Mar 2024 11:43:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtVl=KV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rl5xy-0006oI-SG
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 11:43:14 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34d02e27-e2c1-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 12:43:13 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-513b022a238so2456990e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 04:43:13 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 fm23-20020a05600c0c1700b00413e4cf0c42sm8607143wmb.25.2024.03.15.04.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 04:43:12 -0700 (PDT)
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
X-Inumbo-ID: 34d02e27-e2c1-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710502992; x=1711107792; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vEJHp5ZUQhSC5CXAl5Yq1iRDuA5cFRJNww0FB4moeVA=;
        b=KIIRLd/F3LH4H85Ji7B0lHwU9erZOclpNTilxc8edCkb+Hxb8ui1Sd4q6LRAM4S40x
         PoZshUS2w/HG+Jpz1xm9EVgy5ypRsEfNB/X2ig9iQDoitBlT94T2yGgX+gwtk+tTi3C5
         gzx3lCqMtBjDZvo6YpVuaP6bqBTJsswUfKvVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710502992; x=1711107792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEJHp5ZUQhSC5CXAl5Yq1iRDuA5cFRJNww0FB4moeVA=;
        b=rhvEhVu9+r8FCDIuXeVTINtykYwj05P7pPt/BdUxar0jQ+mjc6YP9wh3I3eL+MoSG1
         izp8ecAu9fD7Zh5afTseeQ5T1jzvGCwkfLtnO1t3jA4Vpqc+nmr/8gnlk9SHqEIbQTHB
         7op8FAU5oSd+CzjQ+uryjiU0JSQzJQsfTMf2ew/WxsF+qu/Hz3nFY5fXllf0rzJKEvyA
         +I9girt2dDF29tODV9ywDgzuisI3jfivf5+GmYbMYojlpSgbOphqasJ+3OS2wHoYRGkk
         VN20FJeH44rYLzgYYNoAyIUs34aI0U56UdB47XvxbEDy9eVFHuyFN8BwLUScpR6OUY9c
         3prw==
X-Gm-Message-State: AOJu0YynaAC4j/T/z7CurqByda1Pfyw91sYnVhgIddJECYgX1smg7RQQ
	3S8dIu8NCHuUkxXk2/WMMiSRZJPydSHpZMW2+AFZsfzHSCo1vX7eDyxNGs/T14x+Bvg2ez5lLKK
	N
X-Google-Smtp-Source: AGHT+IGiM6YwL8oGxPMiPNae6cVIqdAkxb5Gkg1NKp5mei5KRbGk7UjORJlmP4WEiuSHsgpmVwHTlA==
X-Received: by 2002:ac2:5b41:0:b0:513:d20b:1d5a with SMTP id i1-20020ac25b41000000b00513d20b1d5amr3182203lfp.29.1710502992468;
        Fri, 15 Mar 2024 04:43:12 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/time: prefer CMOS over EFI_GET_TIME
Date: Fri, 15 Mar 2024 12:42:42 +0100
Message-ID: <20240315114242.33309-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

EFI_GET_TIME doesn't seem to be very reliable:

----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
CPU:    0
RIP:    e008:[<0000000062ccfa70>] 0000000062ccfa70
[...]
Xen call trace:
   [<0000000062ccfa70>] R 0000000062ccfa70
   [<00000000732e9a3f>] S 00000000732e9a3f
   [<ffff82d04034f34f>] F arch/x86/time.c#get_cmos_time+0x1b3/0x26e
   [<ffff82d04045926f>] F init_xen_time+0x28/0xa4
   [<ffff82d040454bc4>] F __start_xen+0x1ee7/0x2578
   [<ffff82d040203334>] F __high_start+0x94/0xa0

Pagetable walk from 0000000062ccfa70:
 L4[0x000] = 000000207ef1c063 ffffffffffffffff
 L3[0x001] = 000000005d6c0063 ffffffffffffffff
 L2[0x116] = 8000000062c001e3 ffffffffffffffff (PSE)

****************************************
Panic on CPU 0:
FATAL PAGE FAULT
[error_code=0011]
Faulting linear address: 0000000062ccfa70
****************************************

Swap the preference to default to CMOS first, and EFI later, in an attempt to
use EFI_GET_TIME as a last resort option only.  Note that Linux for example
doesn't allow calling the get_time method, and instead provides a dummy handler
that unconditionally returns EFI_UNSUPPORTED on x86-64.

The error checks are moved to the end of the function, in order to have them
grouped together.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/time.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 60870047894b..fcce5528e1f0 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1176,26 +1176,17 @@ static void __get_cmos_time(struct rtc_time *rtc)
 
 static unsigned long get_cmos_time(void)
 {
-    unsigned long res, flags;
+    unsigned long flags;
     struct rtc_time rtc;
     unsigned int seconds = 60;
     static bool __read_mostly cmos_rtc_probe;
     boolean_param("cmos-rtc-probe", cmos_rtc_probe);
 
-    if ( efi_enabled(EFI_RS) )
-    {
-        res = efi_get_time();
-        if ( res )
-            return res;
-    }
-
     if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
         cmos_rtc_probe = false;
-    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
-        panic("System with no CMOS RTC advertised must be booted from EFI"
-              " (or with command line option \"cmos-rtc-probe\")\n");
 
-    for ( ; ; )
+    for ( ; !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) ||
+            cmos_rtc_probe; )
     {
         s_time_t start, t1, t2;
 
@@ -1223,7 +1214,8 @@ static unsigned long get_cmos_time(void)
              rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
              !rtc.day || rtc.day > 31 ||
              !rtc.mon || rtc.mon > 12 )
-            break;
+            return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min,
+                          rtc.sec);
 
         if ( seconds < 60 )
         {
@@ -1231,6 +1223,8 @@ static unsigned long get_cmos_time(void)
             {
                 cmos_rtc_probe = false;
                 acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
+                return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min,
+                              rtc.sec);
             }
             break;
         }
@@ -1240,10 +1234,22 @@ static unsigned long get_cmos_time(void)
         seconds = rtc.sec;
     }
 
-    if ( unlikely(cmos_rtc_probe) )
-        panic("No CMOS RTC found - system must be booted from EFI\n");
+    if ( efi_enabled(EFI_RS) )
+    {
+        unsigned long res = efi_get_time();
+
+        if ( res )
+            return res;
+
+        panic("Broken EFI_GET_TIME %s\n",
+              !cmos_rtc_probe ? "try booting with \"cmos-rtc-probe\""
+                              : "and no CMOS RTC found");
+    }
+    if ( !cmos_rtc_probe )
+        panic("System with no CMOS RTC advertised must be booted from EFI"
+              " (or with command line option \"cmos-rtc-probe\")\n");
 
-    return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
+    panic("No CMOS RTC found - system must be booted from EFI\n");
 }
 
 static unsigned int __ro_after_init cmos_alias_mask;
-- 
2.44.0


