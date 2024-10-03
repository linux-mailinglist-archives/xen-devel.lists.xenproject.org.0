Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8E198F5A6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809695.1222252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7F-0001VZ-94; Thu, 03 Oct 2024 17:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809695.1222252; Thu, 03 Oct 2024 17:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7E-0001DR-Cm; Thu, 03 Oct 2024 17:59:52 +0000
Received: by outflank-mailman (input) for mailman id 809695;
 Thu, 03 Oct 2024 17:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ7A-0006hm-LJ
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:48 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 477a2eb7-81b1-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 19:59:48 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so421394166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:48 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:47 -0700 (PDT)
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
X-Inumbo-ID: 477a2eb7-81b1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978387; x=1728583187; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwL1uhJmN7KffHDYwBpDV67hA/1FIcvi3fYvuqYkXWg=;
        b=jsujU3eWnBW6phFd7puoD4i2FNrE5TAOTnYTSAeZgbuLy1IAv3CPnBpgZlbF47xNUe
         PjWhZ/5dadbk0UCF77ouBNjP22Mg+elzmh0s0vKBu0k/JVlN/f2Hf7gdt/EsIrTUtNQM
         PQ1/lb1W6nm9bJFGMt5qInzQRZ/rkBqkvAcI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978387; x=1728583187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwL1uhJmN7KffHDYwBpDV67hA/1FIcvi3fYvuqYkXWg=;
        b=qPHz8tdrdfapzrmi/YswdQS20WgTALHFJ5NTMa3GmidqEl1dtKuGXFXlh3jkw6N8m7
         ARz7iYxbPftI4e9ZxZGJnPwM/mM6scTe4K7WOhv7croqJMpmjwFjzZxopwFByVNDbKDJ
         UHpwEkWGzeiLiO+QC7DQBY6n/UJHu+Qoj/uh7/PiiLXzvUmHXzwtLtXADYzERpD1IfX3
         qzVjBW0L+Lwd6F/XByD1edIp8HHYB/Xnn0oapwsmrNIOmVehw/vLE+NanR9QB7uC6HbI
         Cs4UBrPEXx/6uVGBrApavfVdPqJhDb3murZq8EauzgovnSqqxT4jE0fi4Kqh4mfm2J4d
         K80Q==
X-Gm-Message-State: AOJu0YyNu/PmiL1zUa7Iud6v/u/iObfqGzXc/1e+4iwcy7/psan8XrhW
	4dCExGIbBCzSlAqz7Tu4ovrOTtA6vnpieeaanHOm4jv1VBpGkdHRR9RZTXLc2lsq4LiRlISwEfC
	k
X-Google-Smtp-Source: AGHT+IH/jMp30CH9hhi8yh0Pz2E1NauSjcKdNTGYgrC2kz1hvNjODmd8+FR/FgfWmofB1vCALdPbcw==
X-Received: by 2002:a17:907:9806:b0:a8d:5f69:c839 with SMTP id a640c23a62f3a-a990a05ee89mr508082266b.15.1727978387337;
        Thu, 03 Oct 2024 10:59:47 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 16/19] xen: Update header guards - Scheduling
Date: Thu,  3 Oct 2024 18:59:16 +0100
Message-Id: <20241003175919.472774-17-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
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


