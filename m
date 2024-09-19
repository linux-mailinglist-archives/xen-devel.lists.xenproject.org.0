Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3329A97CBE8
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 17:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800817.1210820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srJZ9-0007L8-Ed; Thu, 19 Sep 2024 15:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800817.1210820; Thu, 19 Sep 2024 15:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srJZ9-0007Jd-Ab; Thu, 19 Sep 2024 15:59:35 +0000
Received: by outflank-mailman (input) for mailman id 800817;
 Thu, 19 Sep 2024 15:59:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hDEZ=QR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1srJZ8-0007JX-0p
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 15:59:34 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29516ae1-76a0-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 17:59:33 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5365b6bd901so1181511e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 08:59:33 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5369fa5ceb3sm631423e87.32.2024.09.19.08.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 08:59:31 -0700 (PDT)
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
X-Inumbo-ID: 29516ae1-76a0-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726761572; x=1727366372; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6O68B1dFkVC+NGetsOJNVPBZ3KQJrDF4Hl6BN3xL0Y=;
        b=ejNeaprAOCkTanY6uRePqjabSs2b2M/K5YDZ5BtTkEtHHm4u+4Q9dtrUfqlFVzXxGH
         gEBT13QSxYIJF/MhX4B7OUxorRsv8NBNH0r9B06A9fEkJTZfyEl6s0egUUMzGIpWTV2c
         n5AAClaR4eAhuSPBaVbcge78R3QcYD6Y/U3QE40BUmx2YY1vMXvWrcYhwe/+Y60qHyQw
         SWslwBVtRN6w03HPYJmBTwLUsMbDmUsQkApKKQDxvRJ1VD4jAJTDTUTEVNiis3SVzr2F
         Nh/pCIwTmxwIjrgIrcHaFFikBSU+W6loXe1vSK623bYGRTvrkYBaS+DPopEfkb7LqzG6
         4+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726761572; x=1727366372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6O68B1dFkVC+NGetsOJNVPBZ3KQJrDF4Hl6BN3xL0Y=;
        b=CqBFa4219wU+9J6lWcrCNhen7kXhivtTO3R4fvbamo3v+pQRa4wLzCN9XOd3mvWmzy
         jrIx9Q0u81X3vzna91zAZdPA7nXlOyZDHnlmTdIDMIcVhbfEI02xXSRdJWzLk9NLYRNr
         neafVfLpPybpKisBo5s9d9NMCllVNfwnhKY/DWLVu8uf/diu37zE33wI5Rw8sUNIKf2y
         VST1OriSbBMUCO7G47zIOAQ3qU949Ijqd0I8cRgc3oZ/ulSeBvfFYYhtMdvSS0AEURQ4
         KhYmiqcOWoZIR004G+bI+rbaRMFcoxwQ6za6Fd6AThvPPvv5Zup+wzigyd9i35f/LPtv
         b0pg==
X-Gm-Message-State: AOJu0YyXoF9WYeDFv652+FBwQ+qiM9MVZWcLXZeT3Ey641HK3t+oLmJF
	Y84xlOhCiS+x8v+4q0Picjn6Q3VZEYoNT8HsQNk8qDhsbfrLoihCJ+adTw==
X-Google-Smtp-Source: AGHT+IEBW16nv7vOWNAlC6A8Aex3h0CQBJjbK6baJ+lqeWf4oOq7fjFCwN7iTGogyNyOzXOUvgsEEw==
X-Received: by 2002:a05:6512:1390:b0:52c:90b6:170f with SMTP id 2adb3069b0e04-53678fc854dmr15947964e87.29.1726761571590;
        Thu, 19 Sep 2024 08:59:31 -0700 (PDT)
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
Subject: [PATCH v1 0/2] Move percpu code to common
Date: Thu, 19 Sep 2024 17:59:26 +0200
Message-ID: <cover.1726746877.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-CPU area management code, which is largely common across architectures,
is a strong candidate for consolidation into common code.

Currently, there are three architectural-specific aspects that are not yet
unified ( if they can be unified at all ):
1. INVALID_PERCPU_AREA:
  ARM:
    #define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
  x86:
    #define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned long)__per_cpu_start)
2. Return value when __per_cpu_offset Is Already Initialized:
  Arm:
    if (__per_cpu_offset[cpu] != INVALID_PERCPU_AREA)
      return -EBUSY;
  x86:
    if (__per_cpu_offset[cpu] != INVALID_PERCPU_AREA)
      return 0;
3. Handling of CPU_RESUME_FAILED and CPU_REMOVE in cpu_percpu_callback:
  Arm:
    switch (action)
    {
    case CPU_UP_CANCELED:
    case CPU_DEAD:
        free_percpu_area(cpu);
        break;
    }
  x86:
    switch (action)
    {
    case CPU_UP_CANCELED:
    case CPU_DEAD:
    case CPU_RESUME_FAILED:
        if (!park_offline_cpus && system_state != SYS_STATE_suspend)
            free_percpu_area(cpu);
        break;
    case CPU_REMOVE:
        if (park_offline_cpus)
            free_percpu_area(cpu);
        break;
    }

These changes do not affect the functional behavior.


Oleksii Kurochko (2):
  xen: introduce common macros for per-CPU sections defintion
  xen: move per-cpu area management into common code

 xen/arch/arm/Makefile             |   1 -
 xen/arch/arm/percpu.c             |  85 --------------------
 xen/arch/arm/xen.lds.S            |   9 +--
 xen/arch/ppc/stubs.c              |   1 -
 xen/arch/ppc/xen.lds.S            |   9 +--
 xen/arch/riscv/stubs.c            |   1 -
 xen/arch/x86/include/asm/Makefile |   1 -
 xen/arch/x86/include/asm/percpu.h |  18 +++++
 xen/arch/x86/percpu.c             |  92 ++--------------------
 xen/arch/x86/xen.lds.S            |   9 +--
 xen/common/Makefile               |   1 +
 xen/common/percpu.c               | 127 ++++++++++++++++++++++++++++++
 xen/include/asm-generic/percpu.h  |   8 ++
 xen/include/xen/xen.lds.h         |  10 +++
 14 files changed, 172 insertions(+), 200 deletions(-)
 delete mode 100644 xen/arch/arm/percpu.c
 create mode 100644 xen/arch/x86/include/asm/percpu.h
 create mode 100644 xen/common/percpu.c

-- 
2.46.0


