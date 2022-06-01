Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE6C53AC54
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 19:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340698.565802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwSbe-000687-RU; Wed, 01 Jun 2022 17:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340698.565802; Wed, 01 Jun 2022 17:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwSbe-00065F-O1; Wed, 01 Jun 2022 17:58:06 +0000
Received: by outflank-mailman (input) for mailman id 340698;
 Wed, 01 Jun 2022 17:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Edd5=WI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nwSbc-0005nF-PR
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 17:58:04 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6237e503-e1d4-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 19:58:03 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id a15so3995939lfb.9
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jun 2022 10:58:04 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a2e1f01000000b002555bc8f782sm435358ljf.39.2022.06.01.10.58.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Jun 2022 10:58:02 -0700 (PDT)
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
X-Inumbo-ID: 6237e503-e1d4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k1wgktw6Jz1Aqx56EJW/aeWx4Yi6q/5k3Q6KwTdWZ5Y=;
        b=HIGwhXO/yHVx7Hoe08gc1p3tbdz+vN0kP33/Nrsy1wH224GSjSJ4Mr5OJERNkNTke2
         /31/mlMM/Ee9Z87DkXB9Y/LIhS2POLiwykBv/JCy2Bs4FczGL/LMJJJqvyUfeY3wsfuA
         sVzpJD+UNv50U46dlc92i4GMF0rbID240SL77tadHtKf3pBKEVk5fAXDEJkYPakfwmHe
         KcbRhSbDYi8Scowih7Z+s3tl3UVpQ57PIvQ6597F2ymzHQXq/QGQSvjb6XSeiA0fUmhM
         4ENi9SKnWzkXVHHbteEn8+JU2PCE3zWVqUV5O/X9os9CMLtTv4Ai2sdhyomVCtE9Lsfh
         Uwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k1wgktw6Jz1Aqx56EJW/aeWx4Yi6q/5k3Q6KwTdWZ5Y=;
        b=jDKLymu4RApmDUVX+IKk+rTQYB1O4YgIQppA6b0vTUjGRKwT0hZflIqPUb7M68JM0f
         CMLt+WaEmQKuQixGQoO+M8YZs2IV+nDxTz8b+FI7aLXbRD00AMn2f+ijstFhtIdOiHHg
         AX/x3Ejy8IWC0wgwoRdOQaBnxwCYOa+3gunHzZwLP5ya2cgHiiAh4cB94DF4Jo8TUl5E
         Givi2RMuao6rETOdloKX6E8XCfDehcs2ntu0jnCDQyIreKQx8Dkif7W0lHJukBnCt9a3
         hqO7jKbodtBKfCaQwswZUouLRZfIAz8kgfFBwhELnROyRpZORr1lwX+FFwqZoIJK4tUE
         equw==
X-Gm-Message-State: AOAM530ovccMxrohH9mpXDo40smBthZxbivTonWmn8Fg6nWWp27oTb15
	e+zoCqJYNayDxQ6PqfY5UZOyFsEabT8=
X-Google-Smtp-Source: ABdhPJyoQiFwkcGMxtwpgpCGnRfxFp9WKbrIiktUMcfiFBCsfcHF404xwv5VJbaYlmJRFQm6T6bv3w==
X-Received: by 2002:a05:6512:a89:b0:478:80fe:29c0 with SMTP id m9-20020a0565120a8900b0047880fe29c0mr487116lfu.682.1654106283289;
        Wed, 01 Jun 2022 10:58:03 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH V9 0/2] Virtio support for toolstack on Arm (Was "IOREQ feature (+ virtio-mmio) on Arm")
Date: Wed,  1 Jun 2022 20:57:39 +0300
Message-Id: <1654106261-28044-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

The purpose of this patch series is to add missing virtio-mmio bits to Xen toolstack on Arm.
The Virtio support for toolstack [1] was postponed as the main target was to upstream IOREQ/DM
support on Arm in the first place. Now, we already have IOREQ support in, so we can resume Virtio
enabling work. You can find previous discussions at [2].

Patch series [3] is based on recent "staging" branch
(49dd52fb1311dadab29f6634d0bc1f4c022c357a tools/xenstore: fix event sending in introduce_domain())
and tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio based virtio-disk backend [4]
running in Dom0 (or Driver domain) and unmodified Linux Guest running on existing virtio-blk driver (frontend).
No issues were observed. Guest domain 'reboot/destroy' use-cases work properly.

Any feedback/help would be highly appreciated.

[1]
https://lore.kernel.org/xen-devel/1610488352-18494-24-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1610488352-18494-25-git-send-email-olekstysh@gmail.com/
[2]
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02403.html
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02536.html
https://lore.kernel.org/xen-devel/1621626361-29076-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1638982784-14390-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/

[3] https://github.com/otyshchenko1/xen/commits/libxl_virtio4
[4] https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant

Julien Grall (1):
  libxl: Introduce basic virtio-mmio support on Arm

Oleksandr Tyshchenko (1):
  libxl: Add support for Virtio disk configuration

 docs/man/xl-disk-configuration.5.pod.in   |  38 +-
 tools/golang/xenlight/helpers.gen.go      |   8 +
 tools/golang/xenlight/types.gen.go        |  18 +
 tools/include/libxl.h                     |   7 +
 tools/libs/light/libxl_arm.c              | 121 +++-
 tools/libs/light/libxl_device.c           |  62 +-
 tools/libs/light/libxl_disk.c             | 140 ++++-
 tools/libs/light/libxl_internal.h         |   2 +
 tools/libs/light/libxl_types.idl          |  18 +
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_utils.c            |   2 +
 tools/libs/util/libxlu_disk_l.c           | 959 +++++++++++++++---------------
 tools/libs/util/libxlu_disk_l.h           |   2 +-
 tools/libs/util/libxlu_disk_l.l           |   9 +
 tools/xl/xl_block.c                       |  11 +
 xen/include/public/arch-arm.h             |   7 +
 16 files changed, 923 insertions(+), 482 deletions(-)

-- 
2.7.4


