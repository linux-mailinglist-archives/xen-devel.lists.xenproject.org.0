Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AAF98EF11
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809340.1221715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKo3-0008BD-3F; Thu, 03 Oct 2024 12:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809340.1221715; Thu, 03 Oct 2024 12:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKo2-0007py-KM; Thu, 03 Oct 2024 12:19:42 +0000
Received: by outflank-mailman (input) for mailman id 809340;
 Thu, 03 Oct 2024 12:19:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnw-00043W-OA
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:36 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0fea033-8181-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 14:19:36 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a93b2070e0cso101038966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:36 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:35 -0700 (PDT)
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
X-Inumbo-ID: c0fea033-8181-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957975; x=1728562775; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwL1uhJmN7KffHDYwBpDV67hA/1FIcvi3fYvuqYkXWg=;
        b=BJw58PAKT31hj83RKP9nmYCqHQX2AN/AC4676ekDKMXouYk5fW/gqHbiQtkCT5CqEi
         iJ4t7RmRPWo+ExsqxfbRLzNS1IgL5Eq5pfNkv8ptSUqFplEH/DB9TxGuEnTE3U73mLSd
         prNpPCijdgfHlYu2hAu00+fQBvCkauiOD6I2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957975; x=1728562775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwL1uhJmN7KffHDYwBpDV67hA/1FIcvi3fYvuqYkXWg=;
        b=pYjs3ivVTaSmdUdcuVb7LapbJfR+Vg0XEi7++iOaSTCfvm4cJTzpotVQiJ+mTCtLbX
         9NJN0hp78S91E5ZXAV3sYHj8NYgHmbvmqUnf7RSQnIseLz374f8DtuOAWSnP1sqzFowG
         KP8Bd9SFbCl2sn2UdbCnqe+CO7/vyX+IPlok+6AjwVaJiv3ELB9YgbzXp5yEbgzjf4dh
         27Mugj54m9Qx6wHUY00xyRP3zbE1rfDecuLu8M1qAQOXWP9QffRPyw2hhA24lPU7Mf63
         Na4HjWyni63E4I/sphS0LNo/L7YNWoSqnCeFZrhk8gocZk+Qo78gpqTk7uxu2hcbzTKv
         38ig==
X-Gm-Message-State: AOJu0YykMsI97BmVnCtvWRpOm5luU5P3mUTVGpKylz+hCmGQhK6/Np85
	qXacFz9KWXMGEANCrJFTjBjuCxtub2sAbS/vHiLrCUmApupComI/w8F5lq+r/YsESvTgQQvBYOG
	m
X-Google-Smtp-Source: AGHT+IGszONFKy6nKyv+TWrRRRoznyNuVBvnbneNZw/I4ybkDE9AU52qzBaBnLVx48hEwl+4Wepl8w==
X-Received: by 2002:a17:907:6e8a:b0:a8a:792c:4116 with SMTP id a640c23a62f3a-a98f834cdf6mr566471266b.40.1727957975316;
        Thu, 03 Oct 2024 05:19:35 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH 17/20] xen: Update header guards - Scheduling
Date: Thu,  3 Oct 2024 13:19:05 +0100
Message-Id: <20241003121908.362888-18-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to scheduling.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/sched/private.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index c0e7c96d24..02ab905412 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -5,8 +5,8 @@
  * Portions by Mark Williamson are (C) 2004 Intel Research Cambridge
  */
 
-#ifndef __XEN_SCHED_IF_H__
-#define __XEN_SCHED_IF_H__
+#ifndef COMMON__SCHED__PRIVATE_H
+#define COMMON__SCHED__PRIVATE_H
 
 #include <xen/err.h>
 #include <xen/list.h>
@@ -666,4 +666,4 @@ void cpupool_put(struct cpupool *pool);
 int cpupool_add_domain(struct domain *d, unsigned int poolid);
 void cpupool_rm_domain(struct domain *d);
 
-#endif /* __XEN_SCHED_IF_H__ */
+#endif /* COMMON__SCHED__PRIVATE_H */
-- 
2.34.1


