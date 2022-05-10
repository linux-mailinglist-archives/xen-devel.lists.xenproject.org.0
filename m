Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7D520D97
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 08:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325176.547629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noIza-0007rU-9a; Tue, 10 May 2022 06:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325176.547629; Tue, 10 May 2022 06:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noIza-0007oh-64; Tue, 10 May 2022 06:05:06 +0000
Received: by outflank-mailman (input) for mailman id 325176;
 Tue, 10 May 2022 06:05:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+NA3=VS=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1noIzY-0007ob-UV
 for xen-devel@lists.xen.org; Tue, 10 May 2022 06:05:05 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20081880-d027-11ec-a406-831a346695d4;
 Tue, 10 May 2022 08:05:03 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id n8so15878622plh.1
 for <xen-devel@lists.xen.org>; Mon, 09 May 2022 23:05:01 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 g8-20020aa78748000000b0050dc762817bsm9630965pfo.85.2022.05.09.23.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 23:04:58 -0700 (PDT)
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
X-Inumbo-ID: 20081880-d027-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3A4Fz3icoaqYWOy0LXYpOvOE150j94z1YZl1bmEKoNY=;
        b=O6C+Vqls72T9sdXBXiucliRUx7XAxZXGb7ihjbS8Kg2fZIakaY2CZMe+1rh3VHvstU
         p1UkcJAWp9+NnhK++ho5/nWLZcK5BuCeoI/RR5FrLK6Q6SCCoUf6sEXA1hSuEg5tZMnS
         V0IqlxtgAg2pMEACpqea84OQdACAIsvSuLP5jH5W43k2D07tAjeAnN+0QAh1+W+Vv+cS
         BJ3LfL+sDtFkb+BiwxZUDtFm8tuYv3l5+vBTytFq0WHbY2FHEqc9Hiyl2AGR3eve3D48
         tS/W23eB2z8swj32XBv5C2DsQzTnVajd/LA29GTJqY90NUQiscLn44c9sW/1xgEQQY0Y
         rExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3A4Fz3icoaqYWOy0LXYpOvOE150j94z1YZl1bmEKoNY=;
        b=QFUXf2RW0jNdnaARxLfkOGuWMPxMz7T2cyr4Le7ms/JwMiwzV1Ces7bWhmDyWRk6gB
         UAo3oeSmFq7Nb5UJ5bWVdPecGfFmZXqya7XbPPE05HNLvzGH/sVdk5ChMRW1gn53arkP
         0I4Poor7xXnOk0QiauHT7y7yPBT4EZg4dQenArW3xapUVwEf4qSyyM0qhRnNgY9Q4Ojs
         T42eiComvHaNGmpyY9tdo4Us+6Vx6sZl75BV31liC9drqCNWcP3FZLAwH94v5h/wQp6D
         DvQpiQyfo91ix2MFSxhfwdF4gNwkVkCCSJ2cShfQs5peoAtny/wgRs7qc4Ds6hihPHuh
         QCJQ==
X-Gm-Message-State: AOAM530xKUrM2aioTOJ8WoMVGjvUlbNhJLuvYxTaYTfyUZWqL9c6FVrt
	i8XylQIDdj9hURw0I2vcyXPQoAFhq8MCBg==
X-Google-Smtp-Source: ABdhPJwCxRkKD10uDYmbJ335yA9KSzlH1ygVEJjIIhfvKzTcSCFySjE4bus3nOl/WhJQZ5UigtrR9A==
X-Received: by 2002:a17:902:e851:b0:15e:93ac:41db with SMTP id t17-20020a170902e85100b0015e93ac41dbmr19320885plg.26.1652162699592;
        Mon, 09 May 2022 23:04:59 -0700 (PDT)
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
Subject: [PATCH V2 0/6] Virtio toolstack support for I2C and GPIO on Arm
Date: Tue, 10 May 2022 11:34:45 +0530
Message-Id: <cover.1652162646.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset adds toolstack support for I2C and GPIO virtio devices. This is
inspired from the work done by Oleksandr for the Disk device [1].

The first two patches can be applied right away, while the last four need
Oleksandr's series [1] to be applied first.

This is developed as part of Linaro's Project Stratos, where we are working
towards Hypervisor agnostic Rust based backend [2].

I must accept that I am a beginner to Xen and developed this patchset based on
support for existing devices like Disk or Keyboard. There may be bits which I
missed or the one I added which aren't really required.

Thanks.

--
Viresh

[1] https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/
[2] https://lore.kernel.org/xen-devel/20220414092358.kepxbmnrtycz7mhe@vireshk-i7/

Viresh Kumar (6):
  libxl: Add support for Virtio I2C device
  libxl: Add support for Virtio GPIO device
  libxl: arm: Create alloc_virtio_mmio_params()
  libxl: arm: Split make_virtio_mmio_node()
  libxl: Allocate MMIO params for I2c device and update DT
  libxl: Allocate MMIO params for GPIO device and update DT

 tools/golang/xenlight/helpers.gen.go      | 220 ++++++++++++++++++++
 tools/golang/xenlight/types.gen.go        |  54 +++++
 tools/include/libxl.h                     |  64 ++++++
 tools/include/libxl_utils.h               |   6 +
 tools/libs/light/Makefile                 |   2 +
 tools/libs/light/libxl_arm.c              | 132 ++++++++++--
 tools/libs/light/libxl_create.c           |  26 +++
 tools/libs/light/libxl_dm.c               |  34 +++-
 tools/libs/light/libxl_gpio.c             | 236 ++++++++++++++++++++++
 tools/libs/light/libxl_i2c.c              | 236 ++++++++++++++++++++++
 tools/libs/light/libxl_internal.h         |   2 +
 tools/libs/light/libxl_types.idl          |  52 +++++
 tools/libs/light/libxl_types_internal.idl |   2 +
 tools/ocaml/libs/xl/genwrap.py            |   2 +
 tools/ocaml/libs/xl/xenlight_stubs.c      |   2 +
 tools/xl/Makefile                         |   2 +-
 tools/xl/xl.h                             |   6 +
 tools/xl/xl_cmdtable.c                    |  30 +++
 tools/xl/xl_gpio.c                        | 143 +++++++++++++
 tools/xl/xl_i2c.c                         | 143 +++++++++++++
 tools/xl/xl_parse.c                       | 160 +++++++++++++++
 tools/xl/xl_parse.h                       |   2 +
 tools/xl/xl_sxp.c                         |   4 +
 23 files changed, 1539 insertions(+), 21 deletions(-)
 create mode 100644 tools/libs/light/libxl_gpio.c
 create mode 100644 tools/libs/light/libxl_i2c.c
 create mode 100644 tools/xl/xl_gpio.c
 create mode 100644 tools/xl/xl_i2c.c

-- 
2.31.1.272.g89b43f80a514


