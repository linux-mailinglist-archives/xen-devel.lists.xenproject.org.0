Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5A18D38FE
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732038.1137834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCK9k-0000yJ-R9; Wed, 29 May 2024 14:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732038.1137834; Wed, 29 May 2024 14:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCK9k-0000vR-Is; Wed, 29 May 2024 14:19:56 +0000
Received: by outflank-mailman (input) for mailman id 732038;
 Wed, 29 May 2024 14:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mTS/=NA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCK9j-0000nP-Eq
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:19:55 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 853ebdb4-1dc6-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 16:19:54 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f464so2789442a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:19:54 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6389a0b4ccsm101767066b.22.2024.05.29.07.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:19:53 -0700 (PDT)
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
X-Inumbo-ID: 853ebdb4-1dc6-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716992394; x=1717597194; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYSXQhJ0PGNDlVpaDWx18D2dK2stcV3qob4/lvY8HMU=;
        b=N8XIv60u30rCL+EVRlh40On8PeAQPP/7JU4m3myfLz6G3x6aHdKSy278rzWtH8lkiQ
         hAeaVmpbTTrUEy30Wl3Mj0uZCEpjqqTcli37heorFOuCfjJfHkPo0rpEvCoEkdai0N19
         HLn65zOe5tb/uTIYWnzLKlceMZN5XbAz8zWHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716992394; x=1717597194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYSXQhJ0PGNDlVpaDWx18D2dK2stcV3qob4/lvY8HMU=;
        b=S1r5qi8AkiU2E67K8itK/fTX4HAQlA8xOswvmghYiZWih/vWEeUSaLYX6ETjJGIqZu
         Iz4G/Rq3kmw3d0PK3Nl8xPUCxEQ7Z9ikUgeUoUATTfBlEBI1mLEx67Eh5avugKzKBd1V
         9D+2ZdW2+DYS4/ul3NSzyn3ggb+yCQdbuFmbsIJIitwpzRRqsX1GjMtxyq3KFnEFJkZA
         hSDVJLmcEKvDTaueh46T9ntraSdRYFcTvWP+G4EksimijB/xFFXdJrfUSYRGyjqrju9d
         71hBoG0GOH5yyMuK9uLb0fT0jphPd/X8JEnZ3b4hdZibG91c+2cXqz3gtLahEXjQPQ4/
         Tk+w==
X-Gm-Message-State: AOJu0YwNiwzGdUHmgyWwxdivlzBLUvMKBF8i3sssXg1Gjc/Yo4qggDg9
	pVA0V8JyHhLR/kgW+1Wl0ZOhl5+mGIRzYAfB3l34tUxEvKRQtVXtRWOOjdSOLPEDZCX3l55N7Yt
	OUnc=
X-Google-Smtp-Source: AGHT+IH8Mm/hWecuku0+y8gQZdQGlDm2/HgQ7UTncEgW22ljdqB4qeA1EPM0HiL6Nz9RQ80UF36lyQ==
X-Received: by 2002:a17:906:2516:b0:a63:535b:b316 with SMTP id a640c23a62f3a-a63535bb4a2mr285160066b.44.1716992394253;
        Wed, 29 May 2024 07:19:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 3/3] CI: Improve serial handling in qemu-smoke-ppc64le.sh
Date: Wed, 29 May 2024 15:19:45 +0100
Message-Id: <20240529141945.41669-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529141945.41669-1-andrew.cooper3@citrix.com>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have PPC put serial to stdout like all other tests, so it shows up in the main
job log.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/scripts/qemu-smoke-ppc64le.sh | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index 2adbdac87ef5..701d81107d18 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -2,15 +2,15 @@
 
 set -ex
 
+serial_log="$(pwd)/smoke.serial"
+
 # machine type from first arg passed directly to qemu -M
 machine=$1
 
 # Run the test
-rm -f smoke.serial
+rm -f ${serial_log}
 set +e
 
-touch smoke.serial
-
 timeout -k 1 20 \
 binaries/qemu-system-ppc64 \
     -bios binaries/skiboot.lid \
@@ -20,9 +20,10 @@ binaries/qemu-system-ppc64 \
     -vga none \
     -monitor none \
     -nographic \
-    -serial file:smoke.serial \
-    -kernel binaries/xen
+    -serial stdio \
+    -kernel binaries/xen \
+    |& tee ${serial_log} | sed 's/\r//'
 
 set -e
-(grep -q "Hello, ppc64le!" smoke.serial) || exit 1
+(grep -q "Hello, ppc64le!" ${serial_log}) || exit 1
 exit 0
-- 
2.30.2


