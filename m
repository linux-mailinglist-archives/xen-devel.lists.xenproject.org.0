Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E35589802
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 09:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380186.614220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUrt-0008A0-Gm; Thu, 04 Aug 2022 07:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380186.614220; Thu, 04 Aug 2022 07:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUrt-000889-CX; Thu, 04 Aug 2022 07:02:05 +0000
Received: by outflank-mailman (input) for mailman id 380186;
 Thu, 04 Aug 2022 07:02:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wk0C=YI=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oJUrr-000883-M1
 for xen-devel@lists.xen.org; Thu, 04 Aug 2022 07:02:03 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56b0d934-13c3-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 09:02:02 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id a8so5219193pjg.5
 for <xen-devel@lists.xen.org>; Thu, 04 Aug 2022 00:02:02 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 g5-20020a17090a4b0500b001f31e91200asm2833108pjh.44.2022.08.04.00.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 00:01:58 -0700 (PDT)
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
X-Inumbo-ID: 56b0d934-13c3-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6YCloTz4rK9ZTPSsprXuTgjj/k37+SDGUBkJBTTEWc=;
        b=vGT1V0KS5mQsDzTZeYW/BxV/IVD9XHv0dfzb3dRtjW1bEP3pM1S0AD3RIlGtTkAHJ/
         1DCxv1hxmido7M1LGOnxhMHC92RXK17Zo/u0NSbxxEybISdZg9oxhPqCZGkSMORxXoav
         jDiFUKsOs1+qTTbILYRKg41gyzEMkqGpi2qFMRhCqgiVjoD4p2G0Z+rRISAZ940n+sTp
         bOCCcnyBREqtuh7z5fmz1h4f+t1JxgfNqy7mebcBgkqjNCdG8SLuYKmQ6eAPa3zL9Ida
         MGF6JopNEzzE48A1ZxLteHCUPfT0j9WpAeC1bvDYR8jq4/YXnUaCy9ldzOeo2wb3uyv3
         ECxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6YCloTz4rK9ZTPSsprXuTgjj/k37+SDGUBkJBTTEWc=;
        b=WuJv2OSSAvSW4h8CdudYeRDBrLYzvZmQT8YUPIVHFjCmd7IqNZlGHXGDxpPbMHoquj
         1cww0emrtqjCZKx2ue0VC/USBuUymh7g/nXUbzi8wQBJLyHSCEfNvGqVQ22PvfFNICyU
         FgxCw3KrBSLsaP/UNGh/F+8jhb44/URsi2m/uemqqYE1tKJ/ZZ9oOw8kwclmTW3ZMmm3
         lEUsfWTa8zSwlHDcJoD3lvh0SFcfY4ld7o0T0HLiWLwfGAsLjtd+ez3DOgDBAX8KSmdQ
         bH+EZZOi00lZK2cBejEJXObZskt1cyYzpCvjfdJj9FnwtMX8AQqhMPcMVO9oiP/EkKla
         0MsQ==
X-Gm-Message-State: ACgBeo0e1N9WcQlIAVkGyLGVMjQcvDCA7Ord5eLRpsacnlYeD1lUhKCb
	A3SYy1cKpMFWTg5NQmWguqApCSAmGs8AsA==
X-Google-Smtp-Source: AA6agR5i1p3YHct5wewjflQUqsRPmnWesYXt4n10tisD8DVVl54kywGeFMcrEHZ3AwA1KItU4moAQQ==
X-Received: by 2002:a17:902:e543:b0:16f:23b5:9120 with SMTP id n3-20020a170902e54300b0016f23b59120mr629846plf.30.1659596520607;
        Thu, 04 Aug 2022 00:02:00 -0700 (PDT)
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
Subject: [PATCH V3 0/6] Virtio toolstack support for I2C and GPIO on Arm
Date: Thu,  4 Aug 2022 12:31:48 +0530
Message-Id: <cover.1659596139.git.viresh.kumar@linaro.org>
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
 tools/libs/light/libxl_arm.c              | 138 +++++++++++--
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
 23 files changed, 1509 insertions(+), 23 deletions(-)
 create mode 100644 tools/libs/light/libxl_gpio.c
 create mode 100644 tools/libs/light/libxl_i2c.c
 create mode 100644 tools/xl/xl_gpio.c
 create mode 100644 tools/xl/xl_i2c.c

-- 
2.31.1.272.g89b43f80a514


