Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015696C288
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 17:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790492.1200272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzI-0003qT-5g; Wed, 04 Sep 2024 15:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790492.1200272; Wed, 04 Sep 2024 15:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzH-0003mD-U1; Wed, 04 Sep 2024 15:32:03 +0000
Received: by outflank-mailman (input) for mailman id 790492;
 Wed, 04 Sep 2024 15:32:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slrzG-0003Vv-3E
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 15:32:02 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d45172c2-6ad2-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 17:32:01 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a868b8bb0feso810568766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 08:32:01 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a620840b6sm6025966b.92.2024.09.04.08.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 08:31:59 -0700 (PDT)
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
X-Inumbo-ID: d45172c2-6ad2-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725463920; x=1726068720; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrfOkjyZvcFrm5dtWXhSEszzPb0Micj/yQlfQ2ecmso=;
        b=Ym5DYgJXb/QqD576iAPE/mxsugL5njBlen98x64KsXPIAEGG4a0i7EwPeCECaI6iXO
         RgFKVYLUjmX8mqO/AEW0PkL76VnhGmKS/N9sZ7Zd0k5l2AE7VE6Hk1bsck9Y/QIHhHWE
         lSSWo5NtEVbrrPkEtWAyS7RuG6F4jvDf4uDNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725463920; x=1726068720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrfOkjyZvcFrm5dtWXhSEszzPb0Micj/yQlfQ2ecmso=;
        b=W/9f3DIYhsGG3kKZFGoloZQr2kjKju2Ak/5QG9xK//DYwNQt44BFMH6ghlJnu9nQhV
         DHckEilLJwxEtcQ8BnwYuZXprxuHm5jL8qKO7plUYES90aGcDM1RvlAUDu3suYQBhq6U
         chxYY/nsNqoWE/xaNjZwIuakGIIu5q0KRYogXECZpTO3eWXVEYXMQqcje9IGHVAlXOOR
         vQYK2zAZ6MQ/AlKGRggeL/OyiW44nWsDIiLUBTJJSgTObYD6VCw9EJRS5NYCqOcjQn+o
         S+ygg7ZSw0issn4TRxyCV4tSs58hi5irP0yqSKNK6BMfcw6CAuwCKCiVgU09w1mM57cq
         jXBA==
X-Gm-Message-State: AOJu0YwWVjUgL+IRn2fQEQWEbJDkUeKgr5Hte8T5dbozP8XxFFoMKDTu
	hCupx/VHN6GG5CopHy7V6GiEYwzllrRAzAboezzQ7lb/ghy7MsenhQRMmcHUQ4atJ9D3A12PEiP
	Y
X-Google-Smtp-Source: AGHT+IEKwd46aI1FXSeKvqMogs4g+CNs1X3mL1gvBfQn1oSpQxufVbzZyDoD6GdK1DDwCHuEp8mK+w==
X-Received: by 2002:a17:907:980c:b0:a86:8f57:7de0 with SMTP id a640c23a62f3a-a89a37aa9famr1280983266b.49.1725463919983;
        Wed, 04 Sep 2024 08:31:59 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 2/6] x86/time: move CMOS edge detection into read helper
Date: Wed,  4 Sep 2024 17:31:47 +0200
Message-ID: <20240904153151.83995-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904153151.83995-1-roger.pau@citrix.com>
References: <20240904153151.83995-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the logic that ensures the CMOS RTC data is read just after it's been
updated into the __get_cmos_time() function that does the register reads.  This
requires returning a boolean from __get_cmos_time() to signal whether the read
has been successfully performed after an update.

Note that while __get_cmos_time() can be used without waiting for the update
edge, so far the only caller does wait for it, hence move the code inside of
the function.

The goal, albeit not accomplished by this patch, is to be able to split the
probing and the reading of the CMOS RTC data into two separate functions.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Reduce a bit the locked section.

Changes since v2:
 - New in this version.
---
 xen/arch/x86/time.c | 50 +++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 1959cc4a4f2b..571e23431ccd 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1246,8 +1246,26 @@ struct rtc_time {
     unsigned int year, mon, day, hour, min, sec;
 };
 
-static void __get_cmos_time(struct rtc_time *rtc)
+static bool __get_cmos_time(struct rtc_time *rtc)
 {
+    s_time_t start, t1, t2;
+    unsigned long flags;
+
+    spin_lock_irqsave(&rtc_lock, flags);
+
+    /* read RTC exactly on falling edge of update flag */
+    start = NOW();
+    do { /* may take up to 1 second... */
+        t1 = NOW() - start;
+    } while ( !(CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
+              t1 <= SECONDS(1) );
+
+    start = NOW();
+    do { /* must try at least 2.228 ms */
+        t2 = NOW() - start;
+    } while ( (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
+              t2 < MILLISECS(3) );
+
     rtc->sec  = CMOS_READ(RTC_SECONDS);
     rtc->min  = CMOS_READ(RTC_MINUTES);
     rtc->hour = CMOS_READ(RTC_HOURS);
@@ -1265,13 +1283,17 @@ static void __get_cmos_time(struct rtc_time *rtc)
         BCD_TO_BIN(rtc->year);
     }
 
+    spin_unlock_irqrestore(&rtc_lock, flags);
+
     if ( (rtc->year += 1900) < 1970 )
         rtc->year += 100;
+
+    return t1 <= SECONDS(1) && t2 < MILLISECS(3);
 }
 
 static unsigned long get_cmos_time(void)
 {
-    unsigned long res, flags;
+    unsigned long res;
     struct rtc_time rtc;
     unsigned int seconds = 60;
     static bool __read_mostly cmos_rtc_probe;
@@ -1292,29 +1314,9 @@ static unsigned long get_cmos_time(void)
 
     for ( ; ; )
     {
-        s_time_t start, t1, t2;
-
-        spin_lock_irqsave(&rtc_lock, flags);
-
-        /* read RTC exactly on falling edge of update flag */
-        start = NOW();
-        do { /* may take up to 1 second... */
-            t1 = NOW() - start;
-        } while ( !(CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
-                  t1 <= SECONDS(1) );
-
-        start = NOW();
-        do { /* must try at least 2.228 ms */
-            t2 = NOW() - start;
-        } while ( (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
-                  t2 < MILLISECS(3) );
-
-        __get_cmos_time(&rtc);
-
-        spin_unlock_irqrestore(&rtc_lock, flags);
+        bool success = __get_cmos_time(&rtc);
 
-        if ( likely(!cmos_rtc_probe) ||
-             t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
+        if ( likely(!cmos_rtc_probe) || !success ||
              rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
              !rtc.day || rtc.day > 31 ||
              !rtc.mon || rtc.mon > 12 )
-- 
2.46.0


