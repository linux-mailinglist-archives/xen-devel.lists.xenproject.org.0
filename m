Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60368971D3D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794629.1203660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfnU-00049I-0j; Mon, 09 Sep 2024 14:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794629.1203660; Mon, 09 Sep 2024 14:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfnT-00042I-QE; Mon, 09 Sep 2024 14:55:19 +0000
Received: by outflank-mailman (input) for mailman id 794629;
 Mon, 09 Sep 2024 14:55:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snfnS-0003mf-FN
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:55:18 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86cede3d-6ebb-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 16:55:17 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so275465266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 07:55:17 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d258317d6sm350985666b.29.2024.09.09.07.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 07:55:16 -0700 (PDT)
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
X-Inumbo-ID: 86cede3d-6ebb-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725893716; x=1726498516; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTxNeOtTpgpkcU1eMs+pBEYVIkJMsd43OtRijP17qwg=;
        b=dSYvkJm6zRMjNqJgwB6JGv57pxeKHRQtKoBIE+19EbggmSh9axcJwval6X0w9cEp+l
         WDO5j5GvYY4Tch9To2iOUtgYXstI++pC2NmN7XabWpo/qKuvKZFwoner55e1otvokVD0
         Ag6m6e2k0Twb6R1s6hEKy6zoDbTu0wnLO5DAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725893716; x=1726498516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTxNeOtTpgpkcU1eMs+pBEYVIkJMsd43OtRijP17qwg=;
        b=msAntqXYZTKkusmDBDbrve84nMY2vS0pUZ6QuqeR6aaBNwy2OcqZgNknY+xbj+gSnZ
         1LpxfbLICiy+S62hCTVki/MrKAmnItI7p5//rjD5vh40IEuksOcR66T2aryN4IH7tZUi
         oSamH2ehlgbPHbwJR+Z8TmUOt/Rp9A8cpvh8hpXmrgrqEsEcS6lHvT+6GoeLUEQQ9Ngc
         ztK+uvRO3RnOgcrsiNjHFLty6OkrIYIesCqkf1H8hn6I80pCkNOusgtnhZZ3I0PM70A8
         MByVlNjJrNEKjXmFyZp12IB99B+XPqvglpV+UrrPSr3xWrjR8ZfkYndC/nhBBtr249tW
         pXbg==
X-Gm-Message-State: AOJu0YwC7HbTcBpY8Jl7ZNqX7GcB1j67qietgThWt8HOpzNPDjaDD3my
	naUmE8N+UbECONWi28/CQm6pJaH/2Gq9vtXHjX2pxMIL/t/sszoc12GqljY6MhvLG0FmhsiuHpC
	k
X-Google-Smtp-Source: AGHT+IH6ud8BIVnvDcDx9sWO4zrhdmH/lNaVH8QzbGkj1oQf/a1nXTSSso+xFdynUxxPOtcQNvvZqA==
X-Received: by 2002:a17:907:9627:b0:a77:cf9d:f495 with SMTP id a640c23a62f3a-a8d1c4d78f0mr792458466b.40.1725893716375;
        Mon, 09 Sep 2024 07:55:16 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 3/4] x86/time: introduce command line option to select wallclock
Date: Mon,  9 Sep 2024 16:54:54 +0200
Message-ID: <20240909145455.7517-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909145455.7517-1-roger.pau@citrix.com>
References: <20240909145455.7517-1-roger.pau@citrix.com>
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
index 1dcbd9f520f5..c6d3f19a56d1 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1550,6 +1550,36 @@ static const char *__init wallclock_type_to_string(void)
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
@@ -2525,7 +2555,8 @@ int __init init_xen_time(void)
 
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
-    probe_wallclock();
+    if ( wallclock_source == WALLCLOCK_UNSET )
+        probe_wallclock();
 
     printk(XENLOG_INFO "Wallclock source: %s\n", wallclock_type_to_string());
 
-- 
2.46.0


