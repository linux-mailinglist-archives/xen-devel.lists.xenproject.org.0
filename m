Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB4F64B2FD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 11:09:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460390.718287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52DZ-0008NS-A6; Tue, 13 Dec 2022 10:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460390.718287; Tue, 13 Dec 2022 10:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52DZ-0008Kq-6T; Tue, 13 Dec 2022 10:08:57 +0000
Received: by outflank-mailman (input) for mailman id 460390;
 Tue, 13 Dec 2022 10:08:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlCu=4L=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p52DY-0008Kk-4Z
 for xen-devel@lists.xen.org; Tue, 13 Dec 2022 10:08:56 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d85e9e8-7acd-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 11:04:12 +0100 (CET)
Received: by mail-pf1-x436.google.com with SMTP id w26so1834566pfj.6
 for <xen-devel@lists.xen.org>; Tue, 13 Dec 2022 02:08:54 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 p127-20020a62d085000000b0057447bb0ddcsm7303623pfg.49.2022.12.13.02.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 02:08:51 -0800 (PST)
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
X-Inumbo-ID: 7d85e9e8-7acd-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MEPGJn9q5adU/S8s2t73LSez7yHYVZcQQj4vV0P5hUM=;
        b=X8bYor2wPy//l8ImbPwYW8T1ZQnV+3BPOtWdNGUtmHcoRzaWEnBAav0BE9bULAYNI8
         NaCF04QmC+wTkS9Kdin3ZagV6y0JNNBKGg6RMl6HonkW8djuABfLKWj3YaaYfjdTPeD/
         0cehFt8wBxd2xhtIKFlombt6aNGCrp5z5trljLEE1zAAhqLaGBFLzIpZbu+DFxvw/SDx
         hufyI/lvW4MnIaarCY5khgvH8+6Y4BTtxze6qiOzD74la8x3HUhToezPNGeDjkC1YbNz
         kt6i5H8oO07cN8iCFJD7LHyHX/aMOG2Wm/l6VR/F4cldO+CTnfks+YTsIloz/IuVYfEo
         qUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEPGJn9q5adU/S8s2t73LSez7yHYVZcQQj4vV0P5hUM=;
        b=rNkqxGge1/HxvPPJ9556DrgYcorKLHFewIa9t/Uee9FRBoJCg/i04dkhWktOHvcVpG
         W7MWsRNU7coyekSpdm1hMWGERTMdmQVp1S2nCWhHKBBX3RyS0fNsRaRJqAfpAUbfS/Xo
         dMtUHhEbbsUtUruOXRzOk3fUrjofW2VWagwRu9KkrPK4oOEng3k0mW3VMFiLWWt9bR24
         PiIwDArEitT8xWNLUV3JWo1tWUWj7MBZWFDBhZIO6mIw902WP7AGBh8R6vUhyBYS2v+P
         TXGNT6r181Simx6lljtjLj9xrAU53DR8V7aDf8GOAatlkFwP6jBmw6ioxCxFbBQj31+c
         IPig==
X-Gm-Message-State: ANoB5pkVYk3AG19SQK6zBX9ttdCo335/tCMRcqYu5HCoQYlR8qKgwjKh
	h8RAjMKB2Twk+dWgmQU+us/5aK7zmycW4SW2
X-Google-Smtp-Source: AA0mqf6oJUPIldSGXbAR/WBsPregy1vo5veyYFAEQADdpnwplQDnnEp41I49HfILwFcTY4UuYKQmLw==
X-Received: by 2002:a05:6a00:1786:b0:566:901d:cbef with SMTP id s6-20020a056a00178600b00566901dcbefmr26946623pfg.1.1670926132422;
        Tue, 13 Dec 2022 02:08:52 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH V9 0/3] toolstack support for generic virtio devices on Arm
Date: Tue, 13 Dec 2022 15:38:45 +0530
Message-Id: <cover.1670925998.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset adds toolstack support for I2C, GPIO and generic virtio devices.
This is inspired from the work done by Oleksandr for the Disk device.

This is developed as part of Linaro's Project Stratos, where we are working
towards Hypervisor agnostic Rust based backends [1].

This is based of Xen's master branch.

V8->V9:
- Drop changes to tools/ocaml/libs/xl/genwrap.py file.
- Replace GPIO with I2C in a comment.
- Add Reviewed-by tags.

V7->V8:
- Use macros for compatible string names.
- Use strcmp() instead of strncmp() at several places.
- Rename "virtio,devices" to "virtio,device" in commit log.
- Remove extra call to fdt_end_node().
- Disallow "unknown" in xenstore transport.
- Use libxl__strdup().
- Update documentation.
- Remove DEVICE_ADDREMOVE(virtio).

V6->V7:
- Support generic virtio devices too. They are passed with type=virtio,device,
  and we only create the MMIO DT node for them.
- Add links to DT bindings of I2C and GPIO, in code and documentation.
- Call libxl__device_add() for all hypervisor types.
- Add (0, "UNKNOWN") for libxl_virtio_transport.
- Removed libxl_virtio_backend and libxl_virtioinfo, as they were unused.
- Remove unnecessary stuff from libxl__virtio_from_xenstore() and add support
  for type and transport.
- Add backend=domid in documentation and replace compatible with type.
- Improved commit logs.

V5->V6:
- The cleanup patches are sent separately [2].
- We don't add I2C or GPIO specific device changes anymore, rather we create
  generic "virtio" devices. The "type" of a virtio devices helps us identify the
  right device, and create an entry in the DT node. The same can be used for all
  Virtio devices now.
- Update man page xl.cfg.

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

Viresh Kumar (3):
  libxl: Add support for generic virtio device
  xl: Add support to parse generic virtio device
  docs: Add documentation for generic virtio devices

 docs/man/xl.cfg.5.pod.in                  |  33 +++++
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_arm.c              | 100 +++++++++++++++
 tools/libs/light/libxl_create.c           |   4 +
 tools/libs/light/libxl_internal.h         |   6 +
 tools/libs/light/libxl_types.idl          |  18 +++
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_virtio.c           | 144 ++++++++++++++++++++++
 tools/xl/xl_parse.c                       |  81 ++++++++++++
 9 files changed, 388 insertions(+)
 create mode 100644 tools/libs/light/libxl_virtio.c

-- 
2.31.1.272.g89b43f80a514


