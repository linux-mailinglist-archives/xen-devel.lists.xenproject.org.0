Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3011C73A58E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553729.864464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMrK-0001Jz-2u; Thu, 22 Jun 2023 16:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553729.864464; Thu, 22 Jun 2023 16:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMrK-0001Go-07; Thu, 22 Jun 2023 16:08:34 +0000
Received: by outflank-mailman (input) for mailman id 553729;
 Thu, 22 Jun 2023 16:08:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMrI-0001Gi-PC
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:08:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07eac140-1117-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 18:08:31 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f918922954so49368235e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:08:31 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 k9-20020a7bc409000000b003f9b24cf881sm10466573wmi.16.2023.06.22.09.08.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:08:30 -0700 (PDT)
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
X-Inumbo-ID: 07eac140-1117-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450110; x=1690042110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/A79JoyFfC6huza+xbUxwLYTIgxFxi3HGGy1xW4nwf8=;
        b=yogdQdljLj0VC7TAdW5mlkO4xehQvvssX0cA2nch6oDaBprLzWiFgwagXbPBEJUPzI
         8OIBQRK96iDOUORSsMWxYq09FsUAl57K3U6Spr+laGQYD3up4utpggKFA6QLgT1pnzzE
         g09YvBAEWhT3Ne6uAEZ20ASjG6NJFVrE6dhCKSAE9ftFgL2VQh2k27lBfh/eH1PALh0Z
         TigFNL8HOV955rvc2CCDmdPvrqvFji3F59lOahxFByvvXG/hhrUnXerexENOEtvdDaP7
         6ovmIZ3Podq1bNUKQAn5JcJ6oFpTB2lBDcFo1YeGaK5hyp/SsBuz0JGuRcUMA00y2fZf
         V4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450110; x=1690042110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/A79JoyFfC6huza+xbUxwLYTIgxFxi3HGGy1xW4nwf8=;
        b=eWjJjR7c7Wl9M5UEs8viOIbRsMMumeEY5B+M9lSs742MQE2lVFkjNtaMJjpORSkPW/
         qsa3b0s1dw0Z65zsr7nFMgsDavAAukKrmX9wLFzQ3I1IQly+5TL33gDNKQFXDdWwmxF6
         9BMuPOuzLq5aRo2AT0ybN2f38W59evUAF1kfPWE0D1ZQVKkg16U36XyIs3w91mk//GbT
         14wdhUNaKZ9jwceetCkZ7J8FiXTEZpdOZhrRf8smo1RghFsLRwgVfLX+SHst2lg9gWpF
         AZ98laTptTzwreoMb2vfXQ2yN7KLHD3EUHTxZRycZlUlGp12UVyqDSUNrF391aHzy3pR
         mx4w==
X-Gm-Message-State: AC+VfDwco/H5rZ0e8hDc/DSn+zlhVYTV2fslPEvTFvPg/vM9UKurYdVK
	kPL2PUca+I/Twmcs7CVVSpb4IQ==
X-Google-Smtp-Source: ACHHUZ5K2Rg4dqx8epN1plFR54zJdcZBY/04rfPHyMaRt+7mvQIveLbQzgFDlKqnployGGPzU7dMVw==
X-Received: by 2002:a05:600c:22d2:b0:3f9:b297:1804 with SMTP id 18-20020a05600c22d200b003f9b2971804mr8567893wmg.17.1687450110516;
        Thu, 22 Jun 2023 09:08:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Alexander Graf <agraf@csgraf.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 00/16] accel: Share CPUState accel context (HAX/NVMM/WHPX/HVF)
Date: Thu, 22 Jun 2023 18:08:07 +0200
Message-Id: <20230622160823.71851-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This series is part of the single binary effort.

All accelerator will share their per-vCPU context in
an opaque 'accel' pointer within the CPUState.

First handle HAX/NVMM/WHPX/HVF. KVM and TCG will follow
as two different (bigger) follow-up series.

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
  accel: Rename 'cpu_state' -> 'cpu'
  accel: Rename HVF 'struct hvf_vcpu_state' -> AccelCPUState

 MAINTAINERS                       |   4 +-
 include/hw/core/cpu.h             |  10 +-
 include/sysemu/hax.h              |   2 +
 include/sysemu/hvf_int.h          |   2 +-
 include/sysemu/kvm.h              |   2 +
 include/sysemu/nvmm.h             |   2 +
 include/sysemu/tcg.h              |   2 +
 include/sysemu/whpx.h             |   2 +
 include/sysemu/xen.h              |   2 +
 target/i386/hax/hax-i386.h        |  14 +-
 target/i386/hvf/vmx.h             |  22 +-
 target/i386/hvf/x86hvf.h          |  12 +-
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
 target/i386/hvf/x86hvf.c          | 364 +++++++++++++++---------------
 target/i386/nvmm/nvmm-all.c       |  42 ++--
 target/i386/whpx/whpx-accel-ops.c |   3 -
 target/i386/whpx/whpx-all.c       |  45 ++--
 .mailmap                          |   3 +-
 31 files changed, 462 insertions(+), 479 deletions(-)

-- 
2.38.1


