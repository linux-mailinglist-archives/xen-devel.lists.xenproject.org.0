Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B1B9E15A7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:27:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847390.1262510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOFO-0005RL-59; Tue, 03 Dec 2024 08:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847390.1262510; Tue, 03 Dec 2024 08:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOFO-0005PD-2S; Tue, 03 Dec 2024 08:27:06 +0000
Received: by outflank-mailman (input) for mailman id 847390;
 Tue, 03 Dec 2024 08:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=On7Z=S4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tIOFN-0005P7-4C
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:27:05 +0000
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [2a00:1450:4864:20::643])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f16c1eb-b150-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 09:27:02 +0100 (CET)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-aa51d32fa69so801663866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 00:27:03 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([90.240.255.120])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996de56dsm588159466b.79.2024.12.03.00.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 00:27:01 -0800 (PST)
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
X-Inumbo-ID: 5f16c1eb-b150-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733214422; x=1733819222; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n4RYmB97U5RP7D/ueIKFiK5qjFE/edcdOpxPRLmG8lE=;
        b=i9rwJ+AD4HDSy22qCVQOzjsAvmvSyf6o7hExMHr2IvYaCLqYproZXMnkF5tPZVTrgD
         2gYjWVt7UBOkTK6hSUzr0w7rhezB0YriJLziAAB71Iim9xHtYkvK4Qma2Ux4Q2LbuJJt
         Hgbn6lD5j726DPaTus2ComrI0qKcwOY+ujyjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733214422; x=1733819222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4RYmB97U5RP7D/ueIKFiK5qjFE/edcdOpxPRLmG8lE=;
        b=g9oOoXbF0Aa/PZRb0FVZCadSjNcC/ye0jrPm/4E+KDz8y2+zuRPNb0NAKRBI3Au3+t
         tY2iDRsMgf/FV750yNFICz3jy1Qm8M887O1HPLC6BhMWwxz2LUNOEbhfwulKtlAfdH8i
         WIhxzJkhe2pYh6yspQU72JEYUf8TOe2YafN08qcrO/mJYSQOsmWGh4Z04/87uhXyney+
         fGQiXcf//m8YOux5stE+PvczOuQx/FhQQdSkbKutZhj/Ger8X1R6VQRQFE8nOsgMTtKs
         MJFPkk8PO/dwOEaqGzzuIs4+L+1c94RIwc1R3anEbXW660wzvej/3xzC1zd6rKizp2GK
         jT9Q==
X-Gm-Message-State: AOJu0YxjuyKDpgVgGWyZC3i/+Ees9qShAEADBVfoSJIlktuD9ho5gpbB
	0bfZqxSprEfObBxavLI+BJ9tN6zf8HcrzSkmDuBO4y/i7/44kpZ1FNw4jeg22hW7qTOi3IJB9VC
	x0U9eKw==
X-Gm-Gg: ASbGncuB0XO7XHkHgebIy3woNmtEM24t29MrhU7i38jLLPlIktpYBNKB7PCRRedFu2D
	4qAHhFPMetDcXtMtLPT9bD9N8+yN+TT4fez2a/xdCKZEBD+UxEGMNV14YTmWb+DVkVIC2+sp/fT
	uPPbsu2vIniH2Vmhq6GkW+Vp1dBb3BuGXfc1yDcGA3PWwQZgKS8nJ7UMY7zQUmCi79WBIE7VzDk
	kHNSCh/o9FvftqDf5YgFowgphnIPfjA7zbj7a5eYEE5gCqEabuxwL/PGknUfc4bYfNqUM0ObT1U
	6w==
X-Google-Smtp-Source: AGHT+IGUwKfLjT46BhetCnRPGSUz0vRn7TLNlnwBDiPpNtB3xRVG33KctAZBTJBeucMddG0pA8eJiw==
X-Received: by 2002:a17:907:7814:b0:a9a:b70:2a92 with SMTP id a640c23a62f3a-aa5f7d47a36mr112660666b.16.1733214422048;
        Tue, 03 Dec 2024 00:27:02 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CI: Update to FreeBSD 14.2
Date: Tue,  3 Dec 2024 08:26:58 +0000
Message-Id: <20241203082658.134073-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>

https://cirrus-ci.com/task/5913096629256192
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 00e4c57678c2..4a120fad41b2 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -24,7 +24,7 @@ task:
 task:
   name: 'FreeBSD 14'
   freebsd_instance:
-    image_family: freebsd-14-1
+    image_family: freebsd-14-2
   << : *FREEBSD_TEMPLATE
 
 task:

base-commit: 126b0a6e537ce1d486a29e35cfeec1f222a74d11
-- 
2.39.5


