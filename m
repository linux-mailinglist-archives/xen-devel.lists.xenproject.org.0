Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B9D8C87A4
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724202.1129516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y7V-00027b-Ob; Fri, 17 May 2024 13:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724202.1129516; Fri, 17 May 2024 13:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y7V-00024S-Lu; Fri, 17 May 2024 13:59:37 +0000
Received: by outflank-mailman (input) for mailman id 724202;
 Fri, 17 May 2024 13:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJM7=MU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7y4W-0001cB-1H
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:56:32 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 433cb533-1455-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 15:56:31 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6a0b68733f5so4932196d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:56:31 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f205d88sm85754546d6.144.2024.05.17.06.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:56:29 -0700 (PDT)
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
X-Inumbo-ID: 433cb533-1455-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715954189; x=1716558989; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+QOPgKgaP14grMwcOnBETVr6+/OzicFLEDWvdXBbb8=;
        b=DfNHB3P4ZvVodkxRHlTglvtcNH2rH+3QSQw2FBxj2ekAhQoFTMutxFQG0sZ3UkpuXT
         yWZDUhJBxzFh8hPnPPCh/E6X5+zWQASLF9Eq56MVP21ulcS2R/iY1Db/jCTz+HMFVgk3
         PcqvTuT2ETVo8JwNMVR9G7P2NCptFuS+KvcOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954189; x=1716558989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+QOPgKgaP14grMwcOnBETVr6+/OzicFLEDWvdXBbb8=;
        b=iTaKA3kprUw6rTk7+kueIwAh7T7VuCxuZeD9c5FrfRQ4tMwo1uFbHg/inQyJ6BwTvN
         wVZ7g7y4Dj5NXsXlb2niAg08eVZBoSsnIIqtvyuGxINfWB9M/gpHMbW2SSOzOln5imHh
         QR/w2A+lfxAxxP1CH6MQm1HOMRy3N/bKpVf4u9JTQzVqQ7MjTrm9n1Ec+ikUQ43qcQYo
         U+KZS1+gLKioqwwrAAhQHJXiDEKrORkga/40uzHHauFmDnnhxYDuzuIDCjgrVmqFYZug
         3uVXD+hoG3UbrsXwZa2TjGEuIsqAEJ9S8u5HnJAtzVVBcpHkYmsZYwp0yCxgCergJjjn
         k53Q==
X-Gm-Message-State: AOJu0YweNm3hFbyAYsM5rJJ6uu2GIGt4ic2yxnhkql6wUqKRCUBfeZU/
	WlfbWuIw+RaKKsF9RtsPHDh8xMnfsYPqV7fYPFYnhNekhMRZSYKTUCdo44UB5C2hEacbAFKn/8P
	f
X-Google-Smtp-Source: AGHT+IHgrQTPsapkmh3V9ID2fxskDwsofaTuANyIWY+R6O9TdkN1TKqI3uGLThAa5+sDl2A9eaE7DA==
X-Received: by 2002:a05:6214:2f08:b0:6a0:bb97:9470 with SMTP id 6a1803df08f44-6a1682588d5mr283883386d6.41.1715954189511;
        Fri, 17 May 2024 06:56:29 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19] x86/msi: prevent watchdog triggering when dumping MSI state
Date: Fri, 17 May 2024 15:56:05 +0200
Message-ID: <20240517135605.94781-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the same check that's used in dump_irqs().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 19830528b65a..0c97fbb3fc03 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -17,6 +17,7 @@
 #include <xen/param.h>
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
+#include <xen/softirq.h>
 #include <xen/iocap.h>
 #include <xen/keyhandler.h>
 #include <xen/pfn.h>
@@ -1451,6 +1452,9 @@ static void cf_check dump_msi(unsigned char key)
         unsigned long flags;
         const char *type = "???";
 
+        if ( !(irq & 0x1f) )
+            process_pending_softirqs();
+
         if ( !irq_desc_initialized(desc) )
             continue;
 
-- 
2.44.0


