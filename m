Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE5A126D0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 16:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872688.1283666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4vr-0003ia-Dt; Wed, 15 Jan 2025 15:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872688.1283666; Wed, 15 Jan 2025 15:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4vr-0003gW-Aw; Wed, 15 Jan 2025 15:03:47 +0000
Received: by outflank-mailman (input) for mailman id 872688;
 Wed, 15 Jan 2025 15:03:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmQ5=UH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tY4vq-0003gO-CP
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 15:03:46 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea06bf42-d351-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 16:03:44 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so1305339266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 07:03:44 -0800 (PST)
Received: from andrew-laptop.. ([46.149.103.11])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af7besm778137966b.143.2025.01.15.07.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 07:03:43 -0800 (PST)
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
X-Inumbo-ID: ea06bf42-d351-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736953424; x=1737558224; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKiJKRVfHVQ9bFVeIoVGgxmC6qz+HqDIbmFOHXUpcyk=;
        b=GRa6VdgPwq93/IJuGLd0LWjHLfKvn/PTl6Km0UEY2yFw15Tq7NyCnLJ+ERUlYQxt+i
         SIID4hArEd6R558pzJCCcP5exY7my264FxoHBNySNAIFTdt+B7s1nwEHMEJc7PGGGzPx
         8tCbfStuCDU7LthQDvRu4ZFfUtfxrk0wdt6b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736953424; x=1737558224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKiJKRVfHVQ9bFVeIoVGgxmC6qz+HqDIbmFOHXUpcyk=;
        b=m9glMBo/0ku2xUcCMfjATgjpB4V8pLrha9FMCBbByH6RFdMb7MUj9hMR9H83ahPswk
         2hY5mm2tPhhqLe2P9SsytvpeEbEYgpehlnvZVVvxN0o3gsg8+feRTX5Agek5rIjNuhXD
         DWj3NaRwUeU9JcHtnlwTgHpcEshnE+ytEc7HifvWGlgNru1t/hh98S9gPQc8fv7fe3uC
         6QhlDdunIEdI5gYs6AEJOS2D00lDv3vpbfGmoiSr+ac044+KSoEFJiuq7KwHmGWwcGTQ
         lwXu/6H9doY6F6fJYcIGrv2Gb5fdSDsixY2Rhv5WkWdBgsNoH/Hgu1ZdWPbp737aE8Kk
         b2lQ==
X-Gm-Message-State: AOJu0YzQ0ynsgjZE3/M39aRMh6TcHO+lvLnzXdIdDkeb329cqx4oFpQD
	cZCfH0noYSSQUZA4PUdUbHbhvirZkGGP/YPJJlOROHpN6lJShAf9sNlYajIHY/qs8YQ0uwdgRSY
	+xjM=
X-Gm-Gg: ASbGncs3PLM9EPg5dTWXDfwlu4fbPMy1hcp+YGpV7gDPagMhQCPGplzOb3x6LXgbh7k
	W6GSh6ZBx6UxwrIkrNKLD669Wn1QnC+CwxiU6jgOtIKqN/9W0XUr3TGlktt0UwhSjrf2wUGopWP
	pBB3KOGkemR2ZTKGdvGx3PDjuOiGPeeJ0suj3QCJqUN8FxJkXNG/QlzrC8Yz2seMfePY1uDA5zU
	C4I4XFT62tE4PCB3YpOuA3mDFmI9Q4wA7OiveDi1usjWPvi3sr82tdt8LuTNoVNOkhZ
X-Google-Smtp-Source: AGHT+IEzi8m1j62lmsQ0TX5gR5F7sOxFs318coxNOl6AszDGbySxU71ZvCDormRX9P8mdPvmmJX3LQ==
X-Received: by 2002:a17:907:60cf:b0:aa6:8b38:52a3 with SMTP id a640c23a62f3a-ab2abcb07e9mr3022667966b.50.1736953423587;
        Wed, 15 Jan 2025 07:03:43 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/ppc: Fix double xen_ulong_t typedef in public/arch-ppc.h
Date: Wed, 15 Jan 2025 15:03:39 +0000
Message-Id: <20250115150339.53931-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

public/arch-ppc.h contains two adjacent #ifndef __ASSEMBLY__ blocks.

With these merged, it becomes very obvious that there's a duplicate
definition of xen_ulong_t, which is also noticed by the docs build:

  /usr/bin/perl -w /local/xen.git/docs/xen-headers -O html/hypercall/ppc \
          -T 'arch-ppc - Xen public headers' \
          -X arch-arm -X arch-riscv -X arch-x86_32 -X arch-x86_64 \
          -X xen-arm -X xen-riscv -X xen-x86_32 -X xen-x86_64 \
          -X arch-x86 \
          /local/xen.git/docs/../xen include/public include/xen/errno.h
  include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:55
  include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:61
  include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:61
  include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:55

Drop the second typedef.  Finally, annotate the #endif so it's clear
what it refers to.

Fixes: 08c192cc1127 ("xen/ppc: Add public/arch-ppc.h")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/public/arch-ppc.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.h
index 33a24e379551..4ca453a2841e 100644
--- a/xen/include/public/arch-ppc.h
+++ b/xen/include/public/arch-ppc.h
@@ -54,11 +54,6 @@ typedef uint64_t xen_pfn_t;
 
 typedef uint64_t xen_ulong_t;
 #define PRI_xen_ulong PRIx64
-#endif
-
-#ifndef __ASSEMBLY__
-
-typedef uint64_t xen_ulong_t;
 
 /*
  * User-accessible registers: most of these need to be saved/restored
@@ -107,6 +102,6 @@ struct xen_arch_domainconfig {
 
 typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
 
-#endif
+#endif /* !__ASSEMBLY__ */
 
 #endif /* __XEN_PUBLIC_ARCH_PPC_H__ */
-- 
2.34.1


