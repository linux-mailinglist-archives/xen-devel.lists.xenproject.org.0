Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F428649BBA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:10:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459354.717074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fks-0002ts-HE; Mon, 12 Dec 2022 10:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459354.717074; Mon, 12 Dec 2022 10:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fks-0002rS-EH; Mon, 12 Dec 2022 10:09:50 +0000
Received: by outflank-mailman (input) for mailman id 459354;
 Mon, 12 Dec 2022 10:09:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Osd=4K=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p4fkr-0002rI-7u
 for xen-devel@lists.xen.org; Mon, 12 Dec 2022 10:09:49 +0000
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aac9c77-7a05-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 11:09:48 +0100 (CET)
Received: by mail-pg1-x52e.google.com with SMTP id s196so7850204pgs.3
 for <xen-devel@lists.xen.org>; Mon, 12 Dec 2022 02:09:46 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 v7-20020aa799c7000000b0055f209690c0sm5420563pfi.50.2022.12.12.02.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 02:09:44 -0800 (PST)
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
X-Inumbo-ID: 1aac9c77-7a05-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+ck/6s0uEGW3Re0NhZjSPZg1E1YnAhnPK1yQJonRaw=;
        b=sYF5OkanDbqCDtZkVXhGNWkWHtfR3FOut35EvalQlJVvEvKkfh62wIKxBnK8l4TZX7
         mP4H9r1Js2PRHLZstf4GnbDun2lh9HrD6KBDWuCspEqkPZVg5MJs/4lefFqhyTuciUUM
         eeYANpkiquNs9q5ng6sRxNbewxtFd7OlifyLdpLZ6fFbfpfZXrgOXP6l5YB0rRLlaVYp
         NcE68B1dIOk3ZId7+7ocg8M6vouI/j1RSXZgfVm8be9wVawns6S4BfbKMD7Xi2eecZmb
         WaRFMuIiFc/20/oPv9bzhDAcFX2NgH0jhwbhg1TfHIBpwZTlgL7mBebdz5yz4hRLlBdG
         5vRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+ck/6s0uEGW3Re0NhZjSPZg1E1YnAhnPK1yQJonRaw=;
        b=BKrr7uZ72H+Y56Dg0RE8HH4Pr1s/URfnFulMqH2xb7N8JIexh7O1eg/kxsIi2FTcqh
         V8eOFqOQSVpKRot1f80OCloCI48IOzH+4Y+BNyrXNnDFg5kysE51bRn0wRiLK7y87oV8
         2fEYarMwpIZivSWEAFpjpYz0m1tPluag5qHB59WcOdiyFDNJEsofSR+8AizU3YWQzmdq
         PsizKJqskIeSyLjKWye3simC4Nf/Ve7bO3mwINbAPs8RFj27Od8icOUrQSMpbCUYY7/S
         5alWY/OqmRQcPyrhj9mG62BSNoiDZd1qB8m/LmpjwuQL9yjtfFzTCgd7T+sGO+baDeJm
         WGJg==
X-Gm-Message-State: ANoB5plXrSygzhIisJZnOarXC/FCXQo6De9AyEY4hfSiTcwK4HFcjyB2
	1tl8On06Ddc82lXlgAdCa25edmnFq0PjOxBb
X-Google-Smtp-Source: AA0mqf5PgbWk8+Kqkp4wEHZo5a//rOkflu5sifFOtSo7M4mYY8X6gtD3gKd4JTxXziNGu1M6n3V5OA==
X-Received: by 2002:a05:6a00:1696:b0:56a:beee:d0a7 with SMTP id k22-20020a056a00169600b0056abeeed0a7mr19964854pfc.26.1670839785291;
        Mon, 12 Dec 2022 02:09:45 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH V8 0/3] toolstack support for generic virtio devices on Arm
Date: Mon, 12 Dec 2022 15:35:52 +0530
Message-Id: <cover.1670839220.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset adds toolstack support for I2C, GPIO and generic virtio devices.
This is inspired from the work done by Oleksandr for the Disk device.

This is developed as part of Linaro's Project Stratos, where we are working
towards Hypervisor agnostic Rust based backends [1].

This is based of Xen's master branch.

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
 tools/ocaml/libs/xl/genwrap.py            |   1 +
 tools/xl/xl_parse.c                       |  81 ++++++++++++
 10 files changed, 389 insertions(+)
 create mode 100644 tools/libs/light/libxl_virtio.c

-- 
2.31.1.272.g89b43f80a514


