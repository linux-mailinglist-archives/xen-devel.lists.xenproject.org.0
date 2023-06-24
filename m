Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AAC73CC19
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554639.865930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7GK-0008LL-6N; Sat, 24 Jun 2023 17:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554639.865930; Sat, 24 Jun 2023 17:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7GK-0008Gv-3P; Sat, 24 Jun 2023 17:41:28 +0000
Received: by outflank-mailman (input) for mailman id 554639;
 Sat, 24 Jun 2023 17:41:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7GI-0008Gp-Id
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:41:26 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5757024f-12b6-11ee-b237-6b7b168915f2;
 Sat, 24 Jun 2023 19:41:25 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fa71e253f2so26385365e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:41:25 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003f9b0f640b1sm2711760wmc.22.2023.06.24.10.41.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:41:24 -0700 (PDT)
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
X-Inumbo-ID: 5757024f-12b6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628485; x=1690220485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9DD8JyzZ0D9c0TVJWROVlnDQP9z+YeCBvlalUwzeBRo=;
        b=S8HxrYQ2qhgw56X9JXNpzNmjfiViWtcbiWCpgQccPHZivixZ7QAzwnG0azVoU7xVwb
         akuxl0mdCTpThLPPNG44q2zM7WFBYRf++FIjeb7OZaKYcNCoxQVVFO06aKvqykPLZlYZ
         ZvpNiq98b5G8YgGvHvAodfNZ2LcJFFazSZG27b+pSB9bw6v7bdgijzZhhCtwRpACo7M0
         slPhBm89C1gJKR7y1ERfGhGue/oWbU0iTwXu9x0IUylVr99MqavVrVlJRD4xj8CSGUvm
         6za9HdL9/cV4dMDN2/DHhAKDF5i4CxvXeVSa4T7v0NhA1XGwrIFxIoVXTwJ+ThKpvofI
         84Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628485; x=1690220485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DD8JyzZ0D9c0TVJWROVlnDQP9z+YeCBvlalUwzeBRo=;
        b=dLQhtzJOj/Hekn46/dBUiMK32KhlSOAOwESegHp1pDSPoyhIUcltGQN/ygteaQLWOM
         TxZfsvX6vI4lA6sUC2g8Ss05quhAqWr3Mn4o1GRB5HvgVPOWrvW4sXktSx3Wqx7QpDk8
         1sVIcvm7sAbOTJGFV8BjboeIrXabX6bTsPjA9jsXojv+l5UqunIzxgCxsD9iIxFAM+MT
         7ibRJTYSjWcSpujNkZ0PuVYJC2NBfdZWsxcGz5FPtHNItJ6z5krZ6WO8FwGjH1+OIyTt
         +ahXJexQ4qHRj+0itWO28e8g8ZXBXZqgLWR/wxwnh44yWccakJEGpgE8xIjyhKrq5glH
         WE+A==
X-Gm-Message-State: AC+VfDwTI0v+t12J9tsH81gj98NVhx74Cj6p3u6xH+8EI2sFxpJ55inB
	eGz4w6OML8D5i6k+u5lIuxaaQA==
X-Google-Smtp-Source: ACHHUZ4RU70EsAbLLa974X6kTmgNQb8jnG4vK1SD4DHwEek3Lg8HiGz7TW7mHUT/jA40wDP62z4cEA==
X-Received: by 2002:a05:600c:2942:b0:3f7:e7a2:25f6 with SMTP id n2-20020a05600c294200b003f7e7a225f6mr21913470wmd.17.1687628485030;
        Sat, 24 Jun 2023 10:41:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	xen-devel@lists.xenproject.org,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 00/16] accel: Share CPUState accel context (HAX/NVMM/WHPX/HVF)
Date: Sat, 24 Jun 2023 19:41:05 +0200
Message-Id: <20230624174121.11508-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This series is part of the single binary effort.

All accelerator will share their per-vCPU context in
an opaque 'accel' pointer within the CPUState.

First handle HAX/NVMM/WHPX/HVF. KVM and TCG will follow
as two different (bigger) follow-up series.

Except HVF/intel, all has been (cross-)build tested.

I plan to send the PR myself.

Since v2:
- Addressed rth's review comments
- Added rth's R-b tag

Since v1:
- Addressed rth's review comments
- Added rth's R-b tag
- Converted HVF intel (untested)
- Rebased

Philippe Mathieu-Daudé (16):
  MAINTAINERS: Update Roman Bolshakov email address
  accel: Document generic accelerator headers
  accel: Remove unused hThread variable on TCG/WHPX
  accel: Fix a leak on Windows HAX
  accel: Destroy HAX vCPU threads once done
  accel: Rename 'hax_vcpu' as 'accel' in CPUState
  accel: Rename HAX 'struct hax_vcpu_state' -> AccelCPUState
  accel: Move HAX hThread to accelerator context
  accel: Remove NVMM unreachable error path
  accel: Rename NVMM 'struct qemu_vcpu' -> AccelCPUState
  accel: Inline NVMM get_qemu_vcpu()
  accel: Remove WHPX unreachable error path
  accel: Rename WHPX 'struct whpx_vcpu' -> AccelCPUState
  accel: Inline WHPX get_whpx_vcpu()
  accel: Rename 'cpu_state' -> 'cs'
  accel: Rename HVF 'struct hvf_vcpu_state' -> AccelCPUState

 MAINTAINERS                       |   4 +-
 include/hw/core/cpu.h             |  10 +-
 include/qemu/typedefs.h           |   1 +
 include/sysemu/hax.h              |   2 +
 include/sysemu/hvf_int.h          |   2 +-
 include/sysemu/kvm.h              |   2 +
 include/sysemu/nvmm.h             |   2 +
 include/sysemu/tcg.h              |   2 +
 include/sysemu/whpx.h             |   2 +
 include/sysemu/xen.h              |   2 +
 target/i386/hax/hax-i386.h        |  12 +-
 target/i386/hvf/vmx.h             |  22 +-
 target/i386/hvf/x86hvf.h          |  18 +-
 accel/hvf/hvf-accel-ops.c         |  18 +-
 accel/tcg/tcg-accel-ops-mttcg.c   |   4 -
 accel/tcg/tcg-accel-ops-rr.c      |   3 -
 target/arm/hvf/hvf.c              | 108 ++++-----
 target/i386/hax/hax-accel-ops.c   |   5 +-
 target/i386/hax/hax-all.c         |  26 ++-
 target/i386/hax/hax-posix.c       |   4 +-
 target/i386/hax/hax-windows.c     |   6 +-
 target/i386/hvf/hvf.c             | 104 ++++-----
 target/i386/hvf/x86.c             |  28 +--
 target/i386/hvf/x86_descr.c       |  26 +--
 target/i386/hvf/x86_emu.c         |  62 ++---
 target/i386/hvf/x86_mmu.c         |   4 +-
 target/i386/hvf/x86_task.c        |  10 +-
 target/i386/hvf/x86hvf.c          | 372 +++++++++++++++---------------
 target/i386/nvmm/nvmm-all.c       |  42 ++--
 target/i386/whpx/whpx-accel-ops.c |   3 -
 target/i386/whpx/whpx-all.c       |  45 ++--
 .mailmap                          |   3 +-
 32 files changed, 469 insertions(+), 485 deletions(-)

-- 
2.38.1


