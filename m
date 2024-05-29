Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3A38D38FD
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732036.1137820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCK9k-0000pt-86; Wed, 29 May 2024 14:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732036.1137820; Wed, 29 May 2024 14:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCK9k-0000nk-4n; Wed, 29 May 2024 14:19:56 +0000
Received: by outflank-mailman (input) for mailman id 732036;
 Wed, 29 May 2024 14:19:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mTS/=NA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCK9i-0000nO-Eh
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:19:54 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 837de55b-1dc6-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:19:52 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so272480766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:19:52 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6389a0b4ccsm101767066b.22.2024.05.29.07.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:19:50 -0700 (PDT)
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
X-Inumbo-ID: 837de55b-1dc6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716992391; x=1717597191; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7NBtADKKSHisJ5YHk93xXrTguK6Evlu1C7r13rztjA=;
        b=jdYt7QCOa1Hb4yKWZ3HHhU8qqanq1LDljl7dBpMD0eF+Z+RjsqECZ56lrPtBhfdV28
         GQibWURRSp6zHvTrN/ocOObztzU3w+Cem86BwSKcYPYBMv9JZSNAO2wmfjaS5oi+IRoW
         bD1ejK0rF4MthFCzVmRWrDPZt/B7/dOyNWlI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716992391; x=1717597191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7NBtADKKSHisJ5YHk93xXrTguK6Evlu1C7r13rztjA=;
        b=atNHkYUMc2cmFIpBPllILEU6RzkoA2Qp2Z3W+UOZgjKYiWviz9eAXZj5oyGF23+fUF
         qouE5DCJK9NrVkt0GGPdL32+yDjAnrl1cKq6LqbtktoLU3wrHBi4MNTItQ3ohFB8/BfQ
         MVNYoAcUwv4aOT3xRbqJpMQ+NDZid+lT0qFcHmOFPFxr+Eahlix+6zoMk1rYPHE0fDbd
         OnFjdIpZBl3YD5ubtx29qlW0BBOmep6VNQFYmMcrwjOrwBesI7Zj52YNyACNjRAqAkkT
         1qMEXFAYS5WAbli1MwOo8jLXXVgcm9AQwU+hPGJLzkYg+F3roFHl+BdSXfZDNHhIy4xE
         iOtw==
X-Gm-Message-State: AOJu0Yzf58iNNTJIOO3UI9TGJ846YKzl4apnsT9kqNGg7DZmrwbPr4Cs
	+Z0sNK7nOEMl1mQKN8G85VQUk9AdYjkO/RM0gIxh8AOexfAmB4LlB8Dd9/tsg8YTmmeiWGhnX7D
	130k=
X-Google-Smtp-Source: AGHT+IFSeN1eQXlevEyGCfv4T2C28LpmyR94XuaLMZ86aaY2GVHGI+rA3LWvrFwzRHFBKCmmQlCz5g==
X-Received: by 2002:a17:906:13c1:b0:a59:c367:560c with SMTP id a640c23a62f3a-a6265148b73mr1026065666b.60.1716992391233;
        Wed, 29 May 2024 07:19:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 0/3] CI: Misc improvements
Date: Wed, 29 May 2024 15:19:42 +0100
Message-Id: <20240529141945.41669-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All found while making extensive use of Gitlab CI for the bitops boot testing.

For 4.19.  It's all very low risk, and improves the utility/useability of our
testing.

Andrew Cooper (3):
  CI: Remove CI_COMMIT_REF_PROTECTED requirement for HW jobs
  CI: Use a debug build of Xen for the Xilinx HW tests
  CI: Improve serial handling in qemu-smoke-ppc64le.sh

 automation/gitlab-ci/test.yaml           |  8 ++++----
 automation/scripts/qemu-smoke-ppc64le.sh | 13 +++++++------
 2 files changed, 11 insertions(+), 10 deletions(-)

-- 
2.30.2


