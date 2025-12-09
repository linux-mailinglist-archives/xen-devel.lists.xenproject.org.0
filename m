Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B096ECB00DB
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 14:25:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181711.1504727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxiO-0004Sp-SW; Tue, 09 Dec 2025 13:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181711.1504727; Tue, 09 Dec 2025 13:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxiO-0004QB-Pf; Tue, 09 Dec 2025 13:25:16 +0000
Received: by outflank-mailman (input) for mailman id 1181711;
 Tue, 09 Dec 2025 13:25:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vSxiM-0004Q5-T0
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 13:25:14 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dce85f2-d502-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 14:25:12 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42e2b90ad22so2104848f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 05:25:12 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353c9esm30528904f8f.40.2025.12.09.05.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 05:25:11 -0800 (PST)
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
X-Inumbo-ID: 7dce85f2-d502-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765286712; x=1765891512; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DV8NJeRhubdL2jzPn5QSgIhM5cwXZeyKP4ZRnSJnhs=;
        b=jnnxVQsi1K1JRww3TjpO4cWoVd3kCHDVsHOca3S9AK/kxSyOZRbde6yQNn2mFGalNe
         cGxxKYAxaH1PoY/c3KW4+usK2+N/7aSF2wjr4Ny5MvFbz/b0m9i0FvaEtnyIcYkqNygs
         gtZoZ7wBnzMZseFPAD+dH6fDblWLbODkUaOMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765286712; x=1765891512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DV8NJeRhubdL2jzPn5QSgIhM5cwXZeyKP4ZRnSJnhs=;
        b=RIqEUX1U74/x61Cgj42zOEWz2AQT7kd9tJxA5hfIydeWYf/bQb+TCA8qmpZrIHRGkh
         FM/PGnhJhXkVfQ3GfGhOgMJ9DCRXkBUBYrrh5nJ0m5on7xh49ewAeF4KkjQDyj5OhUs6
         dp/CaLlj3YYK9WlBUrnW3hlKp58CKgsObxW5PfIhGngVIULpZik8jrodALiRIs+GEIFP
         EFZYog189kHFW1iseFORXXNHWEoixu0K7rQ3X+MOYVm7pwuwgF9L2FDen6G/SL43478c
         G+CJ6M2Zs263dBQZ6GMVq1ygMzz8QWtxBIwE/OR9TK3Ako4F6ic2DDsJtFUCOzmNYLMR
         71Rw==
X-Gm-Message-State: AOJu0YyTORUJcYx/EQHB55xt8vB+AH6DxyAA6yddX3w6jFiof5utnvcQ
	Z2Nx18vkJxVQMmhIgXUPjog8C5Of8z9Z6phYibi0aS3NxVKht7zRxPTUZmhzLsYHIL0zuJBDnYv
	BvSnW
X-Gm-Gg: AY/fxX40pdwK/bQ8I1cvrJD/3x+xKTJqm64+tM3NkdkbVHFon+D7kUCZit2TMnbL42n
	6KkPdWCLQoonrzqKmtkaOLjKPQ23qPO+SgoG/gRFvmM5ivX6+R57sQ/j9P4fK5nUcmdgBePI781
	Jk+vi+K5F+C43J/xOToG4pr47nHrt9ksresiI7yHZuiqgvuNTk7o2QfqXWCANO2Eln0ux8t9s7e
	3vjhY4g76z6hybQ5rHhYxH7ENrdeKw7VC2VW86bXZcsHFNFS2oZmGHpsfcQquDdlnkKk93X2eRr
	pso4ll4gLAGRvTEuudSsiIEplpBnn8qK6j/c+UqR+M7DTtIEWf6bN0H8jQwarWeI/dWS/hZstnA
	cI3/Odm86AVfSWJEySqOH7VIfRdcM1cYWqBQRTSp7nyHxXs1Ta5g4wolsQBBuWKksKX6nWnpcFi
	Bg0QKrN7wGTwpuh4UKLe7qxXVD8h+tJegoJMWv466vMZk9eXbgN/CVUile3maqbQ==
X-Google-Smtp-Source: AGHT+IF576Gxqlc2rzON8ONVVt4sBQjp9oeiILQCqYMEIxfl2b4m6J7If36NWUVO//drjNX5Phkwzw==
X-Received: by 2002:a5d:588c:0:b0:42b:3da6:6d32 with SMTP id ffacd0b85a97d-42f89f0e3ddmr11531992f8f.23.1765286711827;
        Tue, 09 Dec 2025 05:25:11 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/libfdt: Fix comment following treewide __ASSEMBLY__ cleanup
Date: Tue,  9 Dec 2025 13:25:09 +0000
Message-Id: <20251209132509.2095158-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This one comment didn't match the #ifdef symbol, and escaped conversion.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xen/libfdt/fdt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/libfdt/fdt.h b/xen/include/xen/libfdt/fdt.h
index 57fe566306d0..c6e4d7838dc5 100644
--- a/xen/include/xen/libfdt/fdt.h
+++ b/xen/include/xen/libfdt/fdt.h
@@ -45,7 +45,7 @@ struct fdt_property {
 	char data[0];
 };
 
-#endif /* !__ASSEMBLY */
+#endif /* !__ASSEMBLER__ */
 
 #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
 #define FDT_TAGSIZE	sizeof(fdt32_t)

base-commit: 63137a87311e1081bce0c5a4364492b4fc728bfb
-- 
2.39.5


