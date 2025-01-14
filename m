Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F4A10E12
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 18:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871622.1282602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXkxH-0000A5-7A; Tue, 14 Jan 2025 17:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871622.1282602; Tue, 14 Jan 2025 17:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXkxH-000084-4c; Tue, 14 Jan 2025 17:43:55 +0000
Received: by outflank-mailman (input) for mailman id 871622;
 Tue, 14 Jan 2025 17:43:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXkxG-00007t-6M
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 17:43:54 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d292456-d29f-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 18:43:50 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso8301655a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 09:43:50 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c435bsm6318583a12.27.2025.01.14.09.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 09:43:48 -0800 (PST)
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
X-Inumbo-ID: 1d292456-d29f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736876629; x=1737481429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7G4MlUHu1n7J9U4fkD7VebSjvuwWh3bWJV+pig280U=;
        b=hof4V73YjmqTXXTI9tzvABzGIu6T7uDjQT+JuJu3EgI9dnpj3/zWkpLMDiT0tlzkUl
         Regn58l5wck9XAczaxEYp18PhFsQ0W3r5e3wzch4594krkoPCfFqgTuRrmp+glA+7L0B
         M7C1f7sZm3hrNO+W3CLJeUc134pkpxladszeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736876629; x=1737481429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7G4MlUHu1n7J9U4fkD7VebSjvuwWh3bWJV+pig280U=;
        b=r7WvltvfssAMTXAf3s6HSnoaeadnxmMbkPxsGsJUAaEdXGtbB5/P1ki6Reso/JyvDj
         +YiQW5MQiAbPcs/Xk5StlCIACsqCqArTQ9k5DN8eAZrCxkSvZdexeewqsSGwCdpX0BhF
         70TwIHKjUaUPYbwolFD//judjtEjMYQhdGnz7mumizIAkoW9zf7fLp667DP5YzwpWdM4
         KvwenHBv2so3/tKRr5gERRK12iREhi0ETu6rcDnonRcxbKdPiOhu1WaKmnC5a71wMY6i
         myWdzHHtxnso5j+4Bxl3qq9ayIDtnaEINcUNAkTqpcUe+w8rBzCd9nhjnnu/a5fQAPuJ
         kx4w==
X-Gm-Message-State: AOJu0Yza6r+q5sM+esURj2LNUeX1JjvPcHKFxOLexLO/nJ2+QT01EuDY
	fG3W4ipl1JJVPVEcS9CQoZJMb6Myx8J++1tofqveZLktTe7Z/XevqLCctqiP11+/iDoCChtd/8z
	X
X-Gm-Gg: ASbGncsqsgAjDQmaHUvcBWS5yOsSnN9RUukB59qSeDmuRYeWGNWt8OTtnLE4Um7Y50z
	hcpBPEJasAjiKSjVo3Syck6yYcP17OBc5EGxe0Wit3fZBRJGzNsYRdU7AhvVfrTxqdyFP141Jen
	+amMSWb96OyJ5FQswHX7tmL8o37+G5UOUl7Xck1CS2JQGXqGvYzYsoFUQCp5anjuP+VqP10jtSE
	ypaR/PdAjpjnBMMDKK+Gfp1cgWpwkW67PRMEpLXWysIdH2taxKV2F52PwP2Cg==
X-Google-Smtp-Source: AGHT+IEx8Jfszc85JWJM/EvBe/xXV9e9+9ZgxMTMo4OKPAi2BEw7HdLUb+heJNOppBqLInqGUaF5+w==
X-Received: by 2002:a05:6402:2808:b0:5d3:ba42:ea03 with SMTP id 4fb4d7f45d1cf-5d972e0674bmr21290563a12.8.1736876629486;
        Tue, 14 Jan 2025 09:43:49 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.20] automation/gitlab: disable coverage from clang randconfig
Date: Tue, 14 Jan 2025 18:43:45 +0100
Message-ID: <20250114174345.60887-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If randconfig enables coverage support the build times out due to GNU LD
taking too long.  For the time being prevent coverage from being enabled in
clang randconfig job.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
I will fix the orphaned section stuff separately, as I'm considering just
removing LLVM coverage support because the llvm coverage format is not
stable, and the code to dump it has already become stale.  However I need
to think about it, and in the short term disabling coverage support from
randconfig is more straightforward.
---
 automation/gitlab-ci/build.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index cb84f379b754..bc4a8a5ad20c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -556,6 +556,8 @@ debian-12-x86_64-clang-randconfig:
   variables:
     CONTAINER: debian:12-x86_64
     RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_COVERAGE=n # Disable coverage otherwise build times out.
 
 debian-12-x86_64-gcc:
   extends: .gcc-x86-64-build
-- 
2.46.0


