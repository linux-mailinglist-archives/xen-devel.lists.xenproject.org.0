Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E138C7A2
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 15:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131262.245421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk51m-00057D-Mx; Fri, 21 May 2021 13:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131262.245421; Fri, 21 May 2021 13:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk51m-00055K-IR; Fri, 21 May 2021 13:17:22 +0000
Received: by outflank-mailman (input) for mailman id 131262;
 Fri, 21 May 2021 13:17:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08+4=KQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1lk51l-00055E-Iw
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 13:17:21 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c679fe6-ac74-406e-96d4-05b03dc4e3dd;
 Fri, 21 May 2021 13:17:20 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id c10so8638647lfm.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 May 2021 06:17:20 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m23sm619959lfb.279.2021.05.21.06.17.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 May 2021 06:17:19 -0700 (PDT)
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
X-Inumbo-ID: 3c679fe6-ac74-406e-96d4-05b03dc4e3dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OpIENZDAD+5nPWeUwsHpP2y2zUT9yqD/5d+tccVsuWo=;
        b=Jq2YzdDXvlWKafByJOrgVmcms5x7W3A/Lky66lo/aGaggjeVs+bPiDuo2rFunCgQK8
         V5QjAo+nyy5nHKMp6NjEl0tmcNN8HKeMhkOLjdDz6/hxhIu2kmjY/Z0TV4BoXEcD4JtZ
         S8DquBGUUtMF0eoKEmwRgY344iirpWe1Db5/m7caicrxuXy1Os0iPQuO32InxWXICCnV
         uTB8AQtcWUIS674FCMKXtvL5rfkgP2S2OIJRsejJVM1Tjgo/BsB1Y1FhI4QUIT+2AnL+
         VDyh48d9aDqxnDAbkRj0X2Jkd6mAZCZVNz41CVzT2Koqin6fHoCDqMKm/iqVZMFJfi+/
         xNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OpIENZDAD+5nPWeUwsHpP2y2zUT9yqD/5d+tccVsuWo=;
        b=lnkXaU+N25XYyjG0QHQl3tNJ2KqW1XLjZuj0b7knCYOBSr67Y9N0L0683a77emKFpd
         fMY2OBm5YJljqQcV1eiMbwrkrxPuSRl6/0Wy4AV113r4AnSBXik9gmfwjuLf64NVzXyR
         OWU/oKJYySJu+y4PdqvO7Cmp0aHcw+n0gRWgJYSOdLUFYSmGBmwY+Rik3SnkS7hJaiph
         CjFIFpYjqGEiWlbN+u4FZEvqYfJgGe9vg5AR9U2dTnfpHeNL/3IqyO5vC8+7jyg38++y
         bQQoU7imIUnu2kfAinfsrqxYM8S4YI2sgqzm+OncQuTdOBPa6Z/YbrVaWcQb8tJ2gUXh
         OqCA==
X-Gm-Message-State: AOAM530yWqoTpaZtktb89W4V6CQR8g6wH054VznN2SQEE+GNv9bngeU4
	M/ELEGdgWm7K5zGYG5kTYgg=
X-Google-Smtp-Source: ABdhPJzpuQVGrOG940ZbE1w+sWsIHAfo7A+EDv70Yfvv2O4LPdtO0BgISlK5LJ9Fr4c2yt9bAG/n0w==
X-Received: by 2002:a05:6512:3b10:: with SMTP id f16mr2182383lfv.393.1621603039478;
        Fri, 21 May 2021 06:17:19 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: olekstysh@gmail.com,
	xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	Artem Mygaiev <joculator@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH V5 0/2] Virtio support for toolstack on Arm (Was "IOREQ feature (+ virtio-mmio) on Arm")
Date: Fri, 21 May 2021 16:16:43 +0300
Message-Id: <1621603005-5799-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

The purpose of this patch series is to add missing virtio-mmio bits to Xen toolstack on Arm.
The Virtio support for toolstack [1] was postponed as the main target was to upstream IOREQ/DM
support on Arm in the first place. Now, we already have IOREQ support in, so we can resume Virtio
enabling work. You can find previous discussion at [2].

Patch series [3] was reworked and rebased on recent "staging branch"
(972ba1d x86/shadow: streamline shadow_get_page_from_l1e()) and tested on
Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with "updated" virtio-mmio disk backend [4]
running in Driver domain and unmodified Linux Guest running on existing
virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
use-cases work properly.

Any feedback/help would be highly appreciated.

[1] 
https://lore.kernel.org/xen-devel/1610488352-18494-24-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1610488352-18494-25-git-send-email-olekstysh@gmail.com/
[2]
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02403.html
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02536.html
[3] https://github.com/otyshchenko1/xen/commits/libxl_virtio
[4] https://github.com/xen-troops/virtio-disk/commits/ioreq_ml3


Julien Grall (1):
  libxl: Introduce basic virtio-mmio support on Arm

Oleksandr Tyshchenko (1):
  libxl: Add support for Virtio disk configuration

 docs/man/xl-disk-configuration.5.pod.in   |  27 +
 tools/include/libxl.h                     |   6 +
 tools/libs/light/libxl_arm.c              | 133 ++++-
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
 13 files changed, 764 insertions(+), 448 deletions(-)

-- 
2.7.4


