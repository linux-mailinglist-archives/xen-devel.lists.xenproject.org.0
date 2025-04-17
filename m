Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B46A916ED
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957201.1350374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Kzb-0004no-AR; Thu, 17 Apr 2025 08:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957201.1350374; Thu, 17 Apr 2025 08:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Kzb-0004lZ-7a; Thu, 17 Apr 2025 08:53:07 +0000
Received: by outflank-mailman (input) for mailman id 957201;
 Thu, 17 Apr 2025 08:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CA5y=XD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5Kza-0004lP-3d
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:53:06 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6073db01-1b69-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 10:53:05 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so3870315e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 01:53:05 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4d3463sm45290255e9.13.2025.04.17.01.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 01:53:04 -0700 (PDT)
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
X-Inumbo-ID: 6073db01-1b69-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744879984; x=1745484784; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8mINNb5oM4qyzdutX5C8e0crTYLMttSEIxr9UZ8ZJ8=;
        b=qvA/qHLTZkAT0dN1b95x+exCvPfGqP+9tnyy5maQKzX6XdftYWPX4yJ7pH36zFUy/v
         XuSmTX/TrJbEfzneRyh0F+g18SG8rclFBXQLvywMuugOV/qXgyIgljfkvjstRtV/iILP
         2mEjGGtVmWeLYXLX3rAg+P/JqkKv5MT8njhBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879984; x=1745484784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8mINNb5oM4qyzdutX5C8e0crTYLMttSEIxr9UZ8ZJ8=;
        b=O8NsXfajTiIXCsCtRq+391awhrISC0kHYeq9F/XVB/KETvxryrNumQOOA5BVWCDzF8
         gCLHh8gmq2gtj8mk990L916PmIIP15n/SrKHaG+vzwDFUW9IUeAkQ21rpR82hUI2ii8R
         W0r+7a/DEXzQBJnLCtKJdWiWXKfSfi0aJwTBSfOU2VLhXW7EmPbjwnHSN+6K9gxNjl9S
         XaHndwvNL0meEMh3hnhyQM4MFpForstru2Eawrp4uvduG8D3r77zXXfD/9QRlC5LdF9a
         ea+3Ew3u621R41YpbnXyOh/0n2guMuBxt2suaT3KgN1G458MxSHdG0pBDtPJxnBqa1uI
         +9NQ==
X-Gm-Message-State: AOJu0Ywq2icm7DTNtiUaP2wW8SFAlN4jEOLS+QTmjRGiwBuA6Nifntrn
	k5w1ivjtJezGsdKkT/x5wm8e8DsnaODtY9vG45fMXN/PnAvvqO7qJN/tVGRYjXk19xzHvPVSKl+
	p+vY=
X-Gm-Gg: ASbGncuOxUUUaCYbG/zbvpRCHlV3wIrYYXY4AWcnVtqLcZSIldER//gfoC2OmC45p7g
	xiHbrBB7SD2QsUrZMYzClco9Z+RS2JlsAZpK8NLz4PvUrD4wIHahabeaDl6BFLFEtNuSnoDkakk
	lQPRF7WIu10PxaYRU/UGdvH4muNLKQJsuAbmQ82w6tu4ejHmsSmdpVf4m2DmV44yaBnLfBRQ3ac
	UA3xHMftOmfjqDcZk7ne75O6zSkPCabe/Av9lRQSkF9MoC1pSxqezCdWsiH+gxz39owvOL1utdW
	KbPoVWGJJscA4f6wMU+AZ32fFQQMvCQJu6iTDTqRthHSdI9TFWU8zepKGwiBz98Fprz0C648k0M
	/iVV4B5xpY4pTIQ==
X-Google-Smtp-Source: AGHT+IH/p3EaRhwtaxD+pMRQdKsetCb/RJ/6X93+PioLLUS9PKhYxl1KAYclnfcby2HiJItGENMHBA==
X-Received: by 2002:a05:600c:a15:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-4405d61ce41mr52631525e9.9.1744879984545;
        Thu, 17 Apr 2025 01:53:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/percpu: NUMA-position the per-CPU area
Date: Thu, 17 Apr 2025 09:53:02 +0100
Message-Id: <20250417085302.2554018-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This seems to have been quite an oversite in Xen's NUMA support, albeit it
probably because NUMA was arch-specific at first.

Take the opportunity to sort the includes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1773336913

For the !NUMA case, cpu_to_node() defaults to 0 rather than NUMA_NO_NODE,
making memflags nonzero.  I'm not sure how wise this is, but ARM runs seem
happy with it.
---
 xen/common/percpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/common/percpu.c b/xen/common/percpu.c
index c6ecd95a0874..cdd70acbeaf3 100644
--- a/xen/common/percpu.c
+++ b/xen/common/percpu.c
@@ -1,8 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#include <xen/percpu.h>
 #include <xen/cpu.h>
 #include <xen/init.h>
 #include <xen/mm.h>
+#include <xen/numa.h>
+#include <xen/percpu.h>
 #include <xen/rcupdate.h>
 #include <xen/sections.h>
 
@@ -27,6 +28,8 @@ void __init percpu_init_areas(void)
 
 static int init_percpu_area(unsigned int cpu)
 {
+    nodeid_t node = cpu_to_node(cpu);
+    unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
     char *p;
 
     if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
@@ -34,7 +37,7 @@ static int init_percpu_area(unsigned int cpu)
                ? 0
                : -EBUSY;
 
-    if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
+    if ( (p = alloc_xenheap_pages(PERCPU_ORDER, memflags)) == NULL )
         return -ENOMEM;
 
     memset(p, 0, __per_cpu_data_end - __per_cpu_start);

base-commit: 7f8c2dd829358406dc9e50d5e386e4d2b20b4303
-- 
2.39.5


