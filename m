Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EE4A735C1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 16:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929622.1332338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpIT-0004cR-Be; Thu, 27 Mar 2025 15:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929622.1332338; Thu, 27 Mar 2025 15:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpIT-0004b1-8z; Thu, 27 Mar 2025 15:37:33 +0000
Received: by outflank-mailman (input) for mailman id 929622;
 Thu, 27 Mar 2025 15:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txpIR-0004as-Gn
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 15:37:31 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64565fa1-0b21-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 16:37:29 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-399749152b4so314641f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 08:37:29 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9eef37sm19946626f8f.85.2025.03.27.08.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 08:37:28 -0700 (PDT)
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
X-Inumbo-ID: 64565fa1-0b21-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743089849; x=1743694649; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=csBfsCpwz7Az2tpxeD+7SrIKEDhzsYG19k+28/elAfc=;
        b=nA+xUA51GvN68g7zXkNLFcj/X/RCiQ7S3fDfUI8lYeTiA1dEUuCqNNX04RQAk8fvJC
         A7dVNqohwef5ZuxFLQ6YeDGYudcEt1up+g/kYLfWrnv8Qd5r2FI5QsE5Wtmbbc8s4X8y
         zSb+NkyFpnCLbVTOsmPqGQr5vhVomRLJLqAUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089849; x=1743694649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csBfsCpwz7Az2tpxeD+7SrIKEDhzsYG19k+28/elAfc=;
        b=esv+agBuu18MXummlFBBJOvPFHQzOSegVoXOKT0cScBn0dG2CkjDZNFrxdpXOrQvFw
         lpsiUA8xhPuSD6URlfK3KwXWwPvsrMuI3P0ZEC4o14MF5/brzq+xhRV2HVDHkSF1ZHtt
         f8L4Cdr9GScFQ5LCFTNmskikxTCWY211Ui5H7oABciiRLIrctUwsBUwdwZhqyu25V8Lp
         6FvPcMTB5v38Q7wwTECG4sV0eJmPESY3XSPPKnfPvaWel6BFSpe5l6cTIjtnNG/nQofn
         zXu4Nt/8d4ptnkM30sJj3kYhA17TZzKrxphmmUd2zyY38I4c6NO9Hh9futCikK+bf1yM
         dKRg==
X-Gm-Message-State: AOJu0YzC8vwPcaKNuJmUIMupKB/84hhRAAxU36GyngWfeu8IIGEqF6Ii
	s+VbMDvWN0Shcef0z4rjgd2L4hnJd6oUHA99WrpNVXEsUurv1H+zbXw61pRhEnb0l3GoU0+PuYc
	5epU=
X-Gm-Gg: ASbGncsvbMIdIT2iLxK3jqWcx1g/e9peNKnokeGB4p/AxR3cq//3Ce8Y/U9ZOQukhDu
	8/wr4D8Y4u03T91yMfSmf2FPgDsebnOUXhqqzd8kZpSjVpmLN/Gwb7gOSAuj/EqVDrzCldKn23R
	UgQTKfnBm2wEa/phbB14E/1U94FEMgdy+UC4U36YC9FtnSXuzVapnQlDWxCC5n4zxCDphZkrPoo
	+tBjj70EIw1CON9tT361Wve/8TnrdXCyvzSyuk/3rjx5NgLhl7HW3AlpY5cRW53IQvLh3jMdZXa
	Ok6K3FI2ySSnhs+rfoKWR16alZeAt1kj9yk1w0dOvuSwKmXUlbQwERrwFGTevg1JtPTrjjly9Ti
	hAtOzWxMO4wWqy4sg8A==
X-Google-Smtp-Source: AGHT+IEnA4D9MYI6lQ8OQBBDTfDrp7oTrXo1tcWP7q9l5lG4RlfspSZvzx+KRtuwZRuAmqNXuZ8Z3g==
X-Received: by 2002:a5d:5f8c:0:b0:391:3fd2:610f with SMTP id ffacd0b85a97d-39ad17499camr4029632f8f.13.1743089848580;
        Thu, 27 Mar 2025 08:37:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2] CHANGELOG: Minimum toolchain requirements for x86 and ARM
Date: Thu, 27 Mar 2025 15:37:25 +0000
Message-Id: <20250327153725.401451-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * State x86 and ARM, rather than implying all architectures.
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 35ab6749241c..8f6afa5c858a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - The minimum toolchain requirements have increased for some architectures:
+   - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
+   - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
 
 ### Added
  - On x86:
-- 
2.39.5


