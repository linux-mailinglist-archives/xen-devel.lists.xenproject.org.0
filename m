Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E6971D41
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794627.1203644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfnS-0003pC-DU; Mon, 09 Sep 2024 14:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794627.1203644; Mon, 09 Sep 2024 14:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfnS-0003mg-Aj; Mon, 09 Sep 2024 14:55:18 +0000
Received: by outflank-mailman (input) for mailman id 794627;
 Mon, 09 Sep 2024 14:55:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snfnR-0003YR-83
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:55:17 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85e2f69b-6ebb-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 16:55:15 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f75428b9f8so30678911fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 07:55:15 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ceaf4fsm351514766b.152.2024.09.09.07.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 07:55:12 -0700 (PDT)
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
X-Inumbo-ID: 85e2f69b-6ebb-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725893715; x=1726498515; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzgDXYtJg5j6LBhNtCvSNUlOqDJy96VnpmbQz4pdFjA=;
        b=shuZlL53/LsEZNxvdhEBsqLke6gV7/CymcoObyHOFwBWfE2x2P7iRn8pW5HBge8bpb
         0hj2Q26r4sR2C22obBNLAH/3qikD007QyyrO0oqJzDmWLj+cEsua78Yc8gRFBUxxaKaS
         8oVC1rgYD0QewUXWaRZ5GMYh2RGuQ8HWx8TaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725893715; x=1726498515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzgDXYtJg5j6LBhNtCvSNUlOqDJy96VnpmbQz4pdFjA=;
        b=ZwBQtgy3dRdBE4Vj1LVvx+dnjC6uJ/G7wUeTS12qxar0hNVb3HtbAPVKayoAQrOsCq
         4VboIK2vJTDtm5JOkRTOcUn1F9iC7sBPAd2NpAIFdsTVynAcAidjxePTzq0dUrlN8h8/
         UA1cBlMhIxN8WdLSD/231GZfeKyUt0rXyPTLzSfCWJM3jfxBxtf8hHzbZKplnFQbHzX8
         gq9aX+EQ13Up1q33xhbu1Hfn+rBiPnAIE47j5YFQfTkBjd9DFuCvjdtN2YhktQ2jbKXs
         3f/ml5Jq5VIhW/krozQTtfE8yXHNwH11ftgFLFRRUp3C5B+YWMETTXUvthUVQkKPmxs/
         sn+w==
X-Gm-Message-State: AOJu0Yzd+wjZ5ef4m2pvqn2aIWqLhetZBj7gC+zQjo9XxmKDilqe3FDN
	mjIkN6kqFN1e9Z2i7FFoJXFpuNa42wx6ERov62IZdSAN5MZzGtqSRUaVfXQGqGanqQCQZvytp8+
	K
X-Google-Smtp-Source: AGHT+IF3ZkUNy/jr3w/Wt6ZHMU/LIrZM1q0T3siIkFtydQHSCn7lR5EsReWAiwYgwUCtWItn+G5l8Q==
X-Received: by 2002:a2e:741:0:b0:2f6:4d1b:d9d6 with SMTP id 38308e7fff4ca-2f75a99e85dmr57388001fa.25.1725893714054;
        Mon, 09 Sep 2024 07:55:14 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 1/4] x86/time: pull cmos_rtc_probe outside of function and rename
Date: Mon,  9 Sep 2024 16:54:52 +0200
Message-ID: <20240909145455.7517-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909145455.7517-1-roger.pau@citrix.com>
References: <20240909145455.7517-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename cmos_rtc_probe to opt_cmos_rtc_probe in order to better describe it
being a command line option, and rename cmos_probe() function to
cmos_rtc_probe().

Also move opt_cmos_rtc_probe to being a static global variable in preparation
for further changes that will require the variable being global to the file.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - New in this version.
---
 xen/arch/x86/time.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index f37300946e4e..ec48805a2239 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1291,7 +1291,10 @@ static bool __get_cmos_time(struct rtc_time *rtc)
     return t1 <= SECONDS(1) && t2 < MILLISECS(3);
 }
 
-static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
+static bool __read_mostly opt_cmos_rtc_probe;
+boolean_param("cmos-rtc-probe", opt_cmos_rtc_probe);
+
+static bool cmos_rtc_probe(struct rtc_time *rtc_p)
 {
     unsigned int seconds = 60;
 
@@ -1300,7 +1303,7 @@ static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
         bool success = __get_cmos_time(rtc_p);
         struct rtc_time rtc = *rtc_p;
 
-        if ( likely(!cmos_rtc_probe) )
+        if ( likely(!opt_cmos_rtc_probe) )
             return true;
 
         if ( !success ||
@@ -1332,8 +1335,6 @@ static unsigned long get_cmos_time(void)
 {
     unsigned long res;
     struct rtc_time rtc;
-    static bool __read_mostly cmos_rtc_probe;
-    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
 
     if ( efi_enabled(EFI_RS) )
     {
@@ -1343,12 +1344,12 @@ static unsigned long get_cmos_time(void)
     }
 
     if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
-        cmos_rtc_probe = false;
-    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
+        opt_cmos_rtc_probe = false;
+    else if ( system_state < SYS_STATE_smp_boot && !opt_cmos_rtc_probe )
         panic("System with no CMOS RTC advertised must be booted from EFI"
               " (or with command line option \"cmos-rtc-probe\")\n");
 
-    if ( !cmos_probe(&rtc, cmos_rtc_probe) )
+    if ( !cmos_rtc_probe(&rtc) )
         panic("No CMOS RTC found - system must be booted from EFI\n");
 
     return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
-- 
2.46.0


