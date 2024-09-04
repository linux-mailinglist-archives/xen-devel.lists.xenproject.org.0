Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394896C283
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 17:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790493.1200278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzI-0003zC-F4; Wed, 04 Sep 2024 15:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790493.1200278; Wed, 04 Sep 2024 15:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzI-0003qX-AB; Wed, 04 Sep 2024 15:32:04 +0000
Received: by outflank-mailman (input) for mailman id 790493;
 Wed, 04 Sep 2024 15:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slrzH-0003Vv-9W
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 15:32:03 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d53f1ab9-6ad2-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 17:32:02 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a86e5e9ff05so788841066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 08:32:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a623a9939sm5236366b.158.2024.09.04.08.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 08:32:00 -0700 (PDT)
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
X-Inumbo-ID: d53f1ab9-6ad2-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725463921; x=1726068721; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdGzkJBMdRuuSYc3u2Hg7lyIJS3prPV9F25LIY9VB0g=;
        b=jIUx0+iD7mdZYl5BppKwSa0orj9+kBko8FYH300AOIR56Fn1ZH2LhB2j6L40aZS/J6
         t8JtoOznFJdPZ+SC6iaGfsJqFORRbjHEc5R11gxAGqRsrc1KVZEXN8hD6nHkBbroto6c
         aGE1QjNAIy846OA3HOzgTgwAxw9uMv/Sa/56w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725463921; x=1726068721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdGzkJBMdRuuSYc3u2Hg7lyIJS3prPV9F25LIY9VB0g=;
        b=esvZY81nAF0s4mMLvifvrxLclXLcNRjttOjf6oAQJIkWU4eUDnhkVnIi/D93ATncm1
         gSmUHaPMvbws2NcSEFF9lMO+ScqKy8cqDquyYEdD7sK4Ura1d0+erbh1Ra6U1Ih6osO3
         WNR4t+hV9yQCgp7tdb/T9hDP9ARA0p18MRlX8s5TgY3UNR9p6vctA1E3OiiOLiyolTps
         wm4lzgQ9FOJ5ZlSeGDvCRyPmqHcmLKc5lYZjOFcq+wjbfDCWy08gDSljwYcqTUujm/nx
         8bzaMw+jOBaO2MBglVed/rMsrFOVJOo9n/U5aYUCtquOjqEj0ZIt57ALrazx/tTn6WcM
         TV1Q==
X-Gm-Message-State: AOJu0Yz6wZXrQVid7tGfvmabRqDdRvANsTG1hOmAiLFa/oOKE2iocBJy
	Oeo5OmdS+JCDhY/3pKgFP/mHxnGUGPZQvkUxSWrolpbSj4X8B2RtyPi6wSmMpDm6Hb0ba3F83uB
	B
X-Google-Smtp-Source: AGHT+IE6XkMLQoiA77O1qAsVl6/RLfVs+qbzPjMR2qwXAUzpRGwUiFzq5NDzZGUZpra7+nYpqIMQRQ==
X-Received: by 2002:a17:907:2da5:b0:a86:9cff:6798 with SMTP id a640c23a62f3a-a8a32ed4b43mr394525566b.30.1725463921126;
        Wed, 04 Sep 2024 08:32:01 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 3/6] x86/time: split CMOS read and probe logic into function
Date: Wed,  4 Sep 2024 17:31:48 +0200
Message-ID: <20240904153151.83995-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904153151.83995-1-roger.pau@citrix.com>
References: <20240904153151.83995-1-roger.pau@citrix.com>
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
will be removed by further changes.  Also note that due to the code movement,
now cmos_rtc_probe will only get cleared on a second call to get_cmos_time(),
as the newly introduced cmos_probe() function doesn't modify the variable
anymore.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/time.c | 59 +++++++++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 571e23431ccd..1e3c13fc7360 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1291,45 +1291,32 @@ static bool __get_cmos_time(struct rtc_time *rtc)
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
@@ -1337,7 +1324,31 @@ static unsigned long get_cmos_time(void)
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


