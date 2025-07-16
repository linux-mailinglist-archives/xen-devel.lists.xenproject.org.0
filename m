Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E910B07EA9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045631.1415842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xs-0005gn-7T; Wed, 16 Jul 2025 20:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045631.1415842; Wed, 16 Jul 2025 20:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xr-0005Vw-W1; Wed, 16 Jul 2025 20:16:03 +0000
Received: by outflank-mailman (input) for mailman id 1045631;
 Wed, 16 Jul 2025 20:16:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WS3=Z5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uc8Xp-0003uY-Na
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:16:01 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b03d1ae7-6281-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:15:59 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b39c46e1cfso32364f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 13:15:59 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e8csm30504145e9.5.2025.07.16.13.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 13:15:58 -0700 (PDT)
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
X-Inumbo-ID: b03d1ae7-6281-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696959; x=1753301759; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=cOYLvQR4xMMllxQSoMXCLXeUYzhuM/qj0NkOLUbLXAmu6OxYc9YysBqVPJzLqohCEp
         CASFIvm0GwTIO2D7LK8bgAVeE8vsQ8Y3YkquRB5bYbMqcIOfq7SYw7mjw9tOUvnAjhsB
         shr6b1GO6t7J1xfXpY//5JmyW0nsspBEcKFZ/xRUv1wy7TEsFrR7ubRkGTX7JR0LZ9XU
         FggMzjWD8O14Lu2mcYCJQMxuWyF0knAiIH7uEbIE7JhpVxpdknJGGW26KdOiEIDpS7Gi
         Mm/R1jDg71DUP2gDpcJA5W3vGPDdtCmF1fYZraogMO5fYSuymLqR7lRMcEXPX/9VyOaf
         SRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696959; x=1753301759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=KvKNwxW63spq8xAgy84xI8G98KJWWZvhPwPASPssNZUfGTrHQ/RD4LSGQuFFOPh493
         hBsePW5tH8VKB0yMmKdKJqURvKOmS4vzb81JIzJAjLZ4ISPdYDc06BVLoLyCS7iRfzi9
         RWrFFMjv0m/zUEyx8HkwVe6oYpcaJhnWa0xXw5BbtLrQgk0oFzmhpigSQHDGPZVmuy6l
         D+83fjWgnR8XrP0FC5d9ZEE/fWYcdXWqIXcuoZcC8USnf4W9lSNq+AkABSmBg9aTrxem
         1avyldwTQYpSt4fTu/WlBCA1A7oaJhsBfSq24m3nC2cJD8w+PHTo+wW3S9jEqZtjT/F0
         8GKA==
X-Gm-Message-State: AOJu0Yxqq7Dt6lsNSEiZ2VRBA7pSRO09Ql1WFhCXg0raQ4omUEZBCnLS
	NFdPY/cMsQIpK3eYoHtR/3ba5jBKr3QI/9v7JLXhVmsyPwn0/DAwiWmz2hUAsg==
X-Gm-Gg: ASbGnctaVuQeoTPVZFD/6lkvQcNCqtmG0x3tUX/5aZj3BbHtEh1SkNyG8YSRsidel95
	xq9Ph4FN2DPU/HTjjX1SACakSnlac2DEdQQBO9pMqE7wcSgZr7qUHvEIJk8G0VgkbK8weotI+Fe
	U9ML21JMAOPuUccj7kTbakivdViLwBp+xbQPF7gOWGRJ6sCKc3GT3orHkZY8ttJ02FCDyD2oVUn
	SkjN+vIxKzUu6Wnbeq4VzBw+gpKnl7Y0FT4xGaFstc8YjEYFMrTaEl3L+AJpcyMc4Q3cu/U3YnL
	Ot7GAlB5ecPaNmkiZaFF6Qcz0XfsQxp1btzpfXVp3lMedxTzwO7l88KyVqrnMozWAwRDpQ6SC2I
	g0boKLJzCDh+tfhxUBhgLpS1vWQC1/rtZuxqCwW2kRu0O1kqxn8d5OwS08OjZJaLDn4PehqADLK
	Vegrz0UZXTEsD5CcVZnWRw5g==
X-Google-Smtp-Source: AGHT+IH7GdGusUGVrk9HqTrDwfvIuKdblYUlr4EsEkYGvF6IYaWxoum2v+okSPRztKqsgEEcfS+Xog==
X-Received: by 2002:a05:600c:a30b:b0:453:78fd:1769 with SMTP id 5b1f17b1804b1-4562e279874mr12804105e9.4.1752696958714;
        Wed, 16 Jul 2025 13:15:58 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 8/9] xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr == 0
Date: Wed, 16 Jul 2025 20:15:38 +0000
Message-Id: <b9d7d1094c45bd29a9c030de5279d98bf2724003.1752691429.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752691429.git.w1benny@gmail.com>
References: <cover.1752691429.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Since libxl finally sends the altp2m.nr value, we can remove the previously
introduced temporary workaround.

Creating domain with enabled altp2m while setting altp2m.nr == 0 doesn't
make sense and it's probably not what user wants.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 155ea1f79f..872e97999c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -739,8 +739,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
         if ( !config->altp2m.nr )
         {
-            /* Fix the value to the legacy default */
-            config->altp2m.nr = 10;
+            dprintk(XENLOG_INFO,
+                    "altp2m must be requested with altp2m.nr > 0\n");
+            return -EINVAL;
         }
 
         if ( config->altp2m.nr > MAX_NR_ALTP2M )
-- 
2.34.1


