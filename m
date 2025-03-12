Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05531A5E30D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910628.1317296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAr-0006gP-0B; Wed, 12 Mar 2025 17:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910628.1317296; Wed, 12 Mar 2025 17:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAq-0006eR-TQ; Wed, 12 Mar 2025 17:47:20 +0000
Received: by outflank-mailman (input) for mailman id 910628;
 Wed, 12 Mar 2025 17:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsQAp-0006eC-1j
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:47:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a33dbd2-ff6a-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 18:47:17 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso414075e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 10:47:17 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0b79sm27333805e9.36.2025.03.12.10.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:47:16 -0700 (PDT)
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
X-Inumbo-ID: 0a33dbd2-ff6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741801637; x=1742406437; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9ySLeeh1yjuxUkxJF2YCrGLWw2qs4BAiUK6ECM8mVI=;
        b=wHOnQSE6HIn2QZ4r2Q760hJVexwPJXuP3T6IgG+WRyM3B1xZbAxT7Dzn+Fe+hip8yq
         ROxxjdio8WRcH5R0r/Ug8EW9ndzWY23kcLT1yeHLzBqNqjdi1B4Tp/gDJxi5ujW4tRa6
         TWgaFiVJ0ZNBe8/MlE19fZs5y+xL2/W/oIt0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801637; x=1742406437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9ySLeeh1yjuxUkxJF2YCrGLWw2qs4BAiUK6ECM8mVI=;
        b=xLaxVePT2Q9snp+Q6DWrhiJd+j0oWpfjTrY5sgtLIYwx+CxZKRFrKS76Rw8BDRxSXZ
         Lkd0tJHgBLdfgfmZLrVBfICCvcBjQ5jFNGKliCT0ybE21hNS0XBxszq8eZdnd04UVecM
         +cvCrnPdj82BEV0godsoQEgavI7EiIVuzoDHDItct2d8Ef4tdJjDnfzyK+oHBUYS6oEj
         EErqOzHgUwC3s1uoGPdm2KtGCpIfzpcCONEKvlnlONtenQXNM+hmmE0UpQwU1D6j5v3Y
         bcU6zWmXwmo/927MBVZmt0yRY+crZB1HHo2UCE/Al7C5yprciX0CssRwlU8ZofqsJVT6
         AVbw==
X-Gm-Message-State: AOJu0YwBOLsbUicy8RZ1iSFOYl2Xy+fcbPUdtQyZEBFpl9JG58tWPtkU
	PHg/bSy+CH9eMaaFZQMGJMsIaQdBNwYMMTmbjkIZu1abgoT9GK5J5XlDWr+2On9bfeVWiCM/qh4
	U
X-Gm-Gg: ASbGncuzKrHVtQBuwxGAZblZIO6sToTVlw97J7DDG5rnitJQn/yJwB20F4pn/6LacIs
	lBl7h7prUUNbH1vPhrm98A1daK3auoKWs4c/0iQsj0Dcn0wvp4NgdEf/dNxcRS8Fg3bubvakyKf
	VhiGtuhUIjquMwtTMzQ+1JnFVKqeuPFEvxT4FJzfmAyrMzs4AE2C1HBBicGxCT8BwT4lq+S9DtG
	2lg6JAhlZR078txV7XU7NKyICcgIeqeaKXqbSQ/6zygLeeE4BkIeHYYF2Nf8yGAfUwbTSukoC1h
	CL/7Pqi+TBNM+lp8ZopX7HuOcOYzljT5LxWtJ1rt1LFBq701uqpVEWhVAdb5kXqMyX4HbKj7tza
	GWGqroQZx9NMp7jjczM3VbISLUKn2hrxBY7M=
X-Google-Smtp-Source: AGHT+IFpTaqMGcs3RCCxfIUzSMlD1wVR7Tf0H2EawjN+pSZ1/uvG+g6U61jzaIlddrU/C5NwMhyLOA==
X-Received: by 2002:a05:600c:5251:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-43d00942ff6mr100909555e9.13.1741801636750;
        Wed, 12 Mar 2025 10:47:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 0/8] xen: Untangle mm.h
Date: Wed, 12 Mar 2025 17:45:04 +0000
Message-Id: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This started out trying to fix one little TODO in x86's microcode loader, and
escalated somewhat...

tlb-clock.h is definitely not as clean as it could be, but it's an improvment
over today, and given how long it's taken to get this to compile, I'm not
looking to rewrite everything.

Andrew Cooper (8):
  xen/elfstructs: Include xen/types.h
  xen/livepatch: Fix include hierarchy
  xen: Sort includes
  xen/common: Split tlb-clock.h out of mm.h
  xen/arch: Strip out tlb-clock stubs for non-implementors
  xen/mm: Exclude flushtlb.h from mm.h for PPC and RISC-V
  xen/mm: Exclude flushtlb.h from mm.h for ARM
  xen/mm: Exclude flushtlb.h from mm.h for x86

 xen/arch/arm/arm32/livepatch.c            |  1 -
 xen/arch/arm/arm64/livepatch.c            |  1 -
 xen/arch/arm/include/asm/arm32/flushtlb.h |  2 +
 xen/arch/arm/include/asm/arm64/flushtlb.h |  2 +
 xen/arch/arm/include/asm/fixmap.h         |  2 +
 xen/arch/arm/include/asm/flushtlb.h       | 14 -------
 xen/arch/arm/include/asm/pmap.h           |  1 +
 xen/arch/arm/livepatch.c                  |  1 -
 xen/arch/arm/mmu/domain_page.c            |  2 +
 xen/arch/arm/mmu/pt.c                     |  1 +
 xen/arch/arm/mmu/setup.c                  |  3 +-
 xen/arch/arm/traps.c                      |  1 +
 xen/arch/ppc/include/asm/flushtlb.h       | 14 -------
 xen/arch/riscv/include/asm/flushtlb.h     | 14 -------
 xen/arch/x86/Kconfig                      |  1 +
 xen/arch/x86/alternative.c                | 13 +++---
 xen/arch/x86/cpu/microcode/amd.c          |  2 +-
 xen/arch/x86/livepatch.c                  | 10 ++---
 xen/common/Kconfig                        |  3 ++
 xen/common/memory.c                       |  5 ++-
 xen/common/page_alloc.c                   |  6 +--
 xen/include/xen/elfstructs.h              |  7 +++-
 xen/include/xen/livepatch.h               | 10 ++---
 xen/include/xen/livepatch_elf.h           |  1 -
 xen/include/xen/mm.h                      | 36 ++--------------
 xen/include/xen/tlb-clock.h               | 50 +++++++++++++++++++++++
 xen/include/xen/version.h                 |  1 -
 27 files changed, 102 insertions(+), 102 deletions(-)
 create mode 100644 xen/include/xen/tlb-clock.h


base-commit: 8e60d47cf0112c145b6b0e454d102b04c857db8c
-- 
2.39.5


