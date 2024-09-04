Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C23196C284
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 17:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790491.1200266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzH-0003ln-PX; Wed, 04 Sep 2024 15:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790491.1200266; Wed, 04 Sep 2024 15:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzH-0003kD-LU; Wed, 04 Sep 2024 15:32:03 +0000
Received: by outflank-mailman (input) for mailman id 790491;
 Wed, 04 Sep 2024 15:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slrzF-0003Vv-SL
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 15:32:01 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3e75446-6ad2-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 17:32:00 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a869f6ce2b9so733137566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 08:32:00 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236cfb4sm5500966b.100.2024.09.04.08.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 08:31:58 -0700 (PDT)
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
X-Inumbo-ID: d3e75446-6ad2-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725463919; x=1726068719; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uSQihnqXCf2hMyHenOR5h3swtTmtaH+EXsprydBl94=;
        b=qLcwj5qWBqiyRy6vRlWKzzJLFUIJpICHYXRKOiT75M259/YlyX2aERKvnUuhAIHo+E
         Tj98jJ9vvbraWZ/AvCcYFCKg6g0QoqPPjSZC+/PNeFjpH6ia9syOig8Q40bGKM1u9Q8S
         ZpMzH+4G5FKdPN+WGhyv6oBfhcrDsivt/FkeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725463919; x=1726068719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uSQihnqXCf2hMyHenOR5h3swtTmtaH+EXsprydBl94=;
        b=K12M5pWp8miV3zL9b8VInSv1LzVlmKlmfPJ3gsz7QBf/ygeW06mkya9mra5GIZ7g1w
         R9nBedODf27uhqxKvriMmwDPvsOSIH3bxqwP7pIsIdH+EssWEeidMMGn3LHEwJp5ZUA9
         65Fjh+fA/5p8S4skW+Ex/WbAlU2ovfrhH5uy3jBPckUR62Yg8bmvWfFPm8HSgdOZ4QWH
         ovjW7bSJOqV7m5PAjHYFidsGM7N3DsfX74QWTqXlbzQqo/kUzJjHVTBhgpEOrXZzSp8E
         DEpM9ElHQeqHh7rXnS64kQ3PZSbc4cgVwObqYqKFHo6MG2VAKMNO3uA+tgmZeVcEKHQu
         U6/w==
X-Gm-Message-State: AOJu0YwUE9Do4ha1K14U+UhsY+fiLNJpy51tI8YnqljPE/FfjOEdRU5J
	iwzUgBMLINrciccGPe6eyT2lmqrBYQiTOEaz3b172MhuBX7jQphsmC2pyvgAO8rqpZGsbDU9IJd
	d
X-Google-Smtp-Source: AGHT+IHfzxlFNr7URNfg+tTFdYyvwqEKKJAiB7ZDtpDrq5OI9vbmMwcP4p+qHmEqgXi1l3nRowguDA==
X-Received: by 2002:a17:907:3f09:b0:a86:8e3d:86e2 with SMTP id a640c23a62f3a-a8a32df30c3mr384486466b.11.1725463918850;
        Wed, 04 Sep 2024 08:31:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 1/6] x86/time: introduce helper to fetch Xen wallclock when running as a guest
Date: Wed,  4 Sep 2024 17:31:46 +0200
Message-ID: <20240904153151.83995-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904153151.83995-1-roger.pau@citrix.com>
References: <20240904153151.83995-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the current code in get_wallclock_time() to fetch the Xen wallclock
information from the shared page when running as a guest into a separate
helper.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Place ifdef blocks inside the function.

Changes since v2:
 - New in this version.
---
 xen/arch/x86/time.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index a97d78484105..1959cc4a4f2b 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -787,6 +787,30 @@ static struct platform_timesource __initdata_cf_clobber plt_xen_timer =
 };
 #endif
 
+static unsigned long read_xen_wallclock(void)
+{
+#ifdef CONFIG_XEN_GUEST
+    struct shared_info *sh_info = XEN_shared_info;
+    uint32_t wc_version;
+    uint64_t wc_sec;
+
+    ASSERT(xen_guest);
+
+    do {
+        wc_version = sh_info->wc_version & ~1;
+        smp_rmb();
+
+        wc_sec  = sh_info->wc_sec;
+        smp_rmb();
+    } while ( wc_version != sh_info->wc_version );
+
+    return wc_sec + read_xen_timer() / 1000000000;
+#else
+    ASSERT_UNREACHABLE();
+    return 0;
+#endif
+}
+
 #ifdef CONFIG_HYPERV_GUEST
 /************************************************************
  * HYPER-V REFERENCE TSC
@@ -1497,24 +1521,8 @@ void rtc_guest_write(unsigned int port, unsigned int data)
 
 static unsigned long get_wallclock_time(void)
 {
-#ifdef CONFIG_XEN_GUEST
     if ( xen_guest )
-    {
-        struct shared_info *sh_info = XEN_shared_info;
-        uint32_t wc_version;
-        uint64_t wc_sec;
-
-        do {
-            wc_version = sh_info->wc_version & ~1;
-            smp_rmb();
-
-            wc_sec  = sh_info->wc_sec;
-            smp_rmb();
-        } while ( wc_version != sh_info->wc_version );
-
-        return wc_sec + read_xen_timer() / 1000000000;
-    }
-#endif
+        return read_xen_wallclock();
 
     return get_cmos_time();
 }
-- 
2.46.0


