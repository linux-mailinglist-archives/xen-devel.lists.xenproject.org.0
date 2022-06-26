Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B749A55B426
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 23:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356136.584182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXm-0003H0-Ex; Sun, 26 Jun 2022 21:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356136.584182; Sun, 26 Jun 2022 21:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXm-0003F8-C9; Sun, 26 Jun 2022 21:11:46 +0000
Received: by outflank-mailman (input) for mailman id 356136;
 Sun, 26 Jun 2022 21:11:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3P=XB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o5ZXl-0002ze-MG
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 21:11:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9534bc44-f594-11ec-b725-ed86ccbb4733;
 Sun, 26 Jun 2022 23:11:45 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id ay16so15177748ejb.6
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 14:11:45 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 cq12-20020a056402220c00b004356b8ad003sm6367556edb.60.2022.06.26.14.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 14:11:44 -0700 (PDT)
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
X-Inumbo-ID: 9534bc44-f594-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/ZGiB26wkc6ln+SQl2Q+9yHj6lnaAaAN9Iu/vPcQ1g=;
        b=c/Dx4jLVI71H6lIglKPncvyiMVNDcz+lkyCneD8pZ0VtZmZafuJUi1+Q5Qt6BHFiKh
         G6vsEExUx4P0si3ydzfXuDuki08c0yI8CnkuJ98DvUKU0uSDi7QkQ+Ppz/9UvJC8yky7
         CCH+ioHJhpJAtINMlqymaglWBHHFLfU9ACjtDm7X+qJ/I1XKsv+Un1I2Lum0s4d+GFDA
         upMuIytPTF7UPt4ZOnCpS6SApPR57tNEVpX0UXC8AmXRfTNz78rYH2upOG5BFXjsGaVR
         Dc7/7J6EBQifZWCxH4EozAUio1gL72jC2uvgu8CKHaRHbbNwp8vIECIXU68d/mZUpjMi
         2elQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1/ZGiB26wkc6ln+SQl2Q+9yHj6lnaAaAN9Iu/vPcQ1g=;
        b=RFkzZQAoVpcdhbm23Tb0vnwJHc2IxBiDSrAmAlpNiK6suAHzTQugzqO6kNY5bO0Hug
         xAcBP8lDfsD5dSJteRq+AUjFFzGh65w2BkiJm080nTqrVmNergy4ZUo1FmLPoCmSEOlk
         vd6IFWhG1jGqC+tiHiLwVD03XS65KfAF/K3w02cwwSgGkSAEmVrIk98a4HDsGk3WG+L5
         dbM0UWw9zLO1Umd7AokeNtwIJX4LLnBvOMbQfSGBbVfsBLicyX+SCFp+Dy7mAw7/e6fR
         gvRyxcPzl4DbY/hSmva6RSr58yMGXZP/bJ65tYvsBquJRjff+lDo95xupBykNquRMaan
         WMxg==
X-Gm-Message-State: AJIora93uM8t27pGkdjHecPaSH3kUjM6MNm2Z0jzw+Xvxe43SrZHKhJ0
	wMLXrYVLHlRhAGtgQmXYAqmfVi9GcXQ=
X-Google-Smtp-Source: AGRyM1v8+NAGMGdbj+ckdz0wTt/lfqZgApC1gUcOB5R7jZe3PmGOCbeCDS/tOeQiWv+e7nDFBOe4Wg==
X-Received: by 2002:a17:907:c0a:b0:726:22b1:9734 with SMTP id ga10-20020a1709070c0a00b0072622b19734mr9850234ejc.195.1656277904377;
        Sun, 26 Jun 2022 14:11:44 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/5] xen/common: page_alloc: Fix MISRA C 2012 Rule 8.7 violation
Date: Mon, 27 Jun 2022 00:11:27 +0300
Message-Id: <20220626211131.678995-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626211131.678995-1-burzalodowa@gmail.com>
References: <20220626211131.678995-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variables page_offlined_list and page_broken_list are referenced only
in page_alloc.c.
Change their linkage from external to internal by adding the storage-class
specifier static to their definitions.

This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
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


