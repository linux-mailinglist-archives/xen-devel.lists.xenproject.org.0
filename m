Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0577746F49C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 21:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243308.420882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPfl-0004ai-1v; Thu, 09 Dec 2021 20:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243308.420882; Thu, 09 Dec 2021 20:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPfk-0004Xo-Rv; Thu, 09 Dec 2021 20:05:44 +0000
Received: by outflank-mailman (input) for mailman id 243308;
 Thu, 09 Dec 2021 20:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OcP=Q2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mvPfj-0004Xc-4f
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 20:05:43 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 630ae164-592b-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 21:05:42 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id u22so10681953lju.7
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 12:05:42 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o12sm87371lft.134.2021.12.09.12.05.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Dec 2021 12:05:40 -0800 (PST)
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
X-Inumbo-ID: 630ae164-592b-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=vdi+ngDYZ8frSITjIEVRzjOKqqv9jxuC3qoXZDRzY3E=;
        b=POI/206AdEE7Y8xM46ArhvWFzWMc2DNrU+UafFP+UOclIvQYLxk1wmsBw/yyS/2aJq
         S5CpimmLVPKLGv1qeaK8y9ZSZWPbUrwWz0U9F23hBFzZMNnqPiSgGl6i4yrjddpeoM+4
         pCbv8bG+8PORW01axAIL0xFxcCuYd/SxoZ6D83LMnf0JeYB3FzzmLDoqQYGTBLtxMEcP
         AqUoKYkz+sQ323/QBMVXkSS+NhUo2aqU24AfJZE57ACd8ve3kXXj62V6znNiezs+Qw1u
         72Nkmrzzg3J90EBkRxkscukCm+D95/mVkCa9cL3RnL2xd6tVyz3BvuskJvsUpaKNUpzK
         u5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vdi+ngDYZ8frSITjIEVRzjOKqqv9jxuC3qoXZDRzY3E=;
        b=afqKX/vSVaa+Yr8B89zi46+SZsbbikhrzd98i+S9/Xk2zyVDYs7Aiazw1k4WaLpKkO
         E4DBTDZY+49sZth8yEVjLAp4idDhOqRaf8ax/wa5V53NZq7LYLT7HERiO+0Llz9ZsWZh
         7A0lvQW/lYli78NIXSxQAao4nmwHStJHFaNZ1x/bUDPuSB8UDYPFpnPyriz9o3m68qK7
         dPynYRClc8sPRKo834LqV7+7pCSaZOPUAY3+Y5ixzxzl0TPr7Y5BFRDiSDcsvr8IRuY9
         edEUihwL2eJO3Stx4Oavg1wrfYu30/oNQ7UZwtjx3aH4A3BW8UksWItoPkka6Cf4+NKV
         DMHQ==
X-Gm-Message-State: AOAM531frnjyOTl6NksgE3G6vWnhXrtAC6qqWSWcV9nsEsQ9cM2l4hmp
	EQUSiMmG4wtaUSVb4Kr+QiBk6pIZJ1cq2A==
X-Google-Smtp-Source: ABdhPJxucGuWwfKQW2OEY9Dp9Wft8deEcKtIdgf1+XzoXquMxrrE4dy0sBiatCkpQLtPu/fTSAEpFw==
X-Received: by 2002:a2e:530d:: with SMTP id h13mr8398300ljb.95.1639080341326;
        Thu, 09 Dec 2021 12:05:41 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>
Subject: [PATCH V4 0/6] xen: Add support of extended regions (safe ranges) on Arm
Date: Thu,  9 Dec 2021 22:05:30 +0200
Message-Id: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

You can find the RFC-V3 patch series at [1],[2] and [3].

The corresponding Xen support (for both Dom0 and DomU) is already committed and
is available in mainline Xen since the following commit:
57f87857dc2de452a796d6bad4f476510efd2aba libxl/arm: Add handling of extended regions for DomU

The extended region (safe range) is a region of guest physical address space
which is unused and could be safely used to create grant/foreign mappings instead
of ballooning out real RAM pages to obtain a physical address space for creating
these mappings (which simply results in wasting domain memory and shattering super
pages in P2M table).

The problem is that we cannot follow Linux advise which memory ranges are unused
on Arm as there might be some identity mappings in P2M table (stage 2) the guest is not
aware of or not all device I/O regions might be known (registered) by the time the guest
starts creating grant/foreign mappings. This is why we need some hints from the hypervisor
which knows all details in advance to be able to choose extended regions (which won't
clash with other resources).

The extended regions are chosen at the domain creation time and advertised to it via
"reg" property under hypervisor node in the guest device-tree [4]. As region 0 is reserved
for grant table space (always present), the indexes for extended regions are 1...N.
No device tree bindings update is needed, guest infers the presence of extended regions
from the number of regions in "reg" property.

Please note the following:
- The ACPI case is not covered for now
- patch series was created in a way to retain existing behavior on x86

The patch series is based on v5.16-rc3 and also available at [5], it was fully
tested on Arm64 and only compile tested on x86.

[1] https://lore.kernel.org/all/1627490656-1267-1-git-send-email-olekstysh@gmail.com/
    https://lore.kernel.org/all/1627490656-1267-2-git-send-email-olekstysh@gmail.com/
[2] https://lore.kernel.org/all/1635264312-3796-1-git-send-email-olekstysh@gmail.com/
[3] https://lore.kernel.org/all/1637787223-21129-1-git-send-email-olekstysh@gmail.com/
[4] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob_plain;f=docs/misc/arm/device-tree/guest.txt;hb=refs/heads/master
[5] https://github.com/otyshchenko1/linux/commits/map_opt_ml7

Oleksandr Tyshchenko (6):
  xen/unpopulated-alloc: Drop check for virt_addr_valid() in fill_list()
  arm/xen: Switch to use gnttab_setup_auto_xlat_frames() for DT
  xen/balloon: Bring alloc(free)_xenballooned_pages helpers back
  xen/unpopulated-alloc: Add mechanism to use Xen resource
  arm/xen: Read extended regions from DT and init Xen resource
  dt-bindings: xen: Clarify "reg" purpose

 Documentation/devicetree/bindings/arm/xen.txt |  14 +--
 arch/arm/xen/enlighten.c                      | 132 ++++++++++++++++++++++++--
 drivers/xen/Kconfig                           |   2 +-
 drivers/xen/balloon.c                         |  20 ++--
 drivers/xen/unpopulated-alloc.c               |  87 ++++++++++++++++-
 include/xen/balloon.h                         |   3 +
 include/xen/xen.h                             |  16 ++++
 7 files changed, 245 insertions(+), 29 deletions(-)

-- 
2.7.4


