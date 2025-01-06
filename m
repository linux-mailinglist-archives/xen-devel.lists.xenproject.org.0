Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D610A0310C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865899.1277185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtJc-0002gm-8l; Mon, 06 Jan 2025 20:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865899.1277185; Mon, 06 Jan 2025 20:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtJc-0002eC-5y; Mon, 06 Jan 2025 20:03:08 +0000
Received: by outflank-mailman (input) for mailman id 865899;
 Mon, 06 Jan 2025 20:03:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH3c=T6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tUtJb-0002e6-ES
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:03:07 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d0314b3-cc69-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 21:03:04 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436202dd730so105999775e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 12:03:04 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b3b2a4sm611962245e9.27.2025.01.06.12.02.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Jan 2025 12:03:01 -0800 (PST)
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
X-Inumbo-ID: 3d0314b3-cc69-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736193783; x=1736798583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IVQDyU0aZGqnbGo58WYklNw0MeL8aFrKkG5Vri/XHzI=;
        b=K4ceTbOG2KX/ZFEBwDxgjCIH0T+7OzmE+FLxEy7KrSV4eusCt6SaJDhluG7/oj2TUD
         CeQkQ8VVXIQa32VR0Cc2g/35ZeDljR6EnqtALffXfDaj/jRqq3fHghtVWjrQTdHqsCr3
         pdy7DeCcQeRfKYZItU7TtuixJkaSvXyP6xVud1pY4Yi6Sbgtpf1icP2Ulr0XEiBq16nd
         9zQxYrpbJusIEetuJhHj0gdmvEnPiiDA7FWfHAjxs9wKiUH1qSkbooDaVfuhrhSlaD9b
         GLYq3bImjWBlybjECnqvSxDcrtsVq9/PN6Ul+78Z0oxLGgQFlLtzFK1YDIVeOpCCVV53
         eqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193783; x=1736798583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVQDyU0aZGqnbGo58WYklNw0MeL8aFrKkG5Vri/XHzI=;
        b=fi3nidnxVBJCET1rsWAKB1NqA8Jc8V+0cMaZ87udw3ql1PzEGYivjEajRA8nlevR94
         f3I7wFyFE103t3lPeWcOeTKq/ihYKHaUZ+s3hrib5OLfO5MaeXvIg0+je1cNRc5QP060
         PuFJiyTyhZVZCZthZIK3xVi82bfNguIHArEdOto/AxtUdHqhkOq49SHTH1/zrxlxRQQW
         XsRjwDH8h7xYvIvX4q2jQaSIh1NVUsTIjK2rjnnoJp1iH5DMT7bWmMu2nOb4+CAi5may
         GJyD+Q0xWhzurZ4niGh4k0wB4U/nH8PkB+LMu6/E78gYJ0rjc5CEAiSDbrueBX46UwOo
         beGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXCbA6APnFwncDYzspKK023VPBLN8xe3elEga/tfsop+R42zc1IXPyPD52RAmbKR3rL2hzdgnr+7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz22jsmjExWKqcgGr7LcHntZrBL9dk92yxwmGRDNEWOUqX1bFqO
	LhQr4FBtbqJKtUFwcmDD5RIOPHMfTMn0ipDln6A7cbHWLvnxJ0Ikz4WgVeEo6xk=
X-Gm-Gg: ASbGncunNMXsIeGd0MHSYTHa/rFSvft8xn7Q7S/EbvJPW3PGhFN8k5KvtXyxHVd0nVy
	XBCyegzSYn2nbTQsn4MBE7HzQu6VnpA8AbUlZZmGTBNYV8sgAhxpwDXBGmbFWD6mwHW9IYMBGy0
	7y08in0BCAlBISvvXQ48+2O7Di8q71eHHQkP0wj7oCTctJcAacEWEUvtxE3qQVulUMCbhIIRoP2
	Mc+HfKuEoqGpJoPU1I071ZxGxSy95TLfbYFKAdGw/W3CM5qNJXAsUUkfBo/emVdRTWoIJ7BaJH6
	FbQjXg8rNmrjkNg+PiEQJQgdFm8o4To=
X-Google-Smtp-Source: AGHT+IEvY1dOIYQWFga9MrJsSFG0JoKzIh1x57mMzgTfD/hBdAZ0c+WqLtNl81G5solsww92cOjYAA==
X-Received: by 2002:a05:600c:450f:b0:434:fb65:ebbb with SMTP id 5b1f17b1804b1-436686461cbmr539399575e9.17.1736193783280;
        Mon, 06 Jan 2025 12:03:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Alexander Graf <agraf@csgraf.de>,
	Paul Durrant <paul@xen.org>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Anthony PERARD <anthony@xenproject.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anton Johansson <anjo@rev.ng>
Subject: [RFC PATCH 0/7] accel: Add per-accelerator vCPUs queue
Date: Mon,  6 Jan 2025 21:02:51 +0100
Message-ID: <20250106200258.37008-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

Currently we register all vCPUs to the global 'cpus_queue' queue,
however we can not discriminate per accelerator or per target
architecture (which might happen in a soon future).

This series tries to add an accelerator discriminator, so
accelerator specific code can iterate on its own vCPUs. This
is required to run a pair of HW + SW accelerators like the
(HVF, TCG) or (KVM, TCG) combinations. Otherwise, i.e. the
HVF core code could iterate on TCG vCPUs...
To keep it simple and not refactor heavily the code base,
we introduce the CPU_FOREACH_TCG/HVF/KVM() macros, only
defined for each accelerator.

This is just a RFC to get some thoughts whether this is
heading in the correct direction or not ;)

Regards,

Phil.

Philippe Mathieu-Daudé (7):
  cpus: Restrict CPU_FOREACH_SAFE() to user emulation
  cpus: Introduce AccelOpsClass::get_cpus_queue()
  accel/tcg: Implement tcg_get_cpus_queue()
  accel/tcg: Use CPU_FOREACH_TCG()
  accel/hw: Implement hw_accel_get_cpus_queue()
  accel/hvf: Use CPU_FOREACH_HVF()
  accel/kvm: Use CPU_FOREACH_KVM()

 accel/tcg/tcg-accel-ops.h         | 10 ++++++++++
 include/hw/core/cpu.h             | 11 +++++++++++
 include/system/accel-ops.h        |  6 ++++++
 include/system/hvf_int.h          |  4 ++++
 include/system/hw_accel.h         |  9 +++++++++
 include/system/kvm_int.h          |  3 +++
 accel/accel-system.c              |  8 ++++++++
 accel/hvf/hvf-accel-ops.c         |  9 +++++----
 accel/kvm/kvm-accel-ops.c         |  1 +
 accel/kvm/kvm-all.c               | 14 +++++++-------
 accel/tcg/cputlb.c                |  7 ++++---
 accel/tcg/monitor.c               |  3 ++-
 accel/tcg/tb-maint.c              |  7 ++++---
 accel/tcg/tcg-accel-ops-rr.c      | 10 +++++-----
 accel/tcg/tcg-accel-ops.c         | 16 ++++++++++++----
 accel/tcg/user-exec-stub.c        |  5 +++++
 accel/xen/xen-all.c               |  1 +
 cpu-common.c                      | 10 ++++++++++
 hw/i386/kvm/clock.c               |  3 ++-
 hw/intc/spapr_xive_kvm.c          |  5 +++--
 hw/intc/xics_kvm.c                |  5 +++--
 system/cpus.c                     |  5 +++++
 target/arm/hvf/hvf.c              |  4 ++--
 target/i386/kvm/kvm.c             |  4 ++--
 target/i386/kvm/xen-emu.c         |  2 +-
 target/i386/nvmm/nvmm-accel-ops.c |  1 +
 target/i386/whpx/whpx-accel-ops.c |  1 +
 target/s390x/kvm/kvm.c            |  2 +-
 target/s390x/kvm/stsi-topology.c  |  3 ++-
 29 files changed, 130 insertions(+), 39 deletions(-)

-- 
2.47.1


