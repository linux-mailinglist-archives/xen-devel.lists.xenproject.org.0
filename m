Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4C38C7CC3
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 20:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723569.1128516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gIt-00052g-Do; Thu, 16 May 2024 18:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723569.1128516; Thu, 16 May 2024 18:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gIt-00050h-A7; Thu, 16 May 2024 18:58:11 +0000
Received: by outflank-mailman (input) for mailman id 723569;
 Thu, 16 May 2024 18:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lir8=MT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7gIr-00050W-Rc
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 18:58:09 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bad26e6-13b6-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 20:58:07 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so288234066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 11:58:07 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d9dsm1003072566b.132.2024.05.16.11.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 11:58:06 -0700 (PDT)
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
X-Inumbo-ID: 3bad26e6-13b6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715885887; x=1716490687; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcr1R+3jXcw0CmtqFZJpukM9gBQdwIGdy8JTCpdlTf8=;
        b=d9G9XjcCefaqYZDH3lFMZ1QGHUOU603xm1RDenNvrvLs5EzrM0VDSk9WouHSsRo1Qd
         YksXhReWaNANr3Q2knKVq2Oh7S7CemrMTe50cxZqzrO8I8hNS5YU0hwmiOeWSp64qFvw
         X97Fc3S8ACQWLNJNk8CutOZuwS5s+IeB7TEzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715885887; x=1716490687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcr1R+3jXcw0CmtqFZJpukM9gBQdwIGdy8JTCpdlTf8=;
        b=ilQGW+CAqoJSEkGgXiTyb6c3JuSbdimhnGYpM3vGU73jR/8sWolvqGD7ZFc3AiZzB1
         r46zcGpdw939/ipF0PydbfcD3CxcOww8Gu1hvK/3vBknPR33w8rcbkFDgHPLKFU6aB+k
         MWifNe57TGQDOLIhe9L9p1vewAYBwMDVjf/62jrxaPxxNVEd973mb31mHrOY2OBlw/K9
         1jQxw6GzxrtjQukKDC4rwPAH9vtsjfjuQQEWhhB5VEvWJGoM9tV9oQ+OiqqgSC6nFnOD
         4QgZbcSm1jWhQ+pidzuGXcfOAG5QqeDn1SlVwowlI1CFpAukUUj+gcySKY+IGeNvX3GS
         Ov1w==
X-Gm-Message-State: AOJu0YwXYU5dwTxfrXXDbnVzLFgeGjlNv/p6QtJfn3UmOpC2mHafAGyH
	MiG5z/xt0Uhoy4Xh2klsSaYBKWUxshiD9fYPhmh3K3iTOIT1X9kNDfxlcs0BfW3CkJqKeofNgES
	x
X-Google-Smtp-Source: AGHT+IHGyydj41kfIUIurnmukhVRSCcCUMp2GV5ov6QeWFgr6KyvVGayrdb7K365XV4AIEVrFPnIRg==
X-Received: by 2002:a17:907:10d5:b0:a59:ced4:25b0 with SMTP id a640c23a62f3a-a5a2d5cb153mr1840131466b.34.1715885887222;
        Thu, 16 May 2024 11:58:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: [PATCH v2 for-4.19 0/4] Drop libsystemd
Date: Thu, 16 May 2024 19:58:00 +0100
Message-Id: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On advise from the systemd leadership.

v2:
 * Import the free-standing example and use that to retain existing
   functionality.

Andrew Cooper (4):
  LICENSES: Add MIT-0 (MIT No Attribution)
  tools: Import standalone sd_notify() implementation from systemd
  tools/{c,o}xenstored: Don't link against libsystemd
  tools: Drop libsystemd as a dependency

 LICENSES/MIT-0                                |  31 +++
 automation/build/archlinux/current.dockerfile |   1 +
 .../build/suse/opensuse-leap.dockerfile       |   1 +
 .../build/suse/opensuse-tumbleweed.dockerfile |   1 +
 automation/build/ubuntu/focal.dockerfile      |   1 +
 config/Tools.mk.in                            |   2 -
 m4/systemd.m4                                 |   9 -
 tools/configure                               | 256 ------------------
 tools/include/xen-sd-notify.h                 |  98 +++++++
 tools/ocaml/xenstored/Makefile                |   2 -
 tools/ocaml/xenstored/systemd_stubs.c         |   2 +-
 tools/xenstored/Makefile                      |   5 -
 tools/xenstored/posix.c                       |   4 +-
 13 files changed, 136 insertions(+), 277 deletions(-)
 create mode 100644 LICENSES/MIT-0
 create mode 100644 tools/include/xen-sd-notify.h


base-commit: 977d98e67c2e929c62aa1f495fc4c6341c45abb5
-- 
2.30.2


