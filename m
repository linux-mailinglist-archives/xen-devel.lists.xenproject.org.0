Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A1798A98
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 18:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598076.932572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeeDv-0005xw-4U; Fri, 08 Sep 2023 16:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598076.932572; Fri, 08 Sep 2023 16:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeeDv-0005w3-1r; Fri, 08 Sep 2023 16:20:47 +0000
Received: by outflank-mailman (input) for mailman id 598076;
 Fri, 08 Sep 2023 16:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8cQz=EY=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qeeDt-0005vx-BE
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 16:20:45 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a85f6a69-4e63-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 18:20:43 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31f7638be6eso1399709f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Sep 2023 09:20:43 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a7bce18000000b003feee8d8011sm5574352wmc.41.2023.09.08.09.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 09:20:41 -0700 (PDT)
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
X-Inumbo-ID: a85f6a69-4e63-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694190042; x=1694794842; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NSaAuxFYnMB0rbyOtc0+GS4DWIDxQthSc6OdxGPGSsk=;
        b=OZu/Ub+BWmi/muVIorL5maeqpF0qsFdLd5IRGASOEtw8ve8Yw2py2sDoaWIw2zwqbY
         bkQhh0VuDl5De6rOauWIXhmvlbvvom2ToYXvWNCAibqMwVQk/todSON5sTQussdRsbZr
         8oPR43WzzZqHb/aG2mnpi5v570DHBhpfZruh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694190042; x=1694794842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSaAuxFYnMB0rbyOtc0+GS4DWIDxQthSc6OdxGPGSsk=;
        b=QnICtitWeYQEjklowpdizmfB+q7QjrPCYspVGVmR/eAR3h9pGZc6uEhaLQS6RAPqvY
         wj+n3mMCvbpdZtMzCO7FMQMOB6QBEUaszbOxcPrljywrdgX9SQCYCDj5DA7cR2XLDxH+
         ZWSzVqv+yjYAV5aEZu50M97tHrRvsSdufb/i7q6qlul+wiFVNp80JCOtPrzZfDAeKJvB
         BWvG2oN/geynBpnT3gwHxZeBb9tlglnKSyoIe2V7v7Tf7zEK71AVCDYyTy+zlMq1pLX5
         2DAvmnChPnOx2OfSEbU2D7PTVR307XuMRXIVaO1QBbq95iNAT270JfVis+C+1UHA3g1j
         SyTw==
X-Gm-Message-State: AOJu0Yxx+nW+C5R/uLdo7nVAuPrw5vssZ0Ln/lddj4PKR3WmnQMr5ffv
	h+WEt3YMusNlRYpitmEjZ2gNvL2XUEKR5T2DTdE=
X-Google-Smtp-Source: AGHT+IEs01Run1Xa87KRp4D6Kg7ko/wGEsOZ2roWqgxatRZ0kwYtZ/6HI23zSKc0/USwjTafDYX1NA==
X-Received: by 2002:adf:e546:0:b0:31a:dbd1:bf6 with SMTP id z6-20020adfe546000000b0031adbd10bf6mr2488114wrm.68.1694190042212;
        Fri, 08 Sep 2023 09:20:42 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v2 0/2] update gcov info for newer versions of gcc
Date: Fri,  8 Sep 2023 17:20:30 +0100
Message-ID: <cover.1694189143.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gcov info changes with different versions of gcc.  This patch
series updates it so that we can capture coverage for xen built with
newer compilers.

This doesn't solve all the problems with coverage as Xen still crashes
when trying to reset/read coverage[0].  Still, it's a step forward.

[0] https://gitlab.com/xen-project/xen/-/issues/168

I have tested it with a workaround for the aforementioned bug
(commenting out freeing of the init sections) and the following gcc
versions:
  - gcc 4.8.5
  - gcc 4.9.4
  - gcc 6.5.0
  - gcc 7.5.0
  - gcc 8.5.0
  - gcc 9.5.0
  - gcc 10.5.0
  - gcc 11.4.0
  - gcc 12.3.0

Javi Merino (2):
  coverage: simplify the logic of choosing the number of gcov counters
    depending on the gcc version
  coverage: update gcov info for newer versions of gcc

 xen/common/coverage/Makefile  |  6 +-----
 xen/common/coverage/gcc_4_7.c | 39 ++++++++++++++++++++++++++---------
 xen/common/coverage/gcc_4_9.c | 33 -----------------------------
 xen/common/coverage/gcc_5.c   | 33 -----------------------------
 xen/common/coverage/gcc_7.c   | 30 ---------------------------
 5 files changed, 30 insertions(+), 111 deletions(-)
 delete mode 100644 xen/common/coverage/gcc_4_9.c
 delete mode 100644 xen/common/coverage/gcc_5.c
 delete mode 100644 xen/common/coverage/gcc_7.c

-- 
2.41.0


