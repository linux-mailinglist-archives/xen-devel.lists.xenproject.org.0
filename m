Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ACB9C8B04
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 13:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836418.1252316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZIV-0002Vm-Vq; Thu, 14 Nov 2024 12:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836418.1252316; Thu, 14 Nov 2024 12:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZIV-0002U6-SB; Thu, 14 Nov 2024 12:50:07 +0000
Received: by outflank-mailman (input) for mailman id 836418;
 Thu, 14 Nov 2024 12:50:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Deeb=SJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBZIU-0002Aa-RZ
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 12:50:06 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7e7212d-a286-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 13:50:04 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso5307855e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 04:50:04 -0800 (PST)
Received: from localhost.localdomain (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae1685csm1416809f8f.83.2024.11.14.04.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 04:50:00 -0800 (PST)
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
X-Inumbo-ID: f7e7212d-a286-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY3ZTcyMTJkLWEyODYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTg4NjA0LjIyNDQxNywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731588601; x=1732193401; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0Aj5W+j63+NuGcn0ZB3t9CEq3oH9AJf5/KiiQiC1a0=;
        b=RrB1vT7fbhH01hlcJ3A4CN5AfsCC6B8Nv+lxQ1Y5EC9OSL2jB5BemV+iEw95iVQ2WD
         s1XrGPhYUyZPyqoRlLXC7nMZZ65UxEy4E0J6Ux9/Po7o4xYUPgfbgbjna4xefggzxtu8
         XaV0DkFb5Uu4lkZH61zNpZ6b2DOSsL17LulpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731588601; x=1732193401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0Aj5W+j63+NuGcn0ZB3t9CEq3oH9AJf5/KiiQiC1a0=;
        b=vh6fFgWEQMUqAFUfJ8RS3hyEblpjfe3zYszuMctCnC24imXNJ3cBFomdCjOlgdDWid
         gs2uzvYItAngBZIgYNcBnoOFeCyzWAkxNwwo1/+EMPuxERzRe4KFyKcO20+ONyAvV2U8
         mGaFhH5L3JAWga+FfKOL26x7h72U9KEYQtIDjv6Muc1M6LjwUhoZQoqVSLIoRfR9QI1J
         FX5FwHUxkMG0fdgE4udVR4Z/aF8tk1xl2MUb9guy6UrEVVWpb4Ah/MOknsL68rSh9PqR
         wf/44R+d8au4eTcHJNMcNlWkzyxCQJwjztmSbXyJDmPRjg86Rme8k+iknNHh+vGQdWr7
         7mrQ==
X-Gm-Message-State: AOJu0Yy9pCOX8WGZDKZow2HtrNRmB2nklho7jgHzDuQw9YMkaXr8kfTJ
	32hB3SOXKCwB1xXKRiGTz3wNR99K12oxCN4ADVEX1s8L39CVj9hledauMli5sW7+m3dxQB+qRqr
	X9/I=
X-Google-Smtp-Source: AGHT+IFZBqsZYRBCdwtL6NGshW6oAswZeo2hdZ9/qUiRqDf0+E43eek1nE9y+vm8SVGhne25OJnxhQ==
X-Received: by 2002:a05:600c:4f8a:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-432d4ad340bmr57400045e9.24.1731588601023;
        Thu, 14 Nov 2024 04:50:01 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/4] Use an include/boot directory to override headers for boot code
Date: Thu, 14 Nov 2024 12:49:47 +0000
Message-Id: <20241114124950.24808-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114124950.24808-1-frediano.ziglio@cloud.com>
References: <20241114124950.24808-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all headers can be used by 32 bit boot code.
Allows to override some headers, we don't want to mess up with
main headers as most of the code is only 64 bit so the easy stuff should
be done for 64 bit declarations.
Boot headers should be 64 bit compatibles to avoid having multiple
declarations.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index d457876659..13d4583173 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -18,7 +18,7 @@ CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
 CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
-CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
+CFLAGS_x86_32 += -I$(srctree)/arch/x86/include/boot $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
 
 # override for 32bit binaries
 $(obj32): CFLAGS_stack_boundary :=
-- 
2.34.1


