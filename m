Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673BAA1C4CC
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 19:14:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877005.1287202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfG-0004cc-13; Sat, 25 Jan 2025 18:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877005.1287202; Sat, 25 Jan 2025 18:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfF-0004ap-Ua; Sat, 25 Jan 2025 18:13:49 +0000
Received: by outflank-mailman (input) for mailman id 877005;
 Sat, 25 Jan 2025 18:13:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X0T4=UR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tbkfE-0004aj-Kf
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 18:13:48 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e3caa5b-db48-11ef-a0e5-8be0dac302b0;
 Sat, 25 Jan 2025 19:13:46 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso20958985e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 10:13:46 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd48b000sm70555435e9.20.2025.01.25.10.13.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 10:13:44 -0800 (PST)
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
X-Inumbo-ID: 1e3caa5b-db48-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828826; x=1738433626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=moGB9VY6BYgn3pI64/Eq1yuXgBP6nQhiwk+gTGBd7L0=;
        b=sFHxu4AFvNC9sNk6XZu1+U7thV0oKG/TE8O6eQoiQTPTrowRm8SapVL8g0Gz2B6okJ
         z0tBRoBNhhY5Fsuf49qSwrVvoHvtBufFCepdKZ930mscVUdEsMjdNerikwUkopYxT6Ij
         WBfXxRN6jYkE6vTeHsiF/sVxQHJM8Xp6TiWRdDKRzsO5X3yT5lYtSCuUZGn8AsRzgGaE
         Pn1LySNwjAhh9YHKblJzGM/VhivFDJH/9SOwCtNCclj0G/GMKr5dfB4Pdhrm0nAEoxVI
         ONn9AcHpSc3k27W4xS/gh8FKZznFMjpMpXFw80YvwfNja7OdTgPnNrRZgFf59GuQoSI2
         F0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828826; x=1738433626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moGB9VY6BYgn3pI64/Eq1yuXgBP6nQhiwk+gTGBd7L0=;
        b=aBNY+OR3DtgNZw5qu7amU68cV60qYO7uQkVdhNFQZRXJmwBBF1LA43fLfxeaGbbKsk
         dZFGIPs4sRGejPkNJR1U8s5lo7jAgIbKWCRwyX0Knf3VLv19gt4JYMy0haziiS378hF+
         a8WALfRGo05hCJwSRvbAdDqzSB+7ehwLpD8DUYsBxv06afEaf3+GIVAvq36TOBZ/O90E
         bVYTPnQ2RvoZWr+wXZ+sTxX1tpabv5Zk/f6GVfKt4vlcQ6DXwdx+dlmi9yScJp6IxuE0
         O6HyfTM25baMSk84pNVvretAYx5cEYNMvl1HJYxtdstmaV/wID3VoDI+0xqSCvfKiKmp
         ce+A==
X-Forwarded-Encrypted: i=1; AJvYcCXT5m+o84cam8d2AqgH1uX6R80HAMxiU+X7KemLrS+KwZ+3tVf5JQp5kpf2yg9EtqlvhKaHdYIoF4I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxB7Yw45F8QwvBWmCAmf558Z82N/dBFGTqQikbNRs4U14lJq+l/
	kVNYwE9UbJhw6vXBQU13iutp6Zw19O4ntqKCAZe2vU7TEnesTvHFF0fWCUfil6s=
X-Gm-Gg: ASbGncvIh3Go2y8uIV4QhT46nrDmuSyizUsIoXmqBpbkG2AShVl2DPkcVbD1IJ+yDso
	Gngl0GcSI9SGDr20KA340gyKCQdyTHRqrHnZ48CIJ1IXmFkKeyFgu88cTDDHweBrXCQc1wueRP1
	etpjnwa3TtTPlYTR4beNTxHF0RLwi9w5GrX68wKZUH30+TNhAwAaWZBaAbRK90n6RRy+q9teYIr
	NWnlyGN5I+Tq6BtNi7vkYbcXebVk3YNDF1kcjKOUOk1DEBJ7LGJiPjdtJ8TB3iyjgsCAQiUuwQD
	EarPM5WfdC4m5f5VajRbqczyGX/KhCgyqbEHYRPTlrHvai6ISQFa+oN/sUjz
X-Google-Smtp-Source: AGHT+IFFcuv4NbqWEewutKdT/4sas20HtAvh9/vbvnAdvh7QUUP5Q6Afr6fZs6XUltdZIWZYDYhKXA==
X-Received: by 2002:a05:600c:1d07:b0:436:488f:50a with SMTP id 5b1f17b1804b1-438913ef4b7mr333870305e9.17.1737828825695;
        Sat, 25 Jan 2025 10:13:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Jason Wang <jasowang@redhat.com>,
	qemu-ppc@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] hw/sysbus/platform-bus: Introduce TYPE_DYNAMIC_SYS_BUS_DEVICE
Date: Sat, 25 Jan 2025 19:13:34 +0100
Message-ID: <20250125181343.59151-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Some SysBus devices can optionally be dynamically plugged onto
the sysbus-platform-bus (then virtual guests are aware of
mmio mapping and IRQs via device tree / ACPI rules).

This series makes these devices explicit by having them implement
the DYNAMIC_SYS_BUS_DEVICE class, which only sets 'user_creatable'
flag to %true but makes the codebase a bit clearer (IMHO, at least
now we can grep for DYNAMIC_SYS_BUS_DEVICE).

Philippe Mathieu-Daudé (9):
  hw/sysbus: Use sizeof(BusState) in main_system_bus_create()
  hw/sysbus: Declare QOM types using DEFINE_TYPES() macro
  hw/sysbus: Introduce TYPE_DYNAMIC_SYS_BUS_DEVICE
  hw/vfio: Have VFIO_PLATFORM devices inherit from
    DYNAMIC_SYS_BUS_DEVICE
  hw/display: Have RAMFB device inherit from DYNAMIC_SYS_BUS_DEVICE
  hw/i386: Have X86_IOMMU devices inherit from DYNAMIC_SYS_BUS_DEVICE
  hw/net: Have eTSEC device inherit from DYNAMIC_SYS_BUS_DEVICE
  hw/tpm: Have TPM TIS sysbus device inherit from DYNAMIC_SYS_BUS_DEVICE
  hw/xen: Have legacy Xen backend inherit from DYNAMIC_SYS_BUS_DEVICE

 include/hw/sysbus.h           |  2 ++
 include/hw/xen/xen_pvdev.h    |  3 +-
 hw/core/sysbus.c              | 53 ++++++++++++++++++++---------------
 hw/display/ramfb-standalone.c |  3 +-
 hw/i386/amd_iommu.c           |  2 --
 hw/i386/intel_iommu.c         |  2 --
 hw/i386/x86-iommu.c           |  2 +-
 hw/net/fsl_etsec/etsec.c      |  4 +--
 hw/tpm/tpm_tis_sysbus.c       |  3 +-
 hw/vfio/amd-xgbe.c            |  2 --
 hw/vfio/calxeda-xgmac.c       |  2 --
 hw/vfio/platform.c            |  4 +--
 hw/xen/xen-legacy-backend.c   |  7 ++---
 13 files changed, 42 insertions(+), 47 deletions(-)

-- 
2.47.1


