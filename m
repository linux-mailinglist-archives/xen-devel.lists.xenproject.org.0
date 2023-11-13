Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C190F7E9FC6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631690.985274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yka-000608-4e; Mon, 13 Nov 2023 15:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631690.985274; Mon, 13 Nov 2023 15:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yka-0005xc-1W; Mon, 13 Nov 2023 15:21:20 +0000
Received: by outflank-mailman (input) for mailman id 631690;
 Mon, 13 Nov 2023 15:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2YkY-0005il-UI
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:21:18 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ac07ae4-8238-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:21:18 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5440f25dcc7so6996530a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:21:18 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a1709062e8900b00985ed2f1584sm4168622eji.187.2023.11.13.07.21.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:21:17 -0800 (PST)
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
X-Inumbo-ID: 4ac07ae4-8238-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888877; x=1700493677; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYPq4PnrkT6VT7CGpVPJFK/tNxRA7Q2Z3pzO9BbyyC0=;
        b=uTCaWPd5GCzF6yGh3AdHcfJwS7kJkIWH1/FXEp8Xoq/ytjTz5APHvKFEga9MN22g2D
         43V2HgcBjsa7xx25ZvkRoVu/MWzAoV0Bgc8tbn53de+6055mbYtR9l9wIXRaCnbpPigB
         ks0tSJyj1Yxerg3kJTnPDrHrOz1YXirE+zkJdcKwQ4oK1A0roOe9+93eUrgB12jt3HNn
         SgsIvFmHzTCX2CU5mN7os6Bfhq/0spxUINUFd0LkZ67IEVL5QQTuHoVGPwnt1JGC4S7d
         gpvB7HIvbd8Yk1fBE4Yu9nd2OK/XMKnqiIcSYXYhMFA7miYgJAv0wTJg3jFlrZwf15NW
         pYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888877; x=1700493677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYPq4PnrkT6VT7CGpVPJFK/tNxRA7Q2Z3pzO9BbyyC0=;
        b=Y27YMd7DZ83BqMjn/JmqJ/vqi87eBOtFuzNMzM5+WVr8swjlRVQ1jq2j7SuoTpbrP1
         W3U2yahqd9iHJxho1OJfUTGVMH5waF127MwTBcPH3DNAaw4bExfHGtQ86ftG6VIlVMG5
         /2KxfNj+McozfikJLEvmCIHou3G1CZ49nf6kUVLRMcjhPZRD8iYmNS8O2rab5sj0PdVV
         R9kt/YzWaBD67OevkT2FO7rlRug3Ht9WjEymMVYa014aczd4T0mBQ3e8+3TvWmGcxxNh
         cCcF3qnh6vEkysJnIHA3+dRJl9nJmmwNXJl2hmBFwhR8bVmSTxetHAD24JQiVtaJCwNp
         ILIQ==
X-Gm-Message-State: AOJu0YxdPGGVrCaL9ldA90xXXxly6uAxQ3FdmptXBMb0VzdCoUvn3Urz
	c8h2PrdyQSXtvwYKRhtNdUDGzw==
X-Google-Smtp-Source: AGHT+IF3A9n9kAcrQZnsw9wrjTnx3rsvapxiH3ZCQBhhtTiOatMf4sVc2qaWUo7af2ThaKbG2fzFSA==
X-Received: by 2002:a17:906:410e:b0:9bf:b022:dc7 with SMTP id j14-20020a170906410e00b009bfb0220dc7mr5409271ejk.48.1699888877542;
        Mon, 13 Nov 2023 07:21:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 00/10] hw/xen: Have most of Xen files become target-agnostic
Date: Mon, 13 Nov 2023 16:21:03 +0100
Message-ID: <20231113152114.47916-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

After discussing with Alex Bennée I realized most Xen code
should be target-agnostic. David Woodhouse confirmed that
last week, so I had a quick look and here is the result.

More work is required to be able to instanciate Xen HW in
an heterogeneous machine, but this doesn't make sense yet
until we can run multiple accelerators concurrently.

Only build-tested.

Regards,

Phil.

Philippe Mathieu-Daudé (10):
  sysemu/xen: Forbid using Xen headers in user emulation
  hw/xen/xen_arch_hvm: Rename prototypes using 'xen_arch_' prefix
  hw/xen: Merge 'hw/xen/arch_hvm.h' in 'hw/xen/xen-hvm-common.h'
  hw/xen: Factor xen_arch_align_ioreq_data() out of handle_ioreq()
  hw/xen: Use target-agnostic qemu_target_page_bits()
  hw/xen: Reduce inclusion of 'cpu.h' to target-specific sources
  sysemu/xen-mapcache: Check Xen availability with
    CONFIG_XEN_IS_POSSIBLE
  system/physmem: Only include 'hw/xen/xen.h' when Xen is available
  hw/xen: Extract 'xen_igd.h' from 'xen_pt.h'
  hw/xen: Have most of Xen files become target-agnostic

 hw/xen/xen_pt.h                 | 14 --------------
 include/hw/arm/xen_arch_hvm.h   |  9 ---------
 include/hw/i386/xen_arch_hvm.h  | 11 -----------
 include/hw/xen/arch_hvm.h       |  5 -----
 include/hw/xen/xen-hvm-common.h |  8 +++++++-
 include/hw/xen/xen_igd.h        | 23 +++++++++++++++++++++++
 include/sysemu/xen-mapcache.h   |  3 ++-
 include/sysemu/xen.h            |  8 ++++----
 accel/xen/xen-all.c             |  1 +
 hw/arm/xen_arm.c                | 14 +++++++++++---
 hw/i386/pc_piix.c               |  1 +
 hw/i386/xen/xen-hvm.c           | 16 ++++++++++++----
 hw/xen/xen-hvm-common.c         | 16 +++++++---------
 hw/xen/xen_pt.c                 |  3 ++-
 hw/xen/xen_pt_config_init.c     |  3 ++-
 hw/xen/xen_pt_graphics.c        |  3 ++-
 hw/xen/xen_pt_stub.c            |  2 +-
 system/physmem.c                |  5 ++++-
 accel/xen/meson.build           |  2 +-
 hw/block/dataplane/meson.build  |  2 +-
 hw/xen/meson.build              | 13 ++++---------
 21 files changed, 85 insertions(+), 77 deletions(-)
 delete mode 100644 include/hw/arm/xen_arch_hvm.h
 delete mode 100644 include/hw/i386/xen_arch_hvm.h
 delete mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen_igd.h

-- 
2.41.0


