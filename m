Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A39E9A2874
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 18:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820762.1234367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TEx-0005DB-Rc; Thu, 17 Oct 2024 16:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820762.1234367; Thu, 17 Oct 2024 16:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TEx-00059w-OT; Thu, 17 Oct 2024 16:20:43 +0000
Received: by outflank-mailman (input) for mailman id 820762;
 Thu, 17 Oct 2024 16:20:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFta=RN=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t1TEw-0004vC-Lb
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 16:20:42 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1431c14-8ca3-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 18:20:42 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fb5014e2daso13310121fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 09:20:42 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d77995esm2922739a12.65.2024.10.17.09.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 09:20:40 -0700 (PDT)
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
X-Inumbo-ID: c1431c14-8ca3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729182041; x=1729786841; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mFPVW/GNfkFYA0jwP0JP0xhWbJwauejO0ZM9dVMIMk=;
        b=UjCxelEVIvR+2xeFyj/TnE1UjZm6m5fgKdGaF8f6vzV7Iw0ftOVuAcqzUMthohBe2w
         GA2xhJaOUPOUGMI6y4/C3EZJArR4liq5Pz6uU+lW3mpudgpetm/EqN65a5fhRMTCqiEL
         H44ZVDiPy+363QxfMxNsHXizI9OPg5Dw+Asig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729182041; x=1729786841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mFPVW/GNfkFYA0jwP0JP0xhWbJwauejO0ZM9dVMIMk=;
        b=mOjz/FZWLGrJ7mREr/RsqWkme9kMWRO7jWUcT5pw9a8lGinAH9V4XEdBFkM7eWuNKP
         Fp4pdkeFFDOp+RoDtDYdCq2gh2ShPBAKd2PzLWPbTCJI+8MQrl4UW92Ig1LOpJLeu1FW
         /pUqn1V6gLo1f1EdppxPwxRwUGAx+uGOOFHEp9dm0gLM/H/vnR1cz8DdcSCO73XnGXw5
         v+8P623O4lKudcHPE5y+5UbrW6OkH7QsQbEQZQuiVAdkV7yGDEOmtVTklj0Ro8DT+PGN
         6EafpVQXNfOk09+utHpxyITaK7ApRdR7RKjbAeFZXHfUNRlcnuwFaFwXdCu5UwJ0Guwq
         5RCw==
X-Gm-Message-State: AOJu0YwZ/A888xVndXtRJcCF36o37XdZhrm2uiV7bOQhFBMtgy/gVNAf
	cVHORjJaTqomb0JfZvTUsCaX6JP5PCs7ybpLZrrCgd+116SBi7bTQGPzTTuIZmiA3OHMERvMgow
	Kevg=
X-Google-Smtp-Source: AGHT+IGLTAiFvsipA8tB4KV2Rl1jDJqMPccfYVUbE4KJ0Xy7TV2QHZvD9nu9WmlTmzjjHZy3ZW6l9Q==
X-Received: by 2002:a2e:be23:0:b0:2fa:c9ad:3d36 with SMTP id 38308e7fff4ca-2fb3f1650e2mr97736421fa.7.1729182041389;
        Thu, 17 Oct 2024 09:20:41 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 1/3] automation: Fix URL to the gitlab container registry documentation
Date: Thu, 17 Oct 2024 17:20:19 +0100
Message-ID: <5ebb776792a345724b43b0843aa41c21febcc843.1729170005.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1729170005.git.javi.merino@cloud.com>
References: <cover.1729170005.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gitlab documentation is now at
https://docs.gitlab.com/ee/administration/packages/container_registry.html

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 automation/build/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/build/README.md b/automation/build/README.md
index bd0c0e041804..ecc898680c91 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -110,7 +110,7 @@ make -C automation/build opensuse/tumbleweed-x86_64 PUSH=1
 
 [BuildKit]: https://docs.docker.com/build/buildkit/
 [registry]: https://gitlab.com/xen-project/xen/container_registry
-[registry help]: https://gitlab.com/help/user/project/container_registry
+[registry help]: https://docs.gitlab.com/ee/user/packages/container_registry/
 
 
 Building/Running container for a different architecture
-- 
2.46.1


