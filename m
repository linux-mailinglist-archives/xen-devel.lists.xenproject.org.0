Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456EDA5F9F8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912505.1318746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskXt-0007w9-Er; Thu, 13 Mar 2025 15:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912505.1318746; Thu, 13 Mar 2025 15:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskXt-0007tf-Aj; Thu, 13 Mar 2025 15:32:29 +0000
Received: by outflank-mailman (input) for mailman id 912505;
 Thu, 13 Mar 2025 15:32:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tskXs-0007tP-5X
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:32:28 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea72b0a-0020-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:32:27 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e56b229d60so4149547a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:32:27 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e816968cd8sm820441a12.18.2025.03.13.08.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:32:26 -0700 (PDT)
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
X-Inumbo-ID: 5ea72b0a-0020-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741879947; x=1742484747; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TIi4cok7s5N2w3ZXf4UEucaUUsE5Rcg9ljp/iK/02Ok=;
        b=sx1QSO5wt3WsPAKF4CaczyXzC4xrp4ilCYalK+xUrY1+c101av63+8jwAOCOrima2m
         Mm6rr21BOgEqLV9KO5EMGyM5Ph1boLzTsCnWp7c52uxAzrx/7Tyg7u6kqrm3HJJmcZlm
         Tavr/tSqzfSIrZH+DW33VD96w60UlYGZ0h6ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879947; x=1742484747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIi4cok7s5N2w3ZXf4UEucaUUsE5Rcg9ljp/iK/02Ok=;
        b=wd8Xgpcq77GLQ6jkMT2BsDKXvH3iQf20128oJpfYmRInts9fG9Kz4cIwAce3bUNUUc
         lp5emLDX7skW3m+k0mqL5331aEEjaVryPuv8CWBFeNX4i/ByVagPEQovLH8FvRat/l0l
         774Cn+wys42senS0nf4oCPkEl5qtQh3ZVgGPgwrKyFG5DgyJvNOqY10iCa7919uaS/ow
         ORXpYJ/WicdkSWFh6wtnJCOsHhhg2rFOscApB0ntciF+vwWxvTFQrJvq4m6FT44a1OuG
         jCh56PkMiqFB89HO9ePs//Po48Hsz2wxTiyBYbWMvK0WzA8VkNXONHLVzdUVtASvgNeF
         IkZA==
X-Gm-Message-State: AOJu0YyH6PQBh/KhGyzHsRwoBHNjoJ5Rjwx1bSYqk8OI/S6mzfAG9rz3
	CCeswPGa3gkz7RqAzkVcJr4Ik+iVkCYX0CJVdkOv1ONOPBc3atmU0+pFytxttYPwFaQc7snLZkT
	k
X-Gm-Gg: ASbGnctcPRSQb1wNoFsU9vRhL0gkLxI4BGzMvJKrZzbJ1tBBbW8AVRM/btdyeO647hL
	tjZYcSf0EOC/EJrKU025RnprSuCKClfLPQE9GLcRfjVIVmze27QRe6NJZ4CzozsWExclEOmgiKY
	Y9fLDneYgbwO8REccxcQszD53gCGDHPG2VgMXyhoz7N+lkgJs20dt0LeqXh5ygvN8evgkdu5KFJ
	6DOBjsd9reVuqTMU6mesVNf9GiZGxmwV60IKZqHE43PCokBUN54l4DG5H6Z1cMqEOb9ainvI3hj
	3drH4tpTXosFaEJ+/BzczWPPWLRHiWDzenAzdfAVAxTlc+QvBw==
X-Google-Smtp-Source: AGHT+IHgfVeq3yBRo6Bqwg1lnbR26l9FzWAxjB5axSGBekPFiJ6JljFWE2Qfoy/8t7lULOx6T1mjTA==
X-Received: by 2002:a05:6402:26cc:b0:5e4:a1e8:3ef1 with SMTP id 4fb4d7f45d1cf-5e814e73895mr3446889a12.9.1741879946803;
        Thu, 13 Mar 2025 08:32:26 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 0/7] x86/ubsan: fix ubsan on clang + code fixes
Date: Thu, 13 Mar 2025 16:30:22 +0100
Message-ID: <20250313153029.93347-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This started as a series to fix UBSAN when using clang, and the first 2
patches do fix that.  Patch 3 fix an issue when using UBSAN on gcc 12.
Patch 4 improves the reporting of clang UB pointer arithmetics.

Finally patches 5 and 6 fix bugs in the code highlighted by the clang UB
pointer arithmetic detection: offset additions to NULL pointers and too
early usage of ioremap_wc().

Patch 7 was the original goal of the series: be able to enable UBSAN for
randconfig.

Thanks, Roger.

Roger Pau Monne (7):
  xen/ubsan: provide helper for clang's -fsanitize=function
  x86/wait: prevent duplicated assembly labels
  x86/dom0: placate GCC 12 compile-time errors with UBSAN and PVH_GUEST
  xen/ubsan: expand pointer overflow message printing
  x86/ioremap: prevent additions against the NULL pointer
  x86/vga: fix mapping of the VGA text buffer
  kconfig/randconfig: enable UBSAN for randconfig

 xen/Kconfig                        |   4 ++
 xen/Kconfig.debug                  |   2 +-
 xen/arch/x86/boot/x86_64.S         |  10 ++-
 xen/arch/x86/dmi_scan.c            |   7 +-
 xen/arch/x86/include/asm/config.h  |   5 ++
 xen/arch/x86/mm.c                  |   6 +-
 xen/arch/x86/setup.c               |   2 +-
 xen/common/ubsan/ubsan.c           |  31 +++++++-
 xen/common/ubsan/ubsan.h           |   5 ++
 xen/common/wait.c                  | 111 ++++++++++++++++++++---------
 xen/drivers/video/vga.c            |  11 ++-
 xen/tools/kconfig/allrandom.config |   1 -
 12 files changed, 144 insertions(+), 51 deletions(-)

-- 
2.48.1


