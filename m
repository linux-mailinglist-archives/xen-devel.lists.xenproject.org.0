Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5D4A14145
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 18:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873680.1284689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU34-0007pd-Db; Thu, 16 Jan 2025 17:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873680.1284689; Thu, 16 Jan 2025 17:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU34-0007hS-7M; Thu, 16 Jan 2025 17:52:54 +0000
Received: by outflank-mailman (input) for mailman id 873680;
 Thu, 16 Jan 2025 17:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYU32-0007CP-Gg
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 17:52:52 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4d73ef0-d432-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 18:52:52 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d932eac638so2527302a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 09:52:52 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73edbc18sm227073a12.69.2025.01.16.09.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 09:52:50 -0800 (PST)
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
X-Inumbo-ID: b4d73ef0-d432-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737049971; x=1737654771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PStf4fVV3eap1o0m+cwA72iRcnwg9eiUKsl3FHMYlFU=;
        b=Tqh209ID0kkvPNRWt5u+zTzLFI0cjqx8oJ/QQRr7BbTuvi4SSHJHHMQMAEE0NmvR0U
         SonJZg7ftu5VqrkSfWreDR4U3VOQrpb2MOv8RFtZ9D5MNNH5kn9R4BzVb92gDLdhUlzo
         hL1XEY5+vc4ztc86PX2yVjsOCKsDOvn2B+Ve8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049971; x=1737654771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PStf4fVV3eap1o0m+cwA72iRcnwg9eiUKsl3FHMYlFU=;
        b=E5VZGcAkkMcd3GSRZwAjC9UbkzsETKVxQg4MzNVGHZrPAiIUDIV7iLmHUZxPwTPGC1
         Bx4QL2NID7JJAGDmTpmMQuidt7rCYgPLMmq601tnr28Bj/FUg6kE3t/j2hsIPexGPcIF
         cvUNvvC7p45dPn+grbIBIZG7r014zuVHFqgTu1YTvI91gvsvUzBFD+7JnzcPpFy1zsit
         DueT6kU5dgRIO0Fc4WL5FiOMaJH2oc7k3xdAaAoeXAGPduricin5Ko4yOYnq5Jlo6Zz3
         cZjiCxHhWJq90YFr7j+pkKHE9pVtT0uxfMf45ikEyKxd+DzUTHXWxgxTlt0OHiS3lxFj
         PGYg==
X-Gm-Message-State: AOJu0YxPOL3juHPUR5mrsIF2evZHignfrSPcuuIqWNjw5ITxEt9KKsZ5
	iz/YrdlKfgWCer486ZqAjJojzG3/2IPPc/NtUwZyXe2ZfHU8GxuYCt7FmFBDsjeTCXQ7e9kA2Gj
	k
X-Gm-Gg: ASbGncsB9pcxq/0i3YC2rzb4Ow0vsOS3VwhJ38RHGB0NSHXTDQuRPkg4S/ItvHH2bTb
	fJhKhbTqTU027FmuzcD3GGMIrATKfuHd9x6dDjDYAdUv7ZB1AjoMHtfCbjDKdi64OGSI24xjk0g
	aarsc6+ynzZy2gs5dVZWTfsH6qLsWIC/vH5/07dKZh4BBjtB0+vhsDIgxLxIFVLdcMICh9UPdI+
	+QX+99SpdkQiMsx6b4Vrz0JZ7VK1BLUyXAZq0qjRFVeg7D2pYP8qdD1MtqI4g==
X-Google-Smtp-Source: AGHT+IGM5B89/sW4jjyLnVgy25mYg6tio8LEb3BuycnqnUnpAsENjVhhpxBjpArg3oaD7QOU8tBTaA==
X-Received: by 2002:a05:6402:4304:b0:5d0:e570:508d with SMTP id 4fb4d7f45d1cf-5d972e1787bmr34413603a12.17.1737049970833;
        Thu, 16 Jan 2025 09:52:50 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Artem Savkov <asavkov@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/7] create-diff-object: propagate child symbol changes
Date: Thu, 16 Jan 2025 18:52:10 +0100
Message-ID: <20250116175214.83742-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250116175214.83742-1-roger.pau@citrix.com>
References: <20250116175214.83742-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Artem Savkov <asavkov@redhat.com>

Propagate child symbol changes to it's parent.

Signed-off-by: Artem Savkov <asavkov@redhat.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index b041d94d9723..dd5466bff6ce 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -821,8 +821,14 @@ static void kpatch_compare_sections(struct list_head *seclist)
 			if (sec->base->sym && sec->base->sym->status != CHANGED)
 				sec->base->sym->status = sec->status;
 		} else {
-			if (sec->sym && sec->sym->status != CHANGED)
-				sec->sym->status = sec->status;
+			struct symbol *sym = sec->sym;
+
+			if (sym && sym->status != CHANGED)
+				sym->status = sec->status;
+
+			if (sym && sym->child && sym->status == SAME &&
+			    sym->child->sec->status == CHANGED)
+				sym->status = CHANGED;
 		}
 	}
 }
-- 
2.46.0


