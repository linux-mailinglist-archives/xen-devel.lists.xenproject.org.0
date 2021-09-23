Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA1416831
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 00:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194610.346701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTXWk-0003nr-6q; Thu, 23 Sep 2021 22:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194610.346701; Thu, 23 Sep 2021 22:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTXWk-0003m2-3j; Thu, 23 Sep 2021 22:49:14 +0000
Received: by outflank-mailman (input) for mailman id 194610;
 Thu, 23 Sep 2021 22:49:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES3T=ON=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mTXWi-0003lw-Gb
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 22:49:12 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebc77fb9-83f0-482b-8db8-80accfeb9db4;
 Thu, 23 Sep 2021 22:49:11 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id u18so31251863lfd.12
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 15:49:11 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q5sm230091lfd.17.2021.09.23.15.49.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Sep 2021 15:49:09 -0700 (PDT)
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
X-Inumbo-ID: ebc77fb9-83f0-482b-8db8-80accfeb9db4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=f+iHNZX30F+c9l8Tgf0I+ajS/K8LFWnAgou/URb3Z4Y=;
        b=N+1Lufe5p7WVXW7HUUXmUURqqG23MVOCB7LCzIOqorOjwy9lHld9ZQs2pkMmQSKm2W
         k5ThThDnlm1+53cyvcd9Dt0WNNfO4kcMLXj/76gwyVYu7xFWOp3WdtKcKxaNdyukWuLj
         WTR8NekI2+4n7yctj/BVce/BvqD3Wxe/MajVSBUjM+7PkU4//DanoRTFvgmLScELGSQl
         EKRuCOq7fNHJ1EWj979JHeuAJvN8+IcV/lJoAccpSr/mFRG9i3wRmkBTcSwUfvPdKvwP
         s9fGUYtYKuX9rK/CwOEAYPpyo+su8cysQAvyFiYJZy5v+ILEw3E4ZLFDC065qjr4GSmv
         hbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=f+iHNZX30F+c9l8Tgf0I+ajS/K8LFWnAgou/URb3Z4Y=;
        b=3auqtE2HQC/a1HtIJf2+K3UuuIV7bx+VjGg344KWiCmtcVsPHK1tAs2hgdPvjGxVVY
         4O3bS3MVE6Rp8NrxerA56rxDvglUc7n1atF6f5TRtzn78moZ0rgBDFUdFBOwUViL2JH6
         C8n5hfdujEPXllU26tjkVKtgBxF5O5NavcQrltcLDoMI7IMGOtvdSr6zaYFgxVQATmVC
         XQGrnoagVynFruXaB32DQijUJyylwwnyOuBFLU9Oo1IZ2xvB5drfgJmF2MNRr3idrgTo
         ghWsAkxBeUUgLmVCAO2z6BP+xAog1s946e/JAL34poXtp9x0/edFgKpdZCpt+ptPPjnb
         YZUw==
X-Gm-Message-State: AOAM530JkMdQYnCFYu4yQ5DT+zfefMbZaS6RBV6fd6zmXM9fpLoTEUuH
	oq7MaebNeI7YvH0qGxanH9pHYe3jYE4=
X-Google-Smtp-Source: ABdhPJygKD6RtIKZ2Y06/Ezq1izyho6x3eI+8nE5H7YHNvcqf13XKhchOtCUYGWwyt8Cc034TSUEjA==
X-Received: by 2002:ac2:5681:: with SMTP id 1mr6277604lfr.471.1632437349830;
        Thu, 23 Sep 2021 15:49:09 -0700 (PDT)
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
Subject: [PATCH V3 0/3] Add handling of extended regions (safe ranges) on Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
Date: Fri, 24 Sep 2021 01:48:51 +0300
Message-Id: <1632437334-12015-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

You can find an initial discussion at [1],[2] and [3].

The extended region (safe range) is a region of guest physical address space
which is unused and could be safely used to create grant/foreign mappings instead
of wasting real RAM pages from the domain memory for establishing these mappings.

The extended regions are chosen at the domain creation time and advertised
to it via "reg" property under hypervisor node in the guest device-tree
(the indexes for extended regions are 1...N).
No device tree bindings update is needed, guest infers the presense of extended
regions from the number of regions in "reg" property.
New compatible/property will be needed (but only after this patch [4] or alternative
goes in) to indicate that "region 0 is safe to use". Until this patch is merged it is
not safe to use extended regions for the grant table space.

The extended regions are calculated differently for direct mapped
Dom0 (with and without IOMMU) and non-direct mapped DomUs.

Please note the following limitations:
- The extended region feature is only supported for 64-bit domain currently.
- The ACPI case is not covered.

Xen patch series is also available at [5]. The corresponding Linux patch series is at [6] for now
(last 4 patches).

Tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with updated virtio-disk backend [7]
running in Dom0 (256MB RAM) and DomD (2GB RAM). In both cases the backend pre-maps DomU memory
which is 3GB. All foreign memory gets mapped into extended regions (so the amount of RAM in
the backend domain is not reduced). No issues were observed.

[1] https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/
[2] https://lore.kernel.org/xen-devel/1631034578-12598-1-git-send-email-olekstysh@gmail.com/
[3] https://lore.kernel.org/xen-devel/1631297924-8658-1-git-send-email-olekstysh@gmail.com/
[4] https://lore.kernel.org/xen-devel/1632425551-18910-1-git-send-email-olekstysh@gmail.com/
[5] https://github.com/otyshchenko1/xen/commits/map_opt_ml4
[6] https://github.com/otyshchenko1/linux/commits/map_opt_ml3
[7] https://github.com/otyshchenko1/virtio-disk/commits/map_opt_next

Oleksandr Tyshchenko (3):
  xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
  xen/arm: Add handling of extended regions for Dom0
  libxl/arm: Add handling of extended regions for DomU

 docs/misc/xen-command-line.pandoc |   7 +
 tools/include/libxl.h             |   7 +
 tools/libs/light/libxl.c          |   2 +
 tools/libs/light/libxl_arm.c      |  70 +++++++++-
 tools/libs/light/libxl_types.idl  |   2 +
 xen/arch/arm/domain_build.c       | 280 +++++++++++++++++++++++++++++++++++++-
 xen/arch/arm/sysctl.c             |   2 +
 xen/arch/x86/sysctl.c             |   2 +
 xen/include/public/arch-arm.h     |   3 +
 xen/include/public/sysctl.h       |   4 +-
 10 files changed, 370 insertions(+), 9 deletions(-)

-- 
2.7.4


