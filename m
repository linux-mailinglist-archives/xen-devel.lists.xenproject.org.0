Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC896E599
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 00:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791413.1201276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeL-0001CT-Qb; Thu, 05 Sep 2024 22:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791413.1201276; Thu, 05 Sep 2024 22:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeL-00017R-J5; Thu, 05 Sep 2024 22:08:21 +0000
Received: by outflank-mailman (input) for mailman id 791413;
 Thu, 05 Sep 2024 22:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smKeK-0000d4-Bb
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 22:08:20 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b4cc098-6bd3-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 00:08:18 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso2295014e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 15:08:18 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d020sm187525166b.127.2024.09.05.15.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 15:08:16 -0700 (PDT)
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
X-Inumbo-ID: 5b4cc098-6bd3-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725574098; x=1726178898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nATHuqwrSOYw1vLuBUTAd5OQXfMll/9QK99fmcLPJNA=;
        b=lsX2dNvrsrKnrM/Tmip1JgDLzD9WxBi/XqnbDx7pwr7cEZ9HsLbnxhDSPaJdBnzsLf
         h0C0abTPUQZpndsDvNhelL/Sx0rncE/4tWZlbh2thzjw47VJJSBnPMAxOyHKOqM/38dY
         2+DZ5GMErCHQodm81NJYUweUt7elzoqWyO6bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725574098; x=1726178898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nATHuqwrSOYw1vLuBUTAd5OQXfMll/9QK99fmcLPJNA=;
        b=G7h2affOJjqOm1Vu9gR5RU5pcYq7Yb4u++ZbfwpDLgdGJNT5TlsehFovcKPbElZKao
         A7jvfFvZKEMd7rNJaHZVz+cenByt11WB83DXwpQEix3KUJrfYeHxXWRN/0A8B8yhbwBL
         Y3qddl9Dox2XJKHVr2lsBXXynVm9iCClCMgLNO9AZFEXz3Mq4CBGB/1ojPcijDkarMGj
         YRA6vwcnG1SucP+48NEW7gIIdDf2+dK3v5LZGfFiRqHPR5J39OLswVpj8kdk0uie5Nvg
         HYXFDp/ar6MUmsVUhSnFaDjVgd3BPdIIVzLWJZCTA4hfRD/6c/uYbCyufFpwqlA/p2SW
         ab+w==
X-Gm-Message-State: AOJu0Yx7NKbWms5LzqIf1IKk/MehtpRGDeJpiyhnxwKVo60kuSyOlpSi
	4KcreynVs6oyF/AXn6B1+ymurirmR35P+RbXqcLbYAHob9yrrtr3s/YCzwrvbbv5v7Mh1k2UXuy
	p
X-Google-Smtp-Source: AGHT+IFnfWNe/Vn5XlLsBfNZy4sLg4dUFfxNInf0Ty0gLt3Dwei01aCguBoPhfCvv5xzwGwSwfM6Xw==
X-Received: by 2002:a05:6512:b1e:b0:529:b718:8d00 with SMTP id 2adb3069b0e04-536587a68c7mr361172e87.8.1725574097013;
        Thu, 05 Sep 2024 15:08:17 -0700 (PDT)
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
Subject: [PATCH 2/5] xen/build: Drop unused includes of xen/cache.h
Date: Thu,  5 Sep 2024 23:08:03 +0100
Message-Id: <20240905220806.141300-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905220806.141300-1-andrew.cooper3@citrix.com>
References: <20240905220806.141300-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

None of these are used, not even transitively.

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
 xen/arch/x86/bzimage.c               | 1 -
 xen/arch/x86/dmi_scan.c              | 1 -
 xen/arch/x86/include/asm/processor.h | 1 -
 xen/common/decompress.h              | 1 -
 xen/include/acpi/platform/aclinux.h  | 1 -
 xen/include/xen/rcupdate.h           | 1 -
 6 files changed, 6 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index ac4fd428be0e..66f648f311e4 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -1,4 +1,3 @@
-#include <xen/cache.h>
 #include <xen/errno.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
index 81f80c053a7a..811bf355fba6 100644
--- a/xen/arch/x86/dmi_scan.c
+++ b/xen/arch/x86/dmi_scan.c
@@ -3,7 +3,6 @@
 #include <xen/kernel.h>
 #include <xen/string.h>
 #include <xen/init.h>
-#include <xen/cache.h>
 #include <xen/acpi.h>
 #include <asm/io.h>
 #include <asm/system.h>
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index e71dbb8d3fbf..26e2fb13699a 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -5,7 +5,6 @@
 #define __ASM_X86_PROCESSOR_H
 
 #ifndef __ASSEMBLY__
-#include <xen/cache.h>
 #include <xen/types.h>
 #include <xen/smp.h>
 #include <xen/percpu.h>
diff --git a/xen/common/decompress.h b/xen/common/decompress.h
index e8195b353a15..4683eb6c7ea1 100644
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -1,6 +1,5 @@
 #ifdef __XEN__
 
-#include <xen/cache.h>
 #include <xen/decompress.h>
 #include <xen/init.h>
 #include <xen/string.h>
diff --git a/xen/include/acpi/platform/aclinux.h b/xen/include/acpi/platform/aclinux.h
index f5e0a6108e0b..a66c2e6d1d8f 100644
--- a/xen/include/acpi/platform/aclinux.h
+++ b/xen/include/acpi/platform/aclinux.h
@@ -47,7 +47,6 @@
 #define ACPI_USE_SYSTEM_CLIBRARY
 #define ACPI_USE_DO_WHILE_0
 
-#include <xen/cache.h>
 #include <xen/string.h>
 #include <xen/kernel.h>
 #include <xen/ctype.h>
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 6f2587058edb..95f4ad81c4a8 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -31,7 +31,6 @@
 #ifndef __XEN_RCUPDATE_H
 #define __XEN_RCUPDATE_H
 
-#include <xen/cache.h>
 #include <xen/compiler.h>
 #include <xen/spinlock.h>
 #include <xen/cpumask.h>
-- 
2.39.2


