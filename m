Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A3364C376
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 06:20:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461678.719808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5KBM-0001se-Mf; Wed, 14 Dec 2022 05:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461678.719808; Wed, 14 Dec 2022 05:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5KBM-0001qD-Jp; Wed, 14 Dec 2022 05:19:52 +0000
Received: by outflank-mailman (input) for mailman id 461678;
 Wed, 14 Dec 2022 05:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtkE=4M=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p5KBK-0001q7-Qg
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 05:19:50 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edb919ce-7b6e-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 06:19:49 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so5865576pjd.5
 for <xen-devel@lists.xen.org>; Tue, 13 Dec 2022 21:19:49 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 3-20020a17090a08c300b0021937b2118bsm395935pjn.54.2022.12.13.21.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 21:19:46 -0800 (PST)
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
X-Inumbo-ID: edb919ce-7b6e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k9S/I5H56OQfUtRRUB+uh1kRSu48OPEPKhm4BNOTasE=;
        b=FVIMjHJEap/07K1ESAvavwHEl5dK5kB2XpHslc/awSoiNXKs37VzUHISOmjRKJ1nQB
         X7iQwenOKxGTe8qn6b7Lsy6f24jLQvzo10qhhNPSW62eatbpXstLzN1r/gWTktjS1h1P
         lbTa2YC4D3mXKpYxk4/Mb5ZGW0hNW4rdknTgW/juKEwPUxGhiGCIODSA+DlU+F3XcABs
         Z6gDubR5phHt5FlhjgES9aWmpB35zXD0KtweN/RBRUmgoZ0Wm1oUfLqXWCtCxpyv8IWJ
         XSa0ZnNMcJ4stMfM28rDgLD47DOaUdvGMz/5enoburENJaeirX/dJqaOtxfsgxP5nPJY
         cC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9S/I5H56OQfUtRRUB+uh1kRSu48OPEPKhm4BNOTasE=;
        b=4jsh0dvlx+UmOHkXTFGR9/dHABVLXKQBIr5KrPQBbHakNJJ6wgG+4Hsos8TcgKMRV4
         1NTSv3O1dddqIKaD+r1i48sN0yYr/ssw9PhdtNVqLsZAsa4zcVJfMq3gItaErgD1DZi8
         aG2mG2fnMb/vyCD+4fWCIFphh46+XrdDAUtUDyMGzSydEM5piNaGuXvq2xud4IMkyMHR
         4HaRYYSuHD6Zo4Ccg4yIzCNbqYRvbHNmmnFUFak/KMmE6GZmYrr0BFsfq21mqNqMXGXG
         TnDYxe5qOVFxp1u7yq43FDth2vjC8c8IDE06uDAKqV2M6eP0FX3ElP806Ths9LtzkG1r
         eJIw==
X-Gm-Message-State: ANoB5pmTKyfGIH9/8R/h63kRxlGwtF3qEeolIdoDg1ySgYRY1gK2zmUe
	sf/8Gp4ODLJ1buFB7PWt2rgjMUbdBW6E/zwD
X-Google-Smtp-Source: AA0mqf6P1nJKn8c3Ys2Jse0scUjnMOELsQioU6D5lAv/hgsGdIoRvBu5qRoLyyDDEmELm6bGpL30tA==
X-Received: by 2002:a17:90a:17e8:b0:21a:2306:a9bc with SMTP id q95-20020a17090a17e800b0021a2306a9bcmr23173134pja.7.1670995187682;
        Tue, 13 Dec 2022 21:19:47 -0800 (PST)
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
Subject: [PATCH V10 0/3] toolstack support for generic virtio devices on Arm
Date: Wed, 14 Dec 2022 10:49:39 +0530
Message-Id: <cover.1670994930.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset adds toolstack support for I2C, GPIO and generic virtio devices.
This is inspired from the work done by Oleksandr for the Disk device.

This is developed as part of Linaro's Project Stratos, where we are working
towards Hypervisor agnostic Rust based backends [1].

This is based of Xen's master branch.

V9->V10:
- Swap I2C/GPIO compatible strings, they were wrongly added earlier.
- Arrange tags in timely order and add new ones.

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


