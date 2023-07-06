Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F5E74A40A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560031.875604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUCQ-0003L2-5X; Thu, 06 Jul 2023 18:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560031.875604; Thu, 06 Jul 2023 18:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUCP-0003Fw-VQ; Thu, 06 Jul 2023 18:59:29 +0000
Received: by outflank-mailman (input) for mailman id 560031;
 Thu, 06 Jul 2023 18:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU96-0003x0-89
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:56:04 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0117658-1c2e-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 20:56:01 +0200 (CEST)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-7659db6fb4bso109881385a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:56:01 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:59 -0700 (PDT)
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
X-Inumbo-ID: c0117658-1c2e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669760; x=1691261760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fKIbOA4RKJwyWZPk8ACAEU8hAgIi7aDz2OnDwWBK4c=;
        b=Cr6G8uPAXjG966YgCd12RSzArtdKrgtdtFDqM8CSqVMC0WewIyxV9rSiVUUWIEQfQk
         KYJ330wfhgBT8DweHIXH60w2JtbygVkVJJ3nsoq+OLKJuC75SRZr68JnEXDhIsI9kufJ
         d85xIhvfS4uc+BmNY7RI12I3aED+fYuE+MKG4Fhyb9A03i9T9ysr4XvBJCuwEcKvSrGZ
         jTWQV6dCoyUeMe+gvQOG0LveTvB1jTVVedPpHA5uK1P3yiLF7vowSt2nilrEGiHF7DKh
         I8O9WYwriOizfcVOYsLj+1cre4jzb4bE3IytJ6HOONcu/h333G/r6jorGyjFXF9/GY7L
         lGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669760; x=1691261760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fKIbOA4RKJwyWZPk8ACAEU8hAgIi7aDz2OnDwWBK4c=;
        b=G6rqSlH6+HFJIxDfMiP1mIQO1pqa0PlLYJZFgfKttqnl3Rmylq6IusEP/X+YOvAJeX
         qp9EVaBtZACWR8N1SZQnu2SIiouAbiNAAZxjG9hYRK4N509vLpUfYbk+MndulBdf2u46
         ja52aiXrRlZfrm/+0QCy/1+AJzFyq6jABjwDm0BHi7mTzG0B1OrwtiQbFKTJTDkh+tMr
         EtIB8NqFLo+JGKaSy3oEire0QyBbr+fn0P5mLreJHNsoYcRNHHJLwUm1BBKGdMzbmjAk
         p2OdzPhQuEu5NbdO/Z8QsIxkanM2zvvSFMmID3nrdKQ7BkKrDnl2GQRgBLHTC6BcxBln
         LLaA==
X-Gm-Message-State: ABy/qLaoFL3onhnjW7L44EgTfaGkOUVTAeQkFoANgFUBOml5pWkUty2Y
	VY8hyygXqLMx5mpih5LJwHgJ9pXWcys=
X-Google-Smtp-Source: APBJJlFlSWbJAikYw4AY9jIZZRIdFLX7OQYroKAh+RQQeDlJKPSMq65aJxNrRUo7YbzQsyxSaz/SkA==
X-Received: by 2002:a05:620a:4013:b0:765:aca9:1a10 with SMTP id h19-20020a05620a401300b00765aca91a10mr3805641qko.39.1688669760128;
        Thu, 06 Jul 2023 11:56:00 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v5 15/15] CHANGELOG: Add Intel HWP entry
Date: Thu,  6 Jul 2023 14:54:40 -0400
Message-ID: <20230706185440.48333-16-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Henry Wang <Henry.Wang@arm.com>
---
v3:
Position under existing Added section
Add Henry's Ack

v2:
Add blank line
---
 CHANGELOG.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7d7e0590f8..8d6e6c3088 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,7 +24,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - xl/libxl can customize SMBIOS strings for HVM guests.
  - Add support for AVX512-FP16 on x86.
  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
-
+ - Add Intel Hardware P-States (HWP) cpufreq driver.
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
-- 
2.41.0


