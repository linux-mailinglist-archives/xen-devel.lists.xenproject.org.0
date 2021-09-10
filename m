Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F64070D4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 20:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184708.333417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOl7Y-0003CN-FV; Fri, 10 Sep 2021 18:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184708.333417; Fri, 10 Sep 2021 18:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOl7Y-0003AZ-Bp; Fri, 10 Sep 2021 18:19:28 +0000
Received: by outflank-mailman (input) for mailman id 184708;
 Fri, 10 Sep 2021 18:19:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ConJ=OA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mOl7W-0003AT-4x
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 18:19:26 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0a8c750-8b39-48f1-ae36-b4a0802e83f7;
 Fri, 10 Sep 2021 18:19:24 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id h1so4570466ljl.9
 for <xen-devel@lists.xenproject.org>; Fri, 10 Sep 2021 11:19:24 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a7sm625045lfi.15.2021.09.10.11.19.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Sep 2021 11:19:22 -0700 (PDT)
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
X-Inumbo-ID: a0a8c750-8b39-48f1-ae36-b4a0802e83f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=2wDtrZhJLGcQTMVD7Lr0thv21N4TDU7fV2GjxD/iV08=;
        b=luTtFfp9KMWgKC5T1lBIVoOK7Go4qfHeEWHubo7zAqMPEmbaUhDt5zTKryom0S7/JM
         UUxCSO8QTrJTJBO/MVIsaZaktWA9wNZMHS6HZQCpE7TmCGkhVYhfJZjLUvRNWB9xVa/s
         9UdyNjo+/T4lf8c6h1sKs2ZxsgAbcUz627HuJuyfyJVUAVsoIi/Y2V0IgGEQwNJelS5Y
         dfDPo4Un8LntQqSidk/OArIlckEazIyMqNAoLuFkku+5JdHk3LHC58EweJ3Soz+1z4zi
         YnRnNfJKXihAwQGMlwVT73O1tN597utXANRio6U9xL9mHwPQHNpsWmWDp0PziKmUKNTm
         5amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2wDtrZhJLGcQTMVD7Lr0thv21N4TDU7fV2GjxD/iV08=;
        b=p5I3MYyCL2K7sLJ2Ekvrsx++maPW0ngisloB2yrBYzw1cqdzO9zJzWwfc9zWSZFTrD
         8qvBr5ZGJArLwvTwDgl719eFetwxUVtCwN9lETxrxT934evItWHY4pLtURoIqdyFSXoL
         O3HtjxNeU1rEPYV3ToiaB5G4+7wNDFvAk6kVhugpS28QqpHjAC0HxdKv7LaBpKK6mySY
         h8YD1Zz7bOTIoJEP5bJmWo/o4Ita9trdSEjhz7AW5jdqEkBCSA70ogIFWXbJ3bPC0e/K
         sdbbKH7QiqCMfSC2bR792tuKpzbIlFly8ZzQrRTnE6QEyLhp38KPp9cr81fF5SxRzlIs
         tfbA==
X-Gm-Message-State: AOAM533Uy4EnNt5C6kh/73U2MkrZXK77A1sITW65XAK2WtMym75T0u9Z
	3KSrM8psM5k7kIZwfxNsQ6IOrCdcSXI=
X-Google-Smtp-Source: ABdhPJz9QlSP5NndOvc9v2JpCsObXt/dZ91lpDHfb2Iqv1jj7tluDjLjMLEDqLbRR/Vsx1y+eaEC2Q==
X-Received: by 2002:a2e:814e:: with SMTP id t14mr5280480ljg.473.1631297963344;
        Fri, 10 Sep 2021 11:19:23 -0700 (PDT)
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
Subject: [PATCH V2 0/3] Add handling of extended regions (safe ranges) on Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
Date: Fri, 10 Sep 2021 21:18:41 +0300
Message-Id: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

You can find an initial discussion at [1] and [2].

The extended region (safe range) is a region of guest physical address space
which is unused and could be safely used to create grant/foreign mappings instead
of wasting real RAM pages from the domain memory for establishing these mappings.

The extended regions are chosen at the domain creation time and advertised
to it via "reg" property under hypervisor node in the guest device-tree
(the indexes for extended regions are 1...N).
No device tree bindings update is needed, guest infers the presense of extended
regions from the number of regions in "reg" property.
New compatible/property will be needed (but only after this patch [3] or alternative
goes in) to indicate that "region 0 is safe to use". Until this patch is merged it is
not safe to use extended regions for the grant table space.

The extended regions are calculated differently for direct mapped
Dom0 (with and without IOMMU) and non-direct mapped DomUs.

Please note the following limitations:
- The extended region feature is only supported for 64-bit domain.
- The ACPI case is not covered.

Xen patch series is also available at [4]. The corresponding Linux patch series is at [5] for now
(last 4 patches).

Tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with updated virtio-disk backend [6]
running in Dom0 (256MB RAM) and DomD (2GB RAM). In both cases the backend pre-maps DomU memory
which is 3GB. All foreign memory gets mapped into extended regions (so the amount of RAM in
the backend domain is not reduced). No issues were observed.

[1] https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/
[2] https://lore.kernel.org/xen-devel/1631034578-12598-1-git-send-email-olekstysh@gmail.com/
[3] https://lore.kernel.org/xen-devel/1631228688-30347-1-git-send-email-olekstysh@gmail.com/
[4] https://github.com/otyshchenko1/xen/commits/map_opt_ml3
[5] https://github.com/otyshchenko1/linux/commits/map_opt_ml2
[6] https://github.com/otyshchenko1/virtio-disk/commits/map_opt_next

Oleksandr Tyshchenko (3):
  xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
  xen/arm: Add handling of extended regions for Dom0
  libxl/arm: Add handling of extended regions for DomU

 tools/include/libxl.h            |   7 ++
 tools/libs/light/libxl.c         |   2 +
 tools/libs/light/libxl_arm.c     |  89 ++++++++++++++-
 tools/libs/light/libxl_types.idl |   2 +
 xen/arch/arm/domain_build.c      | 226 ++++++++++++++++++++++++++++++++++++++-
 xen/arch/arm/sysctl.c            |   2 +
 xen/arch/x86/sysctl.c            |   2 +
 xen/include/public/sysctl.h      |   3 +-
 8 files changed, 328 insertions(+), 5 deletions(-)

-- 
2.7.4


