Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264EA3E2D1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 18:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894046.1302863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAap-0003vP-Ed; Thu, 20 Feb 2025 17:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894046.1302863; Thu, 20 Feb 2025 17:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAap-0003tp-Bd; Thu, 20 Feb 2025 17:44:11 +0000
Received: by outflank-mailman (input) for mailman id 894046;
 Thu, 20 Feb 2025 17:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlAao-0003tj-IN
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 17:44:10 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49e8d386-efb2-11ef-9aa9-95dc52dad729;
 Thu, 20 Feb 2025 18:44:09 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-3098088c630so10707341fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 09:44:09 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091e04742esm24070201fa.86.2025.02.20.09.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 09:44:07 -0800 (PST)
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
X-Inumbo-ID: 49e8d386-efb2-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740073448; x=1740678248; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RodT/1ujdCBNM7HybMZLCmntUPSdRFbsXEc373zKCnA=;
        b=P3PuQ6CI2xUZ6MQR6dCuz5Vzr0KLHYj/Kxw4E5pJPW2yN4gyXX3G5N9jyCdfmL0djL
         OS3gDaOk5Icez2KbPCDwhnJvovtLFzMQGVL+wUWNoAXldtpVggN/aUX1+Qoo2YEziqtw
         wzahQrLY0wRclvg+O5Z2unVDyt69kFYmVVsNi8jX3T8TCQ6xrlXsdNgWwg6HP55bIfry
         Gjf/STgxz/DUCsHNHMWfPSZpMLD8ddOnZkFwNZsm8lk5NEuVytFpNOHzP6hcKj88mmMO
         IBRaZWDGeXmvxh3iyecWhF/DepK0UVPuh+pxYubmGlRqLddJNzPJ3FwyKg+Sfg464/l4
         GkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073448; x=1740678248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RodT/1ujdCBNM7HybMZLCmntUPSdRFbsXEc373zKCnA=;
        b=b4fJE8MZunNeYTxcxKuUEkLEp/K2BG2r5y25T1TCQvb12BoiiYk1YOaozKxYDJZvBn
         YWjVJbP8UuHje2SxhlG1Dau3pj4Iaimv2wHW1NwxcE0Y9R85tKRPIhP59S630a2Kb02h
         lYqvG1mLIDWaqIFP8lZ4UGKbWlU6niy4YB0PdEu7v1fs3T51pYJgN+ABSBzVrTQsk6Ue
         2/B4GEHRikbgYTLHPYyKoVRK3fhh6sihcpwG+nn+O7I3COITZmqpZ3zlOIwc2SDCRyd3
         Vr6q6edTab0hUUa318XmW/wdxZxZVCZp+x0R+C2TRMWZf7zQ6VH0qjCV/b0LT1Rhaxtl
         OQDg==
X-Gm-Message-State: AOJu0YxLpeFMOKZ9fD1qGCeZxpoNpS0J065R+nkpk3c1IiNdhg+ao7qC
	dSUGF7eoniLld3ZQrj2i42r5vMCm51GRv3oxLE82FNoITgiAI2GdOCMWJw==
X-Gm-Gg: ASbGnctWkw5zOr0ngY6egGIN2BihOsanDg4eQVRbF985Mu+Ahn+BYz5hIHI4iXrEMMY
	6/w0u7gRjVft+0EVONYmDYdipRLXuH9RsgWVRQcAatTk9eHpGix9e5i343zpez0hc5wbCDUFtPa
	yypIs8XoJzRExyjaFOOeCCaafoO2e9Iu1ud1tdUis4K7sOhQm9quC8OprGWL7rjsRcSYU/vRnT/
	GGE/MS3KaqQLVX4BjmUbbS5+aI3h7WX41p2mwc0aY72gxBL1f1ONx+YtP8fgHN+Qu3q/Rt3CmXK
	23JjhDKrtfQVeFIH
X-Google-Smtp-Source: AGHT+IEZS9gwykAZ2zM2Lz8AoC6A0W7Wai+Ga2hxi8vA7mVIzbjcy4AgoKyECHgaGVBJ2Pqbpgj/sA==
X-Received: by 2002:a05:6512:108a:b0:545:d72:95f0 with SMTP id 2adb3069b0e04-5452fe5bd70mr10006419e87.24.1740073447883;
        Thu, 20 Feb 2025 09:44:07 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for 4.21 v5 0/3] Fixes for vmap_to_mfn() and pt_mapping_level
Date: Thu, 20 Feb 2025 18:44:01 +0100
Message-ID: <cover.1739985805.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce pt_walk(), which does software page table walking to resolve the
following issues:
1. vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA
   from either the direct map region or Xen's linkage region (XEN_VIRT_START),
   thereby an assertion will occur if it is used with other regions, in
   particular for the VMAP region. The solution is usage of pt_walk() for
   vmap_to_mfn().
2. pt_mapping_level() returns incorrect page table level in the case when
   mfn==INVALID_MFN when, for example, VA was mapped to PA using 4k mapping,
   but during destroying/modification pt_mapping_level() could return incorrect
   page table level as when mfn==INVALID_MFN then only VA is taking into account
   for page table level calculation and so if VA is page table level 1 aligned
   then page_mapping_level() will return level 1 ( instead of level 0 as VA was
   mapped to PA using 4k mapping so there is incostinency here ).
   The solution is to set level=CONFIG_PAGING_TABLE to tell pt_update() algo
   that it should use pt_walk() to find proper page table entry instead of
   using for searching of page table entry based on precalculated by
   pt_mapping_level() `level` and `order` values.

---
Changes in v5:
 - Change 'patch for 4.20' to 'patch for 4.21'.
 - Update the cover letter message.
 - Other changes please look inside specific patch.
---
Changes in v4:
 - please look at a specific patch.
---
Changes in v2-v3:
 - update the commit message.
 - other changes look in specific patch.
---

Oleksii Kurochko (3):
  xen/riscv: implement software page table walking
  xen/riscv: update defintion of vmap_to_mfn()
  xen/riscv: update mfn calculation in pt_mapping_level()

 xen/arch/riscv/include/asm/mm.h   |   2 +-
 xen/arch/riscv/include/asm/page.h |  11 ++
 xen/arch/riscv/pt.c               | 176 +++++++++++++++++++++++-------
 3 files changed, 150 insertions(+), 39 deletions(-)

-- 
2.48.1


