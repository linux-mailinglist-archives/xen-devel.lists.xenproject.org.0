Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962A969E9B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789148.1198670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBt-0007BZ-C3; Tue, 03 Sep 2024 13:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789148.1198670; Tue, 03 Sep 2024 13:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBt-00078g-9A; Tue, 03 Sep 2024 13:03:25 +0000
Received: by outflank-mailman (input) for mailman id 789148;
 Tue, 03 Sep 2024 13:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slTBr-00075o-Pl
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:03:23 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e675c1b3-69f4-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 15:03:23 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-428e0d18666so45261285e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:03:23 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b5e3511dsm11383308f8f.34.2024.09.03.06.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 06:03:21 -0700 (PDT)
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
X-Inumbo-ID: e675c1b3-69f4-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725368602; x=1725973402; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+l129vex/BaLP7ihPKH7R+U8k/cBkm9MNqwH4jVc1hI=;
        b=T6Y3osc2uKSRQuoyr8QWoQ9XLgOaiAo/HXVq3xAPLKYJtIpZjUdraqZiArdT0iaz8s
         +ZSu1UsGFuXcASaNq2b7Omv+2adlZRK7542c5L8Iz4LJwb9R73zfFMzlCJw39+PKbqTK
         5mebOEFsiD85f6cIYfSzaHlnzwTzyc5W3oRRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368602; x=1725973402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+l129vex/BaLP7ihPKH7R+U8k/cBkm9MNqwH4jVc1hI=;
        b=Ex1FZwpUnwTV5XW4tbV+ryMk3TV2lhp9buNe71lontd4CfNMMXDYC33fpUGPLbyuji
         x2TkFW03H0Pb5YhU1zEN305LWzwa7ImZ7MACFng7Sg1K2AVRcS13vuhRV6H844tKlF+8
         NocEnAgQMKgS63pCHiol6LZxYr0Q4DStXKNwvPYp5lXqnq6k3WFJk35rUBlZmnMEPaPH
         04emrgUoIRzRTioq5sHgB5ujIbe2lcs+szoZo4HzhJBONIXZeEwFiJKTxafzTz+qHSye
         2OXfouLwz9JG4I5JoTxRoz97Y/kAV3/ba05faIeSD/S3EFDVotdyfxDHXu7LQDOl8Xxd
         HKVA==
X-Gm-Message-State: AOJu0YyZ4h5RiTB3sLVEgw7ilWlUk2jWW8e0l7JJ0zgf2YTT/3APEcdD
	iIzAs5VHp9x0poNVAZ51yMU9+iNa53OR6ufyqIa2BTEuqCqNbuFm0mqx0A3J8Y/PITDcwedG/0L
	+
X-Google-Smtp-Source: AGHT+IHOPMOd/5hxX84fic4x8CaLUZeeOLLppf+Dl+wGsK+bwntuCuCachvZsnvrLeMKtv36Hf0XyA==
X-Received: by 2002:adf:e94a:0:b0:374:c90c:226 with SMTP id ffacd0b85a97d-374c90c0298mr5429728f8f.9.1725368601710;
        Tue, 03 Sep 2024 06:03:21 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 1/7] x86/time: introduce helper to fetch Xen wallclock when running as a guest
Date: Tue,  3 Sep 2024 15:02:57 +0200
Message-ID: <20240903130303.71334-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903130303.71334-1-roger.pau@citrix.com>
References: <20240903130303.71334-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the current code in get_wallclock_time() to fetch the Xen wallclock
information from the shared page when running as a guest into a separate
helper.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/time.c | 43 ++++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index a97d78484105..d022db4bd4a0 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -785,6 +785,31 @@ static struct platform_timesource __initdata_cf_clobber plt_xen_timer =
     .resume = resume_xen_timer,
     .counter_bits = 63,
 };
+
+static unsigned long read_xen_wallclock(void)
+{
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
+}
+#else
+static unsigned long read_xen_wallclock(void)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
 #endif
 
 #ifdef CONFIG_HYPERV_GUEST
@@ -1497,24 +1522,8 @@ void rtc_guest_write(unsigned int port, unsigned int data)
 
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


