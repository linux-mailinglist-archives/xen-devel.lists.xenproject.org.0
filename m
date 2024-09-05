Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029FE96D9D4
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 15:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791093.1200877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smCCZ-0002Pv-4P; Thu, 05 Sep 2024 13:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791093.1200877; Thu, 05 Sep 2024 13:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smCCZ-0002Mx-19; Thu, 05 Sep 2024 13:07:07 +0000
Received: by outflank-mailman (input) for mailman id 791093;
 Thu, 05 Sep 2024 13:07:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smCCY-00025l-5o
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 13:07:06 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfda207d-6b87-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 15:07:05 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a868d7f92feso113442566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 06:07:05 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a61fbb093sm136972766b.11.2024.09.05.06.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 06:07:02 -0700 (PDT)
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
X-Inumbo-ID: bfda207d-6b87-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725541624; x=1726146424; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRQ/Y9M/lKY6HdyDs0B8hohBH4bNX10dLhD71BnUZXc=;
        b=XVfarC+nF9abG/LydPpQOGTF6VYJQ9woso9JGR8FLdqN9dajCf8kXEknwI2L736eZr
         9RiB7eQXuG6rj1F++iIR2lyPHAPgCEb9zCmLm+xIHXYGJxG/oRk+Cq0AjoHNB6GKtMVJ
         TGGnqHMsUQ5Pz5eAzMLz9FcSPM6+5lLp/bLWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541624; x=1726146424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRQ/Y9M/lKY6HdyDs0B8hohBH4bNX10dLhD71BnUZXc=;
        b=f1aYzbTw3dmqgA0MlgywMZltEwA4U6xRwFdy+aSNK94fER1ypYXwsknJIN85nduZuw
         ggrMAweeHdONn2LP31GM7JLssURzgfqZPvRG20J3cLbxKfbZeSohPMQHLIZEVlPQZGbW
         MWAfuHpoTXvw5xPtQLMJjMcyd15Rwz+J307AiWTv7rjRXp53kRlcWHkpxETSJ+NfWS0R
         XmL2nvPLCj1mcaXWJDUfq1PoTvJzoF83967Lrq6PkYVuPuf1HUpK/ysxnY04oqlyj8tS
         rLeXUQ/eVXqcT8NGoZocgro727jWuaExInvjRa7w+YpW8BKCB7RgNR2IvsJc9iSj1lbm
         g6PA==
X-Gm-Message-State: AOJu0YzLAoOr9R035OrX6VOgEbw7knJWq+s7Ke/gZfVMxEhJ7Z0QBW7+
	tDY4LEQFq9xmjL4SMBoonVivFTV4XUH4kIzTjZ9zH6yAu9/e/fWNeK2rv/NcrWJJlACu+WXtIrH
	7
X-Google-Smtp-Source: AGHT+IEvQIFtVKcS9yKWiAo+g/1oR5rOaXxuuAKjoEFDzQURGSW56R2Nn0cMHAn+PqM8ElhZUdqWzQ==
X-Received: by 2002:a17:907:869f:b0:a86:851e:3a2b with SMTP id a640c23a62f3a-a897f8bc9b9mr2101153066b.29.1725541622786;
        Thu, 05 Sep 2024 06:07:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH 1/3] x86/acpi: Drop acpi_video_flags and use bootsym(video_flags) directly
Date: Thu,  5 Sep 2024 14:06:55 +0100
Message-Id: <20240905130657.4075906-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This removes a level of indirection, as well as removing a somewhat misleading
name; the variable is really "S3 video quirks".

More importantly however it makes it very clear that, right now, parsing the
cmdline and quirks depends on having already placed the trampoline; a
dependency which is going to be gnarly to untangle.

That said, fixing the quirk is easy.  The Toshiba Satellite 4030CDT has an
Intel Celeron 300Mhz CPU (Pentium 2 era) from 1998 when MMX was the headline
feature, sporting 64M of RAM.  Being a 32-bit processor, it hasn't been able
to run Xen for about a decade now, so drop the quirk entirely.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/acpi/power.c       |  2 +-
 xen/arch/x86/dmi_scan.c         | 12 ------------
 xen/arch/x86/include/asm/acpi.h |  1 -
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 610937f42e95..557faf312b09 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -56,7 +56,7 @@ static int __init cf_check parse_acpi_sleep(const char *s)
         s = ss + 1;
     } while ( *ss );
 
-    acpi_video_flags |= flag;
+    bootsym(video_flags) |= flag;
 
     return rc;
 }
diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
index 81f80c053a7a..9257aee2ab97 100644
--- a/xen/arch/x86/dmi_scan.c
+++ b/xen/arch/x86/dmi_scan.c
@@ -499,13 +499,6 @@ static int __init cf_check ich10_bios_quirk(const struct dmi_system_id *d)
     return 0;
 }
 
-static __init int cf_check reset_videomode_after_s3(const struct dmi_blacklist *d)
-{
-	/* See wakeup.S */
-	acpi_video_flags |= 2;
-	return 0;
-}
-
 static __init int cf_check dmi_disable_acpi(const struct dmi_blacklist *d)
 { 
 	if (!acpi_force) { 
@@ -546,11 +539,6 @@ static __init int cf_check force_acpi_ht(const struct dmi_blacklist *d)
  
 static const struct dmi_blacklist __initconstrel dmi_blacklist[] = {
 
-	{ reset_videomode_after_s3, "Toshiba Satellite 4030cdt", { /* Reset video mode after returning from ACPI S3 sleep */
-			MATCH(DMI_PRODUCT_NAME, "S4030CDT/4.3"),
-			NO_MATCH, NO_MATCH, NO_MATCH
-			} },
-
 	{ ich10_bios_quirk, "Intel board & BIOS",
 		/*
 		 * BIOS leaves legacy USB emulation enabled while
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 3c47b216d0e0..217819dd619c 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -103,7 +103,6 @@ extern unsigned long acpi_wakeup_address;
 extern int8_t acpi_numa;
 
 extern struct acpi_sleep_info acpi_sinfo;
-#define acpi_video_flags bootsym(video_flags)
 struct xenpf_enter_acpi_sleep;
 extern int acpi_enter_sleep(const struct xenpf_enter_acpi_sleep *sleep);
 extern int acpi_enter_state(u32 state);
-- 
2.39.2


