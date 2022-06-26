Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0492655B425
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 23:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356139.584215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXv-0004DK-Dd; Sun, 26 Jun 2022 21:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356139.584215; Sun, 26 Jun 2022 21:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXv-00049R-8k; Sun, 26 Jun 2022 21:11:55 +0000
Received: by outflank-mailman (input) for mailman id 356139;
 Sun, 26 Jun 2022 21:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3P=XB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o5ZXt-00045G-Eu
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 21:11:53 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 999fc724-f594-11ec-bd2d-47488cf2e6aa;
 Sun, 26 Jun 2022 23:11:52 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id fd6so10484717edb.5
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 14:11:52 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 cq12-20020a056402220c00b004356b8ad003sm6367556edb.60.2022.06.26.14.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 14:11:51 -0700 (PDT)
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
X-Inumbo-ID: 999fc724-f594-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xj9geaDYiDJeXi2P/hZ4T8+FfXgCNZI+BFN5XSupO2M=;
        b=AOaGcV0vT+0cYRABSoUay9LVQ06yx+0+VUBptJY1W5sEO+rs2OrtIw+McAnr97zO/m
         NUXbavyrIvEqQhreBluaN+AEb/IzXjcsf4FOvGB8b10MvGxOMfqQ0wG3D4Q2tD7+V+VZ
         d277lwcgIdGwFhI1iVPx2S7cC306oVHpLJiSwGdzXYLqjo6fbu/uMFxNP99beGSuuwQQ
         IwLkMXw/PYcUcj0LY+GaETqENcqmC5AvLkX+oz0TTMpRHZsTRz7fyU7C5dJcsL0GoUzR
         m4NHKj2JTW/P65gbfsFqsjfv7lvBrZ9ibfTHZhX0UuS5yUEj6rLO/6IGh3sT5+q11mgt
         z/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xj9geaDYiDJeXi2P/hZ4T8+FfXgCNZI+BFN5XSupO2M=;
        b=kto4FgTVuLRE0D3FvAHcIpOIWDPlTKpw8BkY20qi6av0fGzYXOTUtKVEINA6GuIYiw
         LRPnGzk8pokcZNgmbWqNqCXCgrJvFNJw3B22ii8UMOncKp/pwQ3jl2NPvkZk1mgVU9+f
         cSdZRsLfqdcA2iG4yBHLXkK0zRzDt5RZ1zgmWVEdbZU0CSGn+56ortGTwmUncSW9NN0a
         5mzVzkNMLBIretDfmmgt2AFRAuz3q3s3yiD+3fRiIrFmko0J+pDN8F8f7eBKYpYfcX2y
         qS0mcsJE7dXpcorcHkdSBiS/oliuyjXYPDPxLVHjz7AsAIAwG+X66a25FjM4ec/FRmep
         mKjw==
X-Gm-Message-State: AJIora/BubJefBRgQ2UEUWlmZ19xoFY9W4exLPKLSw96u6qaAG5C00ZA
	o+2LQYvp8AVvOyyDBxeYsvgZ++UkETE=
X-Google-Smtp-Source: AGRyM1suuYGZAMFsKza4q0oXYNza4EVXS2SZIk6Rq2XRGJ6H8ZAgjiEKy6qsbFUeaB2/R+gyoXWuDA==
X-Received: by 2002:a05:6402:320f:b0:435:7236:e312 with SMTP id g15-20020a056402320f00b004357236e312mr12957410eda.115.1656277911895;
        Sun, 26 Jun 2022 14:11:51 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 4/5] xen/sched: credit: Fix MISRA C 2012 Rule 8.7 violation
Date: Mon, 27 Jun 2022 00:11:30 +0300
Message-Id: <20220626211131.678995-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626211131.678995-1-burzalodowa@gmail.com>
References: <20220626211131.678995-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-cpu variable last_tickle_cpu is referenced only in credit.c.
Change its linkage from external to internal by adding the storage-class
specifier static to its definitions.

This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
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


