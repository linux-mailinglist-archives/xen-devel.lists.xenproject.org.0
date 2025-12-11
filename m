Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC74CB66E9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 17:14:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184364.1506837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjIY-0002Pd-67; Thu, 11 Dec 2025 16:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184364.1506837; Thu, 11 Dec 2025 16:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjIY-0002Nj-2Q; Thu, 11 Dec 2025 16:13:46 +0000
Received: by outflank-mailman (input) for mailman id 1184364;
 Thu, 11 Dec 2025 16:13:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPjJ=6R=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vTjIX-0002Nd-1B
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 16:13:45 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c8c355d-d6ac-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 17:13:42 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-59584301f0cso277556e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 08:13:42 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b85f38sm6591536f8f.28.2025.12.11.08.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 08:13:41 -0800 (PST)
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
X-Inumbo-ID: 5c8c355d-d6ac-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765469622; x=1766074422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZX/42ePBKrFZv//GJVfveONAsoCd6k5RJTSL9Z8Efk=;
        b=QofvJtjpCyNWDTy92QwBinyU8umg+zbRlLFcR2iISu/kFOiDiMIpFeggIsqLJCWDIf
         9wq+ZSKUxbW2LyFEHkxCH6FpPyCRXe7M1ZkP83gJbEvvlXNM9B6MtUMMrqKFI2G5MOLW
         ba8izWCjGP4QOcLZDjKesbnkr4ChWM3pTxy8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765469622; x=1766074422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZX/42ePBKrFZv//GJVfveONAsoCd6k5RJTSL9Z8Efk=;
        b=sYchrqR4I9cGnZN7ZWLItMvvKFXmT0g7j1alcEvGq2Q87HVmWF+wHqekggonMTvzjm
         0aMrrKzcBMt4+BRVoYIehqbNOT2IPs00wHVzeQf1a7wkqHaJIj/w0UQuBJxg4WwcYD3J
         6hAqx3OO9Nu2TEs7Pq27ydnNYlL5ybxjrAHHRWEphVW5Vpp3eYxQbgVZPSA8jGmFLSQ6
         IyfbsHp3jeLg3D/d4z2XV0DOhZHQ4R8htybXIzytAbLjP5PXuyuBqjwhy/meUC/j7UjI
         dbKj2eLjATAUKgyoj3oUotoNR9pe7FOuuNfZVgLqnZeMXFlVo9/C4jS0iHm8Hr8vZ1zi
         +vtQ==
X-Gm-Message-State: AOJu0Yylc7Cr4yNUIYFWqz7P7wJVNSImWL+Zs2sp2/qrYYuPnS7atJVj
	ueTZyPcGtx1t/dXqzsZpRVJTwv+riyceuwwMEvGoT7CYowGjZQu5o0t6Udk0cG6hEGxHvaluI57
	khBYx
X-Gm-Gg: AY/fxX5YSsZjdN6P9NdSYUL0n4ve7fvDX8Edr+W1EatpYY+Atf2bWjWG8YfLI0Ul7pK
	VsBFeg8rsUa1q6434VVvzS6KhkEe3iFEUVaHbXwmHMTxuioxNmHX01o+qGY6l2cDAYGSFAkiqHv
	L6ZBE8s9iuM0UGYQrgWfaD6Nb7BeHktu9HRUFP1SejdtHOgdGY6Fm9lHryXAHQCJVWRV6vnAU1x
	PZZs+hIpdubUTjVD/cFEo3+f0BzkAQ94j+DnBIbGfqTujC5/ZvlZzjNGPeBuiIhcaKDWWTdjvqB
	Nm+l6YifiIs9Uu56Ivwzk43vUpgRdmGJtJm+RqHBmedmjzF64AiGvEDYplG53KAXt7cfPnxMxbl
	paEENAcJ3Q3WXyFuXyuCLzNaPjfIggK2OoGYDOYZfU0mqxC0g0hKbNELzkjabKOCtXXkKoAgh1u
	d5+xRWH8pe8AQENO5/1r9lcDEIpOiprbei/+bWWptlkU1MsYODpSST8HKziNb3uw==
X-Google-Smtp-Source: AGHT+IFUEm6d3s7aIBI42cNM5XQCaQXesj0bMNjt7uaEgGsy1tdL9eJfL57qGSOM0XpCF670XQX+5Q==
X-Received: by 2002:a05:651c:f17:b0:37f:b2d7:8a0e with SMTP id 38308e7fff4ca-37fb2d7bc42mr18063391fa.5.1765469621504;
        Thu, 11 Dec 2025 08:13:41 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] CI/eclair: Rename the eclair-* jobs to *-all and *-amd
Date: Thu, 11 Dec 2025 16:13:39 +0000
Message-Id: <20251211161339.2296433-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The *-safety jobs are AMD's configuration specifically, and other
configurations will likely be different.

Give the un-suffixed job an *-all suffix to make it clearer what they're
doing.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/gitlab-ci/analyze.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 20cabbe5f70c..37a941bebbae 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -39,7 +39,7 @@
       allow_failure: true
     - !reference [.eclair-analysis, rules]
 
-eclair-x86_64:
+eclair-x86_64-all:
   extends: .eclair-analysis:triggered
   variables:
     LOGFILE: "eclair-x86_64.log"
@@ -58,7 +58,7 @@ eclair-x86_64-testing:
       when: always
     - !reference [.eclair-analysis:triggered, rules]
 
-eclair-x86_64-safety:
+eclair-x86_64-amd:
   extends: eclair-x86_64
   tags:
     - eclair-analysis-safety
@@ -99,7 +99,7 @@ eclair-x86_64-safety:
       when: always
     - !reference [.eclair-analysis:triggered, rules]
 
-eclair-ARM64:
+eclair-ARM64-all:
   extends: .eclair-analysis:triggered
   variables:
     LOGFILE: "eclair-ARM64.log"
@@ -118,7 +118,7 @@ eclair-ARM64-testing:
       when: always
     - !reference [.eclair-analysis:triggered, rules]
 
-eclair-ARM64-safety:
+eclair-ARM64-amd:
   extends: eclair-ARM64
   tags:
     - eclair-analysis-safety

base-commit: abac3b76d20ebecb339cb41bb8982796bf1ce276
-- 
2.39.5


