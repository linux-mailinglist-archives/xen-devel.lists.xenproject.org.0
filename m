Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763724F9C75
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 20:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301744.515006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nctES-0004UL-1o; Fri, 08 Apr 2022 18:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301744.515006; Fri, 08 Apr 2022 18:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nctER-0004Rx-Ux; Fri, 08 Apr 2022 18:21:15 +0000
Received: by outflank-mailman (input) for mailman id 301744;
 Fri, 08 Apr 2022 18:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJw0=US=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nctEQ-0004Rr-El
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 18:21:14 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab6f3b43-b768-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 20:21:12 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id i20so1002387wrb.13
 for <xen-devel@lists.xenproject.org>; Fri, 08 Apr 2022 11:21:12 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm24084701wry.102.2022.04.08.11.21.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Apr 2022 11:21:11 -0700 (PDT)
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
X-Inumbo-ID: ab6f3b43-b768-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NuxJyRB5x0/heBY3jwDaB5SfCddesye7krGp4eE2q70=;
        b=m8Sh2gdK91QLmW/qg5fDhaYaWE7nJmFbmdgGdyx2kHrhJJR7JvYjZzmSnAp8iGuEVT
         zszSdw5Xc9DuI1PmNFisLwxl1l4AHU0aRBQSc7b875k8KaGrgY+cMKijb9JE3F2ZKpWU
         UuoGe1mlIV6B2E4W7PaQIB35616XskHBmNsnUmjAi5F1yOHXN4TyHZV7e0rxtLRDRpvr
         eXDOoea091l3JD0d2fjMGoswU8JldoLNEKKMTQFKKCzC5+9UyuWlTSbvlwfY2Wh5QLMx
         K3pqdqdp7woIgXJX+OiB9MLSifxPjl5w9uA949XXFVttn1auo+fTmhKiFfD+zqHbzr7T
         TjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NuxJyRB5x0/heBY3jwDaB5SfCddesye7krGp4eE2q70=;
        b=QfDMMUBWWjCTHvwn09rKF7A/iYFSbWgkGjLYIZF+xWMm1tqT3pKcGvTqcft0p38kSh
         8BMVlParQN8LvqJQtYwkPDVoZGP041XyM0xkKTe6DxojAoE2lOUyoEaDJH1JhiMvzVW2
         oh+9pGuvIjg1WzF5GQYrgfmU4CYIDND4o1XyTlPEv+iWPkFoX2uJLTp4KZxF5hwCfBoV
         kkP65Ol4vY2y3lVGMkbXC3JNlJdA1q++Ohxddaq8Yc/nJaz6+ZOMp43zzwRurHVY05Ug
         MU7fTy66esSKMHq5lYQJO+HVdJ2tnmaOb7PF7XrMYCQHm+5fCI9KyoD5XnpRx44wmtFk
         fClw==
X-Gm-Message-State: AOAM530K1Ve3AjmMNg9hOb0aPuju3nCvGDNSveQK9Kb2vfBoKW5Px+FA
	GzMczTLOu9MKOF99u0xxN9roQEw0InE=
X-Google-Smtp-Source: ABdhPJx2rctZNlDNgzi60tL2lH3tOr93x2gmGT4TX73qB0jnjaqycO+f217D+W+FIJPlxmfjAH1FYQ==
X-Received: by 2002:adf:f6c4:0:b0:206:1581:dabc with SMTP id y4-20020adff6c4000000b002061581dabcmr15961282wrp.375.1649442071547;
        Fri, 08 Apr 2022 11:21:11 -0700 (PDT)
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
Subject: [PATCH V7 0/2] Virtio support for toolstack on Arm (Was "IOREQ feature (+ virtio-mmio) on Arm")
Date: Fri,  8 Apr 2022 21:21:03 +0300
Message-Id: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
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
(9120b5737f517fe9d2a3936c38d3a2211630323b livepatch: avoid relocations referencing ignored section symbols)
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

[3] https://github.com/otyshchenko1/xen/commits/libxl_virtio2
[4] https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant


Julien Grall (1):
  libxl: Introduce basic virtio-mmio support on Arm

Oleksandr Tyshchenko (1):
  libxl: Add support for Virtio disk configuration

 docs/man/xl-disk-configuration.5.pod.in   |  37 +-
 tools/golang/xenlight/helpers.gen.go      |   6 +
 tools/golang/xenlight/types.gen.go        |  11 +
 tools/include/libxl.h                     |   6 +
 tools/libs/light/libxl_arm.c              | 131 +++-
 tools/libs/light/libxl_device.c           |  57 +-
 tools/libs/light/libxl_disk.c             | 111 +++-
 tools/libs/light/libxl_internal.h         |   1 +
 tools/libs/light/libxl_types.idl          |  10 +
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_utils.c            |   2 +
 tools/libs/util/libxlu_disk_l.c           | 952 +++++++++++++++---------------
 tools/libs/util/libxlu_disk_l.h           |   2 +-
 tools/libs/util/libxlu_disk_l.l           |   9 +
 tools/xl/xl_block.c                       |  11 +
 xen/include/public/arch-arm.h             |   7 +
 16 files changed, 872 insertions(+), 482 deletions(-)

-- 
2.7.4


