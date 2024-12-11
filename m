Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E19ED36B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855079.1268141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVH-00083J-MG; Wed, 11 Dec 2024 17:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855079.1268141; Wed, 11 Dec 2024 17:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVH-00080g-Hl; Wed, 11 Dec 2024 17:28:03 +0000
Received: by outflank-mailman (input) for mailman id 855079;
 Wed, 11 Dec 2024 17:28:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntru=TE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tLQVF-0007J6-NN
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:28:01 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44dbaa17-b7e5-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 18:28:00 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5cfa1ec3b94so9628534a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:28:00 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6656f306csm687297466b.61.2024.12.11.09.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:27:57 -0800 (PST)
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
X-Inumbo-ID: 44dbaa17-b7e5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733938079; x=1734542879; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBf1T7q7Qfa9RGnc2Coijh+Oa0RzeIjYcm94VV4SlJc=;
        b=kxV5UOgUUq817NL6EleR1nKXRcQns110WbtsBreWDiXDJWinhIcbZ/d/mmqlYiSY8S
         XuPBe6zMnqsfqvMzkA91s9gwunS7BWnI5JPx5TTqgZGuSQAva6EqZMzHlSJG0ZQOtxUu
         iozGR3V5mqrvyY2u+XZKNT3EGVRWetoul5hO4me7lK/qf5GWC1lOQWNh6oMitoWc7JXf
         3wY7vLvh0umL4oMn5DMAloluUfBRpa6XTawZxCk7t9k73yGUcN9bQHMnasjBkVpUl5fH
         jCKR6671WNSD0+qDte/+YGJeeTW/+PjwlqqT+WsQbZnWCxGUK9jFIjoVFuspuUSrLp4y
         iqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733938079; x=1734542879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBf1T7q7Qfa9RGnc2Coijh+Oa0RzeIjYcm94VV4SlJc=;
        b=lkNEauXyoElMpxDtiCU5FdhOryf4c9XVZNxGfNopEOsq/E82E/73PuP88J+Nm9GTI4
         8yPYO9rWP8PXMoiluLiGV8S6pCq/wLSgMQ05z06Lql/pBhfhtxalXlpxGncKC5cpFcKB
         M1nblSGi7V4xv3qmiBKtPh4x4EQq8dngZnm9WviOD6dcfgxiYlvTNjkQDyLz8pWng0DF
         CHaj270tMS8cwvSMU/cQxbba/x/pHD6V1So2YT9wbe5q4Iawpc4zvyM79NSrX3hSh217
         5HEzUqarf3owGBMbbbZaxi5w48Pg28L+zdsKaxO9LXZo08aIGQeixnqKO+a4VnDp8eKi
         iQYw==
X-Gm-Message-State: AOJu0Ywik3SSnQzoMwQwk8w9vPH4lOI6lWazmfkBe05zLWIFwPN8HbQ3
	MBRgUjDI2aVoWTR4Z+2x5Ou9OZKX8HOFc6zQFmi/CX7JJSxYCCR2CH+KlRaf
X-Gm-Gg: ASbGncvzJcMtFVPu97VzLwHYdIGvg/MHeZwa+qSU48rkpoALrQLDbDsdg1LKvg5S+UJ
	yRcqsc0FPbDkHnRh4aiT7KVrZBMYThMWOMglNCnJtm0MvwMKaqCyjvEk5+WdAmz65Y4LZnLUxnt
	ADyGrK34GeicIDJB2B2z1ybs45R11NMOAkdYund9Vxlyj6wgaXSePpJJ7IiHRP5pHOTzI+zR6Sq
	+74z+crjsDYcNLAVmPMFIXz/qQentfxCLxVtILp79RlmT3F748u56Y=
X-Google-Smtp-Source: AGHT+IH7cOZleyu34bvpQMa3pFX/11My/M5C5X1FUrFKP5oF4geYyx8+10k/PUjt4AmSnvyzUmK5Hg==
X-Received: by 2002:a17:906:3154:b0:aa6:8fa5:f3e3 with SMTP id a640c23a62f3a-aa6c1ab62b1mr54492666b.8.1733938078530;
        Wed, 11 Dec 2024 09:27:58 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/7] xen/riscv: reorder includes in asm/page.h alphabetically
Date: Wed, 11 Dec 2024 18:27:47 +0100
Message-ID: <2e2751c3ef25f3b1aa3a216045022e82d2ab2b30.1733937787.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733937787.git.oleksii.kurochko@gmail.com>
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 91b1194b55..bf3f75e85d 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -5,8 +5,8 @@
 
 #ifndef __ASSEMBLY__
 
-#include <xen/const.h>
 #include <xen/bug.h>
+#include <xen/const.h>
 #include <xen/types.h>
 
 #include <asm/atomic.h>
-- 
2.47.1


