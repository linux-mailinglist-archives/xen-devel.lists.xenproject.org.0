Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D79BD735
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 21:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830505.1245511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8QRN-0001Jh-0P; Tue, 05 Nov 2024 20:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830505.1245511; Tue, 05 Nov 2024 20:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8QRM-0001ID-U4; Tue, 05 Nov 2024 20:46:16 +0000
Received: by outflank-mailman (input) for mailman id 830505;
 Tue, 05 Nov 2024 20:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lM+p=SA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8QRL-0001I7-E3
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 20:46:15 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fade352a-9bb6-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 21:46:06 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so785429866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 12:46:06 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16a05c0sm180824566b.39.2024.11.05.12.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 12:46:05 -0800 (PST)
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
X-Inumbo-ID: fade352a-9bb6-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZhZGUzNTJhLTliYjYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODM5NTY2Ljg4MzE1NSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730839566; x=1731444366; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BjzLvyyfWPt8J94N1uA3Deo+wtE5Q6Dt5/FQhotzX+Q=;
        b=QX/Rd9hJBCFUgj7PuNjNxy1aC3RGkQCpeays1zhuq0VhVDViwLvCeF3wEMhtR5lwYn
         4xkOijKLjEs7wlMyRLxMXOoSCkTWfMel+xHqXBDxOIa52PODdTOk/Z41aRENgGTaI9wJ
         q6HZ535xCCGqQ/LorVv1opjJRG7+SpgJgCMhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730839566; x=1731444366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjzLvyyfWPt8J94N1uA3Deo+wtE5Q6Dt5/FQhotzX+Q=;
        b=PVC7XmQWcMmagvd5lp3UnmOOW8n+U9A/wxfk07B8vbc+4eLC4WJ1ArpBRzos0J3j3N
         zWY1Ip6834QQ3q6BbWWNCitd7yz8900QL9fAKZGf+LhOtqmxL4vXiRJ6/+MbQnZ+HSYR
         5Kh8lsw654albTESSgkp37+hzUcZl9egkoYqn7xSH4SQbukIQEm6hsnBF2qM9dWXwz/q
         Ds2yNeJavUvq8GuIZvjkXvo+lSaRbON6QeRh8bDNeF3eNOshq3XFih5+C5U9BMqpGrpK
         eB6DzXrgXn3VYlY9YtuA8nZywppok1b++BfljtVtEcE+Ne7RuMy/y2mjRT5tQLXC9J61
         FH3g==
X-Gm-Message-State: AOJu0YyKJNAHGtUAQw0Ar1Kp7xeaStD7NdQpt5ugK/IAFFuMQLsfcXBH
	Sm/lJ8qBHdf70C7QtnpTzJNXJQFRiGuQF8NOad4BuDzUqJCbWQmnyniSxo4+eS1VfNqmrCWkgqz
	G
X-Google-Smtp-Source: AGHT+IGmGoooLUTDNxQlMIm9yhrshdLm1bN1ytZrj6lPvZcJiZPXvjUxVZMA+1AWoOPkUE3mg+kD4g==
X-Received: by 2002:a17:907:9490:b0:a9a:eeb:b263 with SMTP id a640c23a62f3a-a9e50caff2fmr1942326566b.58.1730839565840;
        Tue, 05 Nov 2024 12:46:05 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] CI: Fix package installation for Coverity run
Date: Tue,  5 Nov 2024 20:46:03 +0000
Message-Id: <20241105204603.3412857-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Something has changed recently in the Github Actions environment and the
golang metapacakge resolves to something that no longer exists:

  https://github.com/xen-project/xen/actions/runs/11539340171/job/32120834909

Update metadata before installing, which fixes things.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Example dry run with this fix:

  https://github.com/andyhhp/xen/actions/runs/11692180675/job/32560954258
---
 .github/workflows/coverity.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
index 984636eb4635..a6c2819b0a24 100644
--- a/.github/workflows/coverity.yml
+++ b/.github/workflows/coverity.yml
@@ -12,6 +12,7 @@ jobs:
     steps:
     - name: Install build dependencies
       run: |
+        sudo apt-get update
         sudo apt-get install -y \
           build-essential \
           git-core \
-- 
2.39.5


