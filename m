Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F959BC87
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 11:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391243.628975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ3Ws-0000tg-Km; Mon, 22 Aug 2022 09:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391243.628975; Mon, 22 Aug 2022 09:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ3Ws-0000rU-Hv; Mon, 22 Aug 2022 09:15:30 +0000
Received: by outflank-mailman (input) for mailman id 391243;
 Mon, 22 Aug 2022 09:15:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J63M=Y2=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oQ3Wq-0000rO-P0
 for xen-devel@lists.xen.org; Mon, 22 Aug 2022 09:15:29 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f465aaae-21fa-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 11:15:27 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id e19so9119359pju.1
 for <xen-devel@lists.xen.org>; Mon, 22 Aug 2022 02:15:25 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 z10-20020aa7990a000000b005364e0ec330sm4228931pff.59.2022.08.22.02.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:15:23 -0700 (PDT)
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
X-Inumbo-ID: f465aaae-21fa-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ZGoeLoISjkh8I8Us9ozpNp2hr0tF1YoaAFC9nA49KH0=;
        b=LJn8Mn3+diW1PM3kh7W4P2/HpjGg2v5JMAxeQWImodQgdKy3RHcHiuCagcQG8r09rC
         waMGm8hVq/RUhMcpwsrMTUcL0N71WnigZR8RVVvg2zO30AoLW1vP7cHM9eFoyY4qq5G7
         xWgFASj1nVWIDkApTmquR47n6g6RuR55G/CSWJ7+uRSnLkrSOrhgujHnhw2icGiLTnp8
         2P8C24PMv5sozxAVkADYuHZARfB0RiEhEflQh1J070FC55UP1WBzmJLu4F5iNgAGw6Hr
         UWCIlsJXkd4Z2A9e87Ll/s9DDI9zQpq7GzCip1V2iHzeCFzYaO/C6+veFaDkuSZQRy3S
         Ap/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ZGoeLoISjkh8I8Us9ozpNp2hr0tF1YoaAFC9nA49KH0=;
        b=4bspuEKK9889fpBGFsTzlas6eUGYHQshDFIpibxOMdZO0GywBO3spyydFcHtvHHDeL
         NAaKtkmkyZRvMk7jPciTVz+vFicqQ0U+gy+p/aTdWlnt185WA+hcFibtJIqdJOjuDyfR
         c6GMOEO4/24x5ZsNi/XTTNPGpxIzI0QrwfsR6KXfZk4Sri+pVeAyRAnT305/tWYtAMxg
         YzDWpH/wm+9GtgSuNaBh/30QOyCDtaS5c06B/uBI5BwYb0YOsklWBwpd1A2IiwiVYn9E
         viBV8dbRS9G1oOEYbZHSsU8bDyWuDWF1RT3dQEYaY7swwVSW3J8FWJLEHgtVMHToru50
         1F5w==
X-Gm-Message-State: ACgBeo28DQwSpxBM2JC8LaRQG2PAyu+NP9a6TTu6qBohPFPmSBCoteoQ
	fUqS3Mb2Pm/JA+j1LrVHHk5yctI22P/qGA==
X-Google-Smtp-Source: AA6agR4lVFv0o+CZLjjdxRTv6irG4QATfETPJDdOM7YoXPn2RqHlyiQ4t/rSfazokICXBS637EgoBw==
X-Received: by 2002:a17:903:24e:b0:172:6c9d:14e0 with SMTP id j14-20020a170903024e00b001726c9d14e0mr19492500plh.84.1661159723709;
        Mon, 22 Aug 2022 02:15:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	anthony.perard@citrix.com
Subject: [PATCH V5 0/6] Virtio toolstack support for I2C and GPIO on Arm
Date: Mon, 22 Aug 2022 14:45:12 +0530
Message-Id: <cover.1661159474.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset adds toolstack support for I2C and GPIO virtio devices. This is
inspired from the work done by Oleksandr for the Disk device.

This is developed as part of Linaro's Project Stratos, where we are working
towards Hypervisor agnostic Rust based backend [1].

This is based of origin/staging (commit f6cd15188e09 ("amd/msr: implement
VIRT_SPEC_CTRL for HVM guests using legacy SSBD")) which already has Oleksandr's
patches applied.

V4->V5:
- Fixed indentation at few places.
- Removed/added blank lines.
- Added few comments.
- Added review tags from Oleksandr.
- Rebased over latest staging branch.

V3->V4:
- Update virtio_enabled independently of all devices, so we don't miss setting
  it to true.

- Add iommu handling for i2c/gpio and move it as part of
  make_virtio_mmio_node_common(), which gets backend_domid parameter as a
  result.

V2->V3:
- Rebased over latest tree and made changes according to changes in Oleksandr's
  patches from sometime back.
- Minor cleanups.

V1->V2:
- Patches 3/6 and 4/6 are new.
- Patches 5/6 and 6/6 updated based on the above two patches.
- Added link to the bindings for I2C and GPIO.
- Rebased over latest master branch.


Thanks.

--
Viresh

[1] https://lore.kernel.org/xen-devel/20220414092358.kepxbmnrtycz7mhe@vireshk-i7/

Viresh Kumar (6):
  libxl: Add support for Virtio I2C device
  libxl: Add support for Virtio GPIO device
  libxl: arm: Create alloc_virtio_mmio_params()
  libxl: arm: Split make_virtio_mmio_node()
  libxl: Allocate MMIO params for I2c device and update DT
  libxl: Allocate MMIO params for GPIO device and update DT

 tools/golang/xenlight/helpers.gen.go      | 212 ++++++++++++++++++++
 tools/golang/xenlight/types.gen.go        |  54 ++++++
 tools/include/libxl.h                     |  64 ++++++
 tools/include/libxl_utils.h               |   6 +
 tools/libs/light/Makefile                 |   2 +
 tools/libs/light/libxl_arm.c              | 175 ++++++++++++++---
 tools/libs/light/libxl_create.c           |  26 +++
 tools/libs/light/libxl_dm.c               |  34 +++-
 tools/libs/light/libxl_gpio.c             | 226 ++++++++++++++++++++++
 tools/libs/light/libxl_i2c.c              | 226 ++++++++++++++++++++++
 tools/libs/light/libxl_internal.h         |   2 +
 tools/libs/light/libxl_types.idl          |  48 +++++
 tools/libs/light/libxl_types_internal.idl |   2 +
 tools/ocaml/libs/xl/genwrap.py            |   2 +
 tools/ocaml/libs/xl/xenlight_stubs.c      |   2 +
 tools/xl/Makefile                         |   2 +-
 tools/xl/xl.h                             |   6 +
 tools/xl/xl_cmdtable.c                    |  30 +++
 tools/xl/xl_gpio.c                        | 142 ++++++++++++++
 tools/xl/xl_i2c.c                         | 142 ++++++++++++++
 tools/xl/xl_parse.c                       | 160 +++++++++++++++
 tools/xl/xl_parse.h                       |   2 +
 tools/xl/xl_sxp.c                         |   4 +
 23 files changed, 1539 insertions(+), 30 deletions(-)
 create mode 100644 tools/libs/light/libxl_gpio.c
 create mode 100644 tools/libs/light/libxl_i2c.c
 create mode 100644 tools/xl/xl_gpio.c
 create mode 100644 tools/xl/xl_i2c.c

-- 
2.31.1.272.g89b43f80a514


