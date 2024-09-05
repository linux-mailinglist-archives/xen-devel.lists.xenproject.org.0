Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA496E59A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 00:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791411.1201257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeK-0000mT-91; Thu, 05 Sep 2024 22:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791411.1201257; Thu, 05 Sep 2024 22:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeK-0000gQ-5I; Thu, 05 Sep 2024 22:08:20 +0000
Received: by outflank-mailman (input) for mailman id 791411;
 Thu, 05 Sep 2024 22:08:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smKeJ-0000d4-Ba
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 22:08:19 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ab4e46e-6bd3-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 00:08:17 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f3eabcd293so14937871fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 15:08:17 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d020sm187525166b.127.2024.09.05.15.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 15:08:15 -0700 (PDT)
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
X-Inumbo-ID: 5ab4e46e-6bd3-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725574096; x=1726178896; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6ymGvYQ1tOTkYL6CVhzUbxQEQbDorO1VPkvnskpwj8=;
        b=S7kLyRuGtKeOb0Ldu5Ssw7HSPsilll0Urs9bxWw+ywFc+vw2yLcYOmGpmjxlADY8ig
         537NYYk+HyS15apO7/dtXVRKlrlj12aUftqoJ6lCOsrZMrHvtzw5LR2y7sPsVayuGY2h
         2SKBf4Wtu2KCZvwO8nNpMuWJFZy87sdilvKS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725574096; x=1726178896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6ymGvYQ1tOTkYL6CVhzUbxQEQbDorO1VPkvnskpwj8=;
        b=Hcu679KlEJn3jfreZBH/T3FxV8ZlNcV7UfZ+W7REgUldFTFKhH3S+/O0gb5RKIXsaL
         fAC/ik3kAYCmI2jVqy5O0tLWOA13EUY9QwSR72f77DQC/B8RYYL20u/OYRaNZm/BqM3X
         C7Szf77nYqa7i0DkDRPdvamUzT0GX0m9hp/HjKZi8lL7o3kgNbKnp6jpXFOeJFCOQr+R
         +MyVhFHi0DLD2/+qEsJ+vgz5i4dqI9yJFdT/HGLcKah9jVPT6n3wJ43GbDc0kpTbKa2K
         2wESaTjXoRnBIc/MUIjWcMTWhuoK0sJet51lYksDX3Db68RM++aV7DeR9Xi3bPYecDlk
         JMeg==
X-Gm-Message-State: AOJu0YyWb2KncPeFSkVWA5vyALK+oid4N0l2qrrpEQJIqMWvDYPNR7uh
	fdsJU59CGQbwFNvx0yrxV1ba3/5kJ9OL3ko3TmCRCVGUHuga0ZBlGxeSunCvm+0+TUwmGWF4P/4
	3
X-Google-Smtp-Source: AGHT+IFcw8pctbt8BaM90sGdB9UwIKjhHJN3ZJ7yUUhXSrdYDg21H+OK+5afl3TNwF7Eo8QS9EOWPA==
X-Received: by 2002:a05:6512:3b2a:b0:533:d3e:16f5 with SMTP id 2adb3069b0e04-536587fc619mr166203e87.38.1725574095937;
        Thu, 05 Sep 2024 15:08:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 1/5] x86/build: Rework includes in genapic/probe.c
Date: Thu,  5 Sep 2024 23:08:02 +0100
Message-Id: <20240905220806.141300-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905220806.141300-1-andrew.cooper3@citrix.com>
References: <20240905220806.141300-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

probe.c includes a large number of headers which are unused, and not from
churn so far as I can see in history.  Strip back to a reasonable set.

One complication is that genapic.h has to include xen/cpumask.h because
there's no way to forward declare a cpumask_t.

Also strip trailing whitespace while adjusting the file.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/x86/genapic/probe.c       | 34 ++++++++++++++----------------
 xen/arch/x86/include/asm/genapic.h |  2 ++
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/genapic/probe.c b/xen/arch/x86/genapic/probe.c
index 10ceeae4d247..946c3d3ce364 100644
--- a/xen/arch/x86/genapic/probe.c
+++ b/xen/arch/x86/genapic/probe.c
@@ -1,25 +1,23 @@
-/* Copyright 2003 Andi Kleen, SuSE Labs. 
- * Subject to the GNU Public License, v.2 
- * 
+/* Copyright 2003 Andi Kleen, SuSE Labs.
+ * Subject to the GNU Public License, v.2
+ *
  * Generic x86 APIC driver probe layer.
- */  
-#include <xen/cpumask.h>
-#include <xen/string.h>
-#include <xen/kernel.h>
-#include <xen/ctype.h>
+ */
+#include <xen/bug.h>
+#include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/param.h>
-#include <asm/cache.h>
-#include <asm/fixmap.h>
-#include <asm/mpspec.h>
-#include <asm/apicdef.h>
-#include <asm/mach-generic/mach_apic.h>
-#include <asm/setup.h>
+#include <xen/sections.h>
+#include <xen/string.h>
+#include <xen/types.h>
+
+#include <asm/apic.h>
+#include <asm/genapic.h>
 
 struct genapic __ro_after_init genapic;
 
 static const struct genapic *const __initconstrel apic_probe[] = {
-	&apic_bigsmp, 
+	&apic_bigsmp,
 	&apic_default,	/* must be last */
 	NULL,
 };
@@ -57,8 +55,8 @@ static int __init cf_check genapic_apic_force(const char *str)
 }
 custom_param("apic", genapic_apic_force);
 
-void __init generic_apic_probe(void) 
-{ 
+void __init generic_apic_probe(void)
+{
 	int i;
 
 	record_boot_APIC_mode();
@@ -75,4 +73,4 @@ void __init generic_apic_probe(void)
 	BUG_ON(!genapic.name);
 
 	printk(KERN_INFO "Using APIC driver %s\n", genapic.name);
-} 
+}
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index 970df8ffe0a4..a694371c6d16 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -1,6 +1,8 @@
 #ifndef _ASM_GENAPIC_H
 #define _ASM_GENAPIC_H 1
 
+#include <xen/cpumask.h>
+
 /*
  * Generic APIC driver interface.
  *
-- 
2.39.2


