Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19A05BF362
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 04:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409645.652654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oapHo-0007EB-Bs; Wed, 21 Sep 2022 02:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409645.652654; Wed, 21 Sep 2022 02:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oapHo-0007CL-71; Wed, 21 Sep 2022 02:16:28 +0000
Received: by outflank-mailman (input) for mailman id 409645;
 Wed, 21 Sep 2022 02:16:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2FXW=ZY=gmail.com=cgel.zte@srs-se1.protection.inumbo.net>)
 id 1oapHm-0007CF-QP
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 02:16:26 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 642cc364-3953-11ed-bad8-01ff208a15ba;
 Wed, 21 Sep 2022 04:16:25 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so12728457pjm.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 19:16:25 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a623201000000b0053e9ecf58f0sm661954pfy.20.2022.09.20.19.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 19:16:23 -0700 (PDT)
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
X-Inumbo-ID: 642cc364-3953-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=GnHGtgHj033COJKahffZStPIaXE02OICjJM2Z9aEkfE=;
        b=ArRr74et4U1zLmXiJOghTrTMnedfdbF7K14oBBpNIc8qTkREGPO5v04fI1k1kbyrLx
         aE9AvyteVh2+qhO2Mdb8OF0GMzIxHqqYA7AHgEMHz8m3ZBG0PwqpaX4uoFIQTg10zUkz
         MwCcQnpBOkDxcL5Yt6/9QvFFjyx7CVdOExmelt+4nQuFpw3m7saN/EepKWFmT1xTW4Wv
         coNsRQJPCjqBxC2R2jbd/LOVOzubUoQ1Gm37yLcX/MfefYirEknZw/ktLHoEDM/P0J76
         fX0JWbhPys/CYrKJKqNQ6liKGabibcgJBuAF6GH29Vno10Zq+ui/epuVMeLTYcPMphfm
         nFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=GnHGtgHj033COJKahffZStPIaXE02OICjJM2Z9aEkfE=;
        b=2Okv56k4AU5aNiRCUQtAntEt/20qOz/5DzGmsIwHWE5zwhZyq9OZHF5SSvdo8cRNib
         dNGwMrH0491wt4+84mKwxZ1l9C7yL0BV7TrQpjudKOIsrMxt5o6AlyRr5wE56GJ+ekdZ
         LuTXqo0GJWq3e9pIGjl+F4eRY+xoSR++lPJd3bY5J8uEwWybk206Ln8ClZ9X3ly5wciv
         6QGpE5uaMcZK7t3EdZZNQqDCt6SseCSNLlHVTHIUi/8xPUhdQfROgn6fqauJJ+JvLmnG
         C4yCTmlQpbDiFIG+u//OWAQ0r8A+e5VrI70IPF3FrJKjZOuIkogs/2x1LegdrSeTtbgp
         lB3g==
X-Gm-Message-State: ACrzQf34Oc3oa7Xs0A3aVTqTqMKN6rOP6nTRVaYAkHKuYywTFdhrcxD4
	cPoGCOPVEwiPJS4U+6X23GoapeOW9aQ=
X-Google-Smtp-Source: AMsMyM7MRypGCQbUxoyrc6WNFpMb9PFhoALdU/NO7Lw8H72HCSj9ZvzMDFM2cHVsH6lG7m+CxkybYQ==
X-Received: by 2002:a17:90a:8909:b0:203:ab27:a41 with SMTP id u9-20020a17090a890900b00203ab270a41mr7073542pjn.163.1663726584165;
        Tue, 20 Sep 2022 19:16:24 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: wei.liu@kernel.org
Cc: paul@xen.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] xen-netback: use kstrdup instead of open-coding it
Date: Wed, 21 Sep 2022 02:16:17 +0000
Message-Id: <20220921021617.217784-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minghao Chi <chi.minghao@zte.com.cn>

use kstrdup instead of open-coding it.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/net/xen-netback/xenbus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index e85b3c5d4acc..c1ba4294f364 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -865,13 +865,12 @@ static int connect_data_rings(struct backend_info *be,
 	 * queue-N.
 	 */
 	if (num_queues == 1) {
-		xspath = kzalloc(strlen(dev->otherend) + 1, GFP_KERNEL);
+		xspath = kstrdup(dev->otherend, GFP_KERNEL);
 		if (!xspath) {
 			xenbus_dev_fatal(dev, -ENOMEM,
 					 "reading ring references");
 			return -ENOMEM;
 		}
-		strcpy(xspath, dev->otherend);
 	} else {
 		xspathsize = strlen(dev->otherend) + xenstore_path_ext_size;
 		xspath = kzalloc(xspathsize, GFP_KERNEL);
-- 
2.25.1

