Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E189E1733
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847514.1262591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6U-0003E2-Tw; Tue, 03 Dec 2024 09:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847514.1262591; Tue, 03 Dec 2024 09:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6U-0003Bk-QP; Tue, 03 Dec 2024 09:21:58 +0000
Received: by outflank-mailman (input) for mailman id 847514;
 Tue, 03 Dec 2024 09:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzh2=S4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tIP6T-0003Be-Gf
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:21:57 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a52347e-b158-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:21:56 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53de8ecb39bso6148779e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 01:21:56 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c1945sm587682966b.19.2024.12.03.01.21.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:21:55 -0800 (PST)
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
X-Inumbo-ID: 0a52347e-b158-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733217716; x=1733822516; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YrECqGgLUZ1d6WAaLttV2kaR/8HcO6J1SyjXJDIUtI=;
        b=TIAJWMPqwpUutjBdCnY/UZcjjrboxyd3RJA699GFOfyK/0UN+9Hr+X2YvsFo7UCCUt
         9eoBRrHLkVTMw61jY32+nOgWr+AWEb6wYGxa2zFWtd6kMXcKApgFP+9OOwqCpQMokwzS
         5zippWFE+6K3j4r80/VavGgZtP7L5w5crzA6vRSmCKb0Fr/QftgIFGojXAJq1Urk3PXu
         svqH+SmCZ8WlvAj+0Wu7vHg+LAw8B95nu3Cp6NoFEUwRWsGtioU5GSnYRT69Df95clx3
         san7d4MKP4KGdz4vlDcPYgdJjeP/1JT8UN9mLkmzh8m93xBzxuzTCQvQ9PgL8nd/v/0U
         E/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217716; x=1733822516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YrECqGgLUZ1d6WAaLttV2kaR/8HcO6J1SyjXJDIUtI=;
        b=C4+x4h1AU+tZDSSwW1y5bA4iztUpjvqQdfK+iMeYlnu/88zrEnkMGRlt4fVJ5iHjXo
         TZZX318/obK2fLuxbRewnbEyop5ZV4Ang3Ij6YoVWOHPoXxqmLw8snxNxRIdxV6C3obj
         bZqtKP00ENnm49dMfo0Wm2NsBDgDeH74XYRYvdWr7c2+BUupqKbkMUrK9reTFKtv9GfM
         ZIpIeh+io0JUpvVZy+E9cAE9eYO7rlbun/2QfCeReDE1CdPtPOHDo7/CzQHyEzPcNXxh
         UEK6fa5sFLO9jG2JiTnEw6eBfYXFamFBuzsCruUpsXC11rS0RUA4eOsCT72bDgsaNJU7
         sdyA==
X-Forwarded-Encrypted: i=1; AJvYcCXgrNn9GvZRw+BMLNcrFwGk57Fc0FLgiKleoqWjeyt6Oj8vzIsoAx4iE42cGld3SG3dbpZkUyqQ3Ew=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMI3az25+Q2TOHegzGxW3cTjdCSZDj71tNfxO4nx24Xf/KZjy6
	dotCpxmKj+Y/lwDp/q2PXmqOj310akcYkkiQkPSxWdSz7gMvSWGeSS4VQEfMbPo=
X-Gm-Gg: ASbGncuzlLj4Nbd3CTMEnouFGS35AfV9QfwkTykKSiu+u20QhpuafmCkZH4dnNMeoah
	zUBDHNyJ6O22JeCooLmIVrSCOFLjbl+6dPkut2euK87XVjsUiHmNYYlNPsxlAGBL4/6ntHesRwH
	Mp+hNJn0qJFDl10MFFgFU944YVfsVayZNWwn9qlIL+Cyaoeoc5PlTWQDiG3v9WnPCmuZpn+cS1P
	yVHgC5Zwp25WcWhERW1QPi1Wu5tFZvKW6vFI28Ket6WOldNOgDFhrbauut8DwHaVkAs3U3C
X-Google-Smtp-Source: AGHT+IGkt6mxy3bo2pU8QJ+xjjL4dNnVHS7c3xduFhLG6J04XUp0rGi+FzFB5ZjxOtJwHrXFCV9gJQ==
X-Received: by 2002:a05:6512:1313:b0:53d:ed94:fe64 with SMTP id 2adb3069b0e04-53e129ef4aemr1305626e87.10.1733217715863;
        Tue, 03 Dec 2024 01:21:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/7] cli: Remove mentions of legacy '-machine foo,accel=bar' command line
Date: Tue,  3 Dec 2024 10:21:46 +0100
Message-ID: <20241203092153.60590-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Thomas told '-machine foo,accel=bar' is sugar and almost
deprecated. Rather than having bad examples in the tree,
remove the legacy form and update to the new '-accel bar'
one.

Xen uses via MachineClass::default_machine_opts left for later:

hw/i386/pc_piix.c:818:    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
hw/i386/pc_piix.c:830:    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
hw/xen/xen-pvh-common.c:381:    mc->default_machine_opts = "accel=xen";
hw/xenpv/xen_machine_pv.c:69:    mc->default_machine_opts = "accel=xen";

Philippe Mathieu-Daudé (7):
  tests/functional/test_ppc64_hv: Remove legacy '-machine foo,accel=bar'
  tests/functional/test_virtio_gpu: Remove legacy '-machine
    foo,accel=bar'
  tests/qtest/fuzz: Remove legacy '-machine foo,accel=bar'
  scripts/device-crash-test: Remove legacy '-machine foo,accel=bar'
  accel/tcg: Remove mentions of legacy '-machine foo,accel=bar'
  accel/kvm: Remove mentions of legacy '-machine foo,accel=bar'
  qemu-options: Remove mentions of legacy '-machine foo,accel=bar'

 docs/about/removed-features.rst                |  2 +-
 docs/bypass-iommu.txt                          |  3 ++-
 docs/nvdimm.txt                                |  2 +-
 docs/specs/tpm.rst                             |  2 +-
 docs/system/arm/cpu-features.rst               |  2 +-
 docs/system/cpu-hotplug.rst                    |  2 +-
 docs/system/ppc/powernv.rst                    |  2 +-
 docs/system/ppc/pseries.rst                    |  4 ++--
 linux-user/s390x/target_proc.h                 |  2 +-
 accel/tcg/monitor.c                            |  4 ++--
 system/vl.c                                    |  2 +-
 tests/qtest/fuzz/generic_fuzz.c                |  2 +-
 tests/qtest/fuzz/i440fx_fuzz.c                 |  2 +-
 tests/qtest/fuzz/qos_fuzz.c                    |  2 +-
 tests/qtest/qmp-cmd-test.c                     |  2 +-
 qemu-options.hx                                |  9 ---------
 scripts/device-crash-test                      | 11 ++++++++---
 scripts/oss-fuzz/output_reproducer.py          |  2 --
 scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py |  6 +++---
 tests/functional/test_ppc64_hv.py              |  3 ++-
 tests/functional/test_virtio_gpu.py            |  6 ++++--
 21 files changed, 35 insertions(+), 37 deletions(-)

-- 
2.45.2


