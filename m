Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF098FED7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810096.1222824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVQ-0000CG-Pk; Fri, 04 Oct 2024 08:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810096.1222824; Fri, 04 Oct 2024 08:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVP-0008Ra-OO; Fri, 04 Oct 2024 08:17:43 +0000
Received: by outflank-mailman (input) for mailman id 810096;
 Fri, 04 Oct 2024 08:17:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdVL-0005Vm-SQ
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:17:39 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ec93ce4-8229-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 10:17:39 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso27407841fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:17:39 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102858a4sm189829366b.49.2024.10.04.01.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:17:38 -0700 (PDT)
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
X-Inumbo-ID: 1ec93ce4-8229-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029859; x=1728634659; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwL1uhJmN7KffHDYwBpDV67hA/1FIcvi3fYvuqYkXWg=;
        b=QvTFIBySjIHElGEs46DN3Axi783Y8KEchjkS//cuvo2JSXN3q8oj/8+fndnaIDnEHj
         L3WgfJEGRiWgg9UoYCoHlM9+aIliW3XnKGwVluJh+MjP4sgTheyssHUKo4WeKVP8tFA6
         OZcVXbKeYJY+BQB1YWfhYTcjDczfbNobyDSS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029859; x=1728634659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwL1uhJmN7KffHDYwBpDV67hA/1FIcvi3fYvuqYkXWg=;
        b=qWZAf20wG9TN8NITnnRsiRe5TqysXmBIB1LetQKRrXYs596xysI8MIMk2XZ1NDRg+z
         ygrN6b8itxkjAOwo8ULh1b0t7Nj9K98FBLx7vqM6afNh9RjR7ys4jcVWk14o/Hhih7mG
         2KLB0c6biw+wX9Y7BHGMEL4PwBAul7L7RfCM2wutyN2X2X4TUWikl8fgnO0ej+lntz/5
         CV+v2YrHJY94r7/E4v5VnXi42FJoCDMK9SGQpMN2Rp1Hk2Nzm0PS7n2JM6wNe7fmsR/6
         xp5SW2iaL03F22RzImygYKk9G844/vtDXc1UxkT3RS8pmhHSiPYSZ9OxDt9aYlA9knqr
         8NxQ==
X-Gm-Message-State: AOJu0Yw6qKL1Clx/4VRz37U3yLfB5vhx27DukxueFTdgzbBRYtSGNbMz
	3PkQK9Xo1n3a6Nv7mIFVKv072UTVfg7PCGapscskWaj2S7Ct9f3NGZDuaT+SqZR7KX82g9AKO/v
	P
X-Google-Smtp-Source: AGHT+IFQXJm+VpGpBCeLngcFnt5tihTs8eI9yBxFhgHfLWlPIRs5tn6CeveFOaWvYQ+McywChJ8EYg==
X-Received: by 2002:a05:651c:b0b:b0:2fa:f5f9:4194 with SMTP id 38308e7fff4ca-2faf5f94416mr8245731fa.27.1728029858634;
        Fri, 04 Oct 2024 01:17:38 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v3 16/19] xen: Update header guards - Scheduling
Date: Fri,  4 Oct 2024 09:17:10 +0100
Message-Id: <20241004081713.749031-17-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004081713.749031-1-frediano.ziglio@cloud.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
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


