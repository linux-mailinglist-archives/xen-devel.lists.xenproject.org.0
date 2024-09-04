Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7D96C3C7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790546.1200336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfX-0000KI-St; Wed, 04 Sep 2024 16:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790546.1200336; Wed, 04 Sep 2024 16:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfX-0000IC-Pb; Wed, 04 Sep 2024 16:15:43 +0000
Received: by outflank-mailman (input) for mailman id 790546;
 Wed, 04 Sep 2024 16:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfW-0000I6-8m
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:15:42 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee29b1f8-6ad8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 18:15:41 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5356bb5522bso295063e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:41 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084c9cfsm2388903e87.244.2024.09.04.09.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:39 -0700 (PDT)
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
X-Inumbo-ID: ee29b1f8-6ad8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466541; x=1726071341; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPov3bEaYQETs3cfkL+hd+7yzj0MCF4STSdQusQLNLk=;
        b=aiDnF890ifR4YhU0JmqSKsRUNB8Z0vFs2K5+VXb1WzmiuObtf3Oz3msL41yLuEQv2D
         l2yba3oQTkTBjLK52cgXBc0Kt8L43xy9PmKbJ0vc/hMjcYXnCa7njjXpfWNPocAgaR/0
         2x6kTm3J3s2SKHUnO9breU0b1vf71XOZJSaMeoOOCfOAwrdQ9VlNoBpqlZlp/ZTEU2qs
         axWqBuBkwa0yHMDIiYlvnOjFezU+rh0S+7gV0ZLT+81q5jsuIdHQiY6O3W9gXB+5SlPZ
         gE2OChegXKadf7Hj1NMqHeRQCsu6d1gaiGP32W15OjYBUNP1gutsbDYWcnC61Bd3DJLU
         XIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466541; x=1726071341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPov3bEaYQETs3cfkL+hd+7yzj0MCF4STSdQusQLNLk=;
        b=WcshCAlhKlheeQ4WHxkkPoNiQJ6YF5rt3Or3aphTSY0dXBwNYOs5MTfAjRrRuWkrFN
         FftKwh4e1YC7Z25J/yUyzmFYIvNa3aCPRA/dalFyg2fWG49TTQk/yK/dAPqFPq458UG+
         8iJbO86ZUnu9zPJHh5/jFPYR0owm6NIQbu2mEwOoNTLCevUwZAitwsel02rSqvq9SwQY
         suI/RHJ274shSTqZS0Sv36UqeEOqnYUcbDRU1YC3dM/yo8uJx2c5FPhugy0jbrUWO0RV
         M7CqNXjCGyIgNppc3UOlQtGZQvDnQI6Smow/1cCRPAaRFJEZjIO/D9eGtYtMnJa7G2nf
         9S1w==
X-Forwarded-Encrypted: i=1; AJvYcCXe0H0w7Idjv2OmU/p353Wd8YpaCwTr7Vh/phNXvbN9qX1yUBGLkumiBpy+IeW3xsoOEnFYMbmaaWg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYquBNZyK7O4Th/sA7j07GWIH9NrqPXxmSUsPH6xuOR3Cqf5lD
	azxC3T2NE+o2wK7Sx28ok5tykqWF5ZFmA95dtQHvkJvrJys4H1d5
X-Google-Smtp-Source: AGHT+IGGxyXV1DHmwVIe0OpCvVwm03kby7sZoJZm7dAyldQigQIQwsvNJl64iMUk2nMzo9AdvWIDKg==
X-Received: by 2002:ac2:4c41:0:b0:533:4191:fa47 with SMTP id 2adb3069b0e04-53546b69167mr10896281e87.47.1725466540471;
        Wed, 04 Sep 2024 09:15:40 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 00/12] Xen queue
Date: Wed,  4 Sep 2024 18:15:24 +0200
Message-ID: <20240904161537.664189-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

The following changes since commit e638d685ec2a0700fb9529cbd1b2823ac4120c53:

  Open 9.2 development tree (2024-09-03 09:18:43 -0700)

are available in the Git repository at:

  https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/xen-queue-2024-09-04.for-upstream

for you to fetch changes up to 0b57c8160a2a6c833cfb1d958f08385c4391ab70:

  docs/system/i386: xenpvh: Add a basic description (2024-09-04 16:50:43 +0200)

----------------------------------------------------------------
Edgars Xen queue.

----------------------------------------------------------------
Edgar E. Iglesias (12):
      MAINTAINERS: Add docs/system/arm/xenpvh.rst
      hw/arm: xenpvh: Update file header to use SPDX
      hw/arm: xenpvh: Tweak machine description
      hw/arm: xenpvh: Add support for SMP guests
      hw/arm: xenpvh: Remove double-negation in warning
      hw/arm: xenpvh: Move stubbed functions to xen-stubs.c
      hw/arm: xenpvh: Break out a common PVH machine
      hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
      hw/arm: xenpvh: Reverse virtio-mmio creation order
      hw/xen: pvh-common: Add support for creating PCIe/GPEX
      hw/i386/xen: Add a Xen PVH x86 machine
      docs/system/i386: xenpvh: Add a basic description

 MAINTAINERS                     |   2 +
 docs/system/i386/xenpvh.rst     |  49 ++++++
 docs/system/target-i386.rst     |   1 +
 hw/arm/meson.build              |   5 +-
 hw/arm/trace-events             |   5 -
 hw/arm/xen-pvh.c                |  89 ++++++++++
 hw/arm/xen-stubs.c              |  32 ++++
 hw/arm/xen_arm.c                | 267 -----------------------------
 hw/i386/xen/meson.build         |   1 +
 hw/i386/xen/xen-pvh.c           | 121 ++++++++++++++
 hw/xen/meson.build              |   1 +
 hw/xen/trace-events             |   4 +
 hw/xen/xen-pvh-common.c         | 362 ++++++++++++++++++++++++++++++++++++++++
 include/hw/xen/xen-pvh-common.h |  88 ++++++++++
 14 files changed, 754 insertions(+), 273 deletions(-)
 create mode 100644 docs/system/i386/xenpvh.rst
 create mode 100644 hw/arm/xen-pvh.c
 create mode 100644 hw/arm/xen-stubs.c
 delete mode 100644 hw/arm/xen_arm.c
 create mode 100644 hw/i386/xen/xen-pvh.c
 create mode 100644 hw/xen/xen-pvh-common.c
 create mode 100644 include/hw/xen/xen-pvh-common.h

-- 
2.43.0


