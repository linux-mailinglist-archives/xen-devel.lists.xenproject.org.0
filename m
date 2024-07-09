Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6EB92B9AF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 14:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756247.1164794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRA7o-0000NM-Jw; Tue, 09 Jul 2024 12:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756247.1164794; Tue, 09 Jul 2024 12:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRA7o-0000L6-Gw; Tue, 09 Jul 2024 12:39:16 +0000
Received: by outflank-mailman (input) for mailman id 756247;
 Tue, 09 Jul 2024 12:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cUMd=OJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRA7n-0000L0-1r
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 12:39:15 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f4f2677-3df0-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 14:39:13 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a77dc08db60so439000966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 05:39:13 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a855f20sm73862866b.168.2024.07.09.05.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 05:39:09 -0700 (PDT)
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
X-Inumbo-ID: 3f4f2677-3df0-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720528752; x=1721133552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCwTWs3J2ErhsM7r7MHMIH+3aRxyyC9D91JsPsrwA5k=;
        b=KNI9ECAFiXx58Rb8MXX4UgSIQ8M270jwA5zh5AzD8Fr/I6q0uU3Q5P1seKXWURDSTo
         m9DNrfATx90lF0PticVYGyXKI24Rl4YxU3e3ffxOlSjndcaDYGrgQRW3wLdAlGavu7Qp
         pN8m8UIo5WLmGcBxkFOmy9y6FfCexhiN4x1Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720528752; x=1721133552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCwTWs3J2ErhsM7r7MHMIH+3aRxyyC9D91JsPsrwA5k=;
        b=XPikGULGEe0cUZavXorrS8WK/IrkrkZu5WEiPzacklr+UTrxGAQCFzb/whN21CN4aH
         W2Aw2yttQ66fxvEC+eQnnpVudVX9PUaQmeh8f0odksw3udjNUOoVZTv4h4LBgDGJlSHn
         ZEcBpgIgxe6+qOOX4CjPqMJcwY7L2Bxhxc9cyCBhyav4Y93Ojp9gIEpESIZIgvohn1EB
         7jeGg25RLnefO10rImCsatFbA/8MYhnIAfLsN8gbwatRdZAyCM6s7iP+npwoE2xzq4Bx
         WyiZUjaA2/BsRgXOmNzkNjNYKXnPf8cWZWAUR8V92rUdCghiYMDbKlJE93NhNGB7PQ1s
         XhlA==
X-Gm-Message-State: AOJu0Ywbu0M5Iss+tyaZnhp2O345l9LtGv8IB9MmqYMwUhW/wmKoC/aB
	8daHcQ3CdjLlYiFm0+gnWiGl1RWGi+UWgcRVkPlcH/QFycQqaLFXqJs0Pc9VzLKIhWYlijqApKP
	Y
X-Google-Smtp-Source: AGHT+IGJ02UfS6p/btyg7iOJuzO1L4PP/AX+sFR5ol2jvu6fSK1s+f19xNw2/pApuml8nDivEuvV6Q==
X-Received: by 2002:a17:906:4a59:b0:a6f:ad2f:ac4b with SMTP id a640c23a62f3a-a780b68923amr145728266b.2.1720528750786;
        Tue, 09 Jul 2024 05:39:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19?] stubdom: Remove more leftovers of caml-stubdom
Date: Tue,  9 Jul 2024 13:39:07 +0100
Message-Id: <20240709123907.2400138-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: e536a497545f ("stubdom: Remove caml-stubdom")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.19.  This is additional tidying to a removal in 4.19, which will
otherwise need backporting if it misses 4.19.
---
 config/Stubdom.mk.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/config/Stubdom.mk.in b/config/Stubdom.mk.in
index 5990fc4e04f9..b399d77740e8 100644
--- a/config/Stubdom.mk.in
+++ b/config/Stubdom.mk.in
@@ -26,9 +26,6 @@ LWIP_URL            := @LWIP_URL@
 GRUB_VERSION        := @GRUB_VERSION@
 GRUB_URL            := @GRUB_URL@
 
-OCAML_VERSION       := @OCAML_VERSION@
-OCAML_URL           := @OCAML_URL@
-
 GMP_VERSION         := @GMP_VERSION@
 GMP_URL             := @GMP_URL@
 

base-commit: c4ebeb79d10a25e8d48a71cdd381898265267e67
-- 
2.39.2


