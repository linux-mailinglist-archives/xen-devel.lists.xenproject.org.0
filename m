Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB342960D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 19:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206420.361986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzQF-0001yK-M5; Mon, 11 Oct 2021 17:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206420.361986; Mon, 11 Oct 2021 17:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzQF-0001vv-J5; Mon, 11 Oct 2021 17:49:11 +0000
Received: by outflank-mailman (input) for mailman id 206420;
 Mon, 11 Oct 2021 17:49:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=obo4=O7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mZzQD-0001vo-Il
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 17:49:09 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ec24e22-19c1-4933-9872-8733249f8a14;
 Mon, 11 Oct 2021 17:49:08 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id j21so59258943lfe.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Oct 2021 10:49:08 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h4sm789688lfk.193.2021.10.11.10.49.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Oct 2021 10:49:06 -0700 (PDT)
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
X-Inumbo-ID: 7ec24e22-19c1-4933-9872-8733249f8a14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=vPpPUAzXrj0gMt+2vHmt58Cm6+FwkIlfdfX8jY3NNww=;
        b=LDvb6TVm2oGo0oDIOIlTf9ImmXZjsxRa+XcTl+5twYV+wVzkJMXSc2Lj2Pdr2Esh2u
         VDPHoEJJ6YcdIyy0x0WsbouuBpLHxOeEctjKdRWXDFh13MGgHJO1HQ3XHAhOoEcJKeuO
         u8UmqZxNsYaVpeyPno37YGIw4ikNpysZuE7fGY9EH21Au3+IxubbjLNuku4lgrkAPN8M
         Frv+hZXq+YRzEjAVyjyIxT/fgunX1v9VkjhuXIKfoEN/+bfrzF/EXuPjHmYLxDAltnLa
         f/ISzAypajO7a44wp5rhp61mF8ckF2n26LQFe9GHtxvMeDyXUhq3O85aS5FLluEaTffK
         F1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vPpPUAzXrj0gMt+2vHmt58Cm6+FwkIlfdfX8jY3NNww=;
        b=Gr5NmBLfFFB4cJMYTVbv9vDLnbD8N8IfTqEYLUtugoXD6LaLGy7iZvA1PwAn2L1iq9
         gA30i3fKpdvAtNA2Ay/AMPeioNRdECYT8S4OozH/zc4hfIaFIyeFF+5dYDf5vX5vBUP2
         94cM8p/aZ+AMETSk/vhNHH6PYoQCJCIxIRpqejbHOd0QrSyplwU4vhzA/VhX34Q6dSZl
         YXZzCnQlLBojo2GCIelafl7iUS07ti/nOHmhNOhP5ORIcG/ANU3blAtvKuaQpV2PKt7a
         3a9n5WuS30SWDJM7MpxQODasR001rb1VcOHZbaT1dMqE1fvnG8Pplig93/B8i9khrb0I
         4Aug==
X-Gm-Message-State: AOAM531C+GO+0hqVQLhife9ql9it7Flncb51gi1OemxS1o5MenthR3nJ
	3+5HI3Koa28IGjoLTmveUDq7ekiLu88=
X-Google-Smtp-Source: ABdhPJyxk9Vuo0kJojQh0+DR87ja8CZUqZWGa2bfNjIQBAwdSjW6MRmEDs9E2bLClu3j6o+ewQk3Lg==
X-Received: by 2002:a2e:5c8:: with SMTP id 191mr25133179ljf.126.1633974546816;
        Mon, 11 Oct 2021 10:49:06 -0700 (PDT)
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
Subject: [PATCH V6 0/2] Add handling of extended regions (safe ranges) on Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
Date: Mon, 11 Oct 2021 20:48:57 +0300
Message-Id: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

You can find an initial discussion at [1]-[6].

The extended region (safe range) is a region of guest physical address space
which is unused and could be safely used to create grant/foreign mappings instead
of wasting real RAM pages from the domain memory for establishing these mappings.

The extended regions are chosen at the domain creation time and advertised
to it via "reg" property under hypervisor node in the guest device-tree
(the indexes for extended regions are 1...N).
No device tree bindings update is needed, guest infers the presense of extended
regions from the number of regions in "reg" property.
New compatible/property will be needed (but only after this patch [7] or alternative
goes in) to indicate that "region 0 is safe to use". Until this patch is merged it is
not safe to use extended regions for the grant table space.

The extended regions are calculated differently for direct mapped Dom0 (with and without
IOMMU) and non-direct mapped DomUs.

Please note the following limitations:
- The extended region feature is only supported for 64-bit domain currently.
- The ACPI case is not covered.

Please note that support for Dom0 was already committed, so these patches are remaining DomU bits.

Xen patch series is also available at [8]. The corresponding Linux patch series is at [9]
for now (last 4 patches).

Tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with updated virtio-disk backend [10]
running in Dom0 (256MB RAM) and DomD (2GB RAM). In both cases the backend pre-maps DomU memory
which is 3GB. All foreign memory gets mapped into extended regions (so the amount of RAM in
the backend domain is not reduced). No issues were observed.

[1] https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/
[2] https://lore.kernel.org/xen-devel/1631034578-12598-1-git-send-email-olekstysh@gmail.com/
[3] https://lore.kernel.org/xen-devel/1631297924-8658-1-git-send-email-olekstysh@gmail.com/
[4] https://lore.kernel.org/xen-devel/1632437334-12015-1-git-send-email-olekstysh@gmail.com/
[5] https://lore.kernel.org/xen-devel/1632955927-27911-1-git-send-email-olekstysh@gmail.com/
[6] https://lore.kernel.org/xen-devel/1633519346-3686-1-git-send-email-olekstysh@gmail.com/
[7] https://lore.kernel.org/xen-devel/1632425551-18910-1-git-send-email-olekstysh@gmail.com/
[8] https://github.com/otyshchenko1/xen/commits/map_opt_ml7
[9] https://github.com/otyshchenko1/linux/commits/map_opt_ml4
[10] https://github.com/otyshchenko1/virtio-disk/commits/map_opt_next

Oleksandr Tyshchenko (2):
  xen/arm: Introduce gpaddr_bits field to struct
    xen_domctl_getdomaininfo
  libxl/arm: Add handling of extended regions for DomU

 tools/include/libxl.h            |  8 +++++
 tools/include/xenctrl.h          |  1 +
 tools/libs/ctrl/xc_domain.c      |  1 +
 tools/libs/light/libxl_arm.c     | 76 +++++++++++++++++++++++++++++++++++++---
 tools/libs/light/libxl_domain.c  |  1 +
 tools/libs/light/libxl_types.idl |  1 +
 xen/arch/arm/domctl.c            |  2 ++
 xen/arch/x86/domctl.c            |  1 +
 xen/include/public/arch-arm.h    |  2 ++
 xen/include/public/domctl.h      |  3 +-
 10 files changed, 90 insertions(+), 6 deletions(-)

-- 
2.7.4


