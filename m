Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CB2AD5D26
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011975.1390558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPAH-0004ne-O9; Wed, 11 Jun 2025 17:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011975.1390558; Wed, 11 Jun 2025 17:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPAH-0004kD-JI; Wed, 11 Jun 2025 17:23:05 +0000
Received: by outflank-mailman (input) for mailman id 1011975;
 Wed, 11 Jun 2025 17:23:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJt8=Y2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPPAG-0004ea-40
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:23:04 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b337446f-46e8-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 19:22:50 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so93159f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 10:22:50 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5322ae43fsm15685768f8f.25.2025.06.11.10.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 10:22:49 -0700 (PDT)
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
X-Inumbo-ID: b337446f-46e8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749662569; x=1750267369; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anfQsa7S+yMQpSfHuxEOD+WPNmDFJ5MQMbijHBl0+0s=;
        b=j2+zYRsjD781j8G3GQeEZJweEAsyfXEU7C7ZsSYmJtD51C3CJkarMWktZBIPJPtp8I
         aPOQlQhcDNHn99Q1vCJerkg1QUXpbUoxswn5uRWuH7qST+gBEqLS8AqLNF8uaXi7uSA2
         JT1r5atnbwkFRHGbFje5EZ6g7FP/qnnRWKjqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662569; x=1750267369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anfQsa7S+yMQpSfHuxEOD+WPNmDFJ5MQMbijHBl0+0s=;
        b=b02U97H2bsTafMXrQ6zC1Cn9QfpO6tmNNeqQZYcgVzG940o/Fs8K2wwFlos/XBCfVf
         Sf20Eo50IdLEmfBuw18h9hEaShtyX987FqeYTgmVVlJfMpfPfm9gxXPBXh/LSGqQjd2N
         nFsm3yOiR1C5oxfCA5Lt2PCugpZAJDXu7xsYLn2cEH/xhF3psUkTZ5n12jTV4E9d5PMj
         7q1T18xIsCTj5XlBwET39GsZRF7BQcEtyZSoYnntICUowX3qDSmPr/A2/qs4dl3xXPW5
         M4GWkny5KMnjXA7Uz5MpHUlJW4Ga/KbzBdcwJpqBgiZ896urDATYw5m/CVEbeiSrwOXU
         d8lA==
X-Gm-Message-State: AOJu0YyROOxvM02dLOWeFNGrgKBhAvYUDegG7WZpzmLK9xoHUaNx7Hff
	eYgyVPMppiNLv3aj/SQTjg20j0dYtj+DgvEjcdGDvHEHc689sVofDluT4JL8mmgBdNNoKQtIYzq
	hNqCF
X-Gm-Gg: ASbGnctGlxW92LCb+SiYMRFKHDglCnZ8QioY1YwU/jm1+Szz8diECM0vZI4cQPt+sLp
	bcshmTGq0L+1CCxsWv47x/Q+UiA+pS7KW/Z6WINytPMZCxk1cdumbQhXquN9id7IHy2cwyV8+u4
	nzWX5nmN65cYlUgcTOOihmY6m3mJtDEE2Hs6CdRC6POPegw7kOFp5+4fsy0Auo86P8VuCpH5XtQ
	pi67vC+JIv5FzKYpKMz0v8hHjkITl4aIGmqCYFrWF0FOqXqLN1HGldQaUcs6kYBdWdJQpml9UQn
	PzS6kc4lJg+r8jGLjnf7Lu/fiMOFsNGE7TPdwif8oRgAIu8PHsfgkNypAJ7V/PlD6cDia2RVUlF
	T+IymQRiWw3+wHxFt5DevhKYkotCG66eLuwc=
X-Google-Smtp-Source: AGHT+IGN+fMnV76KlrqchGBkpcg5Z6KymEIXo7HbqL/iYCuu0b1OCDuVUdfNQk1vt7MBMfV1md9AHg==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:ed10:c14 with SMTP id ffacd0b85a97d-3a55869b2b9mr3406097f8f.14.1749662569421;
        Wed, 11 Jun 2025 10:22:49 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH 0/8] pdx: introduce a new compression algorithm
Date: Wed, 11 Jun 2025 19:16:28 +0200
Message-ID: <20250611171636.5674-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series implements a new PDX compression algorithm to cope with the
spare memory maps found on the Intel Sapphire/Granite Rapids.

Patches 1 to 5 prepare the existing code to make it easier to introduce
a new PDX compression, including generalizing the initialization and
setup functions so they are both usable by the existing and the new
compression.

Patches 6 to 8 introduce the new compression, with patch 6 adding most
of the code.  Such patch also adds a unit test to exercise the logic
easily in user-space.  The new compression is only enabled by default on
x86, other architectures are left with their previous defaults.

Thanks, Roger.

Roger Pau Monne (8):
  x86/pdx: simplify calculation of domain struct allocation boundary
  pdx: introduce function to calculate max PFN based on PDX compression
  kconfig: turn PDX compression into a choice
  pdx: provide a unified set of unit functions
  pdx: allow optimizing PDX conversion helpers
  pdx: introduce a new compression algorithm based on offsets between
    regions
  pdx: introduce translation helpers for offset compression
  pdx: introduce a command line option for offset compression

 CHANGELOG.md                           |   3 +
 docs/misc/xen-command-line.pandoc      |  22 ++
 tools/tests/Makefile                   |   1 +
 tools/tests/pdx/.gitignore             |   3 +
 tools/tests/pdx/Makefile               |  54 ++++
 tools/tests/pdx/harness.h              |  73 +++++
 tools/tests/pdx/test-pdx-offset.c      | 320 +++++++++++++++++++
 xen/arch/arm/setup.c                   |  34 +-
 xen/arch/x86/domain.c                  |  35 +--
 xen/arch/x86/include/asm/cpufeatures.h |   1 +
 xen/arch/x86/setup.c                   |  19 +-
 xen/arch/x86/srat.c                    |  30 +-
 xen/common/Kconfig                     |  25 +-
 xen/common/pdx.c                       | 419 +++++++++++++++++++++++--
 xen/include/xen/pdx.h                  | 216 +++++++++----
 15 files changed, 1092 insertions(+), 163 deletions(-)
 create mode 100644 tools/tests/pdx/.gitignore
 create mode 100644 tools/tests/pdx/Makefile
 create mode 100644 tools/tests/pdx/harness.h
 create mode 100644 tools/tests/pdx/test-pdx-offset.c

-- 
2.49.0


