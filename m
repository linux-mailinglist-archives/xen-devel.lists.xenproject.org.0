Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E59C25FE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832772.1248059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7q-0008Vf-C5; Fri, 08 Nov 2024 19:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832772.1248059; Fri, 08 Nov 2024 19:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7q-0008Tj-95; Fri, 08 Nov 2024 19:58:34 +0000
Received: by outflank-mailman (input) for mailman id 832772;
 Fri, 08 Nov 2024 19:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7p-0008TS-1R
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:33 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2629bec-9e0b-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 20:58:28 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so407484366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:28 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:26 -0800 (PST)
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
X-Inumbo-ID: d2629bec-9e0b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQyNjI5YmVjLTllMGItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk1OTA4LjUwNDU4Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095907; x=1731700707; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYie9AcBWI2S7AR0N11MSukBCPDyuxvyXWxJgl6q148=;
        b=Ce34HUJi51sY9h8GqrU1K0EhG99I1+zcKK5euEZUzoMHv6AJH/JvE/Q/cktReb9NXr
         N/gJ7ZpFL+iAqBK8DglC8yhoKk5EmWL+9/UjLKWO/WWPJ8rtZ5w8TSn5pcaMjYB2+uyY
         +6Igp8ARu3/Tisu0lbLSwKPf8uFXoNjcvAwP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095907; x=1731700707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYie9AcBWI2S7AR0N11MSukBCPDyuxvyXWxJgl6q148=;
        b=fK9EfM2Ue8Dtm06NW8UCezWIYknL8RBsQnu4oXWi/zhCi5X3OL1tTBBE80AEXdSK1i
         jd4kNGdHppqHsDdVhX24gMNVZbuwCJjS1ijxrKpgRQjjws4tLQD2k4ACCOR6QTD/Dlxk
         KVXXJS1zt8kTE1RNtGHXEXVBpUFW6JlhfuTmIjAkqm6qv5olb3T6gu0DkXsCl9jjZq0s
         C1sxZ6QyhSjq2UDVn59jWoeV9ieOGJmDqXSuQwdb5s8bJr8sWHR3oY+SDtDwKCg3qYvn
         qtVy5Jz21IPrdijGjwR4wDhxoIRgk7yJZgoJpVT3OpvRqoNzkbvDhUtYPHtGvYBcU4QW
         5tmA==
X-Gm-Message-State: AOJu0YwR3DqiC6nvrMy6hFktJnBOwbzfuLVLNIk2Dpz5rGZNSap+KzlB
	xDjn+oPfVcjZ/+IOvziEq5m3e52YQRBw0Af3OordR2sjfTyv1W2k/GfoyBr93JEEodLcEgnHUsm
	a
X-Google-Smtp-Source: AGHT+IFkwDRG0JuBnQUiz375sbx3PWclHmsV85IVLpeZpU/Z9XZFyOAYTDVEGQOuTd8OzCcEOvwLMw==
X-Received: by 2002:a17:906:f598:b0:a9a:20b4:4078 with SMTP id a640c23a62f3a-a9eeff0da70mr350698466b.16.1731095907494;
        Fri, 08 Nov 2024 11:58:27 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 01/10] VT-d: Drop includes of mach_apic.h
Date: Fri,  8 Nov 2024 19:58:11 +0000
Message-Id: <20241108195820.789716-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108195820.789716-1-andrew.cooper3@citrix.com>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Neither iommu.c nor quirks.c use any functionality.  iommu.c only uses it to
transitively include apic.h and io_apic.h, while quirks.c is only depending on
the ACLINUX wrapping of strtoul() which we spell simple_strtoul() everywhere
else in Xen.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/vtd/iommu.c  | 5 ++++-
 xen/drivers/passthrough/vtd/quirks.c | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index e13be244c130..27a4d1640189 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -31,12 +31,15 @@
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
 #include <xen/keyhandler.h>
+
+#include <asm/apic.h>
+#include <asm/io_apic.h>
 #include <asm/msi.h>
 #include <asm/nops.h>
 #include <asm/irq.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/p2m.h>
-#include <mach_apic.h>
+
 #include "iommu.h"
 #include "dmar.h"
 #include "extern.h"
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index 950dcd56ef8a..dc3dac749ce6 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -32,7 +32,7 @@
 #include <asm/msi.h>
 #include <asm/irq.h>
 #include <asm/pci.h>
-#include <mach_apic.h>
+
 #include "iommu.h"
 #include "dmar.h"
 #include "extern.h"
@@ -321,7 +321,7 @@ static int __init cf_check parse_snb_timeout(const char *s)
         else if ( strcmp(s, "cap") == 0 )
             t = SNB_IGD_TIMEOUT;
         else
-            t = strtoul(s, &q, 0);
+            t = simple_strtoul(s, &q, 0);
     }
     else
         t = t ? SNB_IGD_TIMEOUT_LEGACY : 0;
-- 
2.39.5


