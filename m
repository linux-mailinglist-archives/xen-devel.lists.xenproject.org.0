Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFDCB10883
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055719.1424032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl0-0000wV-0a; Thu, 24 Jul 2025 11:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055719.1424032; Thu, 24 Jul 2025 11:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetkz-0000v7-TU; Thu, 24 Jul 2025 11:05:01 +0000
Received: by outflank-mailman (input) for mailman id 1055719;
 Thu, 24 Jul 2025 11:05:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uetkx-0000v1-UM
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:04:59 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09f7104d-687e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 13:04:59 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45622a1829eso2724335e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:04:59 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fc6d2e8sm1811011f8f.20.2025.07.24.04.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:04:57 -0700 (PDT)
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
X-Inumbo-ID: 09f7104d-687e-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753355098; x=1753959898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b5j4tu0rZfHpp4CiqxyWru5pRU2/BPrCqYPZCtzm1+s=;
        b=rkmhudc/sqn4tMKx8XcQNmPzh0oSguWp7nsNTHtNLW4BFserPJriCEhsN+IPXiZ7yO
         LxW9oUJku5WusM31walQ5diy7tXfNs9Sc9NDaIKEzAb99o9iRlUyoOplBUnm12vKgZl/
         eIQog9+0gEa/6oRlFCEq9lJuFBCPf3B/KaMMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355098; x=1753959898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5j4tu0rZfHpp4CiqxyWru5pRU2/BPrCqYPZCtzm1+s=;
        b=Terx9xLrsUGEIUFEjeF1obkoemC0Ht/Hm+GRUcWABj8DOWyeT5k0t1kBbvHFzmtvm1
         akyGxVw81Kj8YX33wf7yhV2nQWk786mzEsV+C/oHnEuGVwUYphGjy3+hnMYmaxItBI9M
         HvASIznTKTJ/2QfIsa6w1FQMfP+7uI5f/zLNKDAV0KPSkdnG1l3wCzIbdOasVMvT5Wgt
         tbJv8qJczjGiAp4qYVPg+LdYNmmIbumCTAeH/naVNPDFW0eTOS/Mtszrtk1iHBbl92DU
         FBFL9Er8Qo8PaP/jbu8oS9S3Bztb+XoeZT60BvrJjPQYBP6a/lAsOCcgjtew8pDbfkVG
         8MzA==
X-Gm-Message-State: AOJu0YyBDgTjwR8I8dD7p8JKc74A0qjMtq81Yg7b0oq24RJetpekfXKX
	rAJIScC0nC9kgWHxeFofYcqz2T4xEdpGX2o/smFu9pzF4LdguDO622ItRQ3TBQyMIGyU2RlZ+cL
	jWTmt
X-Gm-Gg: ASbGnct1VbGvjs469O8MUAs/SH3376MCig88U4lMFHeHfwj/yLr91a3PTE5tDTwqwZx
	6m/AuLej3uK2l3IKpK4b88k5Am/1olC4DQEFIjPOAVwq1EzF+YAoeUGDIgJDSqLuI4Xl8oZu7xp
	HnbA76c4aQYz1vNkFp7Crt0/KBfQuC8Y3H+uYkVPwjG0Lr1dtvoa5PxJlR4e5cxsivKSKm8WI15
	lGPKcBfQF/k1kZq5sxxMcQnG3mOs+K/jghNoSHzh405njaGPC/HUqIcMi2VsyIFbmkWt/gXPsJV
	0bm78ijqDWvf/5jLvbBLBgqq8k7RPI7CFl7OdkY46BV+fcFQrmJEqgGgNl4tq9jw73od7XRLLrb
	QOVK36G5568lSKqCa/0upP7LjPRcO1bjKz0R+QtB7gf+Zfy8JEWRKo1DcdS15rTkOjhn3MIvqtV
	1z
X-Google-Smtp-Source: AGHT+IHbdZW6UQ38D9aSTwYc1aftm39FwhbWXccn3dxhxdPFaOZy9A+y5SwuE6szGKPUaWDPl1qFAg==
X-Received: by 2002:a05:600c:4e4a:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-45868d4c3edmr49118655e9.22.1753355098169;
        Thu, 24 Jul 2025 04:04:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 0/8] pdx: introduce a new compression algorithm
Date: Thu, 24 Jul 2025 13:04:08 +0200
Message-ID: <20250724110416.2081-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series implements a new PDX compression algorithm to cope with the
spare memory maps found on the Intel Sapphire/Granite Rapids.

Patches 1 to 6 prepare the existing code to make it easier to introduce
a new PDX compression, including generalizing the initialization and
setup functions and adding a unit test for PDX compression.

Patch 7 introduce the new compression.  The new compression is only
enabled by default on x86, other architectures are left with their
previous defaults.

Finally patch 8 optimizes one x86 loop that was iterating over pfn
ranges to instead use pdx values.

Thanks, Roger.

Roger Pau Monne (8):
  kconfig: turn PDX compression into a choice
  pdx: provide a unified set of unit functions
  pdx: introduce command line compression toggle
  pdx: allow per-arch optimization of PDX conversion helpers
  test/pdx: add PDX compression unit tests
  pdx: move some helpers in preparation for new compression
  pdx: introduce a new compression algorithm based on region offsets
  x86/mm: adjust loop in arch_init_memory() to iterate over the PDX
    space

 CHANGELOG.md                           |   3 +
 docs/misc/xen-command-line.pandoc      |   9 +
 tools/tests/Makefile                   |   1 +
 tools/tests/pdx/.gitignore             |   3 +
 tools/tests/pdx/Makefile               |  50 +++
 tools/tests/pdx/harness.h              | 103 ++++++
 tools/tests/pdx/test-pdx.c             | 271 ++++++++++++++++
 xen/arch/arm/include/asm/Makefile      |   1 +
 xen/arch/arm/setup.c                   |  36 +--
 xen/arch/ppc/include/asm/Makefile      |   1 +
 xen/arch/riscv/include/asm/Makefile    |   1 +
 xen/arch/x86/include/asm/cpufeatures.h |   1 +
 xen/arch/x86/include/asm/pdx.h         |  75 +++++
 xen/arch/x86/mm.c                      |  11 +-
 xen/arch/x86/srat.c                    |  30 +-
 xen/common/Kconfig                     |  37 ++-
 xen/common/pdx.c                       | 429 +++++++++++++++++++++++--
 xen/include/asm-generic/pdx.h          |  24 ++
 xen/include/xen/pdx.h                  | 202 ++++++++----
 19 files changed, 1157 insertions(+), 131 deletions(-)
 create mode 100644 tools/tests/pdx/.gitignore
 create mode 100644 tools/tests/pdx/Makefile
 create mode 100644 tools/tests/pdx/harness.h
 create mode 100644 tools/tests/pdx/test-pdx.c
 create mode 100644 xen/arch/x86/include/asm/pdx.h
 create mode 100644 xen/include/asm-generic/pdx.h

-- 
2.49.0


