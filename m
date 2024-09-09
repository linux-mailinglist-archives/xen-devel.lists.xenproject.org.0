Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B5971CDB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794604.1203597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfXs-0007kg-BD; Mon, 09 Sep 2024 14:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794604.1203597; Mon, 09 Sep 2024 14:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfXs-0007iZ-8C; Mon, 09 Sep 2024 14:39:12 +0000
Received: by outflank-mailman (input) for mailman id 794604;
 Mon, 09 Sep 2024 14:39:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snfXq-0007iT-RE
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:39:10 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46301a34-6eb9-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 16:39:09 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so577638366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 07:39:09 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d258354f7sm349910266b.2.2024.09.09.07.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 07:39:07 -0700 (PDT)
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
X-Inumbo-ID: 46301a34-6eb9-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725892749; x=1726497549; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5098580atKJ1AV24vB5/sTFta2URmGEC7FHegXIOsCQ=;
        b=fwbPVpmBf7inf+OLLusgESkbVYLPEsKN/ElXAMBvb03+6pl49KjARlczD9MlcgYlDX
         AnppxDZ0PQ7nINIu8KI3uQ17DiRR4pjHcuQUnyCnYsFWvCPLHaHJEt66qWE4BG6+4Nbh
         ubVwO1pJirZOZRpIaIDIsAsSQbDjlUrlY7DOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725892749; x=1726497549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5098580atKJ1AV24vB5/sTFta2URmGEC7FHegXIOsCQ=;
        b=fBBhBtLqbtl5sCCweQyj1suPGrdlig/y+mvtfFixyp7sonm7H73lFmKcZlCt6yOnCL
         65N4cktULZMae1XzkJUIMFFP3Mx/NZLY3x+aBsI7AAONy84nFvc+SolvhMkA/TPNrKsB
         B8x6hUsv0EiE0FQKocpG6A9jpJow6w9+APQYAwAWcrFhbEjRd3MH8jbSS8X1WyTy9B2i
         fQVk6ckepMv3UY963Lc+iZ6HzQvr/mzvsfpwhFIn7KKG5kHqRU9y+HczKJdil7GtUcFm
         A+yjkGxI57g+rzbEOaQEey5wK8myfCKsUDd6w3zlbYVrJk19ZQ64B4+Vo95iI5nV4gXW
         SyMQ==
X-Gm-Message-State: AOJu0YyOmc63So6aICdhCJ4JBg83bnAOmbMIaXyyCLtroVUgXThjLYdd
	+iBPrd7JV6b0eG1sbGVZpkv2Lv+FdOvRNLNWUjx6b3UE7p1RMsyeX3QYnYsLvAj8kR7qCmPvjgm
	n
X-Google-Smtp-Source: AGHT+IFJRACiDJdH+gGZJyDVPvBXB7F8tMtLL148UQfZ4NQNDN09cfLOpZUfXx8HwsewOQdO7nrNmA==
X-Received: by 2002:a17:907:9628:b0:a8b:6ee7:ba1e with SMTP id a640c23a62f3a-a8b70ee94a5mr765558566b.60.1725892748062;
        Mon, 09 Sep 2024 07:39:08 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] cirrus-ci: update to FreeBSD 14.1 image
Date: Mon,  9 Sep 2024 16:39:02 +0200
Message-ID: <20240909143902.7244-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

14.0 is going EOL by the end of the month.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 72227916c736..1c2a6cb8120e 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -23,7 +23,7 @@ task:
 task:
   name: 'FreeBSD 14'
   freebsd_instance:
-    image_family: freebsd-14-0
+    image_family: freebsd-14-1
   << : *FREEBSD_TEMPLATE
 
 task:
-- 
2.46.0


