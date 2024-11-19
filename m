Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F89D265A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 14:05:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840064.1255845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDNuS-0001Kv-FT; Tue, 19 Nov 2024 13:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840064.1255845; Tue, 19 Nov 2024 13:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDNuS-0001JI-Cs; Tue, 19 Nov 2024 13:04:48 +0000
Received: by outflank-mailman (input) for mailman id 840064;
 Tue, 19 Nov 2024 13:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydLn=SO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDNuQ-0001JC-Tt
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 13:04:46 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7575cce-a676-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 14:04:42 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so9844501fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 05:04:42 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cfb962b007sm2905357a12.28.2024.11.19.05.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 05:04:39 -0800 (PST)
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
X-Inumbo-ID: d7575cce-a676-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzUiLCJoZWxvIjoibWFpbC1sajEteDIzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ3NTc1Y2NlLWE2NzYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDIxNDgyLjIxNzk2NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732021481; x=1732626281; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XwbScXyc4DfZQP6ZIve+wn3XG+BEursfwAm+TjV9Dso=;
        b=S+Pbru0Ptmx4JzggXKvs126QMhYTjZY11VxI6HG0TkDZ+txlogu0ASbD+QFRaF4MZh
         9A/ycwzwuZ4Pac0/mHpltqIYgLE2xLWX0H96e1aupNEwR235xou0Rk7oTCPGAbYgDMLn
         KHeLrvCTLkeHHWnFKQuPqfamEdwlq39INxjSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732021481; x=1732626281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwbScXyc4DfZQP6ZIve+wn3XG+BEursfwAm+TjV9Dso=;
        b=UqdkqVualE32lRM5LjrJIrSfRXbO/w7wj4sokKcss6phXOnUJTT0sgMSPeVXaua+vm
         rV9cOiE4Hu7KQxaG8JN1W6dRkvXcLLgOVKNgkBstDxxBqsexSlk3slSo7iprmUavPEYQ
         mkgWrvawRpjl7rBDbm9zifiI0s2ix+B3Ee5T9VMB2Niw88hk/1PKquq3Iw30ed5FtuIm
         JiaS50T5SmYGH1lOCL7BsZty3dKlTpAhG49FJXCYBizqADMOoq/HvT1CV8FRqViLYfy8
         3DO9QzywMgZNSzZLraldD0w1yFGEpKKmXkBLP2iD7arBdiXwTWDz7B1zwJZgNKz9ictd
         muQw==
X-Gm-Message-State: AOJu0YyXGTnRgCJ/+RCDsHUcGzulsDW9PIoEP/qya4OL4qwu7i4qz2yd
	12TdgpeVqPaJ3Sf7H3yB/nA2affhnMBog1bExZJ65KyKPMcbEKrk9LAJw2o6iBA7bnLOaVW6+K/
	T
X-Google-Smtp-Source: AGHT+IGg0vy/66kRh5w+NyTFpq5F9OhOdHORd1XNU6rXUQQgE5f3yf1+0+kMTkcHUeUqL2HIaukiCA==
X-Received: by 2002:a05:651c:1147:b0:2fb:5060:7037 with SMTP id 38308e7fff4ca-2ff609bdeefmr68899611fa.41.1732021480667;
        Tue, 19 Nov 2024 05:04:40 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] MISRA: Mark Rule 8.4 as clean
Date: Tue, 19 Nov 2024 13:04:37 +0000
Message-Id: <20241119130437.2681955-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All violations have been fixed up, so mark it as clean.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: consulting@bugseng.com <consulting@bugseng.com>

As I've not committed "xen/bootinfo: Include declaration for
fw_unreserved_regions()" yet, I'm very tempted to drop the churn in the arm64
line and have this as the singular patch adjusting the clean list.
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 7944ce2ee3b2..755ea3271fc9 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -47,6 +47,7 @@ MC3R1.R7.4||
 MC3R1.R8.1||
 MC3R1.R8.2||
 MC3R1.R8.3||
+MC3R1.R8.4||
 MC3R1.R8.5||
 MC3R1.R8.6||
 MC3R1.R8.8||
@@ -115,7 +116,7 @@ if(string_equal(target,"x86_64"),
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3R1.R8.4||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
+    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}

base-commit: 3128d7248f2ad389b8e9a3e252958cbfbd1898ee
prerequisite-patch-id: 46b8fc2e9df2fd6be1bbbd6b50463e0e15a8f94d
prerequisite-patch-id: c122b170f57ab96fe52c37aebf1f4bb366194637
prerequisite-patch-id: 1c2d96bf17c5da0981b6c62939d3b7cc1e05933e
prerequisite-patch-id: b3e43902729416e18b4fada7f529b4cb02b1815e
prerequisite-patch-id: 9cb4598ff123c3b153f50f08798ad66a849c1af6
-- 
2.39.5


