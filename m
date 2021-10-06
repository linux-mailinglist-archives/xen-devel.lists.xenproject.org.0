Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769EF423C96
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 13:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202813.357836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY50N-0001lt-Hi; Wed, 06 Oct 2021 11:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202813.357836; Wed, 06 Oct 2021 11:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY50N-0001is-Di; Wed, 06 Oct 2021 11:22:35 +0000
Received: by outflank-mailman (input) for mailman id 202813;
 Wed, 06 Oct 2021 11:22:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZr5=O2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mY50L-0001im-LD
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:22:33 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05e073ce-9d93-457f-88d5-91894cc63882;
 Wed, 06 Oct 2021 11:22:32 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id n8so8860184lfk.6
 for <xen-devel@lists.xenproject.org>; Wed, 06 Oct 2021 04:22:32 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l14sm1002101lfe.124.2021.10.06.04.22.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Oct 2021 04:22:31 -0700 (PDT)
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
X-Inumbo-ID: 05e073ce-9d93-457f-88d5-91894cc63882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=ZhSLsOP6lsWn/L5EMw3XksYmd81bgikwOdA/ODGGuFU=;
        b=BrAJcUCQ1jhmBKSrWsqilU+HDbqqHOARC63p8U/xATxRZwj2kSVJFrVAuKmjuI1xYW
         a5yLAXFg+j+8LLMfq0SBSWERuA1rLc7VYB1WD8A0ckvuD8fWE3lc6qEzIiKIg9gyNeXy
         1Y5s9sNet9CuMuiEbF+3vTORmojx7M47BbcwdD4zyANpwtDnL8qwxx+i4F2HAyvieA7P
         fEswILbz7SOLoC006SR+w48f+p87cH2DME3bu5EhKaxb8A+KstwrRhHU4HGImtqU8g0P
         EmjlYsvLC2x9UITntDWrSsC/NOlJCCjYzX5fCaY4nYK9MTIV9UG+QUO4rHgvN4K/P8ZD
         t9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZhSLsOP6lsWn/L5EMw3XksYmd81bgikwOdA/ODGGuFU=;
        b=PyD58yA8zcnmYeCbMpA0Wcva6TmKJ+D4ZzBFjsSlhkBpbvRGjLf3laJ5u8BV9nU/sM
         S4MOycdnTyevv5KJTJxaSvaphSnmDQ4asZIQ5y5rJG9r5aHRvH4PUvadNxJpn9sFkFuv
         E3HrGQbo5kvtB28HDqRhmWB10O9ldjtuaZckMsklWRzPaXrdBzjYQ5szms2rTBLEpCvr
         dt+UmVRyDEfyFvg88psDojew+5w45CkC5rrfkpTaT4Hcj+h1UBIcloyyYTAp+3taYpCH
         UodM7OI1W8Gm2hQSq5Mz7O4n5bUzYdRbEA8IzenccXrfBMv27jwXTIpTHJ0hEvsANh0F
         HC2g==
X-Gm-Message-State: AOAM532WmCjzavlhH2bS7/vTowiE8hGi8IxmaF7WO6zbc3JW0fBhYejs
	/QAled/kYmmZQhUWY1YSrYCLZ8qzmso=
X-Google-Smtp-Source: ABdhPJyYo4Zu3hM+ebs4ZZYmJR8fy2Cfmjk6/eKIxkjNqqDgCJ//WPZICs4tC9Y58zhrwqDDbYxlfw==
X-Received: by 2002:a05:6512:3190:: with SMTP id i16mr8789406lfe.104.1633519351430;
        Wed, 06 Oct 2021 04:22:31 -0700 (PDT)
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
	Henry Wang <Henry.Wang@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: [PATCH V5 0/3] Add handling of extended regions (safe ranges) on Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
Date: Wed,  6 Oct 2021 14:22:23 +0300
Message-Id: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

You can find an initial discussion at [1]-[5].

The extended region (safe range) is a region of guest physical address space
which is unused and could be safely used to create grant/foreign mappings instead
of wasting real RAM pages from the domain memory for establishing these mappings.

The extended regions are chosen at the domain creation time and advertised
to it via "reg" property under hypervisor node in the guest device-tree
(the indexes for extended regions are 1...N).
No device tree bindings update is needed, guest infers the presense of extended
regions from the number of regions in "reg" property.
New compatible/property will be needed (but only after this patch [6] or alternative
goes in) to indicate that "region 0 is safe to use". Until this patch is merged it is
not safe to use extended regions for the grant table space.

The extended regions are calculated differently for direct mapped Dom0 (with and without
IOMMU) and non-direct mapped DomUs.

Please note the following limitations:
- The extended region feature is only supported for 64-bit domain currently.
- The ACPI case is not covered.

Please note that support for Dom0 [7] was already committed and the last patch in this series
is a requested follow-up.

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
[6] https://lore.kernel.org/xen-devel/1632425551-18910-1-git-send-email-olekstysh@gmail.com/
[7] https://lore.kernel.org/xen-devel/1632955927-27911-3-git-send-email-olekstysh@gmail.com/
[8] https://github.com/otyshchenko1/xen/commits/map_opt_ml6
[9] https://github.com/otyshchenko1/linux/commits/map_opt_ml4
[10] https://github.com/otyshchenko1/virtio-disk/commits/map_opt_next

Oleksandr Tyshchenko (3):
  xen/arm: Introduce gpaddr_bits field to struct xen_arch_domainconfig
  libxl/arm: Add handling of extended regions for DomU
  xen/arm: Updates for extended regions support

 docs/misc/arm/device-tree/guest.txt |  12 ++--
 tools/include/libxl.h               |   5 ++
 tools/libs/light/libxl_arm.c        |  82 +++++++++++++++++++++++++--
 tools/libs/light/libxl_types.idl    |   1 +
 xen/arch/arm/domain.c               |   6 ++
 xen/arch/arm/domain_build.c         | 108 ++++++++++++++++++++++--------------
 xen/include/public/arch-arm.h       |   7 +++
 xen/include/public/domctl.h         |   2 +-
 8 files changed, 170 insertions(+), 53 deletions(-)

-- 
2.7.4


