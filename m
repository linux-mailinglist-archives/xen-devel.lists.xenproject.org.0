Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2EA38CE5A
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 21:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131362.245556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkB66-0003i4-G3; Fri, 21 May 2021 19:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131362.245556; Fri, 21 May 2021 19:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkB66-0003fg-D2; Fri, 21 May 2021 19:46:14 +0000
Received: by outflank-mailman (input) for mailman id 131362;
 Fri, 21 May 2021 19:46:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08+4=KQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1lkB65-0003fa-FS
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 19:46:13 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba3a113d-3472-4e77-ac4c-eb3b4a4b5c78;
 Fri, 21 May 2021 19:46:12 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id w15so25277182ljo.10
 for <xen-devel@lists.xenproject.org>; Fri, 21 May 2021 12:46:12 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y15sm737337lje.74.2021.05.21.12.46.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 May 2021 12:46:10 -0700 (PDT)
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
X-Inumbo-ID: ba3a113d-3472-4e77-ac4c-eb3b4a4b5c78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YROQyG5sGznrcZjYxyIeawnoh81WCylTnmVNG9Qbuyg=;
        b=PJcqL6mxlZ0XxymAtE5EtZ0Xt8wWyauqXfMi1xzkJN8c6CQ7Kx2VU9YGqn8zlqeJ6n
         Kiw3G9TCpy4Q4ENmrb49rge6zXj0nNLFzR+28eit44gWz1vvRKoqeZ+KCNh5j+WRGrOp
         330Z1Blu/euuHJDFyHTLfjKWkzoMu/eBvUC3dyLWNbtEFsNL1NS1A+xWXyzIi1dum3Se
         z3IhLoukdylRg3JBM9/MdAqyv/zvOcDCEjWEamjz3hhMYhc8NLvt0pDJLWbRf88K3E+3
         ZMLBpNs/dbwbhK0wXy6vkOyRMIY37h0xvZl73TMMoknEQo5TyWxCHpBasa8OOAldSHFS
         Vfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YROQyG5sGznrcZjYxyIeawnoh81WCylTnmVNG9Qbuyg=;
        b=GOkqFVkTsKk6Yp4hlCYtLWZHBIW2jz44V45/gjrN/37nrLm+jaKeC0zyv1Rf4UIYbE
         3dDiGWpzbSeAMrK0g3lghe9wwYtVsOzegDEeT6t9Od9mwjmQIz3LGgeFIP2a9ofu+iAi
         scS0WOGRTY+iN9+SWJk3VyhwU4SgMT9qj+66uTKSOzCIXvkIGkSmjYRgN15rBLP9q/oO
         22F6wEU7wu6iyKD7ayRW2YdgEgpeuKzXv4KXyQEaQ2n/xpgpsTxlGksr/2vQyGz1QtiJ
         udI+AczBJ81cn743sJU8y2aEYvTRG5c97QXdtuiKDlxW5mgIrLb4gqGoDCdVhUhyOxZh
         utLA==
X-Gm-Message-State: AOAM533tz0wJN1w8afnrswrHAsYsQJM+t/reUeI5EQPJOQpaWepge8KS
	KQocuIj7/KfiQC3g7Aa+ySAipbOxua1F/Q==
X-Google-Smtp-Source: ABdhPJwmJZ309jj2en0C2Rfuc/yHg/F5Ys8mqP8vcQTJbIqSmM1VP8YzO6/ks6+0H+gAeT0IqXkmSw==
X-Received: by 2002:a05:651c:50f:: with SMTP id o15mr7872705ljp.452.1621626370803;
        Fri, 21 May 2021 12:46:10 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
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
Subject: [RESEND PATCH V5 0/2] Virtio support for toolstack on Arm (Was "IOREQ feature (+ virtio-mmio) on Arm")
Date: Fri, 21 May 2021 22:45:59 +0300
Message-Id: <1621626361-29076-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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


