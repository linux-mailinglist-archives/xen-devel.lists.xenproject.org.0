Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C9B969EA0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789155.1198735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTC2-0000Vy-Nh; Tue, 03 Sep 2024 13:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789155.1198735; Tue, 03 Sep 2024 13:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTC2-0000PX-Fh; Tue, 03 Sep 2024 13:03:34 +0000
Received: by outflank-mailman (input) for mailman id 789155;
 Tue, 03 Sep 2024 13:03:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slTC0-00075o-KU
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:03:32 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb9c1a24-69f4-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 15:03:31 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42bbbff40bbso35490575e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:03:31 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c90c6c06sm6450395f8f.84.2024.09.03.06.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 06:03:29 -0700 (PDT)
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
X-Inumbo-ID: eb9c1a24-69f4-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725368611; x=1725973411; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1JudryMrIq+tOf/N0m9wlfd8xvBvSyUHDLaba1S/18=;
        b=jvjEpyQ3vLauobmFJuB+DQ6NSq92bjPMOvzNcHlfa0nt6lgiJ/q+42MXNRCXt5hZGX
         QOVGpT2YWxFByxs/ywomlblD3Tw0bG+Eyg48Dw3W8H0ti3EJepSSyrdaof41K3CwoqPG
         8GQDQpAKrgHN60XV0LzNawfqjJ6yOPltQnw7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368611; x=1725973411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1JudryMrIq+tOf/N0m9wlfd8xvBvSyUHDLaba1S/18=;
        b=iJgQrD6nPSSguOuKvk/1AZgzO9U0D7k8DRdUg0D4ldXaMWISI+eBu8M7oDJTmEJMGi
         fHjmw1mGdB2gspHZG15STKjqexb45ctRod91kbhA2817GsGc1WUCg3sVzXR3yIUDgfkM
         VVuqpExKR8Zi/f9PsQlZA2M3PVmNhdISTXf0iwu+th5+7BY+nuCQmH/z1UTKHFKC7cud
         5RPoJWgLnn4eVNf2yZuGINjE2RRwTByxkeBAaURVqOqTHt3++WMY4hHo0UvRXaMC7VWK
         02iJnIIZK9ExQpScElXiGVrD7keoH0eflYARScWuXzJo/3sTDb1f8JhgbfwkhSgUV0C2
         3H9w==
X-Gm-Message-State: AOJu0YyXO8caKuFtAqTggE6hBR7h9rodSI/yodP3Az9BXZW0PGeXV9Zm
	KzxZgLXuHOLULYZfzlbX2xp0vKT6xlg+ixdHQ/o8ffQkuq5/Ueo7hJi6zxgSbARZGsX30IwebDn
	5
X-Google-Smtp-Source: AGHT+IH7I2bKXiaNswiZ7b1msSyL3gc2WaSwaOBkVhc0qiu5vT6iJ4YIoeTIGXn8Gs38oih2orxHKg==
X-Received: by 2002:a05:600c:997:b0:42b:ac3f:f5c with SMTP id 5b1f17b1804b1-42bbb436de5mr84973365e9.26.1725368610668;
        Tue, 03 Sep 2024 06:03:30 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 7/7] x86/time: probe the CMOS RTC by default
Date: Tue,  3 Sep 2024 15:03:03 +0200
Message-ID: <20240903130303.71334-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903130303.71334-1-roger.pau@citrix.com>
References: <20240903130303.71334-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Probing for the CMOS RTC registers consist in reading IO ports, and we expect
those reads to have no side effects even when the CMOS RTC is not present.  Xen
already does a similar probing (reading of IO ports) by default when searching
for possible CMOS aliased locations.

Switch the default to probe for the CMOS RTC by default when ACPI FADT contains
the ACPI_FADT_NO_CMOS_RTC flag.  At the same time introduce a new option that
can be used to turn off the probing: `wallclock=no-cmos-probe`.  Deprecate the
previous `cmos-rtc-probe` option.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 docs/misc/xen-command-line.pandoc | 12 ++++++++++--
 xen/arch/x86/time.c               |  9 ++++++---
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 23de922b9705..0d603b9521ae 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -326,11 +326,14 @@ Interrupts.  Specifying zero disables CMCI handling.
 ### cmos-rtc-probe (x86)
 > `= <boolean>`
 
-> Default: `false`
+> Default: `true`
 
 Flag to indicate whether to probe for a CMOS Real Time Clock irrespective of
 ACPI indicating none to be there.
 
+**WARNING: The `cmos-rtc-probe` option is deprecated and superseded by
+_wallclock=no-cmos-probe_ using both options in combination is undefined.**
+
 ### com1 (x86)
 ### com2 (x86)
 > `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<port-bdf>][,[<bridge-bdf>]]]]]]`
@@ -2822,7 +2825,7 @@ suboptimal scheduling decisions, but only when the system is
 oversubscribed (i.e., in total there are more vCPUs than pCPUs).
 
 ### wallclock (x86)
-> `= auto | xen | cmos | efi`
+> `= auto | xen | cmos | no-cmos-probe | efi`
 
 > Default: `auto`
 
@@ -2836,6 +2839,11 @@ Allow forcing the usage of a specific wallclock source.
 
  * `cmos` force usage of the CMOS RTC wallclock.
 
+ * `no-cmos-probe` do not probe for the CMOS RTC presence if the ACPI FADT
+   table signals there's no CMOS RTC.  Implies using the same heuristics as
+   the `auto` option.  By default Xen will probe for the CMOS RTC presence
+   even when ACPI FADT signals no CMOS RTC available.
+
  * `efi` force usage of the EFI_GFET_TIME run-time method when booted from EFI
    firmware.
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 6e19c666d13f..8e6ecbe5e964 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1292,7 +1292,7 @@ static bool __get_cmos_time(struct rtc_time *rtc)
     return t1 <= SECONDS(1) && t2 < MILLISECS(3);
 }
 
-static bool __initdata cmos_rtc_probe;
+static bool __initdata cmos_rtc_probe = true;
 boolean_param("cmos-rtc-probe", cmos_rtc_probe);
 
 static bool __init cmos_probe(void)
@@ -1560,6 +1560,8 @@ static int __init cf_check parse_wallclock(const char *arg)
     if ( !arg )
         return -EINVAL;
 
+    cmos_rtc_probe = true;
+
     if ( !strcmp("auto", arg) )
         wallclock_source = WALLCLOCK_UNSET;
     else if ( !strcmp("xen", arg) )
@@ -1571,6 +1573,8 @@ static int __init cf_check parse_wallclock(const char *arg)
     }
     else if ( !strcmp("cmos", arg) )
         wallclock_source = WALLCLOCK_CMOS;
+    else if ( !strcmp("no-cmos-probe", arg) )
+        cmos_rtc_probe = false;
     else if ( !strcmp("efi", arg) )
     {
         if ( !efi_enabled(EFI_RS) )
@@ -1609,8 +1613,7 @@ static void __init probe_wallclock(void)
           !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
           cmos_rtc_probe ? " CMOS" : "",
           efi_enabled(EFI_RS) ? " EFI" : "",
-          !cmos_rtc_probe ? "Try with command line option \"cmos-rtc-probe\"\n"
-           : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n" : "");
+          !efi_enabled(EFI_RS) ? "System must be booted from EFI\n" : "");
 }
 
 static unsigned long get_wallclock_time(void)
-- 
2.46.0


