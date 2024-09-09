Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAB9714C0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794133.1202849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbGF-00070H-1N; Mon, 09 Sep 2024 10:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794133.1202849; Mon, 09 Sep 2024 10:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbGE-0006yU-SC; Mon, 09 Sep 2024 10:04:42 +0000
Received: by outflank-mailman (input) for mailman id 794133;
 Mon, 09 Sep 2024 10:04:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snbGD-0006Wo-0T
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:04:41 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edacb18d-6e92-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 12:04:40 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so69750866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:04:40 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce96a7sm317744566b.158.2024.09.09.03.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 03:04:39 -0700 (PDT)
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
X-Inumbo-ID: edacb18d-6e92-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725876279; x=1726481079; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBtBtpFtAkSefhAwXJvOHUNIsjR7R+0hhbRTqjIHJ10=;
        b=Z6k+i5dBbMPH6pjAeVn5zUUdgtmS49p16YxkIGrxSA5ydcJt55y8lxGvvCeKR5Piuh
         co1rpbgSMM4Lx0+sf5qLNwuWN7UejAWYdohaYVLxOIw43KGhuS+5HM12IGPsbR417Ckc
         PGvDiPrgz9RQadyGNrPzlR6QbFUrDkxO9EhII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725876279; x=1726481079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBtBtpFtAkSefhAwXJvOHUNIsjR7R+0hhbRTqjIHJ10=;
        b=DKDeSsIyFNYJdPoKs1C3kYhJxYcq9H+AWHPZ1TgZIDxqn5ny2Y7m4Pi9r+okZtyoti
         7pZn2x+pO0khzo5P21nGSvvsGEkkJRt7GH4Tiq01BYYBl0EFS/MSQSfrqzzfYbbs8q5S
         JlKADnvaCjgXmO+cb6Lt7BK5hgMxRNyW7XJN2yJEJMWHhQpHvnHjf/I986YXxJLxGiT6
         UCjxHi2HU/6JuaJifBK0XuSNHQhwq6QykfiEv9TBuxoDrtlOQf5dmMXOWtJ7mVUcz+73
         vjnJd5HMWZdzdi3NmCy81/Z0+OeMAfzfKVbG+ti6S7PnlMDyyT5SvdPS/gJZxhtGh4V9
         vFnA==
X-Gm-Message-State: AOJu0YxD/61zGT60c5j8Vy5pmH98r2/+MZtqzur91uqCGqwkbGhyb5C4
	Zp6lB+oaJgZkbSUAHRzSdBLnb6+q8k6qETwsZmsUX75KZlrdX78mGpqe5ivS7t+Ax8+pyaDOWAQ
	/
X-Google-Smtp-Source: AGHT+IGoutK7m6MT+NPIMJ9erfSJzlViYHQDtRMwPeQaRZX6mfvuqWOaJ/dUcJmfB4lJlh+pcKM9Cg==
X-Received: by 2002:a17:907:c16:b0:a86:8e3d:86e2 with SMTP id a640c23a62f3a-a8a885bfd11mr1219681866b.11.1725876279366;
        Mon, 09 Sep 2024 03:04:39 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Optimise 32 bit C source code
Date: Mon,  9 Sep 2024 11:04:28 +0100
Message-Id: <20240909100428.47102-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909100428.47102-1-frediano.ziglio@cloud.com>
References: <20240909100428.47102-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The various filters are removing all optimisations.
No need to have all optimisations turned off.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 8f5bbff0cc..26737ce25b 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -13,7 +13,7 @@ $(obj)/head.o: $(head-bin-objs:.o=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
-CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
+CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3 -O2
 CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
 CFLAGS_x86_32 += $(filter -I%,$(XEN_CFLAGS))
 
-- 
2.34.1


