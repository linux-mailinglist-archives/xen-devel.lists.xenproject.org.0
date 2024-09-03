Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7439D969EA1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789154.1198730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTC2-0000Pm-8U; Tue, 03 Sep 2024 13:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789154.1198730; Tue, 03 Sep 2024 13:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTC2-0000Mj-3B; Tue, 03 Sep 2024 13:03:34 +0000
Received: by outflank-mailman (input) for mailman id 789154;
 Tue, 03 Sep 2024 13:03:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slTC0-0006aM-6o
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:03:32 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eac49aed-69f4-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 15:03:30 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-374c3400367so2022676f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:03:30 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c88c624f7sm29018635e9.39.2024.09.03.06.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 06:03:28 -0700 (PDT)
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
X-Inumbo-ID: eac49aed-69f4-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725368609; x=1725973409; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlZbFmrpXgN45+AwQZrxSvY5k9Jof+k8TfRDS2/g8Jk=;
        b=YZdDFskrdpci6NJY8E+zzQBhJxRogIg1egGtmtrHCSQk1mnSaHfq4GOp3kJuqA9VNT
         NoZESqRwZpX264TkXc6iSY0BsE9pktilj/BGr1hFed1I80U5bkXJma00eZ4n3HD5zl5z
         9PFJTEFZgGoGuc3SL+7IvLL9W8zw36149RQW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368609; x=1725973409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlZbFmrpXgN45+AwQZrxSvY5k9Jof+k8TfRDS2/g8Jk=;
        b=ETBSf9BQDv5OREtJbkphWCpYfhH/Dm/8nyxryrq+5pw/SjyXzARTahOw9IpohlraL/
         ylJdG0u/Q3t8uH4AIaZTaVlvFQqqFXlvuQD02gQtvnhNG6GfdFupi6dSMHaDqxrf/a6l
         T9waZsQMdP5wTxRUCFCJpluApngSaupHYL6sJ5qTlT+dEXHpbzFq05PFzBWD5cLN/bR/
         F9hFiu9rGFE8OsWiydzu1MNjqdQsq1GkqtJ7g0iXuJJfdxuX7e+cNwqfTPnZfK443mBb
         OaVOHN2vuIBq3t6MDtt4pAQQ6VRrWhSj4TZutyY6BnlKPHFLx/vbMhT7+M+ohzaqPg38
         oyaA==
X-Gm-Message-State: AOJu0YyoflWBHNqC9Qc+QO/L4UJfXYP/OtJEIC4ZbR6TGI8Z9UAa6Lgq
	wQoyLykkO5P0b0HvcYIa61lNDBGf0Gp+lw9tg4BdmaYxGAO9QoBb7PTZdTKqRdxtC4My/Qf58C1
	S
X-Google-Smtp-Source: AGHT+IE8qegNxXDlJK1PFWwHLcnJqhDb4R6QI089xcWKPngT9LyUKz+TVPUn4HkmSxtmlDjANTWxQA==
X-Received: by 2002:a5d:64e4:0:b0:374:c3e4:d6b1 with SMTP id ffacd0b85a97d-374c3e4d794mr8638205f8f.44.1725368609090;
        Tue, 03 Sep 2024 06:03:29 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 6/7] x86/time: introduce command line option to select wallclock
Date: Tue,  3 Sep 2024 15:03:02 +0200
Message-ID: <20240903130303.71334-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903130303.71334-1-roger.pau@citrix.com>
References: <20240903130303.71334-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow setting the used wallclock from the command line.  When the option is set
to a value different than `auto` the probing is bypassed and the selected
implementation is used (as long as it's available).

The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
supported built-in) or from UEFI firmware.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc | 18 +++++++++++++++++
 xen/arch/x86/time.c               | 33 ++++++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 0a66e1ee2d7e..23de922b9705 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2821,6 +2821,24 @@ vwfi to `native` reduces irq latency significantly. It can also lead to
 suboptimal scheduling decisions, but only when the system is
 oversubscribed (i.e., in total there are more vCPUs than pCPUs).
 
+### wallclock (x86)
+> `= auto | xen | cmos | efi`
+
+> Default: `auto`
+
+Allow forcing the usage of a specific wallclock source.
+
+ * `auto` let the hypervisor select the clocksource based on internal
+   heuristics.
+
+ * `xen` force usage of the Xen shared_info wallclock when booted as a Xen
+   guest.
+
+ * `cmos` force usage of the CMOS RTC wallclock.
+
+ * `efi` force usage of the EFI_GFET_TIME run-time method when booted from EFI
+   firmware.
+
 ### watchdog (x86)
 > `= force | <boolean>`
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index da3fd1555041..6e19c666d13f 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1555,6 +1555,36 @@ static const char *wallclock_type_to_string(void)
     return "";
 }
 
+static int __init cf_check parse_wallclock(const char *arg)
+{
+    if ( !arg )
+        return -EINVAL;
+
+    if ( !strcmp("auto", arg) )
+        wallclock_source = WALLCLOCK_UNSET;
+    else if ( !strcmp("xen", arg) )
+    {
+        if ( !xen_guest )
+            return -EINVAL;
+
+        wallclock_source = WALLCLOCK_XEN;
+    }
+    else if ( !strcmp("cmos", arg) )
+        wallclock_source = WALLCLOCK_CMOS;
+    else if ( !strcmp("efi", arg) )
+    {
+        if ( !efi_enabled(EFI_RS) )
+            return -EINVAL;
+
+        wallclock_source = WALLCLOCK_EFI;
+    }
+    else
+        return -EINVAL;
+
+    return 0;
+}
+custom_param("wallclock", parse_wallclock);
+
 static void __init probe_wallclock(void)
 {
     ASSERT(wallclock_source == WALLCLOCK_UNSET);
@@ -2527,7 +2557,8 @@ int __init init_xen_time(void)
 
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
-    probe_wallclock();
+    if ( wallclock_source == WALLCLOCK_UNSET )
+        probe_wallclock();
 
     printk(XENLOG_INFO "Wallclock source: %s\n", wallclock_type_to_string());
 
-- 
2.46.0


