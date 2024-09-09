Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C6A971AD4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794476.1203442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneLY-0004qg-Mi; Mon, 09 Sep 2024 13:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794476.1203442; Mon, 09 Sep 2024 13:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneLY-0004ov-Iy; Mon, 09 Sep 2024 13:22:24 +0000
Received: by outflank-mailman (input) for mailman id 794476;
 Mon, 09 Sep 2024 13:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sneLX-0004oc-Pr
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:22:23 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b945f79-6eae-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 15:22:21 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so8192232a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:22:21 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c7286esm337879166b.138.2024.09.09.06.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 06:22:20 -0700 (PDT)
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
X-Inumbo-ID: 8b945f79-6eae-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725888141; x=1726492941; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IDoPRe5pKMPzPxX6feYXl4w8ZQX1Ods64y/fBaEdyn4=;
        b=YNLt9Ixp/l+P9KtTvd4+4BZv1aYvMVFBqiaGX+quvS62aWgS5lMjWFqgJ6U995uAyz
         dgmAY7dm497YFAEUfutkDYjpvIfU3gnlk1Xj0DUE4ETfX3NmkODPSeNKJsc8j9vYOAqX
         hASCw+61nVNaRHNhqr3ySGv0hICDli/+ftQvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725888141; x=1726492941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDoPRe5pKMPzPxX6feYXl4w8ZQX1Ods64y/fBaEdyn4=;
        b=VZbWWOz6LVG+DbVSVh1nGS6RMy7ODYZ97FhIaQYpwPUu9SpVXTt+xz1jfqV9efXB3P
         ffoYlHxLi2a6qDTcE/RWiusrzCNiwqM6YvMsZMCnCvEHMgxwtE/oCsBMtzdxu+GYvaY1
         qOgql7K/f0ElumiGg0B/lzTEp4TWn4WQB74EunC8Gz/ptaY0wR3s8T+Nj30nvS0Fhia6
         1AiHdFGzDKMPMY3e7Q+wJnlrIu+dDd+6LWqx6cI78mbpVaJWehs5y2F/ThCy3us3+tly
         Z7AAdUdb+1IYna34ZTNLboIJi3C3TrXh+4AmAUboErMOJ6KtK/fNc08MzBGTvkuCWy9u
         XVTw==
X-Gm-Message-State: AOJu0YyCfJJwGL1e72s8qY1kT0EmO71qpvRX3aeqYjTf2JKbtFgP1zpU
	iACd/E6I0Nc7n/p9BKZ1aEt9Su2Opt6VcT76bTQgkAQ0vdQk/cnoiOyz2/mh/xy0cIgKRSK306g
	+
X-Google-Smtp-Source: AGHT+IFPyDTfiD3VL6NQk1WYRVnoTxiB+Xb2Sjx7Y3h6b0Fc5rfmjwuKpuOZinVgdpIxYuDjN5iJig==
X-Received: by 2002:a17:907:2d8d:b0:a8d:41d8:14ad with SMTP id a640c23a62f3a-a8d41d81737mr536398366b.29.1725888140778;
        Mon, 09 Sep 2024 06:22:20 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/2] x86/boot: Optimise 32 bit C source code
Date: Mon,  9 Sep 2024 14:22:15 +0100
Message-Id: <20240909132216.128114-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The various filters are removing all optimisations.
No need to have all optimisations turned off.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
Changes since v2:
- combine filter calls together;
- added additional patch.

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 8f5bbff0cc..dfe3cb7034 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -15,7 +15,7 @@ CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
 CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
-CFLAGS_x86_32 += $(filter -I%,$(XEN_CFLAGS))
+CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS))
 
 # override for 32bit binaries
 $(head-bin-objs): CFLAGS_stack_boundary :=
-- 
2.34.1


