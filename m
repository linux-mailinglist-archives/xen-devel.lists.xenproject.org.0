Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E543AF5B56
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031265.1405064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeU-00008H-Bx; Wed, 02 Jul 2025 14:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031265.1405064; Wed, 02 Jul 2025 14:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeU-00006q-7A; Wed, 02 Jul 2025 14:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1031265;
 Wed, 02 Jul 2025 14:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T1d=ZP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWyeS-0007x9-18
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:41:32 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1e812d6-5752-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 16:41:26 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-453647147c6so74111735e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:41:26 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad20bsm230946905e9.20.2025.07.02.07.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 07:41:25 -0700 (PDT)
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
X-Inumbo-ID: a1e812d6-5752-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751467286; x=1752072086; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOO7w0qwM/ssMiQ+ZlK1nygpwE/Hvw9rR2zu/YyUGog=;
        b=gYQ6gxzAauNflEFHnlcY3juMM4Jrx02e6Dax2gKNwuRAUuuLqef0uJPFhx17Iw/g2N
         UeDzwotfDeudrLiOwhlTwq9jZm8/cIV9vn0DB6D1XU3t8yW8vzAX3BnNKT8AyAqmsWT9
         If/J+AY9UTD80tkDcGadfs9EPtFZ6A1YsB2Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467286; x=1752072086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOO7w0qwM/ssMiQ+ZlK1nygpwE/Hvw9rR2zu/YyUGog=;
        b=CcFaDpazWL7Pm2wT24AEAU9vQqWzLnAg3P8ZwniOuoEkJlfW1nbdMpzIkXLy+lhLbv
         N+YQGZKSEDCYBBAFZaqtyAPX6kDjfX/lggPoiPNYur34Fg6JQEYP+lGlVv36a2uT7HMN
         in7rLSEVONx0H6HrYfPBu2bwlnUyoaq8wX1gtZGJUHMIH6nwTfAYNDE7g/NroAJFqWDM
         m+exTj7Oa0X6MeqO6dwenW5ljQzK44V2DaPP1KR9B1WalWAkRIFik5Gh/gmNZq3IOi/J
         iOX4MRNKwLDRPA16BkW2dsBNMdQWIOg1/acjElqY37wstoAkV8bpVSbxLyLcWdbM98Oy
         UJFQ==
X-Gm-Message-State: AOJu0YwkjMYWWMf5YLwEP8og8HdDiclnybzBKVIRMmWPBtQbbAVHxFwg
	/DTdtMCw47uKffcQ7s5B+x2b2uZmq5R++ooDa4+lEny3KaG4tytYf9xWTGB4BIvPNDkbyvnsoPp
	2Zy9Fed0qOHMW
X-Gm-Gg: ASbGncuRVshkeZOwGqc/Cvx53i5oXqC7YpVfebSU/yn70fYXtaTkaf1GQTOODv/FxI9
	bo8lxHlk+lerIQlaQ5MsbOmRoc7uixYYRXBSkyoI/5VkPDcuwDbsJeMiWNgcA7Mvdy4uBRLnTBD
	M6E1LtF94HNP6faFpLXRI5O2IsRIWLhO9Mm1V3+HTIYFXlhxHYdLPhAm9gHwdvR7BBerH06Zg3B
	/bSOF41bk6nxH5u1vZXFSpz0Eq7xkZnv3QhEh17rAxzJkSClZo75o/atf4GY03J35lHgI0IuIn1
	l0AFaV6nnd5VUAV9DAyJ694bj6cintYk+znYyt44ltZj0ZSIojJjcjp3nCffZAPdAMSRtpyMOg7
	BigINOnabr7Ffj1om/z8aVgBnnESVHNUf0uM=
X-Google-Smtp-Source: AGHT+IHKFBVPN+Y9/aN7QPgXDRyZW5W044Q2V6fp6DhxUVDKeAJq8bmGI0dg3xTCA2ZB+HWgOCJ+/A==
X-Received: by 2002:a05:600c:1d12:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-454a91b5d12mr9410885e9.3.1751467285647;
        Wed, 02 Jul 2025 07:41:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/6] x86/idle: Multiple MWAIT fixes
Date: Wed,  2 Jul 2025 15:41:15 +0100
Message-Id: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The two main bugs were identified in Linux first, and I've modelled Xen's fix
similarly.

Patches 1-4 want committing together.  They do bisect and operate correctly,
but the range takes out an optimisation in order to reimplement it correctly.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1902584433

Andrew Cooper (6):
  x86/idle: Remove broken MWAIT implementation
  x86/idle: Convert force_mwait_ipi_wakeup to X86_BUG_MONITOR
  xen/softirq: Rework arch_skip_send_event_check() into arch_pend_softirq()
  x86/idle: Implement a new MWAIT IPI-elision algorithm
  x86/idle: Drop incorrect smp_mb() in mwait_idle_with_hints()
  x86/idle: Fix buggy "x86/mwait-idle: enable interrupts before C1 on Xeons"

 xen/arch/x86/acpi/cpu_idle.c           | 92 +++++++++++---------------
 xen/arch/x86/cpu/intel.c               |  2 +-
 xen/arch/x86/cpu/mwait-idle.c          |  8 +--
 xen/arch/x86/hpet.c                    |  2 -
 xen/arch/x86/include/asm/cpufeatures.h |  1 +
 xen/arch/x86/include/asm/hardirq.h     | 21 ++++--
 xen/arch/x86/include/asm/mwait.h       |  3 -
 xen/arch/x86/include/asm/softirq.h     | 34 +++++++++-
 xen/common/softirq.c                   |  8 +--
 xen/include/xen/cpuidle.h              |  2 -
 xen/include/xen/irq_cpustat.h          |  1 -
 xen/include/xen/softirq.h              | 16 +++++
 12 files changed, 110 insertions(+), 80 deletions(-)

-- 
2.39.5


