Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01695B12090
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058059.1425753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK10-0003Ba-KK; Fri, 25 Jul 2025 15:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058059.1425753; Fri, 25 Jul 2025 15:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK10-00035J-E0; Fri, 25 Jul 2025 15:07:18 +0000
Received: by outflank-mailman (input) for mailman id 1058059;
 Fri, 25 Jul 2025 15:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK0y-0002MQ-Go
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:16 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c148a98-6969-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:07:14 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-614fd1a5790so274416a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:14 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:13 -0700 (PDT)
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
X-Inumbo-ID: 0c148a98-6969-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456034; x=1754060834; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVEUFIrsCWteOZOdQHJQjh3H/B/OmFPnYtoY93IX3Z8=;
        b=Q5JpWw9O/Lt4Pmgx+OFb5QqXL2xXiPKHAL0aePFQHZpCF6LD58kKfHD1U/9EH0bxmW
         Asp/YN3mzmSqSjg0PX8s4ddkHGhDBnYHbm5JTmZMz/U93n3a9Abn4ZJyAl1fWpq5GK1K
         PNto/4s+y9eBwI06UvhfCWfz7FsxJrfHHe+NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456034; x=1754060834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVEUFIrsCWteOZOdQHJQjh3H/B/OmFPnYtoY93IX3Z8=;
        b=GT2Bv/WiIhGQJQv+nxFy3z9txpUdDpdYdhyEpWuhN8RMW/fOlP8A3gUniqE5pW/k8H
         F9WXjy6zZIwZEwpkODxloJ+g4bseBGz7f6QGg9BzOg+KqWFHSGeBnMcWB4vecZxGsYIz
         TM0Yzx+LGYtQjiN/iukyxwcwFUHuLug3sYkOwqFZ8mOQa7SUS0k866+qBmROVHVjYdX3
         IKmNBplAAjl67RSsaa0sgmkJnO0aG8U2nAxkjhaKZ789pk55r/LU6ZmXWw43W79vjaUO
         2KLBKYvopOzQnxMUBg0YmWgP6BUoCmJO5aQ4gQEdq9O+O1CvQ0JxWkIR/SLf18kEfCxa
         at8w==
X-Gm-Message-State: AOJu0YxAW1EYKVmeh88xYpO/LjGWIh/WpTCDmnRjpqjPlkIgIWm0CZw5
	kOik5XtW+To1WROg7LguYvYfnwakMrBuUocDqf5dDC5zjqT6HWTxkLhtcAXb2BVpykpVYZ5idk1
	6aXQGS2U=
X-Gm-Gg: ASbGnctFrFLkQLHg0is6HmgrSWBym2DjuJgVUUwtDKCeTybEmLd60QdfTp0q9FVlSTC
	DdoiZsttP0bnHucrBvKj13Gmf6iYEWceOU0venzkT5VLxqHkXPnyoS6KKG6GSqKRSvQwL5sxhGS
	X42asarQB+/LqWCLn/6818gnmUcj1bQ+I3XY0/UIIPZNu+t5vD6oSurpwt9I08pLFkjgRKSl++c
	KTHyyDemP/f7sOBCk2CJQ9bVy4jFY67G27QTKwgMa3XLGB0JCvYSkMmwic0XPyhEWoATrA40hDE
	a+JMQ6hijVP2ivj70MSDzqyKWdFvplpqA56qgB+Ec5g/dq3axzim71cvUcNinPW9/SnxoankViA
	C9gBajHKM50Kg0NiQXiK8n7YQsID9jdglgDUYeNm5IcWTiIE=
X-Google-Smtp-Source: AGHT+IHecPa0fHUDYt9VuBiYwJLKcyO0z7ZDAxUoe90D5hB3q1z7LH7eTcHh6J8JrrWout0puCJZIg==
X-Received: by 2002:a05:6402:34d5:b0:606:ebd9:c58b with SMTP id 4fb4d7f45d1cf-614f1bdd877mr2055311a12.1.1753456033718;
        Fri, 25 Jul 2025 08:07:13 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 03/10] arch-x86/pmu.h: convert ascii art drawing to Unicode
Date: Fri, 25 Jul 2025 16:06:39 +0100
Message-ID: <99651231c4b535cdba21c852f3ec7c28c00a8088.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use `aa2u` (ascii-art-to-unicode from Hackage) to convert to
Unicode box drawing characters.

The full list of supported drawing characters can be seen in the
examples at:
https://github.com/fmthoma/ascii-art-to-unicode/blob/master/src/Text/AsciiArt.hs

For future maintenance: conversion can be done incrementally
(mixing ascii art with already converted Unicode,
 and running the conversion tool again), or by hand.

No functional change.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 xen/include/public/arch-x86/pmu.h | 120 +++++++++++++++---------------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/xen/include/public/arch-x86/pmu.h b/xen/include/public/arch-x86/pmu.h
index 8be71a88ee..5bd0aa6f77 100644
--- a/xen/include/public/arch-x86/pmu.h
+++ b/xen/include/public/arch-x86/pmu.h
@@ -130,66 +130,66 @@ typedef struct xen_pmu_arch xen_pmu_arch_t;
 DEFINE_XEN_GUEST_HANDLE(xen_pmu_arch_t);
 
 /* Memory layout:
-*                .---------------------.
-*                | struct xen_pmu_data |
-* +==============+=====================+=======================+ <.
-* | vcpu_id                                                    |  |
-* +------------------------------------------------------------+  |
-* | pcpu_id                                                    |  |
-* +------------------------------------------------------------+  |
-* | domain_id                                                  |  |
-* +------------------------------------------------------------+  |
-* |##pad#######################################################|  |
-* +====+=+===+==================+==============================+  |
-* | pmu| | r | regs             |##pad#########################|  |
-* +----. +---. (xen or guest)   |##############################|  |
-* |      +======================+==============================+  |
-* |      | pmu_flags                                           |  |
-* |      +===+====================+============================+  |
-* |      | l | lapic_lvtpc        |############################|  |
-* |      +---. ###################|##pad#######################|  |
-* |      |     ###################|############################|  |
-* |      +===+=+=======+=====+====+====+=======+========+======+  |
-* |      | c | |       | amd |    |    | intel |         |#####|  |
-* |      +---+ |       .-----.    |    .-------.         |#####|  |
-* |      |     | counter          | fixed_counters       |#####|  | 
-* |      |     +------------------+----------------------+#####|  |
-* |      |     | ctrls            | arch_counters        |#####|  |
-* |      |     +=====+========+===+----------------------+#####|  |
-* |      |     |     | regs[] |  :| global_ctrl          |#####|  |
-* |      |     |     +--------.  :+----------------------+#####|  |
-* |      |     |struct           :| global_ovf_ctrl      |#####|  |
-* |      |     |xen_pmu_cntr_pair:+----------------------+#####|  |
-* |      |     |[counters]       :| global_status        |#####|  |
-* |      |     |                 :+----------------------+#####|  |
-* |      |     |                 :| fixed_ctrl           |#####|  |
-* |      |     |                 :+----------------------+#####|  |
-* |      |     |                 :| ds_area              |#####|  |
-* |      |     |                 :+----------------------+#####|  |
-* |      |     |                 :| pebs_enable          |#pad#|  |
-* |      |     |                 :+----------------------+#####|  |
-* |      |     |                 v| debugctl             |#####|  |
-* |      |     |##################+=======+========+=====+#####|  |
-* |      |     |##################|       | regs[] | :[0]|#####|  |
-* |      |     |##################|       +--------. :   |#####|  |
-* |      |     |##################| uint64_t         :   |#####|  |
-* |      |     |##################| [fixed_counters] :   |#####|  |
-* |      |     |##################|                  :   |#####|  |
-* |      |     |##################|                  :   |#####|  |
-* |      |     |##################| -----------------:   |#####|  |
-* |      |     |##################|  struct          :   |#####|  |
-* |      |     |##################| xen_pmu_cntr_pair:   |#####|  |
-* |      |     +==================+ [arch_counters]  :   +=====+  | 
-* |      |                        |                  :   |     |  |
-* |      |                        |                  v   |     |  |
-* |      |                        +======================+     |  |
-* |      +=====================================================+  |
-* +==========================+=================================+  |
-* |############################################################|  |
-* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  :
-* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  :
-* |############################################################|  | PAGE_SIZE
-* +=========+==================================================+ <.
+*                ╭─────────────────────╮
+*                │ struct xen_pmu_data │
+* ╒══════════════╧═════════════════════╧═══════════════════════╕ ◁╮
+* │ vcpu_id                                                    │  │
+* ├────────────────────────────────────────────────────────────┤  │
+* │ pcpu_id                                                    │  │
+* ├────────────────────────────────────────────────────────────┤  │
+* │ domain_id                                                  │  │
+* ├────────────────────────────────────────────────────────────┤  │
+* │██pad███████████████████████████████████████████████████████│  │
+* ╞════╤═╤═══╤══════════════════╤══════════════════════════════╡  │
+* │ pmu│ │ r │ regs             │██pad█████████████████████████│  │
+* ├────╯ ├───╯ (xen or guest)   │██████████████████████████████│  │
+* │      ╞══════════════════════╧══════════════════════════════╡  │
+* │      │ pmu_flags                                           │  │
+* │      ╞═══╤════════════════════╤════════════════════════════╡  │
+* │      │ l │ lapic_lvtpc        │████████████████████████████│  │
+* │      ├───╯ ███████████████████│██pad███████████████████████│  │
+* │      │     ███████████████████│████████████████████████████│  │
+* │      ╞═══╤═╤═══════╤═════╤════╪════╤═══════╤═══════════════╡  │
+* │      │ c │ │       │ amd │    │    │ intel │         │█████│  │
+* │      ├───┘ │       ╰─────╯    │    ╰───────╯         │█████│  │
+* │      │     │ counter          │ fixed_counters       │█████│  │
+* │      │     ├──────────────────┼──────────────────────┤█████│  │
+* │      │     │ ctrls            │ arch_counters        │█████│  │
+* │      │     ╞═════╤════════╤═══├──────────────────────┤█████│  │
+* │      │     │     │ regs[] │  ┆│ global_ctrl          │█████│  │
+* │      │     │     └────────╯  ┆├──────────────────────┤█████│  │
+* │      │     │struct           ┆│ global_ovf_ctrl      │█████│  │
+* │      │     │xen_pmu_cntr_pair┆├──────────────────────┤█████│  │
+* │      │     │[counters]       ┆│ global_status        │█████│  │
+* │      │     │                 ┆├──────────────────────┤█████│  │
+* │      │     │                 ┆│ fixed_ctrl           │█████│  │
+* │      │     │                 ┆├──────────────────────┤█████│  │
+* │      │     │                 ┆│ ds_area              │█████│  │
+* │      │     │                 ┆├──────────────────────┤█████│  │
+* │      │     │                 ┆│ pebs_enable          │█pad█│  │
+* │      │     │                 ┆├──────────────────────┤█████│  │
+* │      │     │                 ▽│ debugctl             │█████│  │
+* │      │     │██████████████████╞═══════╤════════╤═════╡█████│  │
+* │      │     │██████████████████│       │ regs[] │ ┆[0]│█████│  │
+* │      │     │██████████████████│       └────────╯ ┆   │█████│  │
+* │      │     │██████████████████│ uint64_t         ┆   │█████│  │
+* │      │     │██████████████████│ [fixed_counters] ┆   │█████│  │
+* │      │     │██████████████████│                  ┆   │█████│  │
+* │      │     │██████████████████│                  ┆   │█████│  │
+* │      │     │██████████████████│ ─────────────────┆   │█████│  │
+* │      │     │██████████████████│  struct          ┆   │█████│  │
+* │      │     │██████████████████│ xen_pmu_cntr_pair┆   │█████│  │
+* │      │     ╘══════════════════╡ [arch_counters]  ┆   ╞═════╡  │
+* │      │                        │                  ┆   │     │  │
+* │      │                        │                  ▽   │     │  │
+* │      │                        ╘══════════════════════╛     │  │
+* │      ╘═════════════════════════════════════════════════════╡  │
+* ╞════════════════════════════════════════════════════════════╡  │
+* │████████████████████████████████████████████████████████████│  │
+* ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
+* ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
+* │████████████████████████████████████████████████████████████│  │ PAGE_SIZE
+* ╘════════════════════════════════════════════════════════════╛ ◁╯
 */
 
 #endif /* __XEN_PUBLIC_ARCH_X86_PMU_H__ */
-- 
2.47.1


