Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9355E594
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 17:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357166.585658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Cl2-0001Sw-Gm; Tue, 28 Jun 2022 15:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357166.585658; Tue, 28 Jun 2022 15:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Cl2-0001PR-Bw; Tue, 28 Jun 2022 15:04:04 +0000
Received: by outflank-mailman (input) for mailman id 357166;
 Tue, 28 Jun 2022 15:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VwHr=XD=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o6Cl1-0001MY-2P
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 15:04:03 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8afb4271-f6f3-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 17:04:01 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id c65so18004566edf.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jun 2022 08:04:01 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 k14-20020aa7c04e000000b00431962fe5d4sm9785589edo.77.2022.06.28.08.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:04:00 -0700 (PDT)
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
X-Inumbo-ID: 8afb4271-f6f3-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IoisOmV2uP3Ir6MH/g/SxzICNH4UZsoy3K2WoiWM8Iw=;
        b=EVvItujdDdLUU1KM6UOtMsojrD58ruvnpsKIenfvsus/T3FnBl1Vb8Y9j33kwFb7vh
         sRF06HwvHGEKxWJBEVwxHX2LpyFJO00/uoeILCqtaU5XDBdbdgWlo1QDrOxw8cNO/r2R
         W3pccvCq6cyibp4tzdFrwXpo1x+0xfhHYb6y/+JEgQhajbguOE6nC9DDsR0uxEK8UEs2
         +ZG0OZ/Sm04bW9xZlZIxMuHZgiF9/1dFqV7VcI4ginV4nlC/T+Mrpe1LkBU+X/6GKBlB
         wKPFFImyGl1QbPdC5OINPm34XsxA35LPK/XLl9A16UJ8Hf8tRsW8JaN6CxiwlbX9gPKj
         M26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IoisOmV2uP3Ir6MH/g/SxzICNH4UZsoy3K2WoiWM8Iw=;
        b=uCnXWzMSkPPfhGWUwLsv+rYNqUg0aaVqGgz4Yd2IQaqPVwnaACqOzKS+9zEMGdEzeM
         JiqtKr6SNPudx73pnOxkXFDIddUE761qgNtehYP9s/7oiyrqmpMMOINK1r5Qwobs9FF3
         uKdrErjTXDCePU5U4nvdrdKv10x1dacSdSGAfgJ8wIMa9A3Os2Sxx+Zx/VsF5zHp0YZe
         VjJD3ToK+sfghCacTanOuyZTAdC9A8oxfPxh5FDmjdGVfshHgNG7mHJGahu7bUjAh5P2
         QXbgFPPrSdFAwgV11gY2MmW1jjIl+4KRYp8wUTMSBtesGPEZ4wEbDBfBGKVBNF0Ch9Qu
         nZGA==
X-Gm-Message-State: AJIora88JSQPDwGDj4geHkqBacAbbCld2I7wXrkaJTboxA41MUtPrheP
	oUkJl/Kx72mK2e7Or0bsEFo+sDbz0PQ=
X-Google-Smtp-Source: AGRyM1v+sNPVN8DK0U9kto6+Lpl4hAQnuW0RIELbDg0B3b+egAaDEs9ErMIJgt/8bxOSz3b0bwJQ5A==
X-Received: by 2002:a05:6402:360d:b0:435:710a:2531 with SMTP id el13-20020a056402360d00b00435710a2531mr23651364edb.377.1656428640739;
        Tue, 28 Jun 2022 08:04:00 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 4/5] xen/sched: credit: Fix MISRA C 2012 Rule 8.7 violation
Date: Tue, 28 Jun 2022 18:03:36 +0300
Message-Id: <20220628150337.8520-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628150337.8520-1-burzalodowa@gmail.com>
References: <20220628150337.8520-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-cpu variable last_tickle_cpu is referenced only in credit.c.
Change its linkage from external to internal by adding the storage-class
specifier static to its definitions.

Also, this patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation
warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
- replace the phrase "This patch aims to resolve indirectly a MISRA C 2012
  Rule 8.4 violation warning." with "Also, this patch aims to resolve
  indirectly a MISRA C 2012 Rule 8.4 violation warning."

 xen/common/sched/credit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 4d3bd8cba6..47945c2834 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -348,7 +348,7 @@ static void burn_credits(struct csched_unit *svc, s_time_t now)
 static bool __read_mostly opt_tickle_one_idle = true;
 boolean_param("tickle_one_idle_cpu", opt_tickle_one_idle);
 
-DEFINE_PER_CPU(unsigned int, last_tickle_cpu);
+static DEFINE_PER_CPU(unsigned int, last_tickle_cpu);
 
 static inline void __runq_tickle(const struct csched_unit *new)
 {
-- 
2.34.1


