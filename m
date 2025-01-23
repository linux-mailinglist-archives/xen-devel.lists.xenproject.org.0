Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE50A1AD67
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876388.1286736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6s1-0007jb-HE; Thu, 23 Jan 2025 23:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876388.1286736; Thu, 23 Jan 2025 23:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6s1-0007hT-E5; Thu, 23 Jan 2025 23:44:21 +0000
Received: by outflank-mailman (input) for mailman id 876388;
 Thu, 23 Jan 2025 23:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6rz-0007hN-Vd
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:44:20 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5d396ac-d9e3-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:44:17 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso10331405e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:44:17 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c098sm6544235e9.31.2025.01.23.15.44.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:44:16 -0800 (PST)
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
X-Inumbo-ID: f5d396ac-d9e3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675857; x=1738280657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SrJqTercMM7Oiv7TI6NgScSjNQ/Q43/m4EWNljCwQJg=;
        b=pMhCITg/5t9F82JB+WtHPGBhqZEoI1oBwILVyfi1rN2/DisTsyjCRH1pU1PPlZVFi2
         HG9/wAk/4YsetLosxr6Dx6zoxPxN/1UFG5TF6jbI6NrBozDEmL6Xrw/05bI58wPGQPKN
         OULnSS1Phc2GoRh1HSSx1cnDXFjeMdE6M7L62n8dZtRaPLxXFFGsfeO49o6tawTZDCGa
         mCge5Ivoubqb4JcKIKJXnrNfNAj1ybp1JzoOoKaR1Mo2TvkFbp3mDMvAAVWX6PhGmaIV
         pDqaKrrx9Gi70542ONK/q/X0G8Ml3Vbs5n8+Vx5sxieNRG8JSUdr1YFuvltwVFi7MRRw
         3B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675857; x=1738280657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrJqTercMM7Oiv7TI6NgScSjNQ/Q43/m4EWNljCwQJg=;
        b=v20ZYVaAyGOA7mlEqEvCwO2zC1HiIEsrvC2LmTyOSrHDcbovNIq2jh/Z1H0DwReM9k
         kLWjoqPNqEg5T2jTq1T6XIPzQskB2jfclaf8qmQFnxx1fqi+ikzlHztQxYM/33+w+ujb
         GFabHtzIWWF1Nz71cxddLY/ZcwEwI5enpU3tG4RglUdFXkbboU4gJUuhU0sTtujAb5fG
         rGLSBjaN0dsNfwG9tRFl74yujkTX9OjAocz0sVpDT10mz/l2PTFCoE5QoQSVu5NcVCXj
         3Vxo/7a8zlyyO0NtBkoEhR457/7zThw4TdDvGuTn8dGuHulZiuO+ELSf27eN+KIbPFhR
         4D2A==
X-Forwarded-Encrypted: i=1; AJvYcCV7uaPZowpgsRO6IzrE/IWJMJzMVk48BzYf67yreUUnuRMRgsP2QVjyC9v3iJTxcC8FXwGzivlyrRQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/Vqcey3cp/FB0sDQ/OeI/wbNEJTUoa5Pe1UDV6swH59LBWAqk
	nrOSZSdaba9IguCajfL5cGOCK3C+u9WE7US1JorWA1BWzKo51lJmCev9crC7XGo=
X-Gm-Gg: ASbGncvAkV0DMaIn4nFJRGNB3fdh3r4Z+OCkR1gRhkXjmNXrdjxGik67QN6yJhnIIeO
	e5ANtpqcloTcrGhUBKJljZSeMjJB2xSxJZoR3WT4j6tf7tAJ2YnzdHceTZd2w5BgLKYsaT8stzR
	pFjJUbFKRQ44OiSW776JoQN5V8ZfoyDUlyjGclcb/p85JjSVXsQFV8ulLEeocKb8AZyek2RKoNz
	JimcU4oHtHNauue7IE18mJAguCcJJfpnGkjXoLjD0E9vfsS2QGU6kSsAffdNnBzyXMEdh4bIzP2
	5CCpO02hrE3bmHQVZpc/tQHQbXrX9sG0lQI8/eIKka6An/+jm/LvQne0y6Fa+RDI6Q==
X-Google-Smtp-Source: AGHT+IGBiB8E0eTSoI28+V9cp1gWnvQIF0NcnM5MrTMqS5rNZ7M1PFDJt5j8Or2lR2bn/A8RFfyqaQ==
X-Received: by 2002:a05:600c:a09:b0:435:9ed3:5688 with SMTP id 5b1f17b1804b1-438913f86dcmr267594425e9.18.1737675857123;
        Thu, 23 Jan 2025 15:44:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/20] accel: Simplify cpu-target.c (omnibus)
Date: Fri, 24 Jan 2025 00:43:54 +0100
Message-ID: <20250123234415.59850-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Yet another cleanup series before respining the "extract TCG
fields from CPUState" series. Before that, we try to clarify
a bit the code around CPU creation. Target specific code is
reduced further. Some intermixed User/System is separated,
making maintenance simpler IMHO. Since my local branch is
quite big, I tried to group here all the generic patches.

Regards,

Phil.

Based-on: <20250123215609.30432-1-philmd@linaro.org>
  "target/ppc: Move TCG code from excp_helper.c to tcg-excp_helper.c"

Philippe Mathieu-Daudé (20):
  qemu/compiler: Absorb 'clang-tsa.h'
  user: Extract common MMAP API to 'user/mmap.h'
  gdbstub: Check for TCG before calling tb_flush()
  cpus: Cache CPUClass early in instance_init() handler
  cpus: Keep default fields initialization in cpu_common_initfn()
  accel/kvm: Remove unused 'system/cpus.h' header in kvm-cpus.h
  accel/tcg: Build tcg_flags helpers as common code
  accel/tcg: Restrict tlb_init() / destroy() to TCG
  accel/tcg: Restrict 'icount_align_option' global to TCG
  accel/tcg: Rename 'hw/core/tcg-cpu-ops.h' -> 'accel/tcg/cpu-ops.h'
  accel: Rename 'hw/core/accel-cpu.h' -> 'accel/accel-cpu-target.h'
  accel/accel-cpu-target.h: Include missing 'cpu.h' header
  accel: Forward-declare AccelOpsClass in 'qemu/typedefs.h'
  accel/tcg: Move cpu_memory_rw_debug() user implementation to
    user-exec.c
  cpus: Fix style in cpu-target.c
  cpus: Restrict cpu_common_post_load() code to TCG
  cpus: Have cpu_class_init_props() per user / system emulation
  cpus: Have cpu_exec_initfn() per user / system emulation
  cpus: Register VMState per user / system emulation
  cpus: Build cpu_exec_[un]realizefn() methods once

 MAINTAINERS                                   |   4 +-
 accel/kvm/kvm-cpus.h                          |   2 -
 accel/tcg/internal-common.h                   |  13 +
 bsd-user/qemu.h                               |  13 +-
 .../accel-cpu.h => accel/accel-cpu-target.h}  |   7 +-
 .../tcg-cpu-ops.h => accel/tcg/cpu-ops.h}     |   0
 include/block/block_int-common.h              |   1 -
 include/block/graph-lock.h                    |   2 -
 include/exec/exec-all.h                       |  16 -
 include/exec/page-protection.h                |   2 -
 include/hw/core/cpu.h                         |   2 +
 include/qemu/clang-tsa.h                      | 114 -------
 include/qemu/compiler.h                       |  87 +++++
 include/qemu/thread.h                         |   1 -
 include/qemu/typedefs.h                       |   1 +
 include/system/accel-ops.h                    |   1 -
 include/system/cpus.h                         |   4 -
 include/user/mmap.h                           |  32 ++
 linux-user/user-mmap.h                        |  19 +-
 accel/accel-system.c                          |   1 +
 accel/accel-target.c                          |   2 +-
 accel/hvf/hvf-accel-ops.c                     |   1 +
 accel/kvm/kvm-accel-ops.c                     |   1 +
 accel/qtest/qtest.c                           |   1 +
 accel/stubs/tcg-stub.c                        |   4 -
 accel/tcg/cpu-exec-common.c                   |  34 +-
 accel/tcg/cpu-exec.c                          |  37 +--
 accel/tcg/cputlb.c                            |   2 +-
 accel/tcg/icount-common.c                     |   2 +
 accel/tcg/monitor.c                           |   1 -
 accel/tcg/tcg-accel-ops.c                     |   1 +
 accel/tcg/translate-all.c                     |   3 +-
 accel/tcg/user-exec-stub.c                    |  11 +
 accel/tcg/user-exec.c                         |  94 +++++-
 accel/tcg/watchpoint.c                        |   2 +-
 accel/xen/xen-all.c                           |   1 +
 block/create.c                                |   1 -
 bsd-user/signal.c                             |   2 +-
 cpu-common.c                                  |   1 -
 cpu-target.c                                  | 314 +-----------------
 gdbstub/system.c                              |   6 +-
 hw/core/cpu-common.c                          |  31 ++
 hw/core/cpu-system.c                          | 170 ++++++++++
 hw/core/cpu-user.c                            |  44 +++
 hw/mips/jazz.c                                |   2 +-
 linux-user/signal.c                           |   2 +-
 system/cpus.c                                 |   1 +
 system/globals.c                              |   1 -
 system/physmem.c                              |   2 +-
 target/alpha/cpu.c                            |   2 +-
 target/arm/cpu.c                              |   2 +-
 target/arm/tcg/cpu-v7m.c                      |   2 +-
 target/arm/tcg/cpu32.c                        |   2 +-
 target/arm/tcg/mte_helper.c                   |   2 +-
 target/arm/tcg/sve_helper.c                   |   2 +-
 target/avr/cpu.c                              |   2 +-
 target/avr/helper.c                           |   2 +-
 target/hexagon/cpu.c                          |   2 +-
 target/hppa/cpu.c                             |   2 +-
 target/i386/hvf/hvf-cpu.c                     |   2 +-
 target/i386/kvm/kvm-cpu.c                     |   2 +-
 target/i386/nvmm/nvmm-accel-ops.c             |   1 +
 target/i386/tcg/tcg-cpu.c                     |   4 +-
 target/i386/whpx/whpx-accel-ops.c             |   1 +
 target/loongarch/cpu.c                        |   2 +-
 target/m68k/cpu.c                             |   2 +-
 target/microblaze/cpu.c                       |   2 +-
 target/mips/cpu.c                             |   2 +-
 target/openrisc/cpu.c                         |   2 +-
 target/ppc/cpu_init.c                         |   2 +-
 target/ppc/kvm.c                              |   2 +-
 target/riscv/kvm/kvm-cpu.c                    |   2 +-
 target/riscv/tcg/tcg-cpu.c                    |   4 +-
 target/rx/cpu.c                               |   2 +-
 target/s390x/cpu.c                            |   2 +-
 target/s390x/tcg/mem_helper.c                 |   2 +-
 target/sh4/cpu.c                              |   2 +-
 target/sparc/cpu.c                            |   2 +-
 target/tricore/cpu.c                          |   2 +-
 target/xtensa/cpu.c                           |   2 +-
 tests/unit/test-bdrv-drain.c                  |   1 -
 tests/unit/test-block-iothread.c              |   1 -
 util/qemu-thread-posix.c                      |   1 -
 hw/core/meson.build                           |   5 +-
 84 files changed, 590 insertions(+), 578 deletions(-)
 rename include/{hw/core/accel-cpu.h => accel/accel-cpu-target.h} (92%)
 rename include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} (100%)
 delete mode 100644 include/qemu/clang-tsa.h
 create mode 100644 include/user/mmap.h
 create mode 100644 hw/core/cpu-user.c

-- 
2.47.1


