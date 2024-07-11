Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CA892E5C2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757328.1166219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlt-0000wv-Ij; Thu, 11 Jul 2024 11:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757328.1166219; Thu, 11 Jul 2024 11:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlt-0000r8-CF; Thu, 11 Jul 2024 11:15:33 +0000
Received: by outflank-mailman (input) for mailman id 757328;
 Thu, 11 Jul 2024 11:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrls-0007rD-Dd
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:32 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2ef9dd7-3f76-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:15:31 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f419so923885a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:31 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:28 -0700 (PDT)
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
X-Inumbo-ID: e2ef9dd7-3f76-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696530; x=1721301330; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKFCUmHn/euIN4BAYOnChKlddyPJSKX/LUNusA/vBnA=;
        b=LPRcR6d02bMp6ulwU7ivxHXA2ZT0lq2SEXp7kn8vBfLr88GO3obK/FNG7euxzcPz5b
         r7kbevpxjNnTPa9xXcLJRqIeobnmZy9Gaga2ajl8ytss1W1akn6gqH0Nd+PAJR+QtJZ0
         3fTqan71zgHsHPa0AH+DfC9coTaUXYSg3T2+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696530; x=1721301330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKFCUmHn/euIN4BAYOnChKlddyPJSKX/LUNusA/vBnA=;
        b=HbkoAejir2/4M1y0oMpo9HeQdMDGHliTbjcCqWrAtQEMxmUOoLpc4Ud9JleIDpfAo0
         E3VBP3z++SqenJsXuE/JdkdPjH7gxUofaCUN5PV344Zx/7H9otezoFCTVFufKUNUQ3Sv
         C2p1gX3Co7mDeqL1LQU20qDWYTjCrC8F3KWwR+bB98Yku038x0MJ+iigkQwXtEYV32Cg
         FpM5MrHtzDKvoRRqdn/LbeqtP8R0lUh9EyrnLVeDyywCx6IBNE2mvuJHm2QS3BSw9UK4
         H52fajV90eukrMreqsyG95SwayCh38tZGrpf4vtI+RhubPn8NOX1V2ZQai1YN9HN2OQL
         cuCw==
X-Gm-Message-State: AOJu0Yx05OjSuAyLG7Zvn0+WybZ6eUx3utp1eBjzEvKxd0w0Oke+qA3l
	bakc48e1cO1Ftt8d5pZGDNlqOQqYzWNWiDSqzxkZjtR++GoHtVjWGMzzFU91GfGKe31Hm4TI7bw
	G
X-Google-Smtp-Source: AGHT+IFDY6RbUzLLr+uU7QW4rKNVYt3L0k0y4hzz/H9ybWHb9otZkXB4u8qIzu8bcZh0VfCDJ8yUuQ==
X-Received: by 2002:a17:906:451:b0:a77:db36:1cc6 with SMTP id a640c23a62f3a-a780b89a166mr443901466b.68.1720696530438;
        Thu, 11 Jul 2024 04:15:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 06/12] CI: Mark Archlinux/x86 as allowing failures
Date: Thu, 11 Jul 2024 12:15:11 +0100
Message-Id: <20240711111517.3064810-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Archlinux is a rolling distro, and is subject to arbitrary changes as the
container is rebuilt.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 automation/gitlab-ci/build.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 3e299f34f461..1446bc1d0ea7 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -573,11 +573,13 @@ archlinux-gcc:
   extends: .gcc-x86-64-build
   variables:
     CONTAINER: archlinux:current
+  allow_failure: true
 
 archlinux-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
     CONTAINER: archlinux:current
+  allow_failure: true
 
 centos-7-gcc:
   extends: .gcc-x86-64-build
-- 
2.39.2


