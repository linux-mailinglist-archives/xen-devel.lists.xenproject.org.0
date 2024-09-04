Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51B96C287
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 17:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790496.1200311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzM-0004qG-FG; Wed, 04 Sep 2024 15:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790496.1200311; Wed, 04 Sep 2024 15:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzM-0004ms-A7; Wed, 04 Sep 2024 15:32:08 +0000
Received: by outflank-mailman (input) for mailman id 790496;
 Wed, 04 Sep 2024 15:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slrzL-0003Va-Ft
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 15:32:07 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d727354a-6ad2-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 17:32:05 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a869332c2c2so158324966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 08:32:05 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a623a45b0sm5548066b.143.2024.09.04.08.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 08:32:03 -0700 (PDT)
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
X-Inumbo-ID: d727354a-6ad2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725463924; x=1726068724; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wttwru9ZqE1vNc2cTpVoP3TJEtmOujc6puRAfHnBzQg=;
        b=SON+06av0Y+pV3xgXeZt1LHeH0uJbFre9BoYGCikFEpIV1zkDXhKOZwRKBoRmTxwz4
         dvy1674C4Afs+OrI0fnwaAtIHFNZ529i9XwlXW3Ds2bmLgxSFtvzF5y6FcRNoc8LCpmQ
         SrqSLQhtKY4776cVKuY2ica4JBrwpQknlWUog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725463924; x=1726068724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wttwru9ZqE1vNc2cTpVoP3TJEtmOujc6puRAfHnBzQg=;
        b=s6LKgZ28lwBx4zKC+5bUi1Nop4j/OIAc2n15AZCPM3w9Z3TYbP3sX2pIoq30C1qYFk
         Iwi/yc6797bDBAvbSG3CRYNhywS34Nqpxwu5W/3BnKcSmsV19nmrLnZeinb4dSBHjzu+
         XsuXp89NzSLCcmybp0zQGCCwjDHlRxYhIcH+4wgPbFA3Dmv+4pTbMc9J+s1VZC9HZmIn
         UM4MTwzGJIoY0DLypwUQsJgGGsUvs6uxkuhfz43P4Anjj2opkxfhDiUWrr1/xNlYIG/J
         NMdE/B4uz0f085t6juzxYLAn5e7p3q+Cl/2O79VbL5aG6lVjLE4bisak7zWXIw1RTJ4u
         6qnQ==
X-Gm-Message-State: AOJu0Yx8jv/cz6usBSLtTyvaO9sQ2fTvn5LxkbDLBP2odK7WbvwmmC02
	1IJl+FPVcNIND1CiAB4sx8gwxb4hTh26w1zgs7+FNskxicWz4Y1QV/USGh6oWV/YsM/B9KJkwmN
	i
X-Google-Smtp-Source: AGHT+IFBzXdkAuKaYu8oiD2UdSN5m8OT1z+hLba5AKJcLQo1M7yXW9aHY2tJl8+iVLfn1VeR7WUnCg==
X-Received: by 2002:a17:907:7f14:b0:a7a:8284:c8d6 with SMTP id a640c23a62f3a-a8a43140f0emr268958966b.24.1725463924379;
        Wed, 04 Sep 2024 08:32:04 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 5/6] x86/time: introduce command line option to select wallclock
Date: Wed,  4 Sep 2024 17:31:50 +0200
Message-ID: <20240904153151.83995-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904153151.83995-1-roger.pau@citrix.com>
References: <20240904153151.83995-1-roger.pau@citrix.com>
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
Changes since v3:
 - Note xen option is only available if Xen guest support it built.
 - Fix typo.
---
 docs/misc/xen-command-line.pandoc | 19 ++++++++++++++++++
 xen/arch/x86/time.c               | 33 ++++++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 0a66e1ee2d7e..1944b9d8eb9d 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2821,6 +2821,25 @@ vwfi to `native` reduces irq latency significantly. It can also lead to
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
index 9ebeee61b987..52944b8fbfde 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1553,6 +1553,36 @@ static const char *__init wallclock_type_to_string(void)
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
@@ -2528,7 +2558,8 @@ int __init init_xen_time(void)
 
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
-    probe_wallclock();
+    if ( wallclock_source == WALLCLOCK_UNSET )
+        probe_wallclock();
 
     printk(XENLOG_INFO "Wallclock source: %s\n", wallclock_type_to_string());
 
-- 
2.46.0


