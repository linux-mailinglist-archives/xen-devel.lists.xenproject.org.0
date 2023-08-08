Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DB2773A53
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579781.907897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMMC-0003Md-Qg; Tue, 08 Aug 2023 13:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579781.907897; Tue, 08 Aug 2023 13:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMMC-0003Kb-ND; Tue, 08 Aug 2023 13:02:40 +0000
Received: by outflank-mailman (input) for mailman id 579781;
 Tue, 08 Aug 2023 13:02:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTMMB-0003KL-Iy
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:02:39 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91e1864-35eb-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:02:37 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3159d5e409dso4036857f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 06:02:37 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y15-20020a5d4acf000000b003144b50034esm13567072wrs.110.2023.08.08.06.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 06:02:35 -0700 (PDT)
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
X-Inumbo-ID: d91e1864-35eb-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691499756; x=1692104556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ec8TrED3aRx0vHHIlwtP34Rk7pkdy6yKzk82FFTpTU=;
        b=A4j17B4b2jzh//qNnMqga7eCrHZs2Jw1UYsnbiWt3xd8XJcyYPydS0t9Qeu8vxa/qh
         czKVfN4U67bQfk6yCDBhLlocAoOMmyMcBY6S3N/l6gaXuQd63nr7yYRYrf6JIpHPE9Os
         XjvlZwT+EReBjnyQriH/3CfB31O0KxIfrLskU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691499756; x=1692104556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ec8TrED3aRx0vHHIlwtP34Rk7pkdy6yKzk82FFTpTU=;
        b=BbKmf1oAFYN4IkTpynm4XYNprmjzaei1srDHORL2S6yU0Lfv8f9yEJC62NuIrPci7l
         nzCTvgu/F4epy5EXYzEEXGVhJOD9wR9nSwgR0PDjeYd0gLVQ4v1d4PCTKXka+bLw7N2y
         YoHeu5iZ0IlbFIZ58I0MgjFgWMzYCa+4mGBtjgGwrchrdmUx4bc+HX9LitnoQ/NYSf4c
         D4J2KFyBUzhrrRCakLxN9LeJ518lJ35+CXVmVWQTZTxVve6w537PzdgwhNaB0QG3wUbc
         Lp6SryV+tAC5Rw0C3OZ09Njrn6Zr3Fi01Kfs1i2qgFbZO7by9CNV9dFq0YvcxU2wOGmt
         8okQ==
X-Gm-Message-State: AOJu0YyIuCK/KAP9uOKvh0bmvTi9Mjku+sxlJtiXlIbmz+QtLiWjm7/A
	kZfQqz6IUEAlHpHOB2Q3yDgK84sDamxtxxvTOLI=
X-Google-Smtp-Source: AGHT+IGuOT4NkLxsFpYqnMTa9TMufD+Y5HiN4gkF8fGCGqZ7rhUYxvJWxrng6ui1k+L/XEgE0fvhqQ==
X-Received: by 2002:adf:edcc:0:b0:314:314e:fdda with SMTP id v12-20020adfedcc000000b00314314efddamr8294825wro.23.1691499756436;
        Tue, 08 Aug 2023 06:02:36 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 0/4]  Make PDX compression optional
Date: Tue,  8 Aug 2023 14:02:16 +0100
Message-Id: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently there's a CONFIG_HAS_PDX Kconfig option, but it's impossible to
disable it because the whole codebase performs unconditional
compression/decompression operations on addresses. This has the
unfortunate side effect that systems without a need for compression still
have to pay the performance impact of juggling bits on every pfn<->pdx
conversion (this requires reading several global variables). This series
attempts to:

  * Leave the state of pdx and pdx compression documented
  * Factor out compression so it _can_ be removed through Kconfig
  * Make it so compression is disabled on x86 and enabled on both Aarch32
    and Aarch64 by default.

Series summary:

Patch 1 Moves hard-coded compression-related logic to helper functions
Patch 2 Refactors all instances of regions being validated for pdx
        compression conformance so it's done through a helper
Patch 3 Non-functional reorder in order to simplify the patch 8 diff
Patch 4 Adds new Kconfig option to compile out PDX compression and removes
        the old CONFIG_HAS_PDX, as it was non removable

Already committed:

v1/patch 1 documents the current general understanding of the pdx concept and
           pdx compression in particular
v1/patch 3 Marks the pdx compression globals as ro_after_init
v2/patch 1 Documents the differences between arm32 and arm64 directmaps

Alejandro Vallejo (4):
  mm: Factor out the pdx compression logic in ma/va converters
  mm/pdx: Standardize region validation wrt pdx compression
  pdx: Reorder pdx.[ch]
  pdx: Add CONFIG_PDX_COMPRESSION as a common Kconfig option

 xen/arch/arm/Kconfig                   |   1 -
 xen/arch/arm/include/asm/mm.h          |   3 +-
 xen/arch/x86/Kconfig                   |   1 -
 xen/arch/x86/domain.c                  |  19 ++--
 xen/arch/x86/include/asm/x86_64/page.h |  28 +++---
 xen/arch/x86/x86_64/mm.c               |   6 +-
 xen/common/Kconfig                     |  13 ++-
 xen/common/Makefile                    |   2 +-
 xen/common/efi/boot.c                  |  13 ++-
 xen/common/pdx.c                       |  76 +++++++++------
 xen/include/xen/pdx.h                  | 127 +++++++++++++++++++------
 11 files changed, 193 insertions(+), 96 deletions(-)

-- 
2.34.1


