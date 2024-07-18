Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9352293705B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 23:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760735.1170644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ8O-0003H8-4n; Thu, 18 Jul 2024 21:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760735.1170644; Thu, 18 Jul 2024 21:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ8O-0003Cv-0k; Thu, 18 Jul 2024 21:57:56 +0000
Received: by outflank-mailman (input) for mailman id 760735;
 Thu, 18 Jul 2024 21:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUZ8M-0003BD-6A
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 21:57:54 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8087f40-4550-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 23:57:52 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2eedea0fd88so17559621fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 14:57:52 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a33de74e5sm5294266b.147.2024.07.18.14.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 14:57:50 -0700 (PDT)
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
X-Inumbo-ID: c8087f40-4550-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721339871; x=1721944671; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwFWzFvgZNrEVHvyRBE8cy2ybaA/G1NJTsH6Emb+MEQ=;
        b=r+Vu8uaXA/MHX011CptwK1aHeMR5A1/I9RhXtxeeA/sC31JVuYUnhvZLqi+8LnC6QP
         g/1HvrBIXn0FNjZIYsZaSnJlpPHst7g0aMw+CvE2nPTHPcqJy/IKh1Q2nE0fHIlxtv3u
         PB5FT7fX1yj2OvsCSvn+u6BCBHEMbuY55aiPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721339871; x=1721944671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwFWzFvgZNrEVHvyRBE8cy2ybaA/G1NJTsH6Emb+MEQ=;
        b=VK981onbRL7G4/2U26bNbEKETPirUPSX5YyA/NnABQQNs5jGb2pqsLzcfXSYs3XG2D
         CY8dBWxp8niAYn0fhQ6ChcuIs+0Xe3Q7f72EQxEpH+gLgqMhPqthxt7r0qYXGp/uXj+L
         yOkMLWuGczBI9qQH3OjF+vBhz78bM3ZQjRuisD4VDcdG1lH+kwBDN1kB9vOVobh4XfV8
         bSOLkP/kIdp3MJTkPDgD8O6ohuQJFPXChY58DdF1ZqlEkT/sjWN3jEZPfx9irFM5PKB/
         Gdc5P2guOPtMeyDI1pWDb+BO72T/L5qM3ZwEKf424fM3t7Mia1XbqHzIq89ZPA+IJdAM
         xZMA==
X-Gm-Message-State: AOJu0Yw6iC1qE+PC9HdF3IKTAiG+k0WzNTbZSCPcBprVOrxP/OeOokOW
	KzuDnpyS6GqgLJ9FOzKQSSXa6noQ0ekNecEgjVKzmNT6s9k4K6I9CgkYOjh4pmqhu1zpX7KY86A
	1
X-Google-Smtp-Source: AGHT+IFRHnZO7GLRxxpq0OV++qcIOqQIfYWu2izeKn140Dl3ATRuCUEfGAbfWVvQK4LITKnoUg8qmA==
X-Received: by 2002:a05:6512:682:b0:52c:e040:7d9 with SMTP id 2adb3069b0e04-52ee5428af2mr4540350e87.59.1721339871272;
        Thu, 18 Jul 2024 14:57:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/4] xen/domain: Introduce arch_init_idle_domain()
Date: Thu, 18 Jul 2024 22:57:41 +0100
Message-Id: <20240718215744.3892072-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The idle domain causes a large amount of complexity in domain_create() because
of x86's need to initialise d->arch.ctxt_switch in arch_domain_create().

In order to address this, introduce an optional hook to perform extra
initialisation of the idle domain.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/common/domain.c     | 3 +++
 xen/include/xen/sched.h | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index fb262dcec919..e312c820d641 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -685,6 +685,9 @@ struct domain *domain_create(domid_t domid,
 
     rangeset_domain_initialise(d);
 
+    if ( is_idle_domain(d) )
+        arch_init_idle_domain(d);
+
     /* DOMID_{XEN,IO,etc} (other than IDLE) are sufficiently constructed. */
     if ( is_system_domain(d) && !is_idle_domain(d) )
         return d;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 2dcd1d1a4f8a..90666576c2f8 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -728,6 +728,11 @@ struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
                              unsigned int flags);
 
+#ifndef arch_init_idle_domain
+/* Optional, if there's any construction necessary for DOMID_IDLE */
+static inline void arch_init_idle_domain(struct domain *d) {}
+#endif
+
 /*
  * rcu_lock_domain_by_id() is more efficient than get_domain_by_id().
  * This is the preferred function if the returned domain reference
-- 
2.39.2


