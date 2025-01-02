Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F4D9FFCA2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 18:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864354.1275557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOlM-00068G-4a; Thu, 02 Jan 2025 17:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864354.1275557; Thu, 02 Jan 2025 17:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOlM-00065a-1B; Thu, 02 Jan 2025 17:13:36 +0000
Received: by outflank-mailman (input) for mailman id 864354;
 Thu, 02 Jan 2025 17:13:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NS6K=T2=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tTOlK-00065U-Ig
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 17:13:34 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e53634cf-c92c-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 18:13:33 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43616c12d72so18815925e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 09:13:33 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1fa2bdfbsm37802386f8f.102.2025.01.02.09.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 09:13:32 -0800 (PST)
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
X-Inumbo-ID: e53634cf-c92c-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735838013; x=1736442813; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gEGTOObaKb2ABfYop/If2AgLey7bmu/+IKvPngcCyjY=;
        b=mc7JgaJU5A9ZYBw3HvHqWrgnYXC8iu7SgMR1dMDYYoJrDwoFjdR9wwH681Vu51hGE9
         Jk9Sx4n6okn/anZnTQUY8rA7nQSDqmAIKSKQHBPHxLnAYaUDDVq/9elDwj5XPBUJLXsQ
         7KSZaehtTYOSgdyv03XLB7TFNuK1xS9NSePdEzMlvaY2eIaQXz/g2A2KYe6nVEwF7fTN
         3fR6vrZDcpSnUHfJnymiAC5jpu+V6GPTGRbn4E1+LAOTRCb5weIDAhqq1QqnMa1VuiZu
         uh3ORyonjtFgNgMiiQhs6ee9rj/kEOiO7btkxCjRUtUuLzUnD3mUBhQtrqAXIRahTTv1
         i+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735838013; x=1736442813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEGTOObaKb2ABfYop/If2AgLey7bmu/+IKvPngcCyjY=;
        b=ZCSYjrvhejctaAI8hjrEI4GNe479Hsc3ETEMvXQb4tiJqIL1ezJPgESPhFxjA3tfXZ
         sffGccxdYzp6kiivmVE9VX2ZRMWLLEhHXhX963vWnqbZIewcdwxzG90zti9l51Yx3g2h
         W/abN8LJpNaWpeZrH+jaGwmN9hE/94IU5+d0h5DHpC8Cs+cTh7iZamt5vE+AUkqcZVrP
         P70M2NqRwUgFdDWdcwz2R/LrOHEz7JEow0FLocFzlYQbBPZ/JD3IJainijA2EU3wDPY6
         m7iowP9KjR+4vVkTjzpUps6QHsiTCr+2HFFzWZNH1/DAGqsRzTSksT0MNIW4R3+Hyq9z
         xOhQ==
X-Gm-Message-State: AOJu0Yzr59xidsFcG6gKXV35WKSQrnt/EJYZUYWxBCai3DdokqE92mI/
	1GX4Lon2Rl+67zhzv+nMZnCrkC8w18IUObSK7XvRG7KmYrJ4IISCx9DOew==
X-Gm-Gg: ASbGncuiaNRtuAeCsitKjbBzirSdlaXezEGUUC8iqUvKb9BSz4gmbK0uFNi/ko0m809
	V4kiSrruVk+Fzx7IJZW9/gNl2j6EXjt3Jk0JdbsYOZeBwxUjvena/sDnoMCwNFQeH7W0ycHBwID
	aNuo86wW2tQRLPgJTIl9Qz9pIpQD35smaGDX1r3qtogc3D5IUIN7SXN2dvP4aX/DMU9ygqkIZW8
	47jgGGPLIsYsi5M88TImFV5UKxujfXY/emAvo+toWin07Kls8fc6ukffbcRwuf42FkX5IDWsnP5
	vW2RcmeqFt7M5lVKUG8C39Rg9F7/4twHeMYsX5lDhqETa1+tzqDsfAW7
X-Google-Smtp-Source: AGHT+IHiBo23c2/HncGH60cLyniCt1mAm03RZWryPtKM1mt4uAemgLdWrYQt6BoNPW+CEFkJGMo55Q==
X-Received: by 2002:a5d:6da2:0:b0:386:36e7:f447 with SMTP id ffacd0b85a97d-38a223f64b0mr14435702f8f.13.1735838012381;
        Thu, 02 Jan 2025 09:13:32 -0800 (PST)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 0/2] x86: Add Support for Paging-Write Feature
Date: Thu,  2 Jan 2025 17:13:26 +0000
Message-Id: <cover.1735837806.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Changes since v2:
- Reset entry->pw in all cases in p2m_set_entry, except for p2m_access_r_pw

Changes since v1:
- Added signed-off-by tags

This patch introduces a new XENMEM_access_r_pw permission. Functionally, it is similar to XENMEM_access_r, but for processors with TERTIARY_EXEC_EPT_PAGING_WRITE support (Intel 12th Gen/Alder Lake and later), it also permits the CPU to write to the page during guest page-table walks (e.g., updating A/D bits) without triggering an EPT violation.

This behavior works by both enabling the EPT paging-write feature and setting the EPT paging-write flag in the EPT leaf entry.

This feature provides a significant performance boost for introspection tools that monitor guest page-table updates. Previously, every page-table modification by the guest—including routine updates like setting A/D bits—triggered an EPT violation, adding unnecessary overhead. The new XENMEM_access_r_pw permission allows these "uninteresting" updates to occur without EPT violations, improving efficiency.

Additionally, this feature simplifies the handling of race conditions in scenarios where an introspection tool:

- Sets an "invisible breakpoint" in the altp2m view for a function F
- Monitors guest page-table updates to track whether the page containing F is paged out
- Encounters a cleared Access (A) bit on the page containing F while the guest is about to execute the breakpoint

In the current implementation:

- If xc_monitor_inguest_pagefault() is enabled, the introspection tool must emulate both the breakpoint and the setting of the Access bit.
- If xc_monitor_inguest_pagefault() is disabled, Xen handles the EPT violation without notifying the introspection tool, setting the Access bit and emulating the instruction. However, Xen fetches the instruction from the default view instead of the altp2m view, potentially causing the breakpoint to be missed.

With this patch, setting XENMEM_access_r_pw for monitored guest page-tables prevents EPT violations in these cases. This change enhances performance and reduces complexity for introspection tools, ensuring seamless breakpoint handling while tracking guest page-table updates.


Petr Beneš (2):
  x86: Rename _rsvd field to pw and move it to the bit 58
  x86: Add Support for Paging-Write Feature

 xen/arch/arm/mem_access.c               |  4 ++++
 xen/arch/arm/mmu/p2m.c                  |  1 +
 xen/arch/x86/hvm/hvm.c                  |  1 +
 xen/arch/x86/hvm/monitor.c              |  1 +
 xen/arch/x86/hvm/vmx/vmcs.c             |  4 +++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  4 ++--
 xen/arch/x86/include/asm/p2m.h          |  1 +
 xen/arch/x86/mm/hap/nested_hap.c        |  3 +++
 xen/arch/x86/mm/mem_access.c            |  3 +++
 xen/arch/x86/mm/p2m-ept.c               | 12 ++++++++++++
 xen/include/public/memory.h             |  9 +++++++++
 xen/include/xen/mem_access.h            |  6 ++++++
 13 files changed, 49 insertions(+), 3 deletions(-)

-- 
2.34.1


