Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A71ADD0CD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 17:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018272.1395167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRXnJ-0006LT-9A; Tue, 17 Jun 2025 15:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018272.1395167; Tue, 17 Jun 2025 15:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRXnJ-0006J6-6d; Tue, 17 Jun 2025 15:00:13 +0000
Received: by outflank-mailman (input) for mailman id 1018272;
 Tue, 17 Jun 2025 15:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Un2b=ZA=gmail.com=rosbrookn@srs-se1.protection.inumbo.net>)
 id 1uRXnI-0006J0-3X
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 15:00:12 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3a8e2f8-4b8b-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 17:00:11 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7cadc92771dso628152985a.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 08:00:10 -0700 (PDT)
Received: from six.. ([69.53.121.20]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d3b8dc9e15sm665761485a.9.2025.06.17.08.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 08:00:08 -0700 (PDT)
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
X-Inumbo-ID: c3a8e2f8-4b8b-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750172409; x=1750777209; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZArjs3/+CYFN5nJYtjt1e9TA00uz0flf6Zhhx8TEXc=;
        b=CIGuKpBIFIrGeDFmnSU+hk3twGI+6/p+AeC2+hSCmm3K2FD0VHTS+O2BuNe9tqBubQ
         4lXm6fwwbMgqfIa4vIv9OtM9EbhJQqrgBMabiE/4aRH8VMa/3Gz4wWsaOOORo+SPLOmN
         +WAtiJNCD2A/EBxXUIRGSBfPuxBGYP6rPVhY8z5m0xHA2KtoO2QmRgcsXV3wE8mLb8UY
         qiXjV9tIrhpT3kjxRxA4AYWljvXsmNO0z1cujj0N+WvQOuraMWOH3tjSpB4wdk8ES9+T
         2OFqkBjVbitFyAJWySuWC+6srL0DV8wtu/JbJdzsGDo+1O3a70keDnL3O+qH3xVNUpGc
         KWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750172409; x=1750777209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZArjs3/+CYFN5nJYtjt1e9TA00uz0flf6Zhhx8TEXc=;
        b=p3GluUaIEmi9qDAcbNWcH+AOMVgKEGc4ICyPPwBoeLMOQdzVLenEh096QS3bPFamSJ
         L/j1nLMcSRW56um8PtqL+HBVW07WBSy4r3JTgoJHwdRQc17LVleKV57HCqOUatT//YpR
         klxhq5h4Yb8wGUboj/t/fd/zcUeQJXPvg3FAgIUpAVI5CB5GIdViVHrb6w1ekQ37i4xO
         4+1fkWIWr7f1FhQy0YlOI0LpTcrMBkkM0w6qVm15Ke5Joxy5NPVu5sBsHHcO7ejvng9Q
         pqe/X+vJ0F/QZrti4KllhqyXsusuEbO022yt4XTCe7bOBm6SXj0FkM+0l2qKXPTN/iTo
         EI/w==
X-Gm-Message-State: AOJu0YzqDUdyYzoZHcLaxAViv160sOLauaPkdGUlfFl3dDf+o07Nvvy0
	T2TgQEPOdw7AT7taMqlYXhd6Qpee2WuDnHA+wqZcRzYKAGkSdvLP0Ozw2TEZnxRN
X-Gm-Gg: ASbGncsKlCkAHJCuJaBsFYR4VOswWLbMzepL0IIk07zyaVd+LxUSo8LG5JbmksrQOGb
	Jrv5Onef/EBWgpRKTUScapHb2QXusDNt/G+2qp2dXw9GE/cHLLjX7Ssw9aMuX9qaAan8tlaYqqQ
	5eRih3wxtqkCnxlPsZedyXBGbzwJWCwZI0jun3iwFrxvpMU8OgdjHzVEvR6xk5WijR+p11wG0TN
	/e5h7P4r6jU5CWnhiwKxF2+RY5BFn3FlNUEeRHCr0qPNbmPzfF96wukAyM8y5sACquBgnVJ0Wwy
	r1P0WmT7IOCg/vK5g8qXxOsxROyUfbEbACaoCMiORS6uaGT81II=
X-Google-Smtp-Source: AGHT+IEJfRnIEDPWFQs1ZZ2EtpF0pkHEYAk8w5jqrQ2FmlqKdmACsKxO/myeIuGn4aLn6f/ZiOj1NA==
X-Received: by 2002:a05:620a:a10a:b0:7d3:a6c7:4eb2 with SMTP id af79cd13be357-7d3c6cd4e97mr1672780785a.31.1750172409022;
        Tue, 17 Jun 2025 08:00:09 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: update my email address
Date: Tue, 17 Jun 2025 11:00:02 -0400
Message-ID: <55a35aed605bafd38b6ccfd0bb6e401a5fdf9794.1750172048.git.rosbrookn@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change rosbrookn@gmail.com -> enr0n@ubuntu.com

Signed-off-by: Nick Rosbrook <rosbrookn@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 13f31b0c1b..9aa7dd2f57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -330,7 +330,7 @@ F:	xen/arch/x86/debug.c
 F:	tools/debugger/gdbsx/
 
 GOLANG BINDINGS
-M:	Nick Rosbrook <rosbrookn@gmail.com>
+M:	Nick Rosbrook <enr0n@ubuntu.com>
 R:	George Dunlap <gwd@xenproject.org>
 S:	Maintained
 F:	tools/golang
-- 
2.48.1


