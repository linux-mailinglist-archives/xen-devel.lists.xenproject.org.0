Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCC6A84209
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:47:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945327.1343542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qND-0003wu-Kh; Thu, 10 Apr 2025 11:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945327.1343542; Thu, 10 Apr 2025 11:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qND-0003vO-Hf; Thu, 10 Apr 2025 11:47:11 +0000
Received: by outflank-mailman (input) for mailman id 945327;
 Thu, 10 Apr 2025 11:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qNB-0003hP-SV
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:47:09 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8793fdcd-1601-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 13:47:07 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so5117565e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:47:07 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893776dfsm4651418f8f.33.2025.04.10.04.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 04:47:06 -0700 (PDT)
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
X-Inumbo-ID: 8793fdcd-1601-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744285627; x=1744890427; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmUAg7jU1oFEVgNmFtaK3OHtZvMFInF5GgxTSJzMnuw=;
        b=FKqzwgoU6A/C4/miMEmjyOntZzLtToA+56MOLrn9PmzYEUAwuU6No1MoaEe/5a/kRt
         AL79Gq0ljwRV7KdEYfZ3DRJvdBAloMkiVs4il8iLhGRcnzm3y709wjJ3pVa/hrp7aVdJ
         PIxV3DzWvR4nzwt8XHSlJlcIM3QIkeFDyYSGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744285627; x=1744890427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmUAg7jU1oFEVgNmFtaK3OHtZvMFInF5GgxTSJzMnuw=;
        b=HhVnnRs7Uz7JKfq8HWSKoooNsIDv/GlrVneqK5my2/6A1H/y4zNc8xPKVtuNEG0KS6
         9duJTRoRubdioqV/jEAlD+7Cysf+F0B/mWXnlWF5b5J2IQ/KbBHeR70PAyV1cM8fqFGt
         y+ta0TQUljrkmO3j2j8939UBDDot2UA8NyFuJloxp4d2aqQWDHlh5tTbrbLkIBtS2yZt
         KQJv1PI3BCVJvBsXpOnNLPRlzO6VRVzHAEloUWRdSpelCPRiStjEgaFViwSNK3zUOX/s
         3PVNftLhWvutVei3bBd3WmNiS5MYy3DLtaEwnKuorR/PnNpd+c+AzeDfT+Ga6KGb125d
         +sOA==
X-Gm-Message-State: AOJu0YzxDsWOV18hoKnnxE1SO7nf5ConOa5bEVVw54h0YVM+N9y4efJ8
	c0Hv7F3M1f2L9UJIirXNkA1IGOBZuaQmamI5FsIb1jarrvLVbnnPILdkM5nAoj1sPcmroj+N4ua
	hJyg=
X-Gm-Gg: ASbGncv7Mx/kcOL6rl2BvxsosEYZKJQHz+Z5FBOKQ3fKz/YzfjfxuKP+gocnJJQAYcG
	7hFnEwRMYwMTBOhajkuuoPIpwe2vc3+yexcnVGcDUUfCXhlJOlclp7kQVSQsX+D59lPEJ7Cx2L/
	52i03qhNCuqOs3RWudv3uWZ3vGrLrb9twzXS3Ur3vmLd0vkp6Zwo62lfEHzzi5WLAl9k2Csfese
	pqEy/z9KANFCm2+pZx4sdPv/gVe23cJsYMY3/vrGD/FpEajVMCObSqkVag0cVPe4QM3ulNtSVb/
	Pr9WwhvcZBNSWtQ0aMkajWaYP8srCOPt7PHUVCBlvDVQtYBOZx3MrZwUpAgmdeC0aI+rkYQX0mj
	eRTwj2YgZSp54rn7FKxgk9YGv
X-Google-Smtp-Source: AGHT+IEtA0sWJV4QWwpV9KTtrtVIst7z+N9OHlMYzZ9RWBUae0cIQ2HP+CgUpXTnASNk+vdrh0kdZw==
X-Received: by 2002:a5d:648c:0:b0:391:3988:1c97 with SMTP id ffacd0b85a97d-39d8f46a059mr1680392f8f.17.1744285626831;
        Thu, 10 Apr 2025 04:47:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/6] Clean up Gitlab yaml
Date: Thu, 10 Apr 2025 12:46:24 +0100
Message-Id: <20250410114628.2060072-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Factor out the registry into a common location.  Drop the worflow name, as all
it does is hide the commit message of the change that triggered the pipeline.
List all the stages.  Set a default expiry of 1 month.

Note all the current jobs as legacy.  Their naming scheme needs changing, and
we'll use this opportunity to switch formats too.  However, the artefacts need
to stay using the old name until the final staging-* branch using them is
phased out.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>

v2:
 * Drop the workflow name.
---
 .gitlab-ci.yml | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 36ec6a7e1ee5..734f3982c46f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,12 +1,16 @@
-workflow:
-  name: "xen test artifacts"
+variables:
+  REGISTRY: registry.gitlab.com/xen-project/hardware/test-artifacts
+
+stages:
+  - build
 
 .artifacts:
   stage: build
   image:
-    name: registry.gitlab.com/xen-project/hardware/test-artifacts/${CONTAINER}
+    name: ${REGISTRY}/${CONTAINER}
   artifacts:
     name: "${CI_JOB_NAME_SLUG}"
+    expire_in: 1 month
     paths:
       - binaries/
     exclude:
@@ -19,6 +23,9 @@ workflow:
   variables:
     CONTAINER: alpine:x86_64-build
 
+#
+# The jobs below here are legacy and being phased out.
+#
 x86_64-kernel-linux-6.6.56:
   extends: .x86_64-artifacts
   script:
-- 
2.39.5


