Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BCF32B9B5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92927.175264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVQV-0008Cp-T6; Wed, 03 Mar 2021 17:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92927.175264; Wed, 03 Mar 2021 17:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVQV-0008CQ-Ph; Wed, 03 Mar 2021 17:36:47 +0000
Received: by outflank-mailman (input) for mailman id 92927;
 Wed, 03 Mar 2021 17:36:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Voz6=IB=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lHVQT-0008CL-VA
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 17:36:46 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6533d9fe-48b3-484e-a409-0a954603f8a3;
 Wed, 03 Mar 2021 17:36:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u16so6596949wrt.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Mar 2021 09:36:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm6528499wmf.7.2021.03.03.09.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4253E1FF7E;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
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
X-Inumbo-ID: 6533d9fe-48b3-484e-a409-0a954603f8a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tycmjp6CJiWbZvVw6Aok39MbRvYMS6RtER+7yrB8OAA=;
        b=YULpRfZUogvoBjS7IKX4NXSjOLdIbt0oqgCZlNxkM4Vg3XZlaR8yKSykZ2svwrC2gK
         cZBzTdpvGE/LjH2vM3J0GbKWBh+3LS1PpoVSLRkDHmg9jF4ZA1UCKSjacxnVFfSi51v5
         gFPktTEhl0kutYJSB5N2NU7vOTwPFMaLkm9zAM2yeR9xYVRhHWgRBrjFDB/jK+CLp4Gr
         HUiKolu2a9Oenj/glmKfavTIH+5Ge+nNJkq5/p/6y6Ih1Yyi/jJqRKrMkSLJ54Mz5u7F
         D8vVuB4geNcKyf98IjwqUKtmF+Gczsg0MPQtPyBHX1mJg2ZjNO24hj92ccgOELiWToY1
         yotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tycmjp6CJiWbZvVw6Aok39MbRvYMS6RtER+7yrB8OAA=;
        b=SG4NYrR5XErGM5inQDwx+1ubDU6zx/Uc3hEWQSaLPdm0iX1oVkq4dqh4CSUQKUKmnh
         BIuWTHnZ0buKt+cM7pVyGLcUcy7LLrV+s7VJ4CECxAe+6jQZImInel2x9obbqv+iu8Jg
         IET5fORjh5G0vKNSyjclJigntEeQtc20m/BTudAw0S5YzCf3L4Vy6zcmU+Y3brvQS2sj
         7Zg3XByADaJzNH00CxNjxtAM5Pz7z0kxWEcAlgFBWLRDpDThNNmsgQsawOuS+Km5FaBn
         nOeKq6pRe+XYPjhbYxcOxUOGvFWsiIrDSbHKFWC2aNThEKlMLFp0OyR8PXmUal/DC/I3
         27Gw==
X-Gm-Message-State: AOAM530DabmtudPQs9z8GOrn1MLa7cG0EkamzPvGZf8aYWPilS5mY64N
	Mkd8NSEJIhO4ubqPzL56Q8fNig==
X-Google-Smtp-Source: ABdhPJxRUCcHeBftPQjidg5ANnhVVk7OaZCMfovO8zD1hlzAWv4XeFe4Or+MxE+8iGqAwrh754sPJA==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr28044204wro.350.1614793004070;
        Wed, 03 Mar 2021 09:36:44 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 0/7] Xen guest-loader support, pre-PR
Date: Wed,  3 Mar 2021 17:36:35 +0000
Message-Id: <20210303173642.3805-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Trying to get my ducks in a row for a merge of this before softfreeze
so this is my pre-PR posting of the Xen guest-loader support.
Everything apart from the loader itself is reviewed and given it's
been tested in other patches and I'm going to maintain it I don't see
a reason to hold it up from going in. However if you would like to
review it please do ;-)

The only real change is a tweak to the final patch where I've added a
stable archive URL for the Debian Xen packages.

Alex Bennée (7):
  hw/board: promote fdt from ARM VirtMachineState to MachineState
  hw/riscv: migrate fdt field to generic MachineState
  device_tree: add qemu_fdt_setprop_string_array helper
  hw/core: implement a guest-loader to support static hypervisor guests
  docs: move generic-loader documentation into the main manual
  docs: add some documentation for the guest-loader
  tests/avocado: add boot_xen tests

 docs/generic-loader.txt        |  92 ---------
 docs/system/generic-loader.rst | 117 +++++++++++
 docs/system/guest-loader.rst   |  54 +++++
 docs/system/index.rst          |   2 +
 hw/core/guest-loader.h         |  34 ++++
 include/hw/arm/virt.h          |   1 -
 include/hw/boards.h            |   1 +
 include/hw/riscv/virt.h        |   1 -
 include/sysemu/device_tree.h   |  17 ++
 hw/arm/virt.c                  | 356 +++++++++++++++++----------------
 hw/core/guest-loader.c         | 145 ++++++++++++++
 hw/riscv/virt.c                |  20 +-
 softmmu/device_tree.c          |  26 +++
 MAINTAINERS                    |   9 +-
 hw/core/meson.build            |   2 +
 tests/acceptance/boot_xen.py   | 118 +++++++++++
 16 files changed, 719 insertions(+), 276 deletions(-)
 delete mode 100644 docs/generic-loader.txt
 create mode 100644 docs/system/generic-loader.rst
 create mode 100644 docs/system/guest-loader.rst
 create mode 100644 hw/core/guest-loader.h
 create mode 100644 hw/core/guest-loader.c
 create mode 100644 tests/acceptance/boot_xen.py

-- 
2.20.1


