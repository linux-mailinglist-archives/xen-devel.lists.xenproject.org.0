Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0B2620EF0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 12:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439974.694010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMiI-0006Ug-Fc; Tue, 08 Nov 2022 11:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439974.694010; Tue, 08 Nov 2022 11:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMiI-0006S7-CW; Tue, 08 Nov 2022 11:24:18 +0000
Received: by outflank-mailman (input) for mailman id 439974;
 Tue, 08 Nov 2022 11:24:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDgD=3I=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1osMiH-0006S1-4E
 for xen-devel@lists.xen.org; Tue, 08 Nov 2022 11:24:17 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dff0b4e1-5f57-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 12:24:16 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id l6so13535073pjj.0
 for <xen-devel@lists.xen.org>; Tue, 08 Nov 2022 03:24:15 -0800 (PST)
Received: from localhost ([122.172.84.80]) by smtp.gmail.com with ESMTPSA id
 z127-20020a636585000000b004308422060csm5535481pgb.69.2022.11.08.03.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 03:24:13 -0800 (PST)
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
X-Inumbo-ID: dff0b4e1-5f57-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yOKK+9FPPU0/nPfs+Ew/J1tOJE8GcKPJPaXoeuk6IEI=;
        b=ImzV8I+sv5cVMkpmIUKtSqqc7g99wKYnVsganYTQb+HWYRMIfiBMr/nQTUWbcUbZ8F
         6Sb0fyRx+dH/pirET5BCv2Q0b9kgxXr7wHY3jCkdEIumysCw03+6ydx7/0MBw3nM2NtK
         ZRo+I8dRFszxe89NuXrvucZaasqwYp0owkxSIw3LiO8ca3nuvGu97bdh08hazrpeo+lN
         GTXdhMdEyBo9euHncnVpFjpNGJZbDMj1K59D/6d4YzMCJ+UGLrLOC9vDacjMcdVT1j1n
         1DTkzbK3zfI1wcBbnxi7wao6GIQu5/rP3kZMzOPeSmU5MCWSJPvu7ebCKYBNucI4JYW4
         efQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOKK+9FPPU0/nPfs+Ew/J1tOJE8GcKPJPaXoeuk6IEI=;
        b=A5lgsucU73lbC9l2KGS2/t0Xa8AZOERUEPdKv1ewBJqHQgnAPMMV3NJZroiqN1s9Sp
         0qJg0nYv82asd3rw/dL1p1chauGeibItN5zCnUHV1LuXsOhq/5fbyIqVflD/cETu3181
         2SAYB2BIpibMmg6Bl4eq/EX+zic/KYDX9xDmoZUVuXlwJ/Ie8ihUqv0K17Cidhae+Ccr
         Cvl8VWFvPUDKjie6y2Jbgf4zN/iGyzr9R7rAPxJ9WJZHKSWj3loZVrqlWPyH9F+opAi/
         djAe3XaeUm/FMLQry1XrCRveNqZ2DjggMKdBFh38kEEs8Wc3fogZnnngGdHunzCH58fX
         sL1A==
X-Gm-Message-State: ANoB5pk21jJhyhazMtDj5M0ZI4XmHS6AP6+gjaJwWpAlFZHUTwQ4mvxb
	/WiTZPEKqb8Qop+l2S246VDkicSX3rMGsw==
X-Google-Smtp-Source: AA0mqf7tk6UDS5JBDqKsTz8bX9MQt7VH1u5sRY5bItsEdp9qkYuIXMZr6e+9c/VbfHfGnG6t5KhSwA==
X-Received: by 2002:a17:902:744b:b0:188:8e6b:978a with SMTP id e11-20020a170902744b00b001888e6b978amr470348plt.11.1667906653548;
        Tue, 08 Nov 2022 03:24:13 -0800 (PST)
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
Subject: [PATCH V6 0/3] Virtio toolstack support for I2C and GPIO on Arm
Date: Tue,  8 Nov 2022 16:53:57 +0530
Message-Id: <cover.1667906228.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset adds toolstack support for I2C and GPIO virtio devices. This is
inspired from the work done by Oleksandr for the Disk device.

This is developed as part of Linaro's Project Stratos, where we are working
towards Hypervisor agnostic Rust based backend [1].

This is based of origin/staging (e61a78981364 xen/arm: add iounmap after initrd
has been loaded in domain_build) and the earlier posted cleanup patches [2].

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
[2] https://lore.kernel.org/all/cover.1662626550.git.viresh.kumar@linaro.org/



Viresh Kumar (3):
  libxl: Add support for generic virtio device
  xl: Add support to parse generic virtio device
  docs: Add documentation for generic virtio devices

 docs/man/xl.cfg.5.pod.in                  |  21 ++++
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_arm.c              |  89 +++++++++++++++
 tools/libs/light/libxl_create.c           |   5 +
 tools/libs/light/libxl_internal.h         |   1 +
 tools/libs/light/libxl_types.idl          |  29 +++++
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_virtio.c           | 127 ++++++++++++++++++++++
 tools/ocaml/libs/xl/genwrap.py            |   1 +
 tools/ocaml/libs/xl/xenlight_stubs.c      |   1 +
 tools/xl/xl_parse.c                       |  84 ++++++++++++++
 11 files changed, 360 insertions(+)
 create mode 100644 tools/libs/light/libxl_virtio.c

-- 
2.31.1.272.g89b43f80a514


