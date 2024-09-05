Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD196E59B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 00:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791415.1201299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeO-0001tu-EO; Thu, 05 Sep 2024 22:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791415.1201299; Thu, 05 Sep 2024 22:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeO-0001rI-AW; Thu, 05 Sep 2024 22:08:24 +0000
Received: by outflank-mailman (input) for mailman id 791415;
 Thu, 05 Sep 2024 22:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smKeM-0000d4-Si
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 22:08:22 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cd8793f-6bd3-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 00:08:21 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso444595666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 15:08:21 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d020sm187525166b.127.2024.09.05.15.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 15:08:18 -0700 (PDT)
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
X-Inumbo-ID: 5cd8793f-6bd3-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725574100; x=1726178900; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z07Rt8xWRkaIJIJwoIRUcGqCQ60a5xLz+kCbQYTjXpk=;
        b=QjOvMi/MapPD9rSa3kSa3WKlqhWgsxR3urb426eviUioQt4bH8GFlaIVqH+UCsXbwQ
         ZSIup7yxLQOKZHC52USXhuZbPhE5MvoX/E3ykNzCu/WMj492nmOx3T3cljQXxJVTstwD
         wsh/LfH+bcXGFDLESMlmkkEqB3hj/I8dGNV20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725574100; x=1726178900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z07Rt8xWRkaIJIJwoIRUcGqCQ60a5xLz+kCbQYTjXpk=;
        b=W7MA7m/3lcdrquYInxQRxWMlFMDMzP5pVz/pxC7eiTqD35q0J6IbSx6LushMN16HiN
         aroT60euvy4ffq390fZY3U5k9UFATi4aIRfjQQ2U2TrDzM87KWHgNuNrnZ0LxHrlgiMb
         Ulf9iQGvXpjqKmZt3dMCRnff2MrlHFjrHwrUQ2Ijl2K0W9z/cwsFZYdPBPeUJyjxVyKx
         sEWXl6os8vDP1/3SWtR+/Au5vi3OPccYkOn/9NkTem/aoEQybGmaqujObGAvq65qHzrK
         dNVV7WhWq1km7zjOB1QA3ofGbepVbvmNsfoA/fMpnCMEAjFvT+x5U5KgH3oq95yCYJ1o
         NrpQ==
X-Gm-Message-State: AOJu0YxNhrfDfjQ5w/XqRxCULfR1e58ilmY0pFehRqqp+VxoEM2MoWvF
	RTxIOHTJFloCNjmHHtszFnGd3x8uPHGC1TA9r+YZXDkAjgU//77PyAfytszLo9sSabikMhbIHFU
	9
X-Google-Smtp-Source: AGHT+IH6MdX3GEZWCMtR7PcKtqVSBubYjR64pQJl/gJmLkC0I/kvdKtRQpDLIR5qfacWmOWx6ArYNw==
X-Received: by 2002:a17:907:987:b0:a77:ca3b:996c with SMTP id a640c23a62f3a-a8a8604476emr74497766b.16.1725574099903;
        Thu, 05 Sep 2024 15:08:19 -0700 (PDT)
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
Subject: [PATCH 4/5] x86/cache: Drop legacy __read_mostly/__ro_after_init definitions
Date: Thu,  5 Sep 2024 23:08:05 +0100
Message-Id: <20240905220806.141300-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905220806.141300-1-andrew.cooper3@citrix.com>
References: <20240905220806.141300-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Lots of files were picking these up transitively, including lib.h

However, lib.h needs __read_mostly for printk_once() and this has the side
effect of kicking the transitive can down the road.

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
 xen/arch/x86/include/asm/cache.h | 3 ---
 xen/include/xen/cache.h          | 2 +-
 xen/include/xen/lib.h            | 1 +
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/cache.h b/xen/arch/x86/include/asm/cache.h
index 956c05493e23..f15d10dc7f2d 100644
--- a/xen/arch/x86/include/asm/cache.h
+++ b/xen/arch/x86/include/asm/cache.h
@@ -9,9 +9,6 @@
 #define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
 #define L1_CACHE_BYTES	(1 << L1_CACHE_SHIFT)
 
-/* TODO: Phase out the use of this via cache.h */
-#define __read_mostly __section(".data.read_mostly")
-
 #ifndef __ASSEMBLY__
 
 void cache_flush(const void *addr, unsigned int size);
diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
index a19942fd63ef..90816ba05b1a 100644
--- a/xen/include/xen/cache.h
+++ b/xen/include/xen/cache.h
@@ -15,7 +15,7 @@
 #define __cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
 #endif
 
-#if defined(CONFIG_ARM) || defined(CONFIG_X86)
+#if defined(CONFIG_ARM)
 /* TODO: Phase out the use of this via cache.h */
 #define __ro_after_init __section(".data.ro_after_init")
 #endif
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index e884a02ee8ce..81b722ea3e80 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -10,6 +10,7 @@
 #include <xen/types.h>
 #include <xen/xmalloc.h>
 #include <xen/string.h>
+#include <xen/sections.h>
 
 #define __ACCESS_ONCE(x) ({                             \
             (void)(typeof(x))0; /* Scalar typecheck. */ \
-- 
2.39.2


