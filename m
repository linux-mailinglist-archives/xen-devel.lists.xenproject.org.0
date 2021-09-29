Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8EA41CF83
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 00:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199327.353311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mViRK-0005hG-5a; Wed, 29 Sep 2021 22:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199327.353311; Wed, 29 Sep 2021 22:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mViRK-0005eU-2X; Wed, 29 Sep 2021 22:52:38 +0000
Received: by outflank-mailman (input) for mailman id 199327;
 Wed, 29 Sep 2021 22:52:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XAMn=OT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mViRI-0005eO-DP
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 22:52:36 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f45b94f-b844-4215-9cc7-eaf060905e3e;
 Wed, 29 Sep 2021 22:52:34 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z24so17049919lfu.13
 for <xen-devel@lists.xenproject.org>; Wed, 29 Sep 2021 15:52:34 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g26sm133178lja.16.2021.09.29.15.52.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Sep 2021 15:52:33 -0700 (PDT)
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
X-Inumbo-ID: 5f45b94f-b844-4215-9cc7-eaf060905e3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=pXpW4hIKiLN3Bm2D+gLtF28MQzPdlZAEENqKnqgOkgw=;
        b=E6TbyQIW8pbfhjdtmu4cl3auKbaggZh/cL+3dOe4AkkFDdvaDzme25J1viTF0PGy0m
         oxJUFbJT5bKOecH0br1O0IS7OWL2JqMTBjOHNf2NxpwdNL/QuBrvql7Q089jMMaiRIKC
         UHeSda/qKec5ppPtLILPwPpYXn5tVV/pfz/JKHHiwcuArucLw0yxwAgWQwQCK7D3eSaD
         WzyrCaEM3sXK5gCWHrRm/ZRYy5mX9MjPzw9mUUbb7SnxBEOOmRpbiyTgZ94WrwMtpUHq
         eMWSzj0/Oq2hQqt5OuWZhBZ8PXbsWMV4Un4xn1LQNSk440/gW4lRtdjwugdaXAtlWNk2
         ygsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pXpW4hIKiLN3Bm2D+gLtF28MQzPdlZAEENqKnqgOkgw=;
        b=yb2jfej/XEoh8qox2nwKh4vqKbGm+FWLZkghvxZyqZeA+jAcOI4HQ9Q1QL7Xo9f6f1
         NK1MaPf5eZSsw/meNvH2ydUyA50MtqC4q3liLSVwou1Y8ejZcY8FlZuihJqYqijog/iv
         L7+Xvjv1YwUPDMCGYR9QZGsg4XFxUUEfpFaac/wra6Yn4Zeaz1O7rGgRGNlV5ZsseGxs
         RICbx/AySU2zL8KVrY3g/bUTyeFFJSm3RCoNtR8DceZzQV9hdjlAUGd7ZcvEfEI8yulv
         KDfBvG+ZwlAx6FPny9SCkGkxt/PafRir751eG7jJkTNj9Rq+XMHz+iSXnhboEIIF+RoZ
         c9Xg==
X-Gm-Message-State: AOAM532j5oP3JHcHA4JlTw3LDgbZbjjJqowkgLnJ9ovvO/SqPVsfulC2
	TRfO+ZjdzhC4KHM2Op4GKo1KTcTmLM2BaQ==
X-Google-Smtp-Source: ABdhPJxlvxenimr81Aw9teWgnwEQY7+GVOVZLk95wY6b0sb6ENv9VL9xNUucOGDuerfW8TltNju67Q==
X-Received: by 2002:a05:6512:3087:: with SMTP id z7mr2279728lfd.556.1632955953448;
        Wed, 29 Sep 2021 15:52:33 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: [PATCH V4 0/3] Add handling of extended regions (safe ranges) on Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
Date: Thu, 30 Sep 2021 01:52:04 +0300
Message-Id: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

You can find an initial discussion at [1]-[4].

The extended region (safe range) is a region of guest physical address space
which is unused and could be safely used to create grant/foreign mappings instead
of wasting real RAM pages from the domain memory for establishing these mappings.

The extended regions are chosen at the domain creation time and advertised
to it via "reg" property under hypervisor node in the guest device-tree
(the indexes for extended regions are 1...N).
No device tree bindings update is needed, guest infers the presense of extended
regions from the number of regions in "reg" property.
New compatible/property will be needed (but only after this patch [5] or alternative
goes in) to indicate that "region 0 is safe to use". Until this patch is merged it is
not safe to use extended regions for the grant table space.

The extended regions are calculated differently for direct mapped Dom0 (with and without
IOMMU) and non-direct mapped DomUs.

Please note the following limitations:
- The extended region feature is only supported for 64-bit domain currently.
- The ACPI case is not covered.

Xen patch series is also available at [6]. The corresponding Linux patch series is at [7]
for now (last 4 patches).

Tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with updated virtio-disk backend [8]
running in Dom0 (256MB RAM) and DomD (2GB RAM). In both cases the backend pre-maps DomU memory
which is 3GB. All foreign memory gets mapped into extended regions (so the amount of RAM in
the backend domain is not reduced). No issues were observed.

[1] https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/
[2] https://lore.kernel.org/xen-devel/1631034578-12598-1-git-send-email-olekstysh@gmail.com/
[3] https://lore.kernel.org/xen-devel/1631297924-8658-1-git-send-email-olekstysh@gmail.com/
[4] https://lore.kernel.org/xen-devel/1632437334-12015-1-git-send-email-olekstysh@gmail.com/
[5] https://lore.kernel.org/xen-devel/1632425551-18910-1-git-send-email-olekstysh@gmail.com/
[6] https://github.com/otyshchenko1/xen/commits/map_opt_ml5
[7] https://github.com/otyshchenko1/linux/commits/map_opt_ml4
[8] https://github.com/otyshchenko1/virtio-disk/commits/map_opt_next

Oleksandr Tyshchenko (3):
  xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
  xen/arm: Add handling of extended regions for Dom0
  libxl/arm: Add handling of extended regions for DomU

 docs/misc/xen-command-line.pandoc |  11 ++
 tools/include/libxl.h             |   7 +
 tools/libs/light/libxl.c          |   2 +
 tools/libs/light/libxl_arm.c      |  70 +++++++++-
 tools/libs/light/libxl_types.idl  |   2 +
 tools/xl/xl_info.c                |   2 +
 xen/arch/arm/domain_build.c       | 286 +++++++++++++++++++++++++++++++++++++-
 xen/arch/arm/sysctl.c             |   2 +
 xen/arch/x86/sysctl.c             |   2 +
 xen/include/public/arch-arm.h     |   3 +
 xen/include/public/sysctl.h       |   4 +-
 11 files changed, 382 insertions(+), 9 deletions(-)

-- 
2.7.4


