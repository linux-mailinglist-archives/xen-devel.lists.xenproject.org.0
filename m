Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739EA971597
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794246.1203037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbsR-0008FZ-9U; Mon, 09 Sep 2024 10:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794246.1203037; Mon, 09 Sep 2024 10:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbsR-0008Co-6f; Mon, 09 Sep 2024 10:44:11 +0000
Received: by outflank-mailman (input) for mailman id 794246;
 Mon, 09 Sep 2024 10:44:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snbsP-0008Ch-Fr
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:44:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70a06b48-6e98-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:44:07 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso684852466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:44:07 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25953275sm324080166b.70.2024.09.09.03.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 03:44:06 -0700 (PDT)
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
X-Inumbo-ID: 70a06b48-6e98-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725878647; x=1726483447; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r8bvUG3H/53vtgdS0ABbaHhClLhlbxxXq9bhvu8/auI=;
        b=eppTE4QDkbFD+gWTUUUOZBRV6KV1Vvy+bKjdpCLpGKmyyx2ys0eGgMMcqlFrHpoWh0
         Ijf++ZCGKEnS/w+5ooJLuXHek+/r/Ot8vtBLwk9GMe9RliiCKJesZgwAh9axOvjLp3XJ
         g014SPiARZJrvj7ks4nEcBgFPQQmoJJb5TysY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725878647; x=1726483447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8bvUG3H/53vtgdS0ABbaHhClLhlbxxXq9bhvu8/auI=;
        b=h+gXydOHGKmV9r/uhBiDrhWYfqUC2BWBRabVEndOywJ8ySqvzZ2SirzVjN+ON0UyPv
         x2g5TdBArJXK2eXNz8BULEIwGMcvCxalN0mM4p1ZDvLpiwY8oD5vcgbWzcDzzUewiQvc
         fOBKM+TU6WNjS4FZBZV2i6TxAft6ujaSFyumnpMKpgWrAml2+kzvKN7lpfuAHjkWlac7
         ga9McADfyf9aqYmAiYQYKvc7S93EkUYS3EKpqNJvJLo1GPqQ5UcjAiyZOdoHvDXuM53T
         NFZqWYGXmtHMGff/jLSNU3rYzVKoBHiFeqD6Wo6NHkLcWak951Y0I0LpRnYivnG2BOMS
         KhxQ==
X-Gm-Message-State: AOJu0Yxm1FvqMBiMFkG+Yncy3yoKYcCsDs7blkXBg5yKoLz57aTeTn9g
	ZJyaRcdVNL89Xb3nSBNLtrnNVnTfbLyLxV1JjfTKvIPh2S3Bg7jqiWolAfkHGOUnZGfx1Hc7NkR
	E
X-Google-Smtp-Source: AGHT+IEKJG72WFJYDeDUNYq4YN/rs4dcgb6b3Dwk/EnlrIE9XaKcI8xEl87gRXHrADYg8k5YuP6aOw==
X-Received: by 2002:a17:907:d17:b0:a8d:498f:640 with SMTP id a640c23a62f3a-a8d498f07b6mr444784966b.21.1725878646739;
        Mon, 09 Sep 2024 03:44:06 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/boot: Optimise 32 bit C source code
Date: Mon,  9 Sep 2024 11:44:02 +0100
Message-Id: <20240909104402.67141-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The various filters are removing all optimisations.
No need to have all optimisations turned off.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile | 1 +
 1 file changed, 1 insertion(+)
---
Changes since v1
- reuse optimization level from XEN_CFLAGS.

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 8f5bbff0cc..8352ce023b 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -16,6 +16,7 @@ $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
 CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
 CFLAGS_x86_32 += $(filter -I%,$(XEN_CFLAGS))
+CFLAGS_x86_32 += $(filter -O%,$(XEN_CFLAGS))
 
 # override for 32bit binaries
 $(head-bin-objs): CFLAGS_stack_boundary :=
-- 
2.34.1


