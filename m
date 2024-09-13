Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2491977A63
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 09:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798036.1208184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp1DA-0004Ar-5v; Fri, 13 Sep 2024 07:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798036.1208184; Fri, 13 Sep 2024 07:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp1DA-00049D-1c; Fri, 13 Sep 2024 07:59:24 +0000
Received: by outflank-mailman (input) for mailman id 798036;
 Fri, 13 Sep 2024 07:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnXM=QL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sp1D8-0003uX-El
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 07:59:22 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14cf82b4-71a6-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 09:59:20 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so5173605e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 00:59:20 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b16bfbfsm14947075e9.22.2024.09.13.00.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 00:59:18 -0700 (PDT)
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
X-Inumbo-ID: 14cf82b4-71a6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726214359; x=1726819159; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJgIdTeGxaw7ZlxEbyNjVU/dqlACBdHjFk91wT/lMP4=;
        b=JGX1pSa8gL8GUiIZ8Ugl45/s/B4RRXBvdzBCbCi2/w4I7cI90UZIKknUICO019NTom
         1tGZknKnek+7q2ltvvo4WweiMKFKPmYqCVKwlM8jhWLUwgvWkfSa3hcSCIx3V3QP9lZE
         I3epSXbeToFFHFDLUcbF6oagyMewZ3ObPN8eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726214359; x=1726819159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJgIdTeGxaw7ZlxEbyNjVU/dqlACBdHjFk91wT/lMP4=;
        b=J6F2BGdkORd0MiE02oMZWC0quwGek4Pz6ZPaSk/lzh9wZLq5SnEom5XSEGETcGiLRk
         E2jFCFmzUght/khkA+jsbuq8sKVlAacVTYf+fp9Hw6fDQhvMlZP9LbqVtxir8YuPz2de
         wAl3PboCc4ZFLyyx+jM3vvHU1cgY2442GwpRn8uxdEnsDbU9IOT/19WwvfheGz+auSUw
         a8/vVEXGRWgkioHM24EBnlEiviIvxiWijwjMGsCAck0XsiulYXA1rXSXqjSKpYbB+YrS
         AyG/WFaqGp+f1q2ELREUOxtLvLUit/cxSfX934tBHM424fCr3gzcm1nilHb1ZlVZJqV+
         0vZQ==
X-Gm-Message-State: AOJu0YwCkiiYYOss0uXP3yNwMt7171ABAnkkqjq6OaVIq8dQWo1j6Fq1
	2xxSnOGjkGiT3VXjIJL94u0p8PYq8kB+88vQWc+5rjdHr3FmnaPCmFTjkK0Knr+G8WE90BETtbP
	A
X-Google-Smtp-Source: AGHT+IEpyjfoR6VNGeeMIaigttSgEqTbHzHjL+L/dZTtd9QUnTteQrtHRhilct47Kt1FsJW1CDYTqw==
X-Received: by 2002:a05:600c:4f51:b0:42c:b6db:4270 with SMTP id 5b1f17b1804b1-42d90722068mr11157785e9.11.1726214358750;
        Fri, 13 Sep 2024 00:59:18 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 1/2] x86/time: introduce command line option to select wallclock
Date: Fri, 13 Sep 2024 09:59:06 +0200
Message-ID: <20240913075907.34460-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913075907.34460-1-roger.pau@citrix.com>
References: <20240913075907.34460-1-roger.pau@citrix.com>
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
Changes since v6:
 - Clarify documentation regarding repeated using of the wallclock command line
   option.

Changes since v5:
 - Do EFI run-time services checking after command line parsing.

Changes since v3:
 - Note xen option is only available if Xen guest support it built.
 - Fix typo.
---
 docs/misc/xen-command-line.pandoc | 21 ++++++++++++++++
 xen/arch/x86/time.c               | 41 ++++++++++++++++++++++++++++++-
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 959cf45b55d9..2a9b3b9b8975 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2816,6 +2816,27 @@ vwfi to `native` reduces irq latency significantly. It can also lead to
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
+If the selected option is invalid or not available Xen will default to `auto`.
+
 ### watchdog (x86)
 > `= force | <boolean>`
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 29b026735e5d..e4751684951e 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1552,6 +1552,37 @@ static const char *__init wallclock_type_to_string(void)
     return "";
 }
 
+static int __init cf_check parse_wallclock(const char *arg)
+{
+    wallclock_source = WALLCLOCK_UNSET;
+
+    if ( !arg )
+        return -EINVAL;
+
+    if ( !strcmp("auto", arg) )
+        ASSERT(wallclock_source == WALLCLOCK_UNSET);
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
@@ -2527,7 +2558,15 @@ int __init init_xen_time(void)
 
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


