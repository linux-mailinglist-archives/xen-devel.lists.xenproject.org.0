Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B800BAE19B1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 13:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020846.1396984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZen-0005v2-Fh; Fri, 20 Jun 2025 11:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020846.1396984; Fri, 20 Jun 2025 11:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZen-0005n7-AG; Fri, 20 Jun 2025 11:11:41 +0000
Received: by outflank-mailman (input) for mailman id 1020846;
 Fri, 20 Jun 2025 11:11:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSZem-0005XW-HP
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 11:11:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53db68ae-4dc7-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 13:11:35 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so14076945e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 04:11:35 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4535eac92c6sm55738645e9.22.2025.06.20.04.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 04:11:33 -0700 (PDT)
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
X-Inumbo-ID: 53db68ae-4dc7-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750417894; x=1751022694; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbSr8BZq+3XZdqzq/joJODJPefZlSpOFkrBuMBBZYHg=;
        b=pWH57ykMGbHy5o5r+biYW4+ot4hV0ifkG/0yGuRpaRJvMkU5Oa6GzuKGnDsuF85BPS
         smLTrUTNb5Muz2oZ6Ayq+MaPQ48r3rRdIEs/JWd2u+ng+LTz2qYy/0ieHhsupI32/eHR
         H44KG17gcPcBHj6vFi+V9jZMtsmhgrDx5HjvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417894; x=1751022694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbSr8BZq+3XZdqzq/joJODJPefZlSpOFkrBuMBBZYHg=;
        b=s/zbPrldpVSl6JYsvEDa1jpsikxxe30Pk8uM7h21PYhM0+IivluMI7OixU+c+wjbtC
         t83MmEnuZ2wtmOrLC7jr/z0grdGPCEEmCyGSoKFnjuUAt5I7hn3SJ+Y6cn7oWo4Lrl1y
         lp9DeLeUVAgzCLWic85rYLTrbdeEGUu9hIRrF4vd6OB+GTIPVXOgNkkC5i+3a5CWKiVr
         w+ppYGUepkHIu9TRCa27P+qedjD23MfljcR6CPjME4ru7qTEm25Ua2Udt5WprPvgasS9
         y8Q52+g4kI1Nd3ycCavA/GOWxSOmSbXSkU4s8swmBf/nA2BTusMv7k22DBz+9f9rUIRZ
         gw+Q==
X-Gm-Message-State: AOJu0Yw2dshc7f3VFXbnktmO73vSuRezlGfsEOXTtgfxHnFXJut7Q4RP
	SYqc9wLjCJbxPnb/g7WRQSU1gxBIIjcZJKgsU0gLI2/kcBsn1j8E2Carywh0NOeTXKlueGKzQ0x
	zFWTj
X-Gm-Gg: ASbGnctPwvHVp6KnlETfJm4xWjXdDxP68hxkYFwb0vXFIae23RllDfB9Pbg3RN/Zjp7
	10bwEBUYUU3C3hqjIVr6FrUsGE35BvfBv8GRD9GtNTlG5fCGBCB8uMtU3fyC+3Fyp1Q7gyqn0VA
	fuWgIhEWrEcxJ9fGkdEtL7quhsrk0mnyeITk9ydvpdWCAqI77kXBiKa8f/xT8x0iedxqh7+2SiV
	dQzITjxUEJZ0AiUKRlY/uQ9OH+Zo0eSNKMLTPCFZ7fLkoyFJ+P/Eoty/DKIVG8kzzlDXjs8xrch
	I+WA/WuN1lLI2jElsU6CJB/1yWLXy80HJ+Zau6lSecMh88+bKpLT2ecp0XLSFt7Hj/8SGPuKeis
	qKenMNz/Q9FxT7kDFoT55jL0wv5C/EQ==
X-Google-Smtp-Source: AGHT+IHlaMyVJD2ny8QeL6lFPDknqP7u5lBmZibHUGYT5RKLYCVOrOnAE62aoEM7W+lLZbpUT5WQ+Q==
X-Received: by 2002:a05:600c:840f:b0:442:dc6f:7a21 with SMTP id 5b1f17b1804b1-453653cf3b8mr21225735e9.3.1750417893931;
        Fri, 20 Jun 2025 04:11:33 -0700 (PDT)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 0/8] pdx: introduce a new compression algorithm
Date: Fri, 20 Jun 2025 13:11:22 +0200
Message-ID: <20250620111130.29057-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series implements a new PDX compression algorithm to cope with the
spare memory maps found on the Intel Sapphire/Granite Rapids.

Patches 1 to 7 prepare the existing code to make it easier to introduce
a new PDX compression, including generalizing the initialization and
setup functions and adding a unit test for PDX compression.

Patch 8 introduce the new compression.  The new compression is only
enabled by default on x86, other architectures are left with their
previous defaults.

Thanks, Roger.

Roger Pau Monne (8):
  x86/pdx: simplify calculation of domain struct allocation boundary
  kconfig: turn PDX compression into a choice
  pdx: provide a unified set of unit functions
  pdx: introduce command line compression toggle
  pdx: allow per-arch optimization of PDX conversion helpers
  test/pdx: add PDX compression unit tests
  pdx: move some helpers in preparation for new compression
  pdx: introduce a new compression algorithm based on region offsets

 CHANGELOG.md                           |   3 +
 docs/misc/xen-command-line.pandoc      |   9 +
 tools/tests/Makefile                   |   1 +
 tools/tests/pdx/.gitignore             |   3 +
 tools/tests/pdx/Makefile               |  49 ++++
 tools/tests/pdx/harness.h              |  99 +++++++
 tools/tests/pdx/test-pdx.c             | 224 +++++++++++++++
 xen/arch/arm/include/asm/Makefile      |   1 +
 xen/arch/arm/setup.c                   |  34 +--
 xen/arch/ppc/include/asm/Makefile      |   1 +
 xen/arch/riscv/include/asm/Makefile    |   1 +
 xen/arch/x86/domain.c                  |  40 +--
 xen/arch/x86/include/asm/cpufeatures.h |   1 +
 xen/arch/x86/include/asm/pdx.h         |  75 +++++
 xen/arch/x86/srat.c                    |  30 +-
 xen/common/Kconfig                     |  37 ++-
 xen/common/pdx.c                       | 379 ++++++++++++++++++++++---
 xen/include/asm-generic/pdx.h          |  24 ++
 xen/include/xen/pdx.h                  | 201 +++++++++----
 19 files changed, 1056 insertions(+), 156 deletions(-)
 create mode 100644 tools/tests/pdx/.gitignore
 create mode 100644 tools/tests/pdx/Makefile
 create mode 100644 tools/tests/pdx/harness.h
 create mode 100644 tools/tests/pdx/test-pdx.c
 create mode 100644 xen/arch/x86/include/asm/pdx.h
 create mode 100644 xen/include/asm-generic/pdx.h

-- 
2.49.0


