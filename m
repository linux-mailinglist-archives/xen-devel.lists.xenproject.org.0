Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9155518B0A
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 19:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319813.540215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlwHt-0006L2-7k; Tue, 03 May 2022 17:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319813.540215; Tue, 03 May 2022 17:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlwHt-0006JD-4t; Tue, 03 May 2022 17:26:13 +0000
Received: by outflank-mailman (input) for mailman id 319813;
 Tue, 03 May 2022 17:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5nwV=VL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nlwHr-0006J7-TG
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 17:26:11 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20043ed7-cb06-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 19:26:11 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id p10so31450603lfa.12
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 10:26:11 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a2e9dd2000000b0024f275bb06asm1395134ljj.3.2022.05.03.10.26.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 May 2022 10:26:08 -0700 (PDT)
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
X-Inumbo-ID: 20043ed7-cb06-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umOQGchKDeLfvuk7Ji346IJN/L3nIUwISV47GPcVMhE=;
        b=T7RaQs+80EORAFR76+IMwfgrxBJGUE91BqYOUhT404Onmft+qauRAB/gQ/yuAkFHCT
         G4+nJ2hPwc8VA7ybyq5XbiTlbUa48XueYSSo4fcTOGaFtqRUM21RT+hoBX5yhEuFShGi
         Kg580saW2muxAi+3w0o3K6Jl/AKIOSqO08hsAxGM7ZHZdslGVCOv1SuxsDfD5ryS8Dp0
         4xxAcvOid95eKNPzMKSenptlH68a0I5Bxa0ImqJ1pYbN69E4fsY3Z4sLGCujuOzKdiAo
         lYsnvAAE+LI0qC/42/NCCfNf5yYYlDZscoZj0g3TfwH/u8PCAcfvDZOOLa39p2u6w6P8
         HWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umOQGchKDeLfvuk7Ji346IJN/L3nIUwISV47GPcVMhE=;
        b=l7ucnGDf+ynuNlRWT7LwnJ1J6ZXXrBjy5hvWRefddPhqocmiCpfYgjfsZtnVJ3aU8e
         ON9WLrv2bT9hm1+AQy19k3XfFAuCWWSKMJRyd814+JIPZ4CTKysmJxfIDVCoIEBMxGwO
         bqSri/yUYQ/ZXqmXmhQO3bagYqDkSXgA9MtjTuoz/DQM6Ozg92FGSm+fvV79SkJ6xsYE
         wvKgIi6Y9p9rLXUMz3YSDNW0bOVN0pchXmVPjtWWoYyPtN4B+dtl1ykN/+GFZwBLLFXV
         /brVKkFoCiogj0RwQ1qaHWp0Btt1HwVrMYHIqZdWGny05pkCen5B+3gB8+/Spm3aKuLI
         QZkA==
X-Gm-Message-State: AOAM533AcOl5FYDVnQzrhCl5lWMFbDtK+bIescCgtNcixzhKWrDeGn80
	0Ytf17CXrRD5Mebpu1lMuKJPCUtii5c=
X-Google-Smtp-Source: ABdhPJx2oNncq4yrPTUffO2Fx80aFKy+L4yK4rjO+SaKcJGTvB1KLiN/aaZ7Yb7SO9+g7efJ/YfL7g==
X-Received: by 2002:a05:6512:398b:b0:472:5b79:32f5 with SMTP id j11-20020a056512398b00b004725b7932f5mr9973401lfu.636.1651598769536;
        Tue, 03 May 2022 10:26:09 -0700 (PDT)
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
Subject: [PATCH V8 0/2] Virtio support for toolstack on Arm (Was "IOREQ feature (+ virtio-mmio) on Arm")
Date: Tue,  3 May 2022 20:26:01 +0300
Message-Id: <1651598763-12162-1-git-send-email-olekstysh@gmail.com>
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
(fa6dc0879ffd3dffffaea2837953c7a8761a9ba0 page_alloc: assert IRQs are enabled in heap alloc/free)
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

[3] https://github.com/otyshchenko1/xen/commits/libxl_virtio3
[4] https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant

Julien Grall (1):
  libxl: Introduce basic virtio-mmio support on Arm

Oleksandr Tyshchenko (1):
  libxl: Add support for Virtio disk configuration

 docs/man/xl-disk-configuration.5.pod.in   |  38 +-
 tools/golang/xenlight/helpers.gen.go      |   8 +
 tools/golang/xenlight/types.gen.go        |  18 +
 tools/include/libxl.h                     |   7 +
 tools/libs/light/libxl_arm.c              | 118 +++-
 tools/libs/light/libxl_device.c           |  62 +-
 tools/libs/light/libxl_disk.c             | 136 ++++-
 tools/libs/light/libxl_internal.h         |   2 +
 tools/libs/light/libxl_types.idl          |  16 +
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_utils.c            |   2 +
 tools/libs/util/libxlu_disk_l.c           | 959 +++++++++++++++---------------
 tools/libs/util/libxlu_disk_l.h           |   2 +-
 tools/libs/util/libxlu_disk_l.l           |   9 +
 tools/xl/xl_block.c                       |  11 +
 xen/include/public/arch-arm.h             |   7 +
 16 files changed, 914 insertions(+), 482 deletions(-)

-- 
2.7.4


