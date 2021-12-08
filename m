Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB1F46D917
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 18:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242520.419437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv0Ij-0007Xe-OI; Wed, 08 Dec 2021 17:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242520.419437; Wed, 08 Dec 2021 17:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv0Ij-0007Ve-Kz; Wed, 08 Dec 2021 17:00:17 +0000
Received: by outflank-mailman (input) for mailman id 242520;
 Wed, 08 Dec 2021 17:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ity+=QZ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mv0Ih-0007VY-ST
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 17:00:15 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5031040a-5848-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 18:00:14 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id bi37so6842303lfb.5
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 09:00:14 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b14sm302767lfs.174.2021.12.08.09.00.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 09:00:14 -0800 (PST)
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
X-Inumbo-ID: 5031040a-5848-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=irpOZlHnLuCFvgvt7pasDPosQACWGgbdRbyKuJ7cmBo=;
        b=iUFu/MHHZhkppZ6XYyd5oYPfhGgHxAnxa2IaMN/epp2c8KCFkUYKgNoAPhRmGHceDx
         rWdvlE2KmDCp37apRa+0zHjU5O5KFljD2ebqbREddWmBFZsfnlEeKqytzYPcPdFkvatl
         mImFZmp3XZYYLqS2TxHlD35FalHWrJLf+KvWeiray5Ywgvo71DlzcfxspdmsULC3xMTO
         iwF+BENmvpwFQK+N6y07+w3NXRrVr5/BkZxA9e1QXhKpUM4Se7DlZlzPAZrBh+W72AhP
         A4HTUmI1wvClpDQi4dqG6ezqsOtdtRGfRZvD3p2E9ufujA7nwaceCvNs7DkyxM5tXu4E
         Lw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=irpOZlHnLuCFvgvt7pasDPosQACWGgbdRbyKuJ7cmBo=;
        b=0DgZnXH4MwNaJEKk7twAUjLlP54tCvpspsxTFuIAV8Odcvz9ohKvfePVgApZADN5nN
         8vMWshDxkOtWnNFkNCBxTd4rVQW5M6bjm443E6JoOqMHvz9zKm32lCEXAThrdVbw6euo
         yV5Fg050amvn+nawGup7X/U18UIVsTCVBuXUHPoib495Ro04sOr31j43Ynlebi257fFm
         M3pI/EHTSwyWmGbjWU97DjI1+gPzSqmVrmU6FoCjYXHfUb6zRERCtCw3PJ8hoYIpO1Yh
         9BqIRXJXIau+1lribLGWxf+jnksulOAcGrucVn6GqEvakv406JNlA3jZ/9zFMNHsN3Qn
         FuXQ==
X-Gm-Message-State: AOAM5309Wkh/KcGq7cryMb7HAlxDrvxWtW7SD81na0DBEE4kHW8uvtGp
	IyEAAFNovdb+qXJ7tdhjxWqwLi06wjQ=
X-Google-Smtp-Source: ABdhPJwlxYFJf0RDSgS7tzGaKYOttYlxhI41eqlNrorSK+738YWPrW0ZF5DfTMeRs19cG3z9y/cAnA==
X-Received: by 2002:a05:6512:2820:: with SMTP id cf32mr661584lfb.510.1638982814338;
        Wed, 08 Dec 2021 09:00:14 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH V6 0/2] Virtio support for toolstack on Arm (Was "IOREQ feature (+ virtio-mmio) on Arm")
Date: Wed,  8 Dec 2021 18:59:42 +0200
Message-Id: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
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

Patch series [3] is based on recent "staging branch"
(608531a0cc34a5bc096ccf585e16f182b5ed83e1 MAINTAINERS: Resign from my maintainership roles)
and tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend [4]
running in Driver domain and unmodified Linux Guest running on existing virtio-blk driver (frontend).
No issues were observed. Guest domain 'reboot/destroy' use-cases work properly.

Any feedback/help would be highly appreciated.

[1] 
https://lore.kernel.org/xen-devel/1610488352-18494-24-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1610488352-18494-25-git-send-email-olekstysh@gmail.com/
[2]
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02403.html
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02536.html
https://lore.kernel.org/xen-devel/1621626361-29076-1-git-send-email-olekstysh@gmail.com/

[3] https://github.com/otyshchenko1/xen/commits/libxl_virtio1
[4] https://github.com/xen-troops/virtio-disk/commits/ioreq_ml3

Julien Grall (1):
  libxl: Introduce basic virtio-mmio support on Arm

Oleksandr Tyshchenko (1):
  libxl: Add support for Virtio disk configuration

 docs/man/xl-disk-configuration.5.pod.in   |  27 +
 tools/golang/xenlight/helpers.gen.go      |   6 +
 tools/golang/xenlight/types.gen.go        |   4 +
 tools/include/libxl.h                     |   6 +
 tools/libs/light/libxl_arm.c              | 131 ++++-
 tools/libs/light/libxl_device.c           |  38 +-
 tools/libs/light/libxl_disk.c             |  99 +++-
 tools/libs/light/libxl_types.idl          |   4 +
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_utils.c            |   2 +
 tools/libs/util/libxlu_disk_l.c           | 881 +++++++++++++++---------------
 tools/libs/util/libxlu_disk_l.h           |   2 +-
 tools/libs/util/libxlu_disk_l.l           |   1 +
 tools/xl/xl_block.c                       |  11 +
 xen/include/public/arch-arm.h             |   7 +
 15 files changed, 772 insertions(+), 448 deletions(-)

-- 
2.7.4


