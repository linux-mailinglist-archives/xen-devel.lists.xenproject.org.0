Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE5A56E4B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 17:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905221.1313072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqatj-0000mq-Dm; Fri, 07 Mar 2025 16:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905221.1313072; Fri, 07 Mar 2025 16:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqatj-0000kX-B3; Fri, 07 Mar 2025 16:50:07 +0000
Received: by outflank-mailman (input) for mailman id 905221;
 Fri, 07 Mar 2025 16:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqati-0000dZ-0U
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 16:50:06 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3790ea44-fb74-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 17:50:04 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-390f5f48eafso1140882f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 08:50:04 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bcbcc0c39sm91444105e9.0.2025.03.07.08.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:50:02 -0800 (PST)
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
X-Inumbo-ID: 3790ea44-fb74-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741366203; x=1741971003; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c03e4tdWOqrDGmP3AYQLe9DcnVISbUluGPGs8Qxvsw8=;
        b=AVAi5SjAkWY8JcYmWdlDKnYlp3+r5CVnx+JGUNrVfmYNMn6zpQ1QU0i952l+zvF4qg
         QQQZ2KLMlcj1xTXBAiuboLOnsnfIAsKCl3ExEn8v5KBlpvzq0dPc3gvIaKHHSTG4l6eK
         eUEzwfiySRBgrIgr6PqdormF2Dgdvru0JGIxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741366203; x=1741971003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c03e4tdWOqrDGmP3AYQLe9DcnVISbUluGPGs8Qxvsw8=;
        b=nfPEs1kbePP4W2Aq95elf/8mcIZMPaGvHWSdjMD8jSmvPk7Bn60dsI17OdHU8unPAv
         AL4oZBf4Z0YG5VDZyh44TF8vxY4ToNp5iZ4x5hQKr6lybG90fDH3+66pxKmflebFTrMJ
         vRMVWyBROXGkVY+CsuulbBFtCKRllC+DStR1JA4rWL1mat7FPQ2t4GRHAQZcjyaTxQWL
         dODzk88PaWGpLgY/MdgaShlPGJ19mZ1pV1Qu1KFi19i1Ax7+zWHRrx21gBcV741YZLou
         aoSAInoHpbHOKwP/UVHAYLjWvSqj/eGTEkKYiVuaU4cfOaA8ga+9hWBJUZX4/WovXpzR
         p5uw==
X-Gm-Message-State: AOJu0Yxxg8nONd6A7N/gIAx868la0LH75ImilUBKA5uUA8dbs8JojI1i
	XYUO9pOxdac6QHUB4WLlZSLkKqVsUpDLyecj4pdfblsYBWq1jjIqS9FD8d0hMgIsIlPo81/5rCr
	E
X-Gm-Gg: ASbGnctV7sr5XW+xAEk7sx3B0QnnwajmKmWEu6UKJSg3T5GLdr4iFZitCOgiveP2DiO
	WhFhh71Dy/mvqmdTAl1h+IYxbrDkdXXAeaHIY2lAL6cHrUv8bV652GU77nW6b5TRDqZN8sft4bi
	crRN1JzNwq2N83ErwSKd7MPaf7pvJVVQgHwDIEK+HZgGleRL3zkY4ggkJvKi5qMimFWBw/xi6c1
	Gw1kdXFyADH/l7ac9/RXNuULjzqnMdfREoecob/EfGnv6llP2a/yT3iskiT4bpb4J9VCHOmuhne
	LFyr7zPbf7jzCcTgQkCHd375qkDXviNsSv/I7neuF2L5hJcH34rHEkIbnntGoulsHju3E3pXMyq
	ITxw1mD0RYeAg7X/1CcUpmlkP
X-Google-Smtp-Source: AGHT+IFNY48awumxgEdtHmoxCGME6x7R6bdlUInN4JVtY8eGjaMAac2ZasGQWYHqNj7ftGZZtRFX3A==
X-Received: by 2002:a5d:588f:0:b0:391:1806:e23d with SMTP id ffacd0b85a97d-39132d7a3b6mr2466543f8f.6.1741366203119;
        Fri, 07 Mar 2025 08:50:03 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/domain: Initialise the domain handle before inserting into the domlist
Date: Fri,  7 Mar 2025 16:46:37 +0000
Message-Id: <20250307164637.3087855-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As soon as the the domain is in the domlist, it can be queried via various
means, ahead of being fully constructed.  Ensure it the UUID give by the
toolstack is in place ahead of this.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

Quite possibly benign right now, but the change is appropriate nonetheless.
---
 xen/common/domain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index b887c60ecc1d..8d0125bb8fd0 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -901,6 +901,8 @@ struct domain *domain_create(domid_t domid,
      */
     ASSERT(config);
 
+    memcpy(d->handle, config->handle, sizeof(d->handle));
+
 #ifdef CONFIG_HAS_PIRQ
     if ( !is_hardware_domain(d) )
         d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
@@ -962,7 +964,6 @@ struct domain *domain_create(domid_t domid,
     domlist_insert(d);
 
     domain_changed_state(d);
-    memcpy(d->handle, config->handle, sizeof(d->handle));
 
     return d;
 
-- 
2.39.5


