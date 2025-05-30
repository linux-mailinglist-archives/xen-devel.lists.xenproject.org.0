Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4BAC8C56
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 12:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000672.1380868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKxCn-0005NC-46; Fri, 30 May 2025 10:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000672.1380868; Fri, 30 May 2025 10:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKxCn-0005Kg-1U; Fri, 30 May 2025 10:43:17 +0000
Received: by outflank-mailman (input) for mailman id 1000672;
 Fri, 30 May 2025 10:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OMCM=YO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uKxCl-0005Ka-Qo
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 10:43:15 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1200739-3d42-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 12:43:10 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a376ba6f08so1124163f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 03:43:10 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe73eadsm4392675f8f.41.2025.05.30.03.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 03:43:09 -0700 (PDT)
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
X-Inumbo-ID: e1200739-3d42-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748601789; x=1749206589; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FcIkInxbMiL4bR2A67xJ46+UWHa19mS6X2LgqbhTGfg=;
        b=Gh7rWU3E57om5LihnXotz2jf0wz33ZnZj+asFBwOLs1JOWDEu5XnGG2dX/RYGoKuEV
         qPCeybwMFTP5cRxERgtYAe5xdiNyGK+0Ls8yDHknv+dr7I9YhnATg606yhRcxWsbQye7
         JWYuq+ErHqVSRZ4lu3dNTwPlC4YJD5AYAVG8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748601789; x=1749206589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcIkInxbMiL4bR2A67xJ46+UWHa19mS6X2LgqbhTGfg=;
        b=e22ly3ukgAjyx0hCWMfEOXIJeChF7u0MescpqXCE3BZaOxp5XhIJs1Yw6k/2mzuveZ
         r7fgsYYH0W0Ea/V0CW/4ZGpgpBhScB7qXCep6XXOWZWDkXaH2bbN0x7X7KprMIeS5SA9
         EwMdhqfzqHowV5RitG80evC6XHJ7Mi1TRi8sd+3okFIKVYQakaVXYwyiDvkbzOpOxoHx
         9z3f4UeGKgXMYoAphWExEIcb7GMFCodBAsi2P7/nIrHWo37HLtC+8C4oKpCKDMvVck/R
         8f0zawPKm0Yh9PLGY1/asqvE3o7CGO4VwHFcND+WYarmf1sr48s/QRY8Ygx9qbR2toxb
         RyPA==
X-Gm-Message-State: AOJu0YxUzTxPTWAF5QUs58F3y9esL1ShMPT2T37eIENM5VkMKYmRIB8c
	LDpN4qfZb5Sq20utOivzTO2kpX+32uraRjpSfu0cPs5n0PJTbqaYDRD/8b7AApCpqwST7ZAzyxf
	9tkQa
X-Gm-Gg: ASbGncseRYfiZ6BDLet1ZlBW8x5OYzELp9dUg7XLF+2lPGs/8c4gWR7LGLm/zxxHpX3
	eCr5Q8Rnd8+HUllB5uPRNzZavRHX+SppQoeop/xVdmZlMRR051ig51EAlmizH+igulI0x1EftjJ
	cY2tVAOFv8dCPqCAfIcA0FjNfYAg7IxxNUd4Bs78bkM4CsQvGhVtGZRZ/6n4vWdDkdxUg+2x8Fp
	BmbJle45waBF/WF+p6VIgZrYPCJdqOkZSO/SWrw5BaRQksDfmTm7CQv/c/3GSkLNDPOr14LqmFm
	pS4h3gfhW+jJ6AULUP4Xm+NoREBSCoeK+Htbkfe2GLax/1Qbcah2qa5G7e5IlY5QtRdmMixN9EV
	ZBu73TgV52O44Ywxq8vzqY/61ML0+BJsNNFg=
X-Google-Smtp-Source: AGHT+IGDYISf3/g51HqL2cpRRBysUFU8zZ+xhWlbQGaunBxzVmrsq5xsbMaHdjAaM52c+P0Tiszy4A==
X-Received: by 2002:a5d:58dc:0:b0:3a4:f7db:6ff7 with SMTP id ffacd0b85a97d-3a4f7db764cmr1630713f8f.52.1748601789617;
        Fri, 30 May 2025 03:43:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/tests: Add install target for vPCI
Date: Fri, 30 May 2025 11:43:07 +0100
Message-Id: <20250530104307.2550886-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This lets it run automagically in CI.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/tests/vpci/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 62f21f341a01..9450f7593a41 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -21,7 +21,13 @@ clean:
 distclean: clean
 
 .PHONY: install
-install:
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
 
 vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
 	# Remove includes and add the test harness header
-- 
2.39.5


