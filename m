Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73B758D342
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 07:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382686.617689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtI-0006Dy-3U; Tue, 09 Aug 2022 05:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382686.617689; Tue, 09 Aug 2022 05:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtI-0006Be-0f; Tue, 09 Aug 2022 05:34:56 +0000
Received: by outflank-mailman (input) for mailman id 382686;
 Tue, 09 Aug 2022 05:34:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IoV=YN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oLHtG-0006BY-D0
 for xen-devel@lists.xen.org; Tue, 09 Aug 2022 05:34:54 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd43ef2d-17a4-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 07:34:53 +0200 (CEST)
Received: by mail-pg1-x534.google.com with SMTP id r69so3934621pgr.2
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 22:34:52 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 j6-20020a170902da8600b001618b70dcc9sm10061085plx.101.2022.08.08.22.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 22:34:49 -0700 (PDT)
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
X-Inumbo-ID: fd43ef2d-17a4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=JNWXCMOzndx4pJJoTI4XIwB3NwTqmVIO08uDGR4x5qs=;
        b=NWAsYGfogfNAoeszebimFvZphx7Lr3ShUfzavq7C1+2Wy+gL6ZN+F+4iArdNSycUAF
         nztezNEUMpB0vnZyHLAoJDh0tOri5+N4123o706T0A0hlHOXyZF8p31NanoQVCRAtUr0
         AAQNuZpRK3Hinm/OSNvsrE9AIjH6KdklplTBB8Ff2hH1oyn6/3QErhkvCAvYjxERqN7N
         IJaHXSCtQS5AzdocBJ9rjZP1qe3ZuYOXr7UijtKS3BiXYzuW/J+creyMtT55Rfzfykay
         23uVmJHpnJKtk9a+1mVKK5gOZNgYj8xhXo8KJMB0rRRPen7MjSIR16Vd4WcCyLwZwBRl
         pYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=JNWXCMOzndx4pJJoTI4XIwB3NwTqmVIO08uDGR4x5qs=;
        b=eRyvLklYm9zK1U+mU2zbTCdwXHSfBjhg6FuYA9aRC/dmKM0uGug6PEDQFvpCYrAORo
         z7/K/TlC8uZmN13dcKBboD1uAmSE3yrBbgYPkS4E9xooxt5uukUPoI3ic2MvgFxM1A2z
         qMFxfwO+Nyw2O4YIYKvdja8KEbBZLz7hiDnZWyV5lKbcJ9KJYVjIYCQz709f01sU242U
         KtDJ9XSZAdyAOR5+DFZAcv8u4rxJIbzLH17Wtxvvn3IJ6cLjABDpRtmTY+b2TuvMqH1E
         BcVFmMMqkxrJrfe1KrXaV0ilyjPpweOlG9ufYad4maCeGpY8IjiPfj64vVnCGIPlu99B
         0S9g==
X-Gm-Message-State: ACgBeo1u4Uacr5v5ANPCOyxpjX6EfKj3siTTzxjCyGi0Mk4Y/YTpnxgI
	9r6LEfK7wVZGHfH+gmVCwIEr5Mqt9saoMg==
X-Google-Smtp-Source: AA6agR6rMctglCySAf2suKXt6TghPtg6sebc2AF+dN5iiLqMH44ckoxhjrKe1lxS0BW7nYiaMEbOUw==
X-Received: by 2002:a63:d014:0:b0:41a:13b3:69d9 with SMTP id z20-20020a63d014000000b0041a13b369d9mr18207772pgf.202.1660023290389;
        Mon, 08 Aug 2022 22:34:50 -0700 (PDT)
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
	Julien Grall <julien@xen.org>
Subject: [PATCH V4 0/6] Virtio toolstack support for I2C and GPIO on Arm
Date: Tue,  9 Aug 2022 11:04:27 +0530
Message-Id: <cover.1660023094.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset adds toolstack support for I2C and GPIO virtio devices. This is
inspired from the work done by Oleksandr for the Disk device.

This is developed as part of Linaro's Project Stratos, where we are working
towards Hypervisor agnostic Rust based backend [1].

This is based of origin/staging (commit 01ca29f0b17a ("sched: dom0_vcpus_pin
should only affect dom0")) which already has Oleksandr's patches applied.

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
 tools/libs/light/libxl_arm.c              | 166 +++++++++++++---
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
 23 files changed, 1530 insertions(+), 30 deletions(-)
 create mode 100644 tools/libs/light/libxl_gpio.c
 create mode 100644 tools/libs/light/libxl_i2c.c
 create mode 100644 tools/xl/xl_gpio.c
 create mode 100644 tools/xl/xl_i2c.c

-- 
2.31.1.272.g89b43f80a514


