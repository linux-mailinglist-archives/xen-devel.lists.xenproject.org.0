Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0935969E9C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789150.1198690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBu-0007fH-SC; Tue, 03 Sep 2024 13:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789150.1198690; Tue, 03 Sep 2024 13:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBu-0007bL-OA; Tue, 03 Sep 2024 13:03:26 +0000
Received: by outflank-mailman (input) for mailman id 789150;
 Tue, 03 Sep 2024 13:03:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slTBt-00075o-6P
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:03:25 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e746b798-69f4-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 15:03:24 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42bbc70caa4so34704315e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:03:24 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c84fcfa75sm55355515e9.25.2024.09.03.06.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 06:03:22 -0700 (PDT)
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
X-Inumbo-ID: e746b798-69f4-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725368603; x=1725973403; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWNpjBsAIPK60t6LFlUvJ8Y+91zPGK0954pEXqUaxFA=;
        b=ZFha+ohE3p0b1zf4NxQyTfYi9++xHzXPFc9u4WbKuazXmiq0J9M39+mZ2zImCrSyLg
         JkdkX4P+vgt+OZ1Anrlv+E0/zosJZ6s0fe4ZoeTCYr1hhduPsAJCbbcXsg7OlXAcXE6z
         aKJbpWlKxLVrVa1RXUFqoy83ptffJpNzdQ7t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368603; x=1725973403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWNpjBsAIPK60t6LFlUvJ8Y+91zPGK0954pEXqUaxFA=;
        b=gXaJTkcD5ki+gFxLapTjx61h9j/3BRXZBdsZLXmi6o9swCEPtzNrPeXIHiYLItcgP7
         G5HIZszEE8Lu7Yfnk30DpRfAJzL7plp5zypPg1kKP4MYchKd0n1z6J3Bti2eTIdJE2rN
         Es2kGfWtt3VzwYirBH3klgUKU39U1Vn7WKWTdTDK3fNnZWvmUU82oEjZ6veuyoeRmjHr
         to6aoYpbGYc+9YYNpC6tQmPkHTQ5kUDGFGf0rmArvyAnATkjh95DlfD8s/gOkMS7uQm+
         XE301COuJ7lWyXViMWHSMsxBqNRUFIfnVeHfCUCmDApw652UbiZvjy9DR65KB7KzColu
         X/Ug==
X-Gm-Message-State: AOJu0YyxWFlxJOeEZxpQxaNsy9sHjMqwIIUNUfbUyCRSkkLhxMK6vaQC
	j8stIZWLoIHttNO9gWLNBOX9l1hY9w25UMGI16spsBJ/mYUhtgedTpZEUX/+RLwVEAGueCDm66j
	j
X-Google-Smtp-Source: AGHT+IFJPuLIBbs8tmthZcf2mEWK0Tf3VPt1gaXAlZbfd7dD3iHlHbB7Z04kR6ovPjIdRiHJTEsBlQ==
X-Received: by 2002:a05:600c:3b85:b0:426:602d:a246 with SMTP id 5b1f17b1804b1-42c8dea66b1mr5528665e9.32.1725368602840;
        Tue, 03 Sep 2024 06:03:22 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 2/7] x86/time: move CMOS edge detection into read helper
Date: Tue,  3 Sep 2024 15:02:58 +0200
Message-ID: <20240903130303.71334-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903130303.71334-1-roger.pau@citrix.com>
References: <20240903130303.71334-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the logic that ensures the CMOS RTC data is read just after it's been
updated into the __get_cmos_time() function that does the register reads.  This
requires returning a boolean from __get_cmos_time() to signal whether the read
has been successfully performed after an update.

The goal, albeit not accomplished by this patch, is to be able to split the
probing and the reading of the CMOS RTC data into two separate functions.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/time.c | 50 +++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index d022db4bd4a0..2a64687bf45b 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1247,8 +1247,26 @@ struct rtc_time {
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
@@ -1268,11 +1286,15 @@ static void __get_cmos_time(struct rtc_time *rtc)
 
     if ( (rtc->year += 1900) < 1970 )
         rtc->year += 100;
+
+    spin_unlock_irqrestore(&rtc_lock, flags);
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
@@ -1293,29 +1315,9 @@ static unsigned long get_cmos_time(void)
 
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


