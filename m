Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D3912E6D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 22:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745527.1152654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKkjQ-0006aA-Tc; Fri, 21 Jun 2024 20:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745527.1152654; Fri, 21 Jun 2024 20:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKkjQ-0006Xq-Py; Fri, 21 Jun 2024 20:19:36 +0000
Received: by outflank-mailman (input) for mailman id 745527;
 Fri, 21 Jun 2024 20:19:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKkjP-0006Xk-IV
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 20:19:35 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 934103dc-300b-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 22:19:34 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so25598481fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 13:19:34 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf48b3a6sm116947466b.87.2024.06.21.13.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 13:19:33 -0700 (PDT)
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
X-Inumbo-ID: 934103dc-300b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719001173; x=1719605973; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WWqVYAr+RIssWyYwcsTLLYz+ah7FzeogIU64ufCtzYs=;
        b=ACAk6jekKbb0t+aCuBc55nLn+TD+XBWeH5idsKcqu1nDp0M6ctCWE8ym9zeUxLCyMa
         EITpri29vPIHHy0XzBot1fwgEtqHCPruwDgNqLNW0S4vIh00ZL4CpOxJjtAaXa6eH0f8
         NgHIVxq/LrFrLk5jdvNA4sIkzoPAqSKhLnuJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719001173; x=1719605973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWqVYAr+RIssWyYwcsTLLYz+ah7FzeogIU64ufCtzYs=;
        b=gt7RWRlb09gcNoJUrq0o08FEwPEyEE5UW+tB99575HBgLEjUOA8v4JYo1bcWIlz0ix
         FWxbaiEMdreKb0xC+iPk28WMsJBjXikAgH4DKjfm+nYmNNGuwif8Xb1iCr3ZqZhSyPXC
         pp/uHBVQeNicpZYi7oIUCfZCKQLfsVQXvbZ2y5K+614feazHFS85H9cMb77hTcyTuDxa
         MK/GaFc8YOko16hKg6OzEWPYTnGnU9ghbRs5WQUZXqsIognvV3b0ttHo+k/ZgpNYV0x1
         WvK8sc7u6N39kHbUnntor+tY1dCQXfvpczNgowK2jWqY9whChEgilcS1Iu7CWPf/LzDj
         PsaA==
X-Gm-Message-State: AOJu0Yx0tAWkFsZC2ZY1eInQbGpL9U6kaluv74t1oPAGmoSxHG6M+N8d
	YTrTRM/c6iDMs0lCW8d3W+tbIL3JwQLQ3LOzE3IIMWLqVlsSVgY7Uj2P32qBuJMeS8p1SLiThjC
	bJRU=
X-Google-Smtp-Source: AGHT+IENENi3Vr58wPw4ikChsTi4+fhFJpmmdf1XluRJ4iDieqqOtdR8N77YDi1kMSIvIAN7iQzZvg==
X-Received: by 2002:ac2:592e:0:b0:52c:7fc3:601 with SMTP id 2adb3069b0e04-52ccaa98d2cmr5913736e87.61.1719001173402;
        Fri, 21 Jun 2024 13:19:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH for-4.19? 0/3] xen: build adjustments for __read_mostly/__ro_after_init
Date: Fri, 21 Jun 2024 21:19:25 +0100
Message-Id: <20240621201928.319293-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In aid of getting the RISC-V build working without introducing more technical
debt.  It's done by making PPC shed it's copy of said technical debt.

Build tested quite thoroughly, including in Gitlab.

Andrew Cooper (3):
  xen/riscv: Drop legacy __ro_after_init definition
  xen/ppc: Adjust ppc64_defconfig
  xen/ppc: Avoid using the legacy __read_mostly/__ro_after_init
    definitions

 xen/arch/ppc/configs/ppc64_defconfig | 6 ------
 xen/arch/ppc/include/asm/cache.h     | 3 ---
 xen/arch/ppc/mm-radix.c              | 1 +
 xen/arch/ppc/stubs.c                 | 7 +++++++
 xen/arch/riscv/mm.c                  | 2 +-
 xen/common/argo.c                    | 1 +
 xen/common/cpu.c                     | 1 +
 xen/common/debugtrace.c              | 1 +
 xen/common/domain.c                  | 1 +
 xen/common/event_channel.c           | 2 ++
 xen/common/keyhandler.c              | 1 +
 xen/common/memory.c                  | 1 +
 xen/common/page_alloc.c              | 1 +
 xen/common/pdx.c                     | 1 +
 xen/common/radix-tree.c              | 1 +
 xen/common/random.c                  | 2 +-
 xen/common/rcupdate.c                | 1 +
 xen/common/sched/core.c              | 1 +
 xen/common/sched/cpupool.c           | 1 +
 xen/common/sched/credit.c            | 1 +
 xen/common/sched/credit2.c           | 1 +
 xen/common/shutdown.c                | 1 +
 xen/common/spinlock.c                | 1 +
 xen/common/timer.c                   | 1 +
 xen/common/version.c                 | 3 +--
 xen/common/virtual_region.c          | 1 +
 xen/common/vmap.c                    | 2 +-
 xen/drivers/char/console.c           | 1 +
 xen/drivers/char/ns16550.c           | 1 +
 xen/drivers/char/serial.c            | 2 +-
 xen/include/xen/cache.h              | 2 ++
 xen/include/xen/hypfs.h              | 1 +
 32 files changed, 38 insertions(+), 15 deletions(-)

-- 
2.39.2


