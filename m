Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F38D8C2A1A
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 20:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720025.1122951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5VFO-0002NH-Gk; Fri, 10 May 2024 18:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720025.1122951; Fri, 10 May 2024 18:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5VFO-0002K5-Dy; Fri, 10 May 2024 18:45:34 +0000
Received: by outflank-mailman (input) for mailman id 720025;
 Fri, 10 May 2024 18:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5VFM-0002Jz-GH
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 18:45:32 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79b3457d-0efd-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 20:45:30 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2db13ca0363so36704481fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 11:45:30 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1787c699sm211206566b.53.2024.05.10.11.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 11:45:29 -0700 (PDT)
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
X-Inumbo-ID: 79b3457d-0efd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715366729; x=1715971529; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKpaY5WU7UHJhmw5XT4Z3i9Z6X0mzfzZ8gQ458pu6SA=;
        b=PuX9oRmlt7MSiIPKJlLi1dB2WK9S2HkfZ+/n1V73Dl85xv49OsZ7btWxgLYxNDkTmC
         Ap7Q5qyaH34ZkUYrOdWJB4rojlUNuBLMZ22Tbli2r1kisLpJ1UyqnFxqm3GFP+q46z+u
         Sv86g9nReKnlR8ZnhmN1k8ucA5VHK/0EdbrC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715366729; x=1715971529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKpaY5WU7UHJhmw5XT4Z3i9Z6X0mzfzZ8gQ458pu6SA=;
        b=oIWGf1usXkBCebN0UyeG8VFhKis4CerqK0a4uioJrd1pSSJeCH7D+Oax/w0TQYuOyA
         deh/Z4J+Q+Ek1J5tU6OFVfi1lNjCO2kZZpzMQ/UaIXcerz7DtYTtpO8IlEmkYLW5sjuX
         msmjmc6R+VEDu5TinCsRoXO2ABOgEGCes5Uq7a+O617+iJ5ql9JP20TIsjLCcL9x/lbE
         3xNJDKb6pDeSFpDNvW+IIu+jOUcTX6XU6HEikLeucnda8qiZmUsyUVy8xhqplhrqiKHu
         M1c9FcFjnHyo/APIgY3uf5rhreip82PSJwv782uqdMqL8J6bXviBQ1hmz/aHOQHeGfvO
         KyyA==
X-Gm-Message-State: AOJu0YzIrt8I8rxAEO9OcTXYs+M2lv4mSF3bOOXMUT1aE4bKN5bFhGhk
	bv0MezBp6vr5JmbC1pZxuXeuB6byIjnKf7O3LVbEGbIfixhWYnpRIiw/jv+bgRIehuJ+0oYAVwP
	T
X-Google-Smtp-Source: AGHT+IFqcW7azKlpdKNF1stCeXPIMc8sFgQJijxbq8hsukoFN3xRc9RG79AaxqKQplbx5DtHevvd/g==
X-Received: by 2002:ac2:51a1:0:b0:521:f39d:1a8 with SMTP id 2adb3069b0e04-5220fc7cd5cmr2531479e87.8.1715366729521;
        Fri, 10 May 2024 11:45:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] xen/build: Use -Wflex-array-member-not-at-end when available
Date: Fri, 10 May 2024 19:45:28 +0100
Message-Id: <20240510184528.2272560-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <c19bc75727d18399f73a19dae991660c608a4a84.1715352180.git.nicola.vetrini@bugseng.com>
References: <c19bc75727d18399f73a19dae991660c608a4a84.1715352180.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This option is new in GCC-14, and maps to MISRA Rule 1.1.  The codebase is
clean to it, and Eclair is blocking.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

I really ought to have posted this before we regressed the tree, but oh well.
Better late than never.
---
 xen/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/Makefile b/xen/Makefile
index b6c39fc6aefb..71f0cb5071b3 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -396,6 +396,7 @@ CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
 CFLAGS += -Wdeclaration-after-statement
 $(call cc-option-add,CFLAGS,CC,-Wvla)
+$(call cc-option-add,CFLAGS,CC,-Wflex-array-member-not-at-end)
 CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
 
-- 
2.30.2


