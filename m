Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969277CA028
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 09:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617259.959718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsHlV-0002AP-4Y; Mon, 16 Oct 2023 07:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617259.959718; Mon, 16 Oct 2023 07:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsHlV-000282-10; Mon, 16 Oct 2023 07:11:49 +0000
Received: by outflank-mailman (input) for mailman id 617259;
 Mon, 16 Oct 2023 07:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hqiJ=F6=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qsHlT-00027t-Ch
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 07:11:47 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43ba3fe1-6bf3-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 09:11:46 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ca215cc713so6663515ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 00:11:46 -0700 (PDT)
Received: from localhost ([122.172.80.14]) by smtp.gmail.com with ESMTPSA id
 o11-20020a170902778b00b001b9dab0397bsm7770391pll.29.2023.10.16.00.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 00:11:44 -0700 (PDT)
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
X-Inumbo-ID: 43ba3fe1-6bf3-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697440305; x=1698045105; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YLGlADbqxnWAYarOFVSTI3AQVPhPYl3xWfz7Wse3mA=;
        b=i8OU2YsRZiUe/QeaDM+n3c+EfkOvGesFncybGHI1SVztgATQpR4O7s91/PFComTpyu
         i+XFinS+l77MeiVkF4Jp6TQ7DZzPBMM29wp0d0UUIXMbROKdAqa8Mo8lDc+iySaaLN7W
         3RbCf1v5N4nnv4+T5c6utRpmSAjgs0stdvrQVWWRh8Ml3hsHBsNqjMRdRPXwNzArveXz
         emYaIIM3NQZeyo+qumGR2RGgXEpTDMqPRKwzbzE8YsCjFmom1czFo6nUo01/P/9JE/Gz
         bVCAiSj0rtzYCHpg336xhr1GeBZwSPnvpjARC5AQB217WZBSW72wxhWyHlGbhTSVXD4s
         RKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697440305; x=1698045105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YLGlADbqxnWAYarOFVSTI3AQVPhPYl3xWfz7Wse3mA=;
        b=U+Kw9JJivDB8YG+kxZNJcNCF8kzjaKTlCkW0lam0Wo/cB5BdiuVe3YqGwCq+99GD7m
         u1SZqEH+qznmkCsxOsxV71qgLxiduMJ3/O0cd+amWr1g6AnXwczqAPuGDsmKADj+ke0L
         q47P07CLyJkQ8KaOQzrsELM7r3tvoRgAWnk7hXYqYp/PDAAZ06iimjMs6lxmnLJfYQGJ
         dJAlMW9osZyU2JPtYyf5nQOZOxl91G71Oe9NQMcU1bYBR30+h1Y0S8Vyr8eBLFJ6sorb
         EGb+XPmEyjXoEZo3+XMmpbT2JTpBf4GaTUmoY+w6cuXVuFft8xQmN4y+tzDbymwEMLyn
         xJ9Q==
X-Gm-Message-State: AOJu0YyjhediDCHkOQ1RIIgSee3x8s6huZL64VD6rySjzqd9slA+fTC6
	Ut0Ak6arUVeAsh8p7joVoKQdnA==
X-Google-Smtp-Source: AGHT+IFiZfXVWLAwWVoc8OY1PxB2vC251spWed6E+sNY8zWNiPL3CrOKRidkLrTNfWcwaUPdKETYTg==
X-Received: by 2002:a17:902:ec8c:b0:1c9:b187:4d84 with SMTP id x12-20020a170902ec8c00b001c9b1874d84mr18099691plg.14.1697440304700;
        Mon, 16 Oct 2023 00:11:44 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 1/4] xen: Make struct privcmd_irqfd's layout architecture independent
Date: Mon, 16 Oct 2023 12:41:24 +0530
Message-Id: <a4ef0d4a68fc858b34a81fd3f9877d9b6898eb77.1697439990.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1697439990.git.viresh.kumar@linaro.org>
References: <cover.1697439990.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using indirect pointers in an ioctl command argument means that the
layout is architecture specific, in particular we can't use the same one
from 32-bit compat tasks. The general recommendation is to have __u64
members and use u64_to_user_ptr() to access it from the kernel if we are
unable to avoid the pointers altogether.

Fixes: f8941e6c4c71 ("xen: privcmd: Add support for irqfd")
Reported-by: Arnd Bergmann <arnd@kernel.org>
Closes: https://lore.kernel.org/all/268a2031-63b8-4c7d-b1e5-8ab83ca80b4a@app.fastmail.com/
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/xen/privcmd.c      | 2 +-
 include/uapi/xen/privcmd.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 120af57999fc..5095bd1abea5 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -935,7 +935,7 @@ static int privcmd_irqfd_assign(struct privcmd_irqfd *irqfd)
 		return -ENOMEM;
 	dm_op = kirqfd + 1;
 
-	if (copy_from_user(dm_op, irqfd->dm_op, irqfd->size)) {
+	if (copy_from_user(dm_op, u64_to_user_ptr(irqfd->dm_op), irqfd->size)) {
 		ret = -EFAULT;
 		goto error_kfree;
 	}
diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
index 375718ba4ab6..b143fafce84d 100644
--- a/include/uapi/xen/privcmd.h
+++ b/include/uapi/xen/privcmd.h
@@ -102,7 +102,7 @@ struct privcmd_mmap_resource {
 #define PRIVCMD_IRQFD_FLAG_DEASSIGN (1 << 0)
 
 struct privcmd_irqfd {
-	void __user *dm_op;
+	__u64 dm_op;
 	__u32 size; /* Size of structure pointed by dm_op */
 	__u32 fd;
 	__u32 flags;
-- 
2.31.1.272.g89b43f80a514


