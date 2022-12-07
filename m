Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513EB645482
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 08:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455947.713593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ok6-0000NV-FC; Wed, 07 Dec 2022 07:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455947.713593; Wed, 07 Dec 2022 07:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ok6-0000LJ-BN; Wed, 07 Dec 2022 07:21:22 +0000
Received: by outflank-mailman (input) for mailman id 455947;
 Wed, 07 Dec 2022 07:21:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqWv=4F=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p2ok4-0000L8-8W
 for xen-devel@lists.xen.org; Wed, 07 Dec 2022 07:21:21 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc697c6e-75ff-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 08:21:17 +0100 (CET)
Received: by mail-pf1-x433.google.com with SMTP id x66so16784262pfx.3
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 23:21:16 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 pt18-20020a17090b3d1200b00219dab2d7a0sm535988pjb.9.2022.12.06.23.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 23:21:14 -0800 (PST)
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
X-Inumbo-ID: bc697c6e-75ff-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvB2yLNDseNVSGkxkv45nD49xzh0oEoPx/y3WchbdGE=;
        b=lrujVVZDOnamNjCsUGG9JfN8dlHh15OC7lO7IVSHGuhTurCiIwxcFINV2Xgx5H9Jl4
         IUy7hswtITgXRIJ9QwBDY2E1Jfmatcq996IfSzZ7065u6I6USpcjyT7LcVuNRSlYp+PA
         44VOiKqFEidXHDmaymoenP7mg3SLslYSRtDMofv7MQYiLcAcZvja5BrqNH5EX4QafRn0
         yJChgmOfK0NpFsEoZQkua32vsGBhWzdz5ou9HrLjwo7IEQnzFS4PJMNUVAZ+ei8/OU3h
         9nnUAduCOio8EVRZzdWWoL1ojmx5JKeqUceqybr5UB3wU0v3BS/aUY7YR3tH8DUu78xB
         4G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvB2yLNDseNVSGkxkv45nD49xzh0oEoPx/y3WchbdGE=;
        b=phZxtFlIpDCb7kPnwkghOGfU+cbgqOP4mlsto4AXMFy+ZUfrsN8Ay+fXeMzywi4DB1
         pHYki/VpvP0sV5fzH/YqrJaxDhlYtHtSg/EXaykxVqdXssslVqB6a6AxPHAEOD5bo+qK
         oO7Qi8WFREJPLRzpK6DLuQXyr/b08lq62Sc8Z9jtOmbgKduXg9J2Gf3s347da0z2FpZV
         vD5hnk6JkM41eeR7B8SlgQemPONVzDq1kBMjg3YE2Q61Lv/iYI+vfLLCxG9COxIqmh6y
         q/zJLwu+W4fJ9oNr80+v7yfKb48RLmMLR40/OqmY7FPEkELms3RiAOOF+SVDkYNbcnUg
         geWg==
X-Gm-Message-State: ANoB5plJ+Owh813ibaHMci2lsZTLve9QMrIC4NTorl98OTtGN/C+5ZNP
	+2gpPFeIYIpOqdhNIyfy71K3Z2JL+dnZBR1z
X-Google-Smtp-Source: AA0mqf5kAtmj9A6e1juL15hCLizbUPvEPO35b0ps2D/WLs7J0qdD7K8bTwSgPQI/HEyfEkGsXMpJUw==
X-Received: by 2002:a63:3c5:0:b0:478:9cf7:44fe with SMTP id 188-20020a6303c5000000b004789cf744femr16284465pgd.68.1670397674983;
        Tue, 06 Dec 2022 23:21:14 -0800 (PST)
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
Subject: [PATCH V7 0/3] toolstack support for generic virtio devices on Arm
Date: Wed,  7 Dec 2022 12:50:41 +0530
Message-Id: <cover.1670396758.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset adds toolstack support for I2C, GPIO and generic virtio devices.
This is inspired from the work done by Oleksandr for the Disk device.

This is developed as part of Linaro's Project Stratos, where we are working
towards Hypervisor agnostic Rust based backends [1].

This is based of Julien's for-next/4.18 branch [2].

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
[2] https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/for-next/4.18

Viresh Kumar (3):
  libxl: Add support for generic virtio device
  xl: Add support to parse generic virtio device
  docs: Add documentation for generic virtio devices

 docs/man/xl.cfg.5.pod.in                  |  28 +++++
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_arm.c              | 103 ++++++++++++++++
 tools/libs/light/libxl_create.c           |   4 +
 tools/libs/light/libxl_internal.h         |   1 +
 tools/libs/light/libxl_types.idl          |  18 +++
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_virtio.c           | 144 ++++++++++++++++++++++
 tools/ocaml/libs/xl/genwrap.py            |   1 +
 tools/ocaml/libs/xl/xenlight_stubs.c      |   1 +
 tools/xl/xl_parse.c                       |  80 ++++++++++++
 11 files changed, 382 insertions(+)
 create mode 100644 tools/libs/light/libxl_virtio.c

-- 
2.31.1.272.g89b43f80a514


