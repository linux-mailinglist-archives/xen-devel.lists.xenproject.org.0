Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA64643D9C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 08:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454459.712011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2SKh-0004Fg-A3; Tue, 06 Dec 2022 07:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454459.712011; Tue, 06 Dec 2022 07:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2SKh-0004DC-7C; Tue, 06 Dec 2022 07:25:39 +0000
Received: by outflank-mailman (input) for mailman id 454459;
 Tue, 06 Dec 2022 07:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecPl=4E=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p2SKg-0004D3-3F
 for xen-devel@lists.xen.org; Tue, 06 Dec 2022 07:25:38 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c8148c0-7537-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 08:25:37 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id m4so6181011pls.4
 for <xen-devel@lists.xen.org>; Mon, 05 Dec 2022 23:25:35 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 m17-20020a170902db1100b00172951ddb12sm4718350plx.42.2022.12.05.23.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 23:25:33 -0800 (PST)
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
X-Inumbo-ID: 2c8148c0-7537-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Za+dh89Sg6l7PfVqjmQ5knr2ZRecNLpXHCNPpgP8qvk=;
        b=iAkK/Cq4XJu+lIbsNflxy+DhSeDwb7YvE24aK7yVfcmOMgEFPELPJ5DlAGcymNyczY
         eHMxK7JAIeZzbbv+JpgszQbEjvulL/E2l4NNRSzTWEh2r0eZapyUg5M6Au66E8fGc/mw
         4TcQEq4pbovV1UYZU+h2cT7Qz4DFHQN2SbO8pNwfbvQEqRaEgaYLDo3DCqSkK2rzUbOK
         4sl441MyMmhmeFrel/cgbWgLE8DSMZAfj0hGamtutNkJOJAOJofVkAnX4py3vy/xEJ/a
         Y8C7GOGytTYq35B/FAJRUG9VVy1zXenvEyKNQPZi8me63+7Yealvb4BZzNLE4BOz3zWS
         RNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Za+dh89Sg6l7PfVqjmQ5knr2ZRecNLpXHCNPpgP8qvk=;
        b=y5lISU75t4L/lR0emJzGDYa48W3lseg/Rh04zLEub0UK1DPlmK9X5PqDuHqR102ew7
         nb1pVjlz2noER2HChlcR1VlVqpCoSrFBq/BfGRSxblX3qPBem+dfKLSrw5OaALm3Xf5D
         mRC03LIn1FK5SE7/Elaj4hlcI4gfHXM46e8/o+ViSeygXDkku3jlngyRWZSx5yM8aclD
         xhHO/5anKMpdsZgf886U9XoIK2tC42EnT/TRgxnEBkqv8dUeXT2yZ4swH7CfQ2T8ely5
         fQQcNzD6TrCCyUu9M/Oy1N/t2D01LtF8q5MOHyHoIVBTUVYZaTl+Wn9DAy/NVcB/bHsD
         4wiw==
X-Gm-Message-State: ANoB5pnAm/2HMSzoiumMBIV0R+NJRYHp5b8yLGYTVgsbbHNAY3JRuQ4Z
	NqSSrY1pCcsqqB2r7sQu4p0XOaJhPlhenSQQ
X-Google-Smtp-Source: AA0mqf5RUt+OnA9SE4wbv1QUX7bSAk5vjHUGxgrgtSWjt1C263C6EBHsEHIflwvk2pTX55hD5+SVZw==
X-Received: by 2002:a17:902:bd81:b0:189:d342:c421 with SMTP id q1-20020a170902bd8100b00189d342c421mr9688443pls.174.1670311534236;
        Mon, 05 Dec 2022 23:25:34 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] tools: Fix removal of COPYING and .gitignore
Date: Tue,  6 Dec 2022 12:55:24 +0530
Message-Id: <9f8818c9fe3f3ed43aa42bd0a06645af69c46034.1670311329.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Makefile continues to remove the entire tools/include/xen/ directory
on "make clean", which isn't the right thing to do anymore since this
file contains files like COPYING and .gitignore now.

Since there are only two files at the moment, use "xen/[a-z]*" regex to
remove everything else.

Fixes: 4ea75e9a9058 ("Rework COPYING installed in /usr/include/xen/, due to several licences")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
I got into trouble as my build script does a "make clean" before building
everything again and so build fails without the COPYING file.

Based of:

https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/for-next/4.18

 tools/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/Makefile b/tools/include/Makefile
index f838171e8cd5..2ca344cba521 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -84,7 +84,7 @@ install: all
 
 .PHONY: clean
 clean:
-	rm -rf xen xen-xsm acpi
+	rm -rf xen/[a-z]* xen-xsm acpi
 	$(MAKE) -C xen-foreign clean
 	rm -f _*.h
 
-- 
2.31.1.272.g89b43f80a514


