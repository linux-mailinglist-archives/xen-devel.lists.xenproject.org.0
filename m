Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC68B279E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 19:33:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712192.1112667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s02xP-0004TT-2W; Thu, 25 Apr 2024 17:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712192.1112667; Thu, 25 Apr 2024 17:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s02xO-0004RT-Vh; Thu, 25 Apr 2024 17:32:26 +0000
Received: by outflank-mailman (input) for mailman id 712192;
 Thu, 25 Apr 2024 17:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIz1=L6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s02xN-0004RI-Hw
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 17:32:25 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5b903bf-0329-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 19:32:21 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-571be483ccaso1485676a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 10:32:21 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ci8-20020a170906c34800b00a587356c04csm4006477ejb.187.2024.04.25.10.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 10:32:20 -0700 (PDT)
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
X-Inumbo-ID: c5b903bf-0329-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714066341; x=1714671141; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1f5qDqGyeFzuGbaTLZT3boVwZg08aUEwWNQGvrJ0bLw=;
        b=cs7XMolUa37ydDFv460BAZb/ql4qC/50gsy5e3IQM39Vn6ZIBEiZOxYG2xYnB0t8p/
         DK/8iixr9w8U2gEe4XucNXbI+967s7t6HWS7K39Ey9QDzEx1m3zdR8STJDOKDiBlysXJ
         ibIEhGZEDjHrLx4Q7mTey75zDhQ7Slg7VpUOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714066341; x=1714671141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1f5qDqGyeFzuGbaTLZT3boVwZg08aUEwWNQGvrJ0bLw=;
        b=HkYdy8mFEJGV4/1hB4z8trc+Ok4jQeyJkneXpAch7+FF21yYq32DEpFPxNtQ65Ohf9
         Emsk+jeLSnzGqOx1SxUl7czzct9+Zj05Y954htC1Afdt4DUyajlevTUyCAEkpDnowS0/
         ATOXJ5QGvLmqp1BSoolu5NKRwGLB5p6OHSjUJf1vU5Qg5LDFCYOfvSZutNhbUX6XhHlC
         pK9E/qgBOqsJd+ClruCLEesyNvTUdpW9wKTgLBYHAonGGiSWiNefMzQ+6fFhZ4DirBFV
         CAqd2DCaoS4QHGiCClflMRuyh8uACFgvm/QY3l2tPvO3scVSnDdPUFOnMgi0L4PGyafg
         hpvA==
X-Gm-Message-State: AOJu0YwO8dsz47Qxiuicwe8/sJiwiTtnJuMc25R7JcUq6iEStj7z75+L
	D6XKtMNi3NJ6SWoqhMeWTrTEpI6Eb6n+4rXdvVy2NgZGWNAwFVeJP8zvWTKn3FHVSI8wGit/uAE
	s
X-Google-Smtp-Source: AGHT+IEN5H45g7ORHanmEwlBu+iaropz2pE8IhU5BK2lSQkK8JktE+sGMyn+vbVEURVuepiAQ3z9Lw==
X-Received: by 2002:a17:906:cb09:b0:a55:5ddd:e5f6 with SMTP id lk9-20020a170906cb0900b00a555ddde5f6mr270364ejb.28.1714066341084;
        Thu, 25 Apr 2024 10:32:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] Drop libsystemd
Date: Thu, 25 Apr 2024 18:32:14 +0100
Message-Id: <20240425173216.410940-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On advise from the systemd leadership.  See patch 1 for details.

Andrew Cooper (2):
  tools/{c,o}xenstored: Don't link against libsystemd
  tools: Drop libsystemd as a dependency

 automation/build/archlinux/current.dockerfile |   1 +
 .../build/suse/opensuse-leap.dockerfile       |   1 +
 .../build/suse/opensuse-tumbleweed.dockerfile |   1 +
 automation/build/ubuntu/focal.dockerfile      |   1 +
 config/Tools.mk.in                            |   2 -
 m4/systemd.m4                                 |  23 +-
 tools/config.h.in                             |   3 -
 tools/configure                               | 523 +-----------------
 tools/ocaml/xenstored/Makefile                |  12 +-
 tools/ocaml/xenstored/systemd.ml              |  15 -
 tools/ocaml/xenstored/systemd.mli             |  16 -
 tools/ocaml/xenstored/systemd_stubs.c         |  47 --
 tools/ocaml/xenstored/xenstored.ml            |   1 -
 tools/xenstored/Makefile                      |   5 -
 tools/xenstored/posix.c                       |   9 -
 15 files changed, 8 insertions(+), 652 deletions(-)
 delete mode 100644 tools/ocaml/xenstored/systemd.ml
 delete mode 100644 tools/ocaml/xenstored/systemd.mli
 delete mode 100644 tools/ocaml/xenstored/systemd_stubs.c


base-commit: 23cd1207e7f6ee3e51fb42e11dba8d7cdb28e1e5
-- 
2.30.2


