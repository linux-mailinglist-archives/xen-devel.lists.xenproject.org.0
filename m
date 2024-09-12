Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1EA976742
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 13:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797311.1207238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohnG-0006VG-Im; Thu, 12 Sep 2024 11:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797311.1207238; Thu, 12 Sep 2024 11:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohnG-0006OP-FD; Thu, 12 Sep 2024 11:15:22 +0000
Received: by outflank-mailman (input) for mailman id 797311;
 Thu, 12 Sep 2024 11:15:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sohnF-0006KP-Ec
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 11:15:21 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c284b91-70f8-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 13:15:20 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so108692366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 04:15:20 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72748sm730888566b.117.2024.09.12.04.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 04:15:18 -0700 (PDT)
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
X-Inumbo-ID: 4c284b91-70f8-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726139719; x=1726744519; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIQDU1Hamekzud1T/6MRTc7roHQp5I3um5eAiC+UGfA=;
        b=djeX/zsl34Bf3tkRToihJH7nb/aVtM6lvYJSJeCVE3iZ54l8eOaLXfnOxuIyCqEEqR
         GSwsv3t82r+yoJn3dnt100w0qnJBab5ezbf30eTQYaXZdle84m9iTVOta0+GrNsE/J6B
         i+Vr8/diWEflkG2eBu7jcVxFrvjvDdTiYZeQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726139719; x=1726744519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIQDU1Hamekzud1T/6MRTc7roHQp5I3um5eAiC+UGfA=;
        b=Y33R5JhSxWJVU6lHsmGcIHMRGF3E+FpvoUrBljLVOdTAywL00xq5rYLwHvgF9FVXkQ
         XzaivYo8UU9JaG0yfyvFtri6y7SroPxlzDVGsLfd+LycEZDVY6HUgONzFIMjkvGDbv4j
         1hJv35qybcvZpLsBMvuLuWLQc81/YIijZ9ks/WTeF8GG81XcXiEo1ojcX/GyRuQTZmB4
         1gE7C2rEm02fWS8nhz8iNVvRkjwFcRmi+/E6U4BKaqQBmj67UkNX38oIo06Ek5Tjd05e
         EpIgsR4I8YDTj/K6yVr5tkkwgJTuD/6TtpptitsfVye6MH6ZQlBwEYGWcAFlYPy5bNi2
         Q2+Q==
X-Gm-Message-State: AOJu0YzkIk4uT0v8s2VPZu/nMFORrlHQlP4Tf/zVEKZRiGv5XgSUdzQF
	iRsNmnR7hJb2AbOEvD4E514Dty66DIm+5+NTu0ViDssP5AvPlynnyaLNtuajbz5Gchmx1xyCmmc
	W
X-Google-Smtp-Source: AGHT+IFCSNXfXXjU3pr8LA54EmWvXqjfw4W/A7yLw3mhS3CHwK8how4HhuGgJMeBpljrufjDpcKGvg==
X-Received: by 2002:a17:907:f1a2:b0:a8d:250a:52b2 with SMTP id a640c23a62f3a-a90293c543emr205928266b.6.1726139718950;
        Thu, 12 Sep 2024 04:15:18 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 1/2] x86/time: introduce command line option to select wallclock
Date: Thu, 12 Sep 2024 13:15:13 +0200
Message-ID: <20240912111514.26934-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240912111514.26934-1-roger.pau@citrix.com>
References: <20240912111514.26934-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow setting the used wallclock from the command line.  When the option is set
to a value different than `auto` the probing is bypassed and the selected
implementation is used (as long as it's available).

The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
supported built-in) or from UEFI firmware respectively.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v5:
 - Do EFI run-time services checking after command line parsing.

Changes since v3:
 - Note xen option is only available if Xen guest support it built.
 - Fix typo.
---
 docs/misc/xen-command-line.pandoc | 19 +++++++++++++++
 xen/arch/x86/time.c               | 39 ++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 959cf45b55d9..a4f916d0d33e 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2816,6 +2816,25 @@ vwfi to `native` reduces irq latency significantly. It can also lead to
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
+   guest.  This option is only available if the hypervisor was compiled with
+   `CONFIG_XEN_GUEST` enabled.
+
+ * `cmos` force usage of the CMOS RTC wallclock.
+
+ * `efi` force usage of the EFI_GET_TIME run-time method when booted from EFI
+   firmware.
+
 ### watchdog (x86)
 > `= force | <boolean>`
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 9588502f28e8..b97c81ebd3e9 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1552,6 +1552,35 @@ static const char *__init wallclock_type_to_string(void)
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
+        /*
+         * Checking if run-time services are available must be done after
+         * command line parsing.
+         */
+        wallclock_source = WALLCLOCK_EFI;
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
@@ -2527,7 +2556,15 @@ int __init init_xen_time(void)
 
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
-    probe_wallclock();
+    /*
+     * EFI run time services can be disabled from the command line, hence the
+     * check for them cannot be done as part of the wallclock option parsing.
+     */
+    if ( wallclock_source == WALLCLOCK_EFI && !efi_enabled(EFI_RS) )
+        wallclock_source = WALLCLOCK_UNSET;
+
+    if ( wallclock_source == WALLCLOCK_UNSET )
+        probe_wallclock();
 
     printk(XENLOG_INFO "Wallclock source: %s\n", wallclock_type_to_string());
 
-- 
2.46.0


