Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB6A965D72
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786340.1195954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyJI-0002RP-7u; Fri, 30 Aug 2024 09:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786340.1195954; Fri, 30 Aug 2024 09:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyJI-0002PL-58; Fri, 30 Aug 2024 09:52:52 +0000
Received: by outflank-mailman (input) for mailman id 786340;
 Fri, 30 Aug 2024 09:52:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDj5=P5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjyJG-0001wc-KF
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:52:50 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e038f21-66b5-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 11:52:49 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a86c476f679so197235666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 02:52:50 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891db563sm194655566b.185.2024.08.30.02.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 02:52:47 -0700 (PDT)
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
X-Inumbo-ID: 9e038f21-66b5-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725011569; x=1725616369; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hgy6KsLd6IVjOwpOTywTcBhClUvG6CNwo7fjv2Ub9pE=;
        b=CISCvTTikoh72V5M1EcMolC5AWIP9DqPjY8cnPV/2gGIe7/bKXPEVTbyZBW90i8/m6
         QYOkJ6YVvVPOAi5AaQ4oHN8P1pdk6uUarvnBVkq5a9gSa3fT65Ee/pSf13/KnxXERR/O
         8Lrq20/E5CaCVJaFxOB2xJpHh/QWxky2UcqcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725011569; x=1725616369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hgy6KsLd6IVjOwpOTywTcBhClUvG6CNwo7fjv2Ub9pE=;
        b=eR3L7Di/v3wJA/CVrJFZf/IWkzordalNSbbUHaQWKxeVbSt+LddALuutT8TlxfqCIT
         88Ap0SmitoYXc0ucjUyaer59PpdLb27OKJfxZzk/3+QUdx79nQ27E5GA7NKpiHQS0azu
         l9iUayvy9sKCgbrvT6INF3lUZcJQDiPcJmpfwfdeemAiWNcHa5YBL/d3T3x5WFRgZNI9
         2xsev6Gv0W/scFyxnqHtlRqmOc74bLIKb6RV9lrv6gc7unqmlIahAkgJUZQmI+R1yrVs
         qN0A0EeQRKMRHWleEYdp5R+RkPwwJv33O2jOInPpcaTA9LRgXvC+e01avA86FQTyawzl
         x4Vg==
X-Gm-Message-State: AOJu0YzXHE2MMV6Eei6U6NCpaCDVrJmu5NV9oakvPdvUNkjKot/eeQI5
	A9oLJxPIkeDTrVARrWbIZG/eBKnduOQYCM8GRpwh/bbq0mlFSfmibjfJwgSAoJdwaTWeB7cklE7
	r
X-Google-Smtp-Source: AGHT+IFxGczVF6OVtd6iF412SmeyKSsOp7M6/YaF4GjHiZ2HTlFEHYZsy4UU3cUI+jq5qcQVC4tb1w==
X-Received: by 2002:a17:907:94cb:b0:a86:8d83:542d with SMTP id a640c23a62f3a-a897fa751f3mr483777566b.45.1725011568064;
        Fri, 30 Aug 2024 02:52:48 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/2] x86/time: prefer CMOS over EFI_GET_TIME
Date: Fri, 30 Aug 2024 11:52:20 +0200
Message-ID: <20240830095220.49473-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830095220.49473-1-roger.pau@citrix.com>
References: <20240830095220.49473-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The EFI_GET_TIME implementation is well known to be broken for many firmware
implementations, for Xen the result on such implementations are:

----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
CPU:    0
RIP:    e008:[<0000000062ccfa70>] 0000000062ccfa70
[...]
Xen call trace:
   [<0000000062ccfa70>] R 0000000062ccfa70
   [<00000000732e9a3f>] S 00000000732e9a3f
   [<ffff82d04034f34f>] F arch/x86/time.c#get_cmos_time+0x1b3/0x26e
   [<ffff82d04045926f>] F init_xen_time+0x28/0xa4
   [<ffff82d040454bc4>] F __start_xen+0x1ee7/0x2578
   [<ffff82d040203334>] F __high_start+0x94/0xa0

Pagetable walk from 0000000062ccfa70:
 L4[0x000] = 000000207ef1c063 ffffffffffffffff
 L3[0x001] = 000000005d6c0063 ffffffffffffffff
 L2[0x116] = 8000000062c001e3 ffffffffffffffff (PSE)

****************************************
Panic on CPU 0:
FATAL PAGE FAULT
[error_code=0011]
Faulting linear address: 0000000062ccfa70
****************************************

Swap the preference to default to CMOS first, and EFI later, in an attempt to
use EFI_GET_TIME as a last resort option only.  Note that Linux for example
doesn't allow calling the get_time method, and instead provides a dummy handler
that unconditionally returns EFI_UNSUPPORTED on x86-64.

Such change in the preferences requires some re-arranging of the function
logic, so that panic messages with workaround suggestions are suitably printed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/time.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 272ca2468ea6..0eee954809a9 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1305,24 +1305,36 @@ static unsigned long get_cmos_time(void)
     static bool __read_mostly cmos_rtc_probe;
     boolean_param("cmos-rtc-probe", cmos_rtc_probe);
 
+    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
+        cmos_rtc_probe = false;
+
+    if ( (!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) ||
+          cmos_rtc_probe) && read_cmos_time(&rtc, cmos_rtc_probe) )
+        return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
+
     if ( efi_enabled(EFI_RS) )
     {
         unsigned long res = efi_get_time();
 
         if ( res )
             return res;
+
+        panic("Broken EFI_GET_TIME %s\n",
+              !cmos_rtc_probe ? "try booting with \"cmos-rtc-probe\" option"
+                              : "and no CMOS RTC found");
     }
 
-    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
-        cmos_rtc_probe = false;
-    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
+    /*
+     * No viable clock source found.  Attempt to provide some guidance to the
+     * user about possible workarounds to boot Xen on the system.
+     */
+    ASSERT(system_state < SYS_STATE_smp_boot);
+
+    if ( !cmos_rtc_probe )
         panic("System with no CMOS RTC advertised must be booted from EFI"
               " (or with command line option \"cmos-rtc-probe\")\n");
 
-    if ( unlikely(!read_cmos_time(&rtc, cmos_rtc_probe)) )
-        panic("No CMOS RTC found - system must be booted from EFI\n");
-
-    return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
+    panic("No CMOS RTC found - system must be booted from EFI\n");
 }
 
 static unsigned int __ro_after_init cmos_alias_mask;
-- 
2.46.0


