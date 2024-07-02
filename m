Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D096E923BF4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752289.1160547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGk-0002o9-TG; Tue, 02 Jul 2024 11:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752289.1160547; Tue, 02 Jul 2024 11:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGk-0002k2-OB; Tue, 02 Jul 2024 11:01:54 +0000
Received: by outflank-mailman (input) for mailman id 752289;
 Tue, 02 Jul 2024 11:01:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObGj-0000Yf-6q
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:01:53 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c5e04bc-3862-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 13:01:51 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a724958f118so488330966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:01:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7516310768sm269306866b.218.2024.07.02.04.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:01:49 -0700 (PDT)
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
X-Inumbo-ID: 7c5e04bc-3862-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719918110; x=1720522910; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXRTusB4zdDIQb1xw+ddCF02nNWGT9px/ZuZuuKSvAg=;
        b=Ls3gRZUPWwmU2+8EXBXboUGUw1ibUnudc3e+Q9SP5c33xVMD4HmeufgpexZmlTwpVH
         4HGQmhvy7ec22PxoG/1KoPI4Jnx25z6stwfawhsRghMsroAlyDkbM1OBrOMkkRqyclHs
         FTJxdZlnyM25YOWZg6IGHJk+muL4W2hDm/95lYZST3M+Jtk9qjB2AUMQZrpAZ0qrR4Cj
         0L6LyBzO4i3yZ3tlkkclsefaAP4L68ykRfcyiB7twOBYd/HpenGgLkgYhK5f27NxizVT
         /UWGaa3We/rR+m+6Drm1dw8UrspZnjus3c3lTexDGGY7oZti1ZTjqMdPXJ3TSaJ2b9Xc
         PJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918110; x=1720522910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXRTusB4zdDIQb1xw+ddCF02nNWGT9px/ZuZuuKSvAg=;
        b=bPYqMU5t8snV4VunXekr9VtUBFrF6AJS9ZqtQWVwmwj52NEDgZ+ht01+qmCHChPirY
         29LjZnIbPElBirl1Rw6/jpmC20al+ud7aJbtDNApFlZ9RyFDdyLxgdhAl5lVHy1EQM37
         v5l6oWklHo/fhKZU7m3Aa9FAi+GzfoUn2n9+WMQO7vn+/9IPesJJjVzuiZyQTVl2jmJm
         tXb5ZPAzO+5yRdAUOUPIFWWrE3DRQFqB2VdsBwMHtrhZAKrEUsGBEc1ravq3t/8R2N9c
         9ozOJp44zniRU31HBsNZk2ZJRtbe+Ms27xmkWm+52v6LU7o8PtszJG3zMGUuoBFnEx3Y
         orpQ==
X-Gm-Message-State: AOJu0YwnZmRTxFYRlkDJv5d3EBz9eNa8GWmOhZiE91XX/utsS5HvJhkp
	jkbVZc3Rh6F3Krbd19Y6d8r+XCS4X6DiNzgCOyiWdIsOhdDjxRifSEYDImZh
X-Google-Smtp-Source: AGHT+IG2pHgxImgAkUq4VXk4SSwVc1DND2SRw0rdx3tt+E8v6anp+jp0TghkfiqxNfhdDjpKP2bvtA==
X-Received: by 2002:a17:906:7313:b0:a6f:1111:bd8 with SMTP id a640c23a62f3a-a7514475b3emr521361866b.46.1719918110343;
        Tue, 02 Jul 2024 04:01:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v14 9/9] xen/x86: drop constanst_test_bit() in asm/bitops.h
Date: Tue,  2 Jul 2024 13:01:36 +0200
Message-ID: <ad139232c39ad67246233a9b001f07b289491788.1719917348.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719917348.git.oleksii.kurochko@gmail.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

constant_test_bit() is functionally the same as generic_test_bit(),
so constant_test_bit() can be dropped and replaced with
generic_test_bit().

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 Changes in V14:
  - Add Requested-by: Jan Beulich <jbeulich@suse.com>
  - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
 Changes in V13:
  - new patch
---
 xen/arch/x86/include/asm/bitops.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index f9aa60111f..8c0403405a 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -277,12 +277,6 @@ static inline int test_and_change_bit(int nr, volatile void *addr)
     test_and_change_bit(nr, addr);                      \
 })
 
-static inline int constant_test_bit(int nr, const volatile void *addr)
-{
-    return ((1U << (nr & 31)) &
-            (((const volatile unsigned int *)addr)[nr >> 5])) != 0;
-}
-
 static inline int variable_test_bit(int nr, const volatile void *addr)
 {
     int oldbit;
@@ -297,7 +291,7 @@ static inline int variable_test_bit(int nr, const volatile void *addr)
 
 #define arch_test_bit(nr, addr) ({                      \
     __builtin_constant_p(nr) ?                          \
-        constant_test_bit(nr, addr) :                   \
+        generic_test_bit(nr, addr) :                    \
         variable_test_bit(nr, addr);                    \
 })
 
-- 
2.45.2


