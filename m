Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A890E32525C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89812.169544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWe-0006P7-Uc; Thu, 25 Feb 2021 15:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89812.169544; Thu, 25 Feb 2021 15:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWe-0006Oa-Q4; Thu, 25 Feb 2021 15:26:00 +0000
Received: by outflank-mailman (input) for mailman id 89812;
 Thu, 25 Feb 2021 15:25:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJgK=H3=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFIWc-0006Ig-Ts
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:25:58 +0000
Received: from mail-ot1-x332.google.com (unknown [2607:f8b0:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4b25551-09c9-4f5c-a34e-49f38da048f8;
 Thu, 25 Feb 2021 15:25:50 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id b8so5998917oti.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 07:25:50 -0800 (PST)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id l4sm1047292ooq.33.2021.02.25.07.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 07:25:49 -0800 (PST)
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
X-Inumbo-ID: b4b25551-09c9-4f5c-a34e-49f38da048f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0m5dJDerLXkuZbIjHhNT28vY8++JYdZl1jR5h36Ds1M=;
        b=DPnRPwDD4srYuosEWwZF3X8aPV2fQkhNjtgGjLmOSVKFpg6e9ScPHU+CtJrOvlXwjK
         zw6DX/D0nL/q2obdwPHzuDL4I27RSfmWPmW7dsGYwX5TtueyQyyiDOqR1SOQQzL3y762
         2knRf9Kc0H6zNVVcXXk5uW/n8RcEcugtxrAcSUJZA9NGh3SeRVTqof8mt5GVWenAiwUK
         tCC8EIuctNupMgWq/rkvVcbbBDHZopFB/tvVVAlIvK2PxCy8NwV3KNu0BOXJwgZfiT3D
         ScPW8gfhhjeipK9is9hwKEFET8u2n8gSHBqRnQiCjlU5uaiw1YITMfyh01iB41hKM1P8
         G0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0m5dJDerLXkuZbIjHhNT28vY8++JYdZl1jR5h36Ds1M=;
        b=Ybu4VCE1qo7FESvlUZZWPzZST6MVoChwUMA+yOve+7yuWiSfgcez3VJDkKh+pMiy/4
         ImK4Ua1kNl6wNKdWER870o3oKFaiJ8SZOaZozM5FHdepxIdkT7VXAVUQm/iZXn3InPoV
         HDXFFySmetX664V7+hb+vuDUA9G3vN+cbKkuefJeThlfcATEnpuse2cTDEN++No1QMEq
         I0UvkQ+gjz2B0h666AXeTe2oRmK1E3kAuUdWuozPZwAcjRZgIgM67BD4PsN4aPmRZfwn
         OW6nI1ZtjoE6V5gY54WAvoXa+xArg1DTmP+suA/UnygLZN1lbt+9rtttcOJKa3voyq8k
         r8Kw==
X-Gm-Message-State: AOAM533X0nSVce2LmHuf1urYYP77fPEW4m8d1RgV/dEptATBBzEXu89E
	1nMS6ce0xzea0qe7Zwql+dOciOOggD0I5iNp
X-Google-Smtp-Source: ABdhPJwe4ud8EAoypaTz0SETf6ZK7rHsSPipfZl1/lJrhmpEksqhqzmEj9wNWFTfFbHKwjYYWna+aA==
X-Received: by 2002:a05:6830:11c7:: with SMTP id v7mr2694660otq.245.1614266749291;
        Thu, 25 Feb 2021 07:25:49 -0800 (PST)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH for-next 3/6] xen/sched: Fix build when NR_CPUS == 1
Date: Thu, 25 Feb 2021 08:24:02 -0700
Message-Id: <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614265718.git.connojdavis@gmail.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return from cpu_schedule_up when either cpu is 0 or
NR_CPUS == 1. This fixes the following:

core.c: In function 'cpu_schedule_up':
core.c:2769:19: error: array subscript 1 is above array bounds
of 'struct vcpu *[1]' [-Werror=array-bounds]
 2769 |     if ( idle_vcpu[cpu] == NULL )
      |

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 xen/common/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9745a77eee..f5ec65bf9b 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2763,7 +2763,7 @@ static int cpu_schedule_up(unsigned int cpu)
     cpumask_set_cpu(cpu, &sched_res_mask);
 
     /* Boot CPU is dealt with later in scheduler_init(). */
-    if ( cpu == 0 )
+    if ( cpu == 0 || NR_CPUS == 1 )
         return 0;
 
     if ( idle_vcpu[cpu] == NULL )
-- 
2.27.0


