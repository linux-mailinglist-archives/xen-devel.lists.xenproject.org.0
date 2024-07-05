Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6417928B84
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 17:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754376.1162792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkjv-000080-4y; Fri, 05 Jul 2024 15:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754376.1162792; Fri, 05 Jul 2024 15:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkjv-00005z-2L; Fri, 05 Jul 2024 15:20:47 +0000
Received: by outflank-mailman (input) for mailman id 754376;
 Fri, 05 Jul 2024 15:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4R/=OF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPkjt-00005r-KM
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 15:20:45 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25683790-3ae2-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 17:20:43 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77bf336171so256866966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 08:20:43 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c8ad6c6esm78100366b.49.2024.07.05.08.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 08:20:40 -0700 (PDT)
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
X-Inumbo-ID: 25683790-3ae2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720192842; x=1720797642; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NrzNfhl2P/0/0SZmMx6v7qVnc8kyhqfiItOMvG5o1uo=;
        b=lbSXnHY97k7PeUB0dUK97ftch2wyYCbdeJ9Dk5VSiW8GNxI0Cq7Ckkej119s4dx2QP
         OCylZ/G/cpK+3MJ97ryAUPBvIHIVtKQ+ncTVjCCZLGVK4hmZrV7BCL05vNN+X1G1y3xw
         c6sErAq+lpCEk9YbCbgsaaBzUra97wbfv+R30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192842; x=1720797642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrzNfhl2P/0/0SZmMx6v7qVnc8kyhqfiItOMvG5o1uo=;
        b=A/7rIGDpyREv8fFhan953P/2f5VC7RuPZjPLAuDNFGpOwAiV9ros3mmLnRrJqBisIQ
         AcRpLNXbx9uhgA2HI4FmZdL98oAxDB965WsU99SeAf6FvldgON3JjTsozPVKLflRDSEg
         sPe1nV/pRmTkCaRePZXg6MeHym1vIkNLImUFutlphjvKPTLECihFzVIQrzGxmxId51iu
         VaiGnW9bZYGaSGtH9JrDKZ+CIHSQw+YBdWXQCCssUE2hez4HekQqIVoYW0ES/Mx6bFEc
         Ad32KPAX6bVPXchcreNMn40qdmjXfSRoCAV6R1U43/A8ZTuRNNQXzKNxesDTFG9Rh9as
         CpOQ==
X-Gm-Message-State: AOJu0YwZvyRV/TaaGTrErMtMGINZyBq/pN5VacjRZYqYGMM2pdYVewWy
	MO7BqwqMbqHz3UNu1l/WxevBv0A76uCJ6Zg5R+f6ADzMtLrWjEQSDv6AXxVAMW2+WqkTdQeQczB
	b
X-Google-Smtp-Source: AGHT+IEPuLvXIsVUFR+7tg0gAV55lh7/XiiJSwYOoj36vsuRtnr6VhpsN3+nBdSrdd2J81aSX+gYrw==
X-Received: by 2002:a17:906:6a93:b0:a77:a1f1:cfa0 with SMTP id a640c23a62f3a-a77bdae45eamr333391766b.36.1720192842183;
        Fri, 05 Jul 2024 08:20:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 0/6] CI: Fixes, part 2
Date: Fri,  5 Jul 2024 16:20:31 +0100
Message-Id: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Work to fix a few build system checks, and to strip the obsolete contents of
the build containers, prior to adding new containers (will be part 3).

Andrew Cooper (6):
  build: Regenerate ./configure with Autoconf 2.71
  build: Fix the version of python checked for by ./configure
  CI: Refresh the Coverity Github Action configuration
  build: Drop openssl as a build dependency
  build: Drop libiconv as a build dependecy
  build: Drop xorg-x11 as a build dependency

 .cirrus.yml                                   |    2 +-
 .github/workflows/coverity.yml                |   36 +-
 README                                        |    2 -
 .../build/debian/bookworm-arm64v8.dockerfile  |    2 -
 .../build/debian/bookworm-i386.dockerfile     |    2 -
 automation/build/debian/bookworm.dockerfile   |    2 -
 .../build/debian/jessie-i386.dockerfile       |    2 -
 automation/build/debian/jessie.dockerfile     |    2 -
 .../build/debian/stretch-i386.dockerfile      |    2 -
 automation/build/debian/stretch.dockerfile    |    2 -
 automation/build/fedora/29.dockerfile         |    1 -
 automation/build/ubuntu/bionic.dockerfile     |    2 -
 automation/build/ubuntu/focal.dockerfile      |    2 -
 automation/build/ubuntu/trusty.dockerfile     |    2 -
 automation/build/ubuntu/xenial.dockerfile     |    2 -
 .../kernel/5.19-arm64v8.dockerfile            |    1 -
 .../tests-artifacts/kernel/6.1.19.dockerfile  |    1 -
 config/Tools.mk.in                            |    1 -
 configure                                     | 1006 +--
 docs/configure                                |  990 +--
 stubdom/configure                             | 2293 ++++--
 tools/config.h.in                             |   15 +-
 tools/configure                               | 6397 +++++++++--------
 tools/configure.ac                            |    4 +-
 24 files changed, 6136 insertions(+), 4635 deletions(-)

-- 
2.39.2


