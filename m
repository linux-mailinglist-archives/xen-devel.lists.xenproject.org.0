Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17D9849DC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803175.1213631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cU-0006ch-8t; Tue, 24 Sep 2024 16:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803175.1213631; Tue, 24 Sep 2024 16:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cU-0006am-68; Tue, 24 Sep 2024 16:42:34 +0000
Received: by outflank-mailman (input) for mailman id 803175;
 Tue, 24 Sep 2024 16:42:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st8cS-0006ag-Vf
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:42:32 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe643462-7a93-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 18:42:31 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so6999528a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:42:32 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134917sm101862166b.203.2024.09.24.09.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:42:30 -0700 (PDT)
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
X-Inumbo-ID: fe643462-7a93-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727196151; x=1727800951; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6YKyUWDm3kn9IpzXBFrcGv2QPG2rXoIjGk8I73ONduY=;
        b=Q/zRs6lEDiSQz9JUsxySt69EK3fb7/N8tCI+SFdNhSKytWpP2l8H0eCtEq+HwnB4Ng
         O+2qpcY+q8vCfxy5XwAAnhfg1zRmVQM0ANgqP6Bv/GMKC2/ry1YG7q3KdyfLoVc1mNYL
         nm4RGqkXxJCYS0ysNEwqcCxv2Sy9jT/RYCV2iaXNAnHoE6pIdrQH2+CWX0J50KfyWFno
         cG34R4GDYb/j9X/i0KA7vzdRlwfLuQndG/sX3WlNchwqox1Loq9S42Tq7futNW09e+kE
         C5ivW3NtlfXkP3HkbAAUnC467mk1AXtu9ps4t2tjB7oNJhoOkrl4oiPfQ1sLzrqGpWuk
         SlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196151; x=1727800951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YKyUWDm3kn9IpzXBFrcGv2QPG2rXoIjGk8I73ONduY=;
        b=gV6VoX+QyHloGYVuNqsfGN/ebTOzCgYCPOpHd0UCxd/52htfMHUReuOyfUOdOFUeCO
         R69JguFycVMIhYafATWhvjJ0VJeQ0ku3F5yZxhQmP2dg6+nuTX419zwf7ecuv32cYeft
         0QGWVzOTjjafY5FMDtJLcKpQBGIOQ02OLWRD+39f8ePSMd/qGGQJjc9NX1voasnOK8Z2
         y6wOnvT/wJwhdI383DZasHT/O1A2m4TYjqyiBxgZyhwYlerbrZp0EtKNYLVvCMQbHohQ
         O+esTieK5ulBddioqXmq66EFvnRqodNMmT8d58oN3iUrbWAFIH2D60DHNKhJH+Z0Bfa6
         BDZA==
X-Gm-Message-State: AOJu0Ywo/AhnQsSysHKsYi2dVjuW+Nhu6H953VFigHynQRPp29ymOJGr
	7J0BbrQjnxNo4SBZDPOVcnRAuihGnWWytskRUrEYivsRW8rwA4QNcex19g==
X-Google-Smtp-Source: AGHT+IF49SjZk3IDGRJJ7tATvwN6P0ww0F86WV7s44P/jTgZxew4KDecXqAYTsHJxwm9wmp2tFrkvA==
X-Received: by 2002:a17:907:3f9f:b0:a80:f81c:fd75 with SMTP id a640c23a62f3a-a90d51e1edcmr1569508466b.0.1727196150996;
        Tue, 24 Sep 2024 09:42:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 0/2] Move percpu code to common
Date: Tue, 24 Sep 2024 18:42:26 +0200
Message-ID: <cover.1727185495.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-CPU area management code, which is largely common across architectures,
is a strong candidate for consolidation into common code.

Currently, there is only one architectural-specific aspect:
1. INVALID_PERCPU_AREA:
  ARM:
    #define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
  x86:
    #define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned long)__per_cpu_start)

These changes do not affect the functional behavior for x86.

For Arm add support of CPU_RESUME_FAILED, CPU_REMOVE and freeing of percpu
in the case when system_state != SYS_STATE_suspend.

---
Changes in V2:
 - update the cover letter message.
 - move CPU_RESUME_FAILED, CPU_REMOVE handling to common code.
 - rename PERCPU_SECTION to PERCPU_BSS.
 - drop ARCH_PERCPU_AREA_CHECK and ARCH_CPU_PERCPU_CALLBACK and connected
   functions.
 - All other changes look at specific patch.
---

Oleksii Kurochko (2):
  xen: introduce common macros for per-CPU sections defintion
  xen: move per-cpu area management into common code

 xen/arch/arm/Makefile             |   1 -
 xen/arch/arm/include/asm/smp.h    |   7 +-
 xen/arch/arm/percpu.c             |  85 -----------------------
 xen/arch/arm/xen.lds.S            |   9 +--
 xen/arch/ppc/include/asm/smp.h    |   6 --
 xen/arch/ppc/stubs.c              |   1 -
 xen/arch/ppc/xen.lds.S            |   9 +--
 xen/arch/riscv/include/asm/smp.h  |   6 --
 xen/arch/riscv/stubs.c            |   1 -
 xen/arch/x86/Makefile             |   1 -
 xen/arch/x86/include/asm/Makefile |   1 -
 xen/arch/x86/include/asm/percpu.h |  16 +++++
 xen/arch/x86/percpu.c             | 112 ------------------------------
 xen/arch/x86/xen.lds.S            |   9 +--
 xen/common/Makefile               |   1 +
 xen/common/percpu.c               | 110 +++++++++++++++++++++++++++++
 xen/include/asm-generic/percpu.h  |   9 ++-
 xen/include/xen/percpu.h          |   4 ++
 xen/include/xen/xen.lds.h         |  10 +++
 19 files changed, 153 insertions(+), 245 deletions(-)
 delete mode 100644 xen/arch/arm/percpu.c
 create mode 100644 xen/arch/x86/include/asm/percpu.h
 delete mode 100644 xen/arch/x86/percpu.c
 create mode 100644 xen/common/percpu.c

-- 
2.46.1


