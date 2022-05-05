Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F18D951B92A
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321559.542574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVzS-0007Fr-EW; Thu, 05 May 2022 07:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321559.542574; Thu, 05 May 2022 07:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVzS-0007Dr-BP; Thu, 05 May 2022 07:33:34 +0000
Received: by outflank-mailman (input) for mailman id 321559;
 Thu, 05 May 2022 07:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7gz=VN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1nmVzR-0007CX-1v
 for xen-devel@lists.xen.org; Thu, 05 May 2022 07:33:33 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a93b71f4-cc45-11ec-a406-831a346695d4;
 Thu, 05 May 2022 09:33:32 +0200 (CEST)
Received: by mail-pj1-x102d.google.com with SMTP id iq10so3456585pjb.0
 for <xen-devel@lists.xen.org>; Thu, 05 May 2022 00:33:31 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 g5-20020a635205000000b003c14af5060esm666455pgb.38.2022.05.05.00.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 00:33:29 -0700 (PDT)
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
X-Inumbo-ID: a93b71f4-cc45-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ybq9PQWMvYB+rx172vn/HNQj4/TuzKkSJCqSdN1eHyM=;
        b=Jqj+Vz4GbZzonnAax6DnR8nTiHHAuhFnrMS/2aQzMzCpgC6IqAMnQH9zfG3tILHJvw
         1CabTtSkZA67Y9YESGe2B6jwWYyqYml7G81YjSqc4944VutrbFSCfNXwSnFcVLLQtS2F
         N6O0wKO6mqKTRdcW4RAKWi1TlzVQpBbrWoscLUO1SiG4tORQJSoi0kbmHPf90q4W7+Dm
         1320VHbqr3L60HBb3pFOE5kzHdzb+zxqsr+KKOjkpQhkZOfwgAk/Q6rrjlfTvQJU5JOa
         gCQU/Dx4qoUNqFBE9QFwIawQnCNJQ/PJeLA7zXf3cvWn5+WXznARJFQ8KXVZ3SFu/yXe
         V/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ybq9PQWMvYB+rx172vn/HNQj4/TuzKkSJCqSdN1eHyM=;
        b=RG6/h8FTpj5GfHAAI0vnUROCDlAgwtt8ydQp1JvtgpccGQV80OQfmteHatF1m3qYuD
         sLkMHSjkEaOVVrMNXA/zSd1qAiRTDXKfFK/Gix4nGuiU4HKyFNcGP5eQSCM9yvkePq72
         B2++D5s550RcgIjMCr0tUBpHbqx21yn7Jl9bPpR4G+4XaZNcdJEfzGQta2XKZOxV1IH9
         y6TceeBaV+rC1gDYhFoekVpBCvNhxmkouqE6DreYD+p7lh8yGEPWClVYmxYmu38wCBVd
         ZCXJdh6c2QoSfEYFlvmM6cfNKo8NBYOFK0nnzkyfYz3D42txAlaqnx6VKAUW+I2yVOGi
         QeUQ==
X-Gm-Message-State: AOAM530r0qWSwfPKurQX6NRVjQj8EVQko6QJhFyzBGdW7oMGn9wbRh1L
	3KrefZph1Rq78zAoD+/53JV27fclxn1n6g==
X-Google-Smtp-Source: ABdhPJwfAtBx+hfWoJ1pvr4S9UnGesILtdZj9jghAuXe9Y+0LwQa61b7dx5t4gLSaj+qmULhAk4PgQ==
X-Received: by 2002:a17:90b:4c91:b0:1dc:57bc:4caa with SMTP id my17-20020a17090b4c9100b001dc57bc4caamr4474371pjb.10.1651736010030;
        Thu, 05 May 2022 00:33:30 -0700 (PDT)
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
Subject: [PATCH 0/4] Virtio toolstack support for I2C and GPIO on Arm
Date: Thu,  5 May 2022 13:03:19 +0530
Message-Id: <cover.1651734854.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset adds toolstack support for I2C and GPIO virtio devices. This is
inspired from the work done by Oleksandr for the Disk device [1].

The first two patches can be applied right away, but the last two need
Oleksandr's series [1] to be applied first.

This is developed as part of Linaro's Project Stratos, where we are working
towards Hypervisor agnostic Rust based backend [2].

I must accept that I am a beginner to Xen and developed this patchset based on
support for existing devices like Disk or Keyboard. There may be bits which I
missed or the one I added which aren't really required.

Thanks.

--
Viresh

Viresh Kumar (4):
  libxl: Add support for Virtio I2C device
  libxl: Add support for Virtio GPIO device
  libxl: Allocate MMIO params for I2c device and update DT
  libxl: Allocate MMIO params for GPIO device and update DT

 tools/golang/xenlight/helpers.gen.go      | 220 ++++++++++++++++++++
 tools/golang/xenlight/types.gen.go        |  54 +++++
 tools/include/libxl.h                     |  64 ++++++
 tools/include/libxl_utils.h               |   6 +
 tools/libs/light/Makefile                 |   2 +
 tools/libs/light/libxl_arm.c              | 117 ++++++++++-
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
 23 files changed, 1540 insertions(+), 5 deletions(-)
 create mode 100644 tools/libs/light/libxl_gpio.c
 create mode 100644 tools/libs/light/libxl_i2c.c
 create mode 100644 tools/xl/xl_gpio.c
 create mode 100644 tools/xl/xl_i2c.c

-- 
2.31.1.272.g89b43f80a514

[1] https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/
[2] https://lore.kernel.org/xen-devel/20220414092358.kepxbmnrtycz7mhe@vireshk-i7/

