Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B500B9306E1
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 20:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758518.1167977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sShBp-00060K-TE; Sat, 13 Jul 2024 18:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758518.1167977; Sat, 13 Jul 2024 18:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sShBp-0005yN-QI; Sat, 13 Jul 2024 18:09:45 +0000
Received: by outflank-mailman (input) for mailman id 758518;
 Sat, 13 Jul 2024 18:09:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBzr=ON=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sShBp-0005yH-3d
 for xen-devel@lists.xenproject.org; Sat, 13 Jul 2024 18:09:45 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14939cdf-4143-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 20:09:43 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a77c1658c68so359320066b.0
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jul 2024 11:09:43 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc820f2bsm68742666b.206.2024.07.13.11.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 11:09:42 -0700 (PDT)
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
X-Inumbo-ID: 14939cdf-4143-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720894183; x=1721498983; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kLnfIhXGFRpZ63ksRdUUROBBVsX5+G8A7HW79LTA0Y=;
        b=C91IJTujgIoZtEaSzb5vBGVPhArPqlbesXaOsOy4VdYEszrocYUYtyEirjBMJB51QP
         p4q+dIGAC2cfcL9nxNDI2D+Ioi6dc0fGKKBxW44FJwIfg73jBPtn2NY7dwLjyJCmMwt6
         +Z62Y01FS7+uYPHxBvI1snAE+AyyMmZqAt/k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720894183; x=1721498983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kLnfIhXGFRpZ63ksRdUUROBBVsX5+G8A7HW79LTA0Y=;
        b=cL42PS8kBtMUHZEmz4g7/YnSTeKoxavIynwr46ideJe4xtAQvbyrQS9pbBs4ddbS8Z
         x3Fy8gOr1kt5JPh5EY87th2cxZKmTElRYdc1IGudVCXLvaxRflyh1i9bTsygf/1SItVg
         Lnzmf49F2jy4SndUvOSD9MkyjLKG41RU+Q3rvfXB0HXdFECU2uPyqKcXK78ZXANuuecb
         hM/ZYiHEVnOCjVPwXAX0lqFC+7RmDK2Fcu6GkLyHCvtMCnb/xhRVv4WCfrqPojCWN8jR
         0jsKXYMdjgL8xTpZgYwPFuS44zMsU3NRiuwrYKNHQDwYqv7ZZGlHdBK/weg2XXxFBpzH
         CUvw==
X-Gm-Message-State: AOJu0YwHc3j7C2zXpTMw9r0IvvDZ65e33ToCntoqBkMrpGiHOrw4nCDe
	PBZp2gu+HElCY2Vj+bKrCmCbQeQykiNY5kJo++0l4g7Y9a0fc5Iq3klvhMZ2MTwAqRazR3MNS9D
	e
X-Google-Smtp-Source: AGHT+IF21P/TdDBvZv0ynJwpuwE7O+ftef5rHt2+0E4kNRYSDJa6QoX06m46PvsERr+7bCZ5r8Mq7w==
X-Received: by 2002:a17:906:195a:b0:a77:e48d:bc9 with SMTP id a640c23a62f3a-a780b68a472mr833888266b.16.1720894182670;
        Sat, 13 Jul 2024 11:09:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 19/12] docs: Fix install-man$(1)-pages if no manpages are generated
Date: Sat, 13 Jul 2024 19:09:39 +0100
Message-Id: <20240713180939.3363273-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All tools to build manpages are optional, and if none of them happen to be
present, the intermediate working directory may not even be created.

Treat this as non-fatal, bringing the behaviour in line with install-html.
Like the html side, it needs to be not-or to avoid Make thinking the rule has
failed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 docs/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/Makefile b/docs/Makefile
index 966a104490ac..b30cc619f8dd 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -151,7 +151,7 @@ man$(1)-pages: $$(DOC_MAN$(1))
 .PHONY: install-man$(1)-pages
 install-man$(1)-pages: man$(1)-pages
 	$(INSTALL_DIR) $(DESTDIR)$(mandir)
-	cp -r man$(1) $(DESTDIR)$(mandir)
+	[ ! -d man$(1) ] || cp -r man$(1) $(DESTDIR)$(mandir)
 
 # Clean
 .PHONY: clean-man$(1)-pages
-- 
2.39.2


