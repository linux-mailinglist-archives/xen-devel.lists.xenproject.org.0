Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA91A6D7970
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:18:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518389.804870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0DZ-00028F-Na; Wed, 05 Apr 2023 10:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518389.804870; Wed, 05 Apr 2023 10:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0DZ-00026O-Ky; Wed, 05 Apr 2023 10:18:17 +0000
Received: by outflank-mailman (input) for mailman id 518389;
 Wed, 05 Apr 2023 10:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0DY-00024X-0j
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:18:16 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d2ca14d-d39b-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 12:18:15 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso2518425wmq.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:18:15 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c451000b003ef66c89af0sm5203608wmo.0.2023.04.05.03.18.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:18:14 -0700 (PDT)
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
X-Inumbo-ID: 2d2ca14d-d39b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3c7APLhxJFNCqIErCGS2nhF3aw+HLHuokeVO/lFk00=;
        b=OBiO/iyMPp7HhyBZcX7fJgp2AA6LNBmXbyqspQfxTpbw5ifIhJkHachSnVGxiHum7T
         pDyTjdZU/TDYDH8YqIYCNPP2VKdx3wdUBLlBxM9gzo34nXlEfQws3UH3CuMpU0XuvBtJ
         BR0Y9rfffghCpUn3Lq722SfA08hTOExgU+rQvnILo+j+5Ft88ticBqenXwg5p/GlGvca
         41krEivQExeKbzC6OcydV1hPviKH9pwe4ul7G2ol7M0QTifUHh3PLePZ/6n5cypktE9F
         2KVXZ7OB0raOVG9XCJUMp3dAf1zpvJiqWUaGdW48AgcrjBnZSMXe3CucyEtdxru47k5Y
         KTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3c7APLhxJFNCqIErCGS2nhF3aw+HLHuokeVO/lFk00=;
        b=02+2NsZRj3ClHmrk2mN+2kEpRFejs3Hr7gcidK/z/jKApKg1J0cBk8FJ3L0HO1XpUL
         U18pr8UcZg9HJ7EErCmhh2HxtxS01X7YNxoGl9hhks/Z7DQEbYMrOQWMw/Vkrdn7qP1W
         mLAl590KJXd4EbSVxY/pY4HGB11lZo5P/7KldgVnexFnA/o568y5moafCHWgZaUDZrCH
         S2WoqYfWmoFIJQdywrhD9GkxeXHrkhkv+DUx4Vg1kF3f8fT7/gL1YtCbbXblDfJnOQQo
         eBag7eNHedLxFJ4RYwuXf4fTPEn4kpBlhxQbBkfYzR4u5QUvtuFtejOmRIVnwsthISai
         gJlA==
X-Gm-Message-State: AAQBX9dxAXx/87IUkGCQaxOIBAJNtSRgL1oWfFsc1o6K/byLElVut8eg
	pWoulLeD6kRRcXx3hmPp6AVq0g==
X-Google-Smtp-Source: AKy350Ybve9k60nXpw2N7+saf2pFb1rgNJYM8Jf0Z78V3ulPWVpu1aVqOeAnHikWi6TcyhWdL0mjyg==
X-Received: by 2002:a7b:c4d3:0:b0:3ed:551b:b78f with SMTP id g19-20020a7bc4d3000000b003ed551bb78fmr4181570wmk.4.1680689894558;
        Wed, 05 Apr 2023 03:18:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/14] accel: Share CPUState accel context (HAX/NVMM/WHPX/HVF)
Date: Wed,  5 Apr 2023 12:17:57 +0200
Message-Id: <20230405101811.76663-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This series is part of the single binary effort.

All accelerator will share their per-vCPU context in
an opaque 'accel' pointer within the CPUState.

First handle HAX/NVMM/WHPX/HVF. KVM and TCG will follow
as two different (bigger) follow-up series.

Philippe Mathieu-Daudé (14):
  accel: Document generic accelerator headers
  accel: Remove unused hThread variable on TCG/WHPX
  accel: Fix a leak on Windows HAX
  accel: Destroy HAX vCPU threads once done
  accel: Rename 'hax_vcpu' as 'accel' in CPUState
  accel: Use a typedef for struct hax_vcpu_state
  accel: Rename struct hax_vcpu_state -> struct AccelvCPUState
  accel: Move HAX hThread to accelerator context
  accel: Allocate NVMM vCPU using g_try_FOO()
  accel: Rename NVMM struct qemu_vcpu -> struct AccelvCPUState
  accel: Inline NVMM get_qemu_vcpu()
  accel: Rename WHPX struct whpx_vcpu -> struct AccelvCPUState
  accel: Inline WHPX get_whpx_vcpu()
  accel: Rename HVF struct hvf_vcpu_state -> struct AccelvCPUState

 include/hw/core/cpu.h             | 11 ++---
 include/sysemu/hax.h              |  2 +
 include/sysemu/hvf_int.h          |  2 +-
 include/sysemu/kvm.h              |  2 +
 include/sysemu/nvmm.h             |  2 +
 include/sysemu/tcg.h              |  2 +
 include/sysemu/whpx.h             |  2 +
 include/sysemu/xen.h              |  2 +
 target/i386/hax/hax-i386.h        | 14 ++++---
 accel/hvf/hvf-accel-ops.c         | 16 +++----
 accel/tcg/tcg-accel-ops-mttcg.c   |  4 --
 accel/tcg/tcg-accel-ops-rr.c      |  3 --
 target/arm/hvf/hvf.c              | 70 +++++++++++++++----------------
 target/i386/hax/hax-accel-ops.c   |  5 ++-
 target/i386/hax/hax-all.c         | 26 +++++++-----
 target/i386/hax/hax-posix.c       |  4 +-
 target/i386/hax/hax-windows.c     |  6 +--
 target/i386/nvmm/nvmm-all.c       | 38 +++++++----------
 target/i386/whpx/whpx-accel-ops.c |  3 --
 target/i386/whpx/whpx-all.c       | 39 +++++++----------
 20 files changed, 123 insertions(+), 130 deletions(-)

-- 
2.38.1


