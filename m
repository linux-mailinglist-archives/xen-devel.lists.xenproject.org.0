Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB97766618
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 10:00:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571347.894965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINb-0006GB-87; Fri, 28 Jul 2023 07:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571347.894965; Fri, 28 Jul 2023 07:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINb-0006EV-4v; Fri, 28 Jul 2023 07:59:19 +0000
Received: by outflank-mailman (input) for mailman id 571347;
 Fri, 28 Jul 2023 07:59:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gb0=DO=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qPINZ-0006Dw-6z
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 07:59:17 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a58da7a3-2d1c-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 09:59:15 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe1489ced6so3155838e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 00:59:15 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfdd82000000b0030e56a9ff25sm4089629wrl.31.2023.07.28.00.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 00:59:14 -0700 (PDT)
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
X-Inumbo-ID: a58da7a3-2d1c-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690531155; x=1691135955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ8GAGKVTdBJDiMCFf/cQuGt+MTjVyEKYvgM1SWGPZE=;
        b=Nv7FXAUPPBPzRL/8QSIT6HqywGoeaBOOkC9QTiaNNfp+HW0DrCqYwEZt6QSurW5ZLF
         9NAVpRaCi01CdXk5fO1cc7OcZKorRxxhGT18X3h/GkxwkJmSl2gBuq53A7IiYxhvI3sy
         oZWLAN/g4fuDQ4d9+VdvoQotRRn2XPx51gVb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690531155; x=1691135955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQ8GAGKVTdBJDiMCFf/cQuGt+MTjVyEKYvgM1SWGPZE=;
        b=FFD1gpBwFK3trw9DLYKv2ARlSoeOiMrBHqYd9xhahI/qVDuYWa7ioYuUMrkYiBfBZK
         azakzXbeh9zV/mjUUVFomEMgJiBwAAwtc/B5kpZ8rLkiQf4UKCwaEgGyfowCfzuor4bC
         3nLnq1roq4S04cbfcn04nudpgssARIf9XbIyKYOBhU/FUB1b0dS5Kzmzd7JP17srcXXh
         OwDtwzYt1R4OYN8dqTXlRW6v5V1Tw19fEX/yru6dAcyYuMUIRHVWGvgGMXKDgNCBH5O7
         umeTNDJeN4gwQcCxXpVE/SnBDa01jfrIO0jW3BVcr/3O/ckUhUIYTEdd/Nw+nis1/Ewt
         pw0Q==
X-Gm-Message-State: ABy/qLbGduN67ywbhBeOcMmFlsBvC1ZtG97ciL2CHq1XkIojEEXLvHQu
	E+1nHZYCQ4I6FGjBWDSWXBLD0NCA40I+onoK14EEqQ==
X-Google-Smtp-Source: APBJJlH2Ebt+A2ZEoAjBY0a03tkMgSZlz6iZkafMDp1YMn/rdIVeRT0CDp6QTfDSyFnITDqcY335SA==
X-Received: by 2002:a05:6512:ad3:b0:4f8:7781:9870 with SMTP id n19-20020a0565120ad300b004f877819870mr1377566lfu.60.1690531154790;
        Fri, 28 Jul 2023 00:59:14 -0700 (PDT)
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
Subject: [PATCH v2 0/5] Make PDX compression optional
Date: Fri, 28 Jul 2023 08:58:58 +0100
Message-Id: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
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

Patch 1 makes a clarification in ARM code to explain some discrepancies
        between the concept of "directmap" in arm32 and arm64 relevant to
        this series (i.e: why this series doesn't touch arm32 in directmap
        accesses).
Patch 2 Moves hard-coded compression-related logic to helper functions
Patch 3 Refactors all instances of regions being validated for pdx
        compression conformance so it's done through a helper
Patch 4 Non-functional reorder in order to simplify the patch 8 diff
Patch 5 Adds new Kconfig option to compile out PDX compression and removes
        the old CONFIG_HAS_PDX, as it was non removable

Already committed:

v1/patch 1 documents the current general understanding of the pdx concept and
           pdx compression in particular
v1/patch 3 Marks the pdx compression globals as ro_after_init

Alejandro Vallejo (5):
  arm/mm: Document the differences between arm32 and arm64 directmaps
  mm: Factor out the pdx compression logic in ma/va converters
  mm/pdx: Standardize region validation wrt pdx compression
  pdx: Reorder pdx.[ch]
  pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common Kconfig option

 xen/arch/arm/Kconfig                   |   1 -
 xen/arch/arm/include/asm/mm.h          |  29 +++++-
 xen/arch/x86/Kconfig                   |   1 -
 xen/arch/x86/domain.c                  |  19 ++--
 xen/arch/x86/include/asm/x86_64/page.h |  28 +++---
 xen/arch/x86/x86_64/mm.c               |   7 +-
 xen/common/Kconfig                     |  13 ++-
 xen/common/Makefile                    |   2 +-
 xen/common/efi/boot.c                  |  13 ++-
 xen/common/pdx.c                       |  75 +++++++++------
 xen/include/xen/pdx.h                  | 126 +++++++++++++++++++------
 11 files changed, 218 insertions(+), 96 deletions(-)

-- 
2.34.1


