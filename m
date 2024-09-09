Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643F971AD3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:22:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794477.1203446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneLY-0004t8-UH; Mon, 09 Sep 2024 13:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794477.1203446; Mon, 09 Sep 2024 13:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneLY-0004qh-PE; Mon, 09 Sep 2024 13:22:24 +0000
Received: by outflank-mailman (input) for mailman id 794477;
 Mon, 09 Sep 2024 13:22:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sneLX-0004Ib-PQ
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:22:23 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c00f466-6eae-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 15:22:22 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c25f01879fso5397618a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:22:22 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c7286esm337879166b.138.2024.09.09.06.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 06:22:21 -0700 (PDT)
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
X-Inumbo-ID: 8c00f466-6eae-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725888142; x=1726492942; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoQnx6kzPsFyXcUBBQJY7C9TBiSWlHZPtOFJi+K7h18=;
        b=kAw8hyy11IZCFdxs32Tz0Beusy/zbuqWiuaYGxZJ8291+0dy8SICcaUPfrNAbxl3/j
         UTMbG/oqkf95+Y7RgHUNI2Dm4Myb8q67zbzGh9eXFnoey2Ql0/EL7uoVjPvau5k+T8Ws
         vjEjuG3cnIV7+5mX/SUyerwfvGgKWDWiyQi5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725888142; x=1726492942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoQnx6kzPsFyXcUBBQJY7C9TBiSWlHZPtOFJi+K7h18=;
        b=pdMzDGJsvfTwV5XuhMYAYip6+1I8ExFbfi+5fppQRI0ZtRJ5kUEX5rOISR6foedJKM
         L+WOV4wjSbEzDi97cqmIjEI3kI+U9giUeqvNzUVIm940MH2ls+aPl1tNpJBqzdXgpV/m
         53g3/lGKIx1RZbq5IpEwoKtT2m/N7uNaYBCBafSaph8c5nnhBJN7q0b5GwP5x5mtBY+p
         NQFCWuEqCdadAGUtRMvBIfzwOrZ3Zyuyaq21AdeaLd++8yWMOOiZgoat0/kUkkg4OJ3m
         3Cx/MeApUl+sfFgpGy3mAGnRbd8P5eubwIK+PIXnk9ZNsdQSw+u2LReNS/hNk9g5aPUV
         fEyw==
X-Gm-Message-State: AOJu0Yz3vAC636cXmC6t1qzTSAt/Lq0kjruQuNpNEXTxyGNMvGAl3zoW
	7DXSf0iWHwrv83TQa6BiqnUcW/IhNTNitZkmX1VgHYAlXFGDmQVDxyk/cHrS6UdDh8RvfeAIh8u
	D
X-Google-Smtp-Source: AGHT+IEwkIdbtqEgYLGLl/su9KK7AHA/r0kgNTv8J99HE4zZ5rkBBCLD0fk0nYz6GD58tr/0VXHBcw==
X-Received: by 2002:a17:907:9306:b0:a86:8d83:542d with SMTP id a640c23a62f3a-a8a88867457mr842644666b.45.1725888141467;
        Mon, 09 Sep 2024 06:22:21 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 2/2] x86/boot: Add missing __XEN__ definition
Date: Mon,  9 Sep 2024 14:22:16 +0100
Message-Id: <20240909132216.128114-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909132216.128114-1-frediano.ziglio@cloud.com>
References: <20240909132216.128114-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are compiling Xen source code so we should define __XEN__ macro.
We don't want to import all definitions from XEN_CFLAGS (as done for
other options) because most of them are processor dependent and
do not apply to 32 bit.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
Changes since v3:
- improve commit message.

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index dfe3cb7034..ff0f965876 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -15,7 +15,7 @@ CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
 CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
-CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS))
+CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
 
 # override for 32bit binaries
 $(head-bin-objs): CFLAGS_stack_boundary :=
-- 
2.34.1


