Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C877B7B2B06
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 06:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610158.949446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm5ZH-0005z6-G9; Fri, 29 Sep 2023 04:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610158.949446; Fri, 29 Sep 2023 04:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm5ZH-0005xN-Co; Fri, 29 Sep 2023 04:57:35 +0000
Received: by outflank-mailman (input) for mailman id 610158;
 Fri, 29 Sep 2023 04:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/U+m=FN=gmail.com=k.kahurani@srs-se1.protection.inumbo.net>)
 id 1qm5ZF-0005xH-S8
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 04:57:33 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1ae20ee-5e84-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 06:57:30 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5347e657a11so6658118a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Sep 2023 21:57:30 -0700 (PDT)
Received: from localhost.localdomain ([105.29.162.58])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a170906a45900b009ad778a68c5sm11914319ejb.60.2023.09.28.21.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 21:57:29 -0700 (PDT)
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
X-Inumbo-ID: b1ae20ee-5e84-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695963450; x=1696568250; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXa6TIRRuLGAOfXeMDWjLcsviL/p0AD6ZFGbl3p8aRQ=;
        b=kwGLY3Zt4cHXIz7jAd6gU2A1G0JqXMDtuta3cwLgQps8Vx6Saw6yburDAICG73KX1M
         ZrE8lomvlxj/x2kBnoeD9IA1EEoO9Zrdjv5qJkxv5RB+ByDf2iBXY1qYdR4yldab2PTU
         HOTJLGVcZDekL/eVzgg1PRIla4ABh9/YsUpe/exDLOs4bs48UUSGIMyfD2aP0Od4K5tp
         hevqXkngiopNvy6Dk0NQ48Xg4VpaW6ALSscOy/wrnaXUHjuC9PwNTFf4pEnNVp5s+TCP
         QV+tSinA6G+Z9mQpr9e6RSfKtnGP+96/BrBZUPPlNb/+XOXeLy8Al3ieZIh9Pk16Ge0i
         TkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695963450; x=1696568250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXa6TIRRuLGAOfXeMDWjLcsviL/p0AD6ZFGbl3p8aRQ=;
        b=Tpr3m2niEZWYpg2S8yrBhRc+UGIuqv5M0e63ZrrGoUhy6+O2IZJSBsglleiqhbS6r4
         6Poxdq6Wl84kcLuLPFaaD7da4tWqocdop57DJt3BUxYZW5wqZf4MZd3MStFgBNF/Kafp
         x8fT1WpsbA2qM1eHy9MnBZMfNyITJxJ9xRtEYd5IqlXoXvkNxmu8ogxU1AWdvuz8Wdv2
         9ozytjH4VnEDxBZ35IxNi3dXnYuw6jyTGq8UGl2GbNRiH1tseN/x99zmnyF1YSw0YV0o
         j2LTaD8zErAk0uhBK+IPr/70fNJqbzugqKPHL4FURZl/uVOdYmQ5Z2uRGmFPD6iY9dZ+
         k3Nw==
X-Gm-Message-State: AOJu0YzBluXOCOWVfdHLT7Wu9t6MZ2nHCKI9bYYOY7eDZdT1oZUmW5ra
	uOH7neVj+E0rl8SwgdQmnUZ1WzfCyCY=
X-Google-Smtp-Source: AGHT+IGsTSrLfRldjHAJa2jRFD2tOF9jewMS0r9ODruBxmLHSeLi5Rh7DI0v4LJvxaruXRk6RdrQeg==
X-Received: by 2002:a17:907:2cd2:b0:9ae:621b:ae4e with SMTP id hg18-20020a1709072cd200b009ae621bae4emr2750794ejc.13.1695963449523;
        Thu, 28 Sep 2023 21:57:29 -0700 (PDT)
From: David Kahurani <k.kahurani@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	David Kahurani <k.kahurani@gmail.com>
Subject: [PATCH] tools/xenstore: Avoid leaking memory in check_store
Date: Fri, 29 Sep 2023 07:57:24 +0300
Message-Id: <20230929045724.6844-1-k.kahurani@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While this code should not be trigger-able from an unprivileged domain
it is called multiple times when the database gets inconsistent. This
means that a malicious guest able to corrupt the database will trigger
the leaks here.

Fix the leaks so that this code can be safely called from anywhere

Signed-off-by: David Kahurani <k.kahurani@gmail.com>
---
 tools/xenstored/core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 092de76a2e..edd07711db 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2535,18 +2535,18 @@ static void clean_store(struct check_store_data *data)
 	domain_check_acc(data->domains);
 }
 
-int check_store_path(const char *name, struct check_store_data *data)
+int check_store_path(const void *ctx, const char *name, struct check_store_data *data)
 {
 	struct node *node;
 
-	node = read_node(NULL, NULL, name);
+	node = read_node(NULL, ctx, name);
 	if (!node) {
 		log("check_store: error %d reading special node '%s'", errno,
 		    name);
 		return errno;
 	}
 
-	return check_store_step(NULL, NULL, node, data);
+	return check_store_step(ctx, NULL, node, data);
 }
 
 void check_store(void)
@@ -2556,6 +2556,7 @@ void check_store(void)
 		.enoent = check_store_enoent,
 	};
 	struct check_store_data data;
+	void *ctx;
 
 	/* Don't free values (they are all void *1) */
 	data.reachable = create_hashtable(NULL, "checkstore", hash_from_key_fn,
@@ -2571,17 +2572,19 @@ void check_store(void)
 		goto out_hash;
 	}
 
+	ctx = talloc_new(NULL);
 	log("Checking store ...");
-	if (walk_node_tree(NULL, NULL, "/", &walkfuncs, &data)) {
+	if (walk_node_tree(ctx, NULL, "/", &walkfuncs, &data)) {
 		if (errno == ENOMEM)
 			log("check_store: ENOMEM");
-	} else if (!check_store_path("@introduceDomain", &data) &&
-		   !check_store_path("@releaseDomain", &data) &&
+	} else if (!check_store_path(ctx, "@introduceDomain", &data) &&
+		   !check_store_path(ctx, "@releaseDomain", &data) &&
 		   !check_transactions(data.reachable))
 		clean_store(&data);
 	log("Checking store complete.");
 
 	hashtable_destroy(data.domains);
+	talloc_free(ctx);
  out_hash:
 	hashtable_destroy(data.reachable);
 }
-- 
2.25.1


