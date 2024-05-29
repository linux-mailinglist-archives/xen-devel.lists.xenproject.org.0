Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5A08D3900
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732037.1137826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCK9k-0000wM-HG; Wed, 29 May 2024 14:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732037.1137826; Wed, 29 May 2024 14:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCK9k-0000qC-Cn; Wed, 29 May 2024 14:19:56 +0000
Received: by outflank-mailman (input) for mailman id 732037;
 Wed, 29 May 2024 14:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mTS/=NA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCK9i-0000nP-Pz
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:19:54 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 844d1903-1dc6-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 16:19:53 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57a033c2e9fso1255235a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:19:53 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6389a0b4ccsm101767066b.22.2024.05.29.07.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:19:51 -0700 (PDT)
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
X-Inumbo-ID: 844d1903-1dc6-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716992392; x=1717597192; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc/urejuK2M9KAkefkWK+X4luH5a6jraofBI99vzPZo=;
        b=e//jalF831zaKPqYUYFU5K8wvkCJ0CTEu7sQz/hh5Ru/yZqdhDy+kR03msssUBipsk
         vvpcLOq+INJA66UrPonON+waMSAvJHoGhzTaN7jbSU+Rk4rDqzRtIzEmyFgd29hN6vOX
         2z8M4wSO75ivYYA906e0c53DeonFL5DUzh9LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716992392; x=1717597192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc/urejuK2M9KAkefkWK+X4luH5a6jraofBI99vzPZo=;
        b=lhFOuPidZx/g9R5ZD91gDZxLvcfOJQQk4iKqygHo/dZbtKSgfmtNHzPwSdW9YTNzWC
         b5/2/g8XlxhkqlWyyTF9FH8BWquo+adLvUp1CeruAxaDzxY9xeP3/mNXjcpPFPuLZo9b
         74IiCi02bJClP+rQzdFCFFTabJwMPGOYkIhYpWslDmxENY2cZre1ArlnAuR96RIRbms8
         CmUeKU81U6JTc/53c8DO9/rpA1dSg3w/rDAj6f83cHr8TD4Oe7sVtw/5Rad1iOnCCWKa
         iCA3Njup0bYWLRoIQNpSaqQEoTBmDrLrN1skNhXI24x5/WEXOFEN3e5LC0WftqgMXjvt
         /MZw==
X-Gm-Message-State: AOJu0YzM+tSp+tbWkh4OgU48kDFbaBYsHMTp81tFsDRkRASgc/CpQ+pk
	OhzNxRg1sAU9EV5UxQCKBSQsImmvjnCFW3f1wY+xqEGdWOWm5MotUSQuGq1v1KZ/4sgJpsporjp
	6TK0=
X-Google-Smtp-Source: AGHT+IEqb5api7YOB5c5JcJp7ScU29OHf161yGSsdq3HrC5QI8Ff3C9+zcTXyrgoIB2eySMmpW8DjQ==
X-Received: by 2002:a17:907:7d9f:b0:a62:b36a:eafa with SMTP id a640c23a62f3a-a62b36b0213mr1634016866b.57.1716992392482;
        Wed, 29 May 2024 07:19:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/3] CI: Remove CI_COMMIT_REF_PROTECTED requirement for HW jobs
Date: Wed, 29 May 2024 15:19:43 +0100
Message-Id: <20240529141945.41669-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529141945.41669-1-andrew.cooper3@citrix.com>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This restriction doesn't provide any security because anyone with suitable
permissions on the HW runners can bypass it with this local patch.

Requiring branches to be protected hampers usability of transient testing
branches (specifically, can't delete branches except via the Gitlab UI).

Drop the requirement.

Fixes: 746774cd1786 ("automation: introduce a dom0less test run on Xilinx hardware")
Fixes: 0ab316e7e15f ("automation: add a smoke and suspend test on an Alder Lake system")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Fixes because this wants backporting, but it also needs acks from both Marek
and Stefano as the owners of the hardware in question.
---
 automation/gitlab-ci/test.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ad249fa0a5d9..efd3ad46f08e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -92,7 +92,7 @@
     when: always
   only:
     variables:
-      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+      - $XILINX_JOBS == "true"
   tags:
     - xilinx
 
@@ -112,7 +112,7 @@
     when: always
   only:
     variables:
-      - $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+      - $QUBES_JOBS == "true"
   tags:
     - qubes-hw2
 
-- 
2.30.2


