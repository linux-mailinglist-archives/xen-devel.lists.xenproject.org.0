Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0227568A1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564727.882375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh2-0002BB-HY; Mon, 17 Jul 2023 16:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564727.882375; Mon, 17 Jul 2023 16:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh2-00028O-Er; Mon, 17 Jul 2023 16:03:24 +0000
Received: by outflank-mailman (input) for mailman id 564727;
 Mon, 17 Jul 2023 16:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcy7=DD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLQh1-00027B-3e
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:03:23 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 743676f2-24bb-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 18:03:22 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so6718380a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 09:03:22 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 bo28-20020a0564020b3c00b0051df5bd1cd8sm10099050edb.65.2023.07.17.09.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 09:03:21 -0700 (PDT)
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
X-Inumbo-ID: 743676f2-24bb-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689609802; x=1692201802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=To9L4rpbWvu0aRYnNzcVhBGhI7VK7vgBTkVqxpmKYmw=;
        b=K/hSzCf4hIlZpf3r+4F6dG6oFM55W7NG1aIMlJIv7MV/h1/NYLLwcByEK6/dNPJWs+
         A2GTmaai4tuY0qA//bFSQePeK9rhRXV2kWaldtIwFQ/6mVeUw6ahKpt7U0N24gZFn3OW
         2QdVE/lm+Y304a7/+dl89Hd3zSO///BsGXBl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609802; x=1692201802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=To9L4rpbWvu0aRYnNzcVhBGhI7VK7vgBTkVqxpmKYmw=;
        b=RzwZ+O1K+mDVb55ZeltCNF3s6QrCxECJ6ZhhMnBu7y70nbjJ4np2ClBuC8R7JyVKS/
         PrpOUAvexv+IcDcw5AZibJtHp5v6Z1dPc0YDcR86tNT9AyBB0eb/SeixaWeIEJmrtUgn
         g4ED7+dxdeAXg8xuTI8zPwjowHvVGeazUKjBhXKZ2r+R/BJA9iw3wBWZULf63UuboE1K
         GkIobf8Zb+PxvOhqIE3shOtIPL4MraH2TPeSisaVWicifdp7gbIoeXBZZA0IgXyJMw0M
         I0si0oO7R/gBhG2mHWjWO3C7W80hrcurO4WMoOZnP6pFYTAeggnrZDo4+LOmLsjZhNMv
         JfKw==
X-Gm-Message-State: ABy/qLbXIcboSNDnBb3qCIBleSVHljXfTh3DqXHF72xIzBTWncILU8oD
	6alAPesXioBYWfSm6PfKBYWdIHPMo2scOGsvocg=
X-Google-Smtp-Source: APBJJlGeLACk9RQWJyLIcChGa01ydrn8+ODAdtstcXaohJ2FGMttmM0HwFg8pRybA33B7sZhJtKcuw==
X-Received: by 2002:aa7:ca56:0:b0:521:788f:66ff with SMTP id j22-20020aa7ca56000000b00521788f66ffmr6579861edt.23.1689609801700;
        Mon, 17 Jul 2023 09:03:21 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/8] Make PDX compression optional
Date: Mon, 17 Jul 2023 17:03:10 +0100
Message-Id: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
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

Patch 1 documents the current general understanding of the pdx concept and
        pdx compression in particular
Patch 2 makes a clarification in ARM code to explain some discrepancies
        between the concept of "directmap" in arm32 and arm64 relevant to
        this series (i.e: why this series doesn't touch arm32 in directmap
        accesses).
Patch 3 Marks the pdx compression globals as ro_after_init
Patch 4 Gets rid of the current CONFIG_HAS_PDX option because (a) the name
        is misleading (b) cannot be removed in its current form.
Patch 5 Moves hard-coded compression-related logic to helper functions
Patch 6 Refactors all instances of regions being validated for pdx
        compression conformance so it's done through a helper
Patch 7 Non-functional reorder in order to simplify the patch 8 diff
Patch 8 Adds new Kconfig option to compile out PDX compression

Alejandro Vallejo (8):
  mm/pdx: Add comments throughout the codebase for pdx
  arm/mm: Document the differences between arm32 and arm64 directmaps
  pdx: Mark pdx hole description globals readonly after boot
  build: Remove CONFIG_HAS_PDX
  mm: Factor out the pdx compression logic in ma/va converters
  mm/pdx: Standardize region validation wrt pdx compression
  pdx: Reorder pdx.[ch]
  pdx: Add CONFIG_HAS_PDX_COMPRESSION as a Kconfig option

 xen/arch/arm/Kconfig                   |   1 -
 xen/arch/arm/include/asm/mm.h          |  30 ++-
 xen/arch/x86/Kconfig                   |   1 -
 xen/arch/x86/domain.c                  |  19 +-
 xen/arch/x86/include/asm/x86_64/page.h |  28 ++-
 xen/arch/x86/x86_64/mm.c               |   2 +-
 xen/common/Kconfig                     |  13 +-
 xen/common/Makefile                    |   2 +-
 xen/common/efi/boot.c                  |   6 +-
 xen/common/pdx.c                       | 120 +++++++++---
 xen/include/xen/mm.h                   |  11 ++
 xen/include/xen/pdx.h                  | 241 +++++++++++++++++++++++--
 12 files changed, 405 insertions(+), 69 deletions(-)

-- 
2.34.1


