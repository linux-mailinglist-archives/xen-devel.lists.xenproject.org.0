Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA1255E592
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 17:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357163.585625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Ckv-0000ZF-HV; Tue, 28 Jun 2022 15:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357163.585625; Tue, 28 Jun 2022 15:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Ckv-0000WB-DH; Tue, 28 Jun 2022 15:03:57 +0000
Received: by outflank-mailman (input) for mailman id 357163;
 Tue, 28 Jun 2022 15:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VwHr=XD=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o6Ckt-0000FN-Gr
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 15:03:55 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86b8b540-f6f3-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 17:03:54 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id r18so10128764edb.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jun 2022 08:03:54 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 k14-20020aa7c04e000000b00431962fe5d4sm9785589edo.77.2022.06.28.08.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:03:51 -0700 (PDT)
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
X-Inumbo-ID: 86b8b540-f6f3-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M0SruDIC7tILE6Tp9AaAgZ7Os1HI5vkvwVQqezZqtgw=;
        b=a4IZlozpkE6hL7/PA4FYmLFksQ8QRj59XbyHnYcG/KDI6EtbEBSe41T+C6emSXeJgv
         BfTlI83zKQhiWvbSM9ymqFnrLdR5yma/eMWMEUOiKBEhEVbpNhmTpNBqxYN2EtJzURJ+
         70SaXtg7+cbkyGwoWHL1kkd0wkcevobiB4jS1UEUbXkZVBN6cX1AiHG6zSINbbONExI0
         w62IAShur36tUBhSqhzqy2c0xvNv+ZqSKJircS5eWgKmTsjv2KvVzU46bfYpSexMAA3r
         IZNDT5OdbzZhGSgtgLHwXipapVZ2KjyErSJeZUILqGjGjJavIlDJQuUOm1o5xgxqsg4L
         wmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M0SruDIC7tILE6Tp9AaAgZ7Os1HI5vkvwVQqezZqtgw=;
        b=HuNWgw3yV8LtD/NrXrM+p0cCBVxZYdbRmcOH6xXfrsJNveWW5laHmIRj3x9wsAUh4X
         5EQjFrAFWyJnt/sOwcOIwJ31YTzSRWAs9Ph1YncCS7c8p17V4bESxsOlPx5kUgMSrx6L
         cGm6jptbxrY/Cqo3dGroOYFB8WJ1HFJkkCnbIyK2sVivEU2zmuG2ZMsHHfiYsnQqsLC6
         MWByufLIHwYbwr/XF7bzlRbyTZlpm2+BSXMXMAtYnYErIhnapprJbimwBejH8Mfyk9ms
         TZsbXg00kfIvyjT7/HgpIlxa40peMyksp3v9Rx9ZwY6smUsSGl/YkDZabGYS//l/iQwE
         paEw==
X-Gm-Message-State: AJIora8IurRIN48otfewLdTFkOs6muNNApz8vE4ygZdNuAM3JDL8TX4d
	tzARaKlJRnfm8nVN47Y3iyWTzfTkZso=
X-Google-Smtp-Source: AGRyM1u3PNIN1RneM/j5WWwXSiJuUHYoy2v7tnHRb8olj21vskIYCn1u+vLDS7eueUqi14NxWAjQKw==
X-Received: by 2002:a05:6402:50c7:b0:435:923b:9b23 with SMTP id h7-20020a05640250c700b00435923b9b23mr24377774edb.336.1656428632549;
        Tue, 28 Jun 2022 08:03:52 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/5] xen/common: page_alloc: Fix MISRA C 2012 Rule 8.7 violation
Date: Tue, 28 Jun 2022 18:03:33 +0300
Message-Id: <20220628150337.8520-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628150337.8520-1-burzalodowa@gmail.com>
References: <20220628150337.8520-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variables page_offlined_list and page_broken_list are referenced only
in page_alloc.c.
Change their linkage from external to internal by adding the storage-class
specifier static to their definitions.

Also, this patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation
warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
- replace the phrase "This patch aims to resolve indirectly a MISRA C 2012
  Rule 8.4 violation warning." with "Also, this patch aims to resolve
  indirectly a MISRA C 2012 Rule 8.4 violation warning."

 xen/common/page_alloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 000ae6b972..fe0e15429a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -235,9 +235,9 @@ static unsigned int dma_bitsize;
 integer_param("dma_bits", dma_bitsize);
 
 /* Offlined page list, protected by heap_lock. */
-PAGE_LIST_HEAD(page_offlined_list);
+static PAGE_LIST_HEAD(page_offlined_list);
 /* Broken page list, protected by heap_lock. */
-PAGE_LIST_HEAD(page_broken_list);
+static PAGE_LIST_HEAD(page_broken_list);
 
 /*************************
  * BOOT-TIME ALLOCATOR
-- 
2.34.1


