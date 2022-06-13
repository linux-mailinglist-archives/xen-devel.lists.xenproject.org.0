Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE1549B15
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 20:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348444.574681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0oRi-0000RX-Sp; Mon, 13 Jun 2022 18:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348444.574681; Mon, 13 Jun 2022 18:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0oRi-0000Pd-Pm; Mon, 13 Jun 2022 18:05:50 +0000
Received: by outflank-mailman (input) for mailman id 348444;
 Mon, 13 Jun 2022 18:05:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WHVA=WU=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o0oRg-0000PT-QO
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 18:05:48 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73142f65-eb43-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 20:05:46 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id c4so10092384lfj.12
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jun 2022 11:05:46 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a2e7c12000000b00253ceefb668sm1038104ljc.60.2022.06.13.11.05.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 11:05:45 -0700 (PDT)
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
X-Inumbo-ID: 73142f65-eb43-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3X433a3FF43hMBG6s4c1d0hQ8N/X8C5lhmNEz7SbdLU=;
        b=K1vz95IGkglMSxjYaoyzhSsB9kpBR3D32ASHS+9IsM6ydL6Cf136Yml0m2JSWroJJ8
         3orA6sucLm3Y3hmFCBC9p22Q7w/N2Gbv3HYGkLh2dKg65CO7XF4ox0V/KQ20AB1SWWOJ
         86BZMgqM9bQM1TeJXvBP/sZbFCQqpAuNlwOixXV02SthdbHmPANPWjB7D8bckxt44mgy
         l+1T9CVyMIqOlFSOjkVa6t10HdfwQRtK2oC/mw6hkTcyqnGxsXl9xFVsM0KrKXJvUOAT
         ho+QboMKXVkjNhJ1AM9f0LNCkAl9wBqsUEugZu5y2fLzoyxEhtQfILnhQXNDOlM+FJic
         NA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3X433a3FF43hMBG6s4c1d0hQ8N/X8C5lhmNEz7SbdLU=;
        b=kujE5pKArHgeluJD6J6VaRGdo6hwjnAH9QsfAIRVFIG2lklgtGDN+Diwtp2rw9C42u
         1d4QYGDBKo7+lj+RvLbIb6DW+MURDw/OhxpqLcg3QlOzT8OWOrHH5CDd8/oge7c+q1MP
         XzepeUjrXIX7Hj7tsr9O6yjzTtPPYd1Tcr5kn7Hz6l1DIQRR9zbm2JsiUPVXFy0zYjna
         FzjBig9AO3UIDxrWSj1Oar++p9Xn4J9YjZ+EUM9RUElhUcdX3fWh46Ty5f4OpW2PP4FJ
         rmKfmDBwYRIIugNjLRRl7z+KG6zIhSk6Nl4+zkkhFfXwwOmbMpNi6NqtjT0Rv/O8Dw6W
         bBMw==
X-Gm-Message-State: AJIora+LeXcFxTA9Da+dlauRfndxwuZ5fp5wLkBJ79WDQ+3IRAlJ1QHM
	gViTCLLPBYv+1FbtW5dj6XdRRBIURJQ=
X-Google-Smtp-Source: AGRyM1uMpG4usfSrwKkDWOXbd142Prl8AlpC/rS1kFj5zYT98But2bSOpQaQg+Id3svm/CSpUQZKaQ==
X-Received: by 2002:ac2:5f5c:0:b0:478:f5dc:f1c4 with SMTP id 28-20020ac25f5c000000b00478f5dcf1c4mr637955lfz.317.1655143545927;
        Mon, 13 Jun 2022 11:05:45 -0700 (PDT)
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
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH V10 0/3] Virtio support for toolstack on Arm (Was "IOREQ feature (+ virtio-mmio) on Arm")
Date: Mon, 13 Jun 2022 21:05:19 +0300
Message-Id: <1655143522-14356-1-git-send-email-olekstysh@gmail.com>
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
(c9a707df83aad17a6fcf2e8330ab3b5bead6fb8b xen/arm: mm: Re-implement setup_frame_table_mappings() with map_pages_to_xen())
and tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio based virtio-disk backend [4]
running in Dom0 (or Driver domain) and unmodified Linux Guest running on existing virtio-blk driver (frontend).
No issues were observed. Guest domain 'reboot/destroy' use-cases work properly.

!!! Please note, for V10 I included commit "libxl/arm: Create specific IOMMU node to be referred by virtio-mmio
devices" which depends on the current series [5]. All patches except "libxl: Add support for Virtio disk
configuration" have Stefano's and Anthony's R-b tags.

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
https://lore.kernel.org/xen-devel/1654106261-28044-1-git-send-email-olekstysh@gmail.com/

[3] https://github.com/otyshchenko1/xen/commits/libxl_virtio_next3
[4] https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant

[5] https://lore.kernel.org/xen-devel/1653944813-17970-1-git-send-email-olekstysh@gmail.com/
    https://lore.kernel.org/xen-devel/1654197833-25362-1-git-send-email-olekstysh@gmail.com/

Julien Grall (1):
  libxl: Introduce basic virtio-mmio support on Arm

Oleksandr Tyshchenko (2):
  libxl: Add support for Virtio disk configuration
  libxl/arm: Create specific IOMMU node to be referred by virtio-mmio
    device

 docs/man/xl-disk-configuration.5.pod.in   |  38 +-
 tools/golang/xenlight/helpers.gen.go      |   8 +
 tools/golang/xenlight/types.gen.go        |  18 +
 tools/include/libxl.h                     |   7 +
 tools/libs/light/libxl_arm.c              | 164 ++++-
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
 xen/include/public/device_tree_defs.h     |   3 +-
 17 files changed, 968 insertions(+), 483 deletions(-)

-- 
2.7.4


