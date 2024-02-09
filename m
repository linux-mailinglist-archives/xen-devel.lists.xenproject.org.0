Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BA184FB5E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 19:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678781.1056303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBK-0007HH-HM; Fri, 09 Feb 2024 18:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678781.1056303; Fri, 09 Feb 2024 18:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBK-0007CX-Bw; Fri, 09 Feb 2024 18:00:58 +0000
Received: by outflank-mailman (input) for mailman id 678781;
 Fri, 09 Feb 2024 18:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYVBJ-0007AX-06
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 18:00:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b4587ba-c775-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 19:00:54 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56001d49cc5so1574177a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 10:00:54 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 fd1-20020a056402388100b00561103f29fbsm984503edb.75.2024.02.09.10.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 10:00:52 -0800 (PST)
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
X-Inumbo-ID: 2b4587ba-c775-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501653; x=1708106453; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8B0Pj3x9NNKyskGfWUDgYAd1f6cJ4ZaavTN0FBUQZB0=;
        b=hVJR1BqBFs+33LuACE+BtHluv4asgv0Ii/hfFeuXPieavH8xQ90r4/p7jQyitCAj6j
         03CXLm5zD7s89cCV0UmwNP9XAtfx8ufnXnFC52nSBR30mFGn8m81whnEia/KVJiKduL8
         f5rfYy4KSYx+G0m2bORWWEB8Y4uBgXv5LGt5FRvks+uKztwoKkt13nDoI3OyLBvqtFXQ
         yFAsFWVmouLEXwvIwTciPHBBVnAi5vIouo+bQ090GSzaU6QaNsO5TyLX90h2guN+65ym
         evHVe2C1N9wgVjknBhoQlHEHsbW2hRdHclGx7PKGLI79gJWEl3zYLMbq3/UBjTwi58kN
         +YNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501653; x=1708106453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8B0Pj3x9NNKyskGfWUDgYAd1f6cJ4ZaavTN0FBUQZB0=;
        b=nOu+JehDBDcdanz65c4oRk3obYkkzGhGTbf87JEfjjRO3nTPWNz4ftRe2R/QVtNNly
         MMDFoxhi8BnBx5Lb9XTek1ujAuEJe0H7gwxx08iW7O8m8fkN9IqKyQxhq+xrytjSUa78
         eAXKkErcVxWrOxdIj+d8jpN1yBwaixhw2UmOhCo4vzezIiuVp7luORAmRDuZHmQRerrJ
         UryMZGRIEhCsTuvTyKKJpVNU04FKSDb1zIkfW5J4pS6ELruCPq0w3Jk8EjNe6sQLUFEB
         1uI846sP4dbPxGR/xmKFYRdrFHW6FE5BohsyAskPDuYM8fizdbw4GWUyZCRKgrUfoVRD
         lBjw==
X-Gm-Message-State: AOJu0YyD15moGf6cFDTKKjvXS2WAKpevQsSqRFrGXgXvOXOggeJJTdV0
	dRE1MS2qzHEPpnI3sHe4e4Y/9hrDK7beNycWPcFfjwR5P9pjPCAWdlvxuVOy
X-Google-Smtp-Source: AGHT+IG7YVXB7f4PptTAFpGa8e2Ebe1L2b/BYhzaG1OzjD3gFAhpsghcd0eV447A5hEkZZ+cTgF6yw==
X-Received: by 2002:a05:6402:148a:b0:561:c35:dad7 with SMTP id e10-20020a056402148a00b005610c35dad7mr2005215edv.32.1707501653167;
        Fri, 09 Feb 2024 10:00:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJq/ORgYEshu0agU36A7K2vaCtwYElOyG89uaAaZbIGprzWaCHQZSxuiaWXmvYNC53dDnvYqCoRA5D/DMmtg47GnJuanhYSEj3pySLOrY3r6CTI82SQ6TwgQ==
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 1/7] automation: ensure values in EXTRA_FIXED_RANDCONFIG are separated by new line
Date: Fri,  9 Feb 2024 19:00:43 +0100
Message-ID: <8b6f208f0b4327392cfddbfa6809117cc7686750.1707499278.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707499278.git.oleksii.kurochko@gmail.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kconfig tool expects each configuration to be on a new line.

The current version of the build script puts all of ${EXTRA_FIXED_RANDCONFIG}
in a single line and configs are seperated by spaces.

As a result, only the first configuration in ${EXTRA_FIXED_RANDCONFIG} will
be used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - Nothing changed. Only rebase
---
Changes in V7:
 - Nothing changed. Only rebase
---
Changes in V6:
 - The patch was introduced in this version of patch series.
---
 automation/scripts/build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index b3c71fb6fb..13b043923d 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -14,7 +14,7 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
 
     # Append job-specific fixed configuration
     if [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]]; then
-        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.config
+        sed "s/ /\n/g" <<< "${EXTRA_FIXED_RANDCONFIG}" > xen/tools/kconfig/allrandom.config
     fi
 
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
@@ -28,9 +28,11 @@ else
     echo "CONFIG_DEBUG=${debug}" >> xen/.config
 
     if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
-        echo "${EXTRA_XEN_CONFIG}" >> xen/.config
+        sed "s/ /\n/g" <<< "${EXTRA_XEN_CONFIG}" >> xen/.config
     fi
 
+    cat xen/.config
+
     make -j$(nproc) -C xen olddefconfig
 fi
 
-- 
2.43.0


