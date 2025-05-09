Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09F0AB1A85
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 18:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980249.1366716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQe7-0001hx-T1; Fri, 09 May 2025 16:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980249.1366716; Fri, 09 May 2025 16:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQe7-0001fj-LW; Fri, 09 May 2025 16:32:23 +0000
Received: by outflank-mailman (input) for mailman id 980249;
 Fri, 09 May 2025 16:32:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDQe5-0001fR-Hz
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 16:32:21 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cf6fefa-2cf3-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 18:32:19 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so24440045e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 09:32:19 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ecb46sm3790069f8f.30.2025.05.09.09.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 09:32:18 -0700 (PDT)
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
X-Inumbo-ID: 2cf6fefa-2cf3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746808338; x=1747413138; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ROHO2f0QCmXC07+ZMsEuiruPA5mpfSKk5CWbkg5bBDE=;
        b=NCzM5G7IHWw5Ja8FpRHtZZ5Wfvi6qaQ5jIModyWMpKQb71cVYBT+IIEAGDFP8p5pwy
         vfgwc1noBpzi1WosbGupjg6DjvZEO/Lot/6JNhIxflPKvJQrj6bhaCGkj70VAEX9js0T
         4YZnpuHamCL8MFEF2GHLrWJ2mzJBV+4JmnSdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746808338; x=1747413138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROHO2f0QCmXC07+ZMsEuiruPA5mpfSKk5CWbkg5bBDE=;
        b=vdQtD/GpiGwACw4cuWveEeiuxTHvqomg/ji1p+ZgkHGk+zYlt8Y5LvwaGt2reKMLCi
         YnEq+GWuW+zdzhwnQG4La7OC6lOvhaiBGHUC/fSOuT646X41F0XwVcA5yMO6++MdnQBa
         v5OC2trVJ6lhzle3NHK8PkyR1IOhSEq44+2E1OIdafPGg0L7bq0bLBWCEBnpWgOaevQT
         FTp1Iw9HF5OjMWZzmXDj5LcgyXXx8i4SNxek/wTcCq4pfP92yDuJS21htsqxBnt1n2w4
         +eDP+hFVtqkC0RwDlR7wllYDuLXQuRFzMR5Cb5L3G6WRoP+oUelQ9CMkOLTH+IAJygMG
         KKcw==
X-Gm-Message-State: AOJu0YyTB4428xRpgVHaPRlMwtzDzFg4TJ4RKS44ZLBxU/s78Ho5mWH4
	zIQUJhnyJIT5UvCEyhpkelt2++B6sC8b0V6sanZjMPjT1DCFfJ4fgdXisEIeOSGFlMLGK6NUWRn
	r
X-Gm-Gg: ASbGnctMmZdfGr0fJLMWUN9zNR0TptWIOwDWxYixwEJ3fXPH1ZXvJXWaS2wMjfca+7d
	VTjxL8bTPeuDOi7uHR//c1aPkG3UGEJU4S4PUYhyMYyobARM1Xa72f9r/qn1quoVrd8hulv1F1J
	UzPouhmlHqcMBgvUY2EnAMOfNXlYqtDwJQmExtwi4KehCAoBOXAUZE3/pgy5wdiA8kGVNQ3vRh0
	VtYKqaO9SiLX0xCyUL5L2QoIuSLcYUHnf4fg/T4wLCw0yS1F5xF0tJ2gQtN3NuRXnKcXzNrxmVW
	yTw8iPV3xKeEQEuSutl/gzF8S05UB5kfz4tUheGmgA1KpDq/h5i70IH62Jab9w+Kg9EQG9Vhh/H
	ATzq251wQ/XComA==
X-Google-Smtp-Source: AGHT+IGLX+lnRXCiVy5f1WlMgI/nXk7GoIPxwhZx0XmuyhZr4oXjX5NR99nmp6IjIpflQcwAxsVJfg==
X-Received: by 2002:a05:600c:3b0e:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d6ddea12mr36479785e9.31.1746808338433;
        Fri, 09 May 2025 09:32:18 -0700 (PDT)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 0/3] xen: Header fixes
Date: Fri,  9 May 2025 17:32:09 +0100
Message-Id: <20250509163212.2948359-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split out of "[PATCH 0/8] xen: Untangle mm.h"

https://lore.kernel.org/xen-devel/20250312174513.4075066-1-andrew.cooper3@citrix.com/

Andrew Cooper (3):
  xen/elfstructs: Include xen/types.h
  xen/livepatch: Fix include hierarchy
  xen: Sort includes

 xen/arch/arm/arm32/livepatch.c  |  1 -
 xen/arch/arm/arm64/livepatch.c  |  1 -
 xen/arch/arm/livepatch.c        |  1 -
 xen/arch/arm/mmu/setup.c        |  2 +-
 xen/arch/x86/alternative.c      | 12 ++++++------
 xen/arch/x86/livepatch.c        |  9 ++++-----
 xen/common/memory.c             |  4 +++-
 xen/common/page_alloc.c         |  5 ++---
 xen/include/xen/elfstructs.h    |  8 +++++++-
 xen/include/xen/livepatch.h     | 10 +++++-----
 xen/include/xen/livepatch_elf.h |  1 -
 xen/include/xen/mm.h            |  6 +++---
 xen/include/xen/version.h       |  1 -
 13 files changed, 31 insertions(+), 30 deletions(-)

-- 
2.39.5


