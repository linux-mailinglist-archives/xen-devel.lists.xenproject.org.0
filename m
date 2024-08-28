Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017496345E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785163.1194570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQll-0006Fs-1e; Wed, 28 Aug 2024 22:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785163.1194570; Wed, 28 Aug 2024 22:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlk-0006EK-Rd; Wed, 28 Aug 2024 22:04:00 +0000
Received: by outflank-mailman (input) for mailman id 785163;
 Wed, 28 Aug 2024 22:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQlj-0006E0-AZ
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:03:59 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6be75a87-6589-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 00:03:57 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8683dc3b17so470202666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:03:57 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:03:54 -0700 (PDT)
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
X-Inumbo-ID: 6be75a87-6589-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882636; x=1725487436; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YY7MdvuXI6KKD8+0pPI2HR0N6tLhBf9qtdXr9xTRqOc=;
        b=JVg+js8fhpXq0R7yHZOGyCwdSnLv9LB32l/WDbC7v8aVXiq0IULmFHNOigMaQs5Tod
         mDwQJj4zLkSzSDyZr4/JwkWleJmhXwSb8IGpuFQ2aAAzCeEsolDY+bFTqWuJinTyEj4I
         9v455mIuarMUdSyp8xBJQM7+hA3rKaLmI4o/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882636; x=1725487436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YY7MdvuXI6KKD8+0pPI2HR0N6tLhBf9qtdXr9xTRqOc=;
        b=PSLmzp43+k0Zqb6domwnBNSO0ikPtOltWH6IZm5X0kweB+fAoKoXJYKC2j1iosKire
         GowEPdyu2rLymzZJb43RZurgTzwhVgw40Jb5UxcDsh5IXZvvZYnv+c6Oj8xjc/am0KWA
         KhN0t8qULdft5L9opgtURQVoV+0ANbROvOzBSGp9WRHyfI9EuJbRwOEW2ByRYR27Mh2v
         cOYcZ23D1mDSELOtCqVTj4hGLqoOfqCOGKz3AAp+PoYd2yrQ1mp40+dOS7hNp8GTVgkN
         FujcbcsHn/9whJowCFLeYnmOW2MyoTFvOW5Sj4k0Zw/FcBNKPB/ED0FMe3jPecbIJ0/E
         VR3g==
X-Gm-Message-State: AOJu0YxI4vfYxH9CRLcDQ6ClcTkCmoYjocyusHwqRed6up2zsieszeR8
	PGmIT6dL1RAXcO67yarzZs6BOgZz54H2YmDaNk8p7tXzjzTpIb6SSBi/WBpIefNsnJsNChWs1qf
	j
X-Google-Smtp-Source: AGHT+IEuHLfT8SF7T9SoGHK35Ew10y9xfRr96n0xd9gQtPh6jurJbr0jjpik5vI6lideD3kIfObDjw==
X-Received: by 2002:a05:6402:90c:b0:5a1:2ce9:f416 with SMTP id 4fb4d7f45d1cf-5c21eda0c2bmr824009a12.37.1724882635259;
        Wed, 28 Aug 2024 15:03:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 00/11] xen/bitops: hweight() cleanup/improvements
Date: Wed, 28 Aug 2024 23:03:40 +0100
Message-Id: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next phase of bitops cleanup.  This series:

 1) Untangles the mess around hweight()
 2) Removes some unwise uses of hweight()
 3) Makes it work transparently for RISC-V
 4) Use the POPCNT instruction on x86 when available

See individual patches for v2 changes.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1431232348
https://cirrus-ci.com/build/6014616877137920

Andrew Cooper (11):
  xen/compiler: Rename __attribute_const__ to attr_const
  xen/bitops: Switch from __pure to attr_const
  xen/bitops: Reinstate the please tidy message
  xen/bitops: Introduce a multiple_bits_set() helper
  xen/bitops: Convert 'hweight(x) > 1' to new multiple_bits_set()
  xen/bitops: Drop the remnants of hweight{8,16}()
  xen/bitops: Introduce generic_hweightl() and hweightl()
  xen/bitops: Drop hweight_long() and use hweightl()
  xen/bitops: Implement hweight32() in terms of hweightl()
  xen/bitops: Implement hweight64() in terms of hweight{l,32}()
  x86/bitops: Use the POPCNT instruction when available

 xen/arch/arm/include/asm/arm64/cpufeature.h |  12 +-
 xen/arch/arm/include/asm/bitops.h           |  11 --
 xen/arch/ppc/include/asm/bitops.h           |  11 +-
 xen/arch/x86/cpu/vpmu.c                     |   2 +-
 xen/arch/x86/hvm/vlapic.c                   |  10 +-
 xen/arch/x86/include/asm/bitops.h           |  32 ++++--
 xen/arch/x86/include/asm/byteorder.h        |   4 +-
 xen/arch/x86/include/asm/endbr.h            |   4 +-
 xen/common/bitmap.c                         |   4 +-
 xen/common/bitops.c                         |  40 +++++++
 xen/common/numa.c                           |   2 +-
 xen/include/xen/bitops.h                    | 118 +++++++++-----------
 xen/include/xen/byteorder/swab.h            |   6 +-
 xen/include/xen/compiler.h                  |   2 +-
 xen/include/xen/self-tests.h                |  10 +-
 xen/lib/Makefile                            |   2 +
 xen/lib/generic-hweightl.c                  |  49 ++++++++
 xen/lib/x86-generic-hweightl.c              |  69 ++++++++++++
 18 files changed, 266 insertions(+), 122 deletions(-)
 create mode 100644 xen/lib/generic-hweightl.c
 create mode 100644 xen/lib/x86-generic-hweightl.c

-- 
2.39.2


