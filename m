Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7488A00CC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 21:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703586.1099293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudt3-0008DK-S1; Wed, 10 Apr 2024 19:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703586.1099293; Wed, 10 Apr 2024 19:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudt3-0008AJ-P4; Wed, 10 Apr 2024 19:45:37 +0000
Received: by outflank-mailman (input) for mailman id 703586;
 Wed, 10 Apr 2024 19:45:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rudt2-0008AD-Bz
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 19:45:36 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e55eb251-f772-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 21:45:34 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a5213f0f85dso105495166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 12:45:34 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906230d00b00a51f0f9a2casm2567845eja.188.2024.04.10.12.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 12:45:32 -0700 (PDT)
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
X-Inumbo-ID: e55eb251-f772-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712778333; x=1713383133; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5HdQpnvHrH/YBHNhvbeu+vnuV113IZ3Z4yBsyYl9hE=;
        b=ohjRPQgljoSfyu2G/fWOnnRHYAJNe8rbNM0iqAgzND4SU1Yi0CWKv+YtS/JVcgga82
         79BaxBMlN+HEI0oj+WkuUcBkgFM2jQQ76E6T9AIR75CaPk3H8Vdzf5Bpgv0llHrQS0wv
         /PplDzRv8aoHmnU0t9UK4SHYj/oeAWgY+jSg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712778333; x=1713383133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5HdQpnvHrH/YBHNhvbeu+vnuV113IZ3Z4yBsyYl9hE=;
        b=Ic8HvbTpArLDbVIF/RE8GUBzvJGCgdEjlRwpwHE/0h44DFFbKVcPTiplFQybmlIFzL
         t3Y6UalAUlUaemJ932Q+rkHvvU3XPpbGvxcy+qNqXzu/IG8ey9ThNmpcG9GuPL+fKTrB
         /a/91cCUvjVf+DXvjJhIAIE4YROFB3dLNCvKDJTKYslyUlum4KKoeJMQiM2z9KeGJ/ig
         x+5ptMOQ3OKbw6lufdq6NBt1yVQ84KUyR3cVz/6DriYGet9z9tFF+mmCh1eblD+Kjvb4
         jnGrbclsnykGVxSWg+WZTwL8kjeD9ihS/lROE2npJvOO3+qLQNf1J57hPqmQohIImgTx
         4Gbg==
X-Gm-Message-State: AOJu0YxDL1fc3kq+njAVQYQ0tAuscSltZqHLTHb6t7/IX549VMv4EIr6
	+wAWP7u0gLioGqakqlpKKnNvTDjO2oazLfcBWHQjVbgoZv/4aPfsX2JKwYXg4n40RXJpPweYHc6
	3XIo=
X-Google-Smtp-Source: AGHT+IEQeqcZiU62WncIHnkFSFMa7CDZKstddHbkcyiXT+uGXT62N8aMwFrUNmTGWG8iisFh1dpe+g==
X-Received: by 2002:a17:907:944e:b0:a52:1208:31eb with SMTP id dl14-20020a170907944e00b00a52120831ebmr2055368ejc.48.1712778333052;
        Wed, 10 Apr 2024 12:45:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] x86/emul: Adjust X86EMUL_OPC_EXT_MASK to placate MISRA
Date: Wed, 10 Apr 2024 20:45:31 +0100
Message-Id: <20240410194531.1500509-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resolves 4740 MISRA R7.2 violations.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

of 4935, so 96% of them...
---
 xen/arch/x86/x86_emulate/x86_emulate.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 698750267a90..d92be69d84d9 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -620,7 +620,7 @@ struct x86_emulate_ctxt
  * below).
  * Hence no separate #define-s get added.
  */
-#define X86EMUL_OPC_EXT_MASK         0xffff0000
+#define X86EMUL_OPC_EXT_MASK         0xffff0000U
 #define X86EMUL_OPC(ext, byte)       ((uint8_t)(byte) | \
                                       MASK_INSR((ext), X86EMUL_OPC_EXT_MASK))
 /*

base-commit: 0e7ea8ca5fc9bce9248414f6aaf2dc861abd45d9
prerequisite-patch-id: 8d06e56c5d8a52f1387e1f5a7fce6a94b8c4a1ed
prerequisite-patch-id: 13355d26254b979c79de456c9a6ea6a9c639ba63
prerequisite-patch-id: d1f308616490257685a49248e29f1b3516c2dde4
-- 
2.30.2


