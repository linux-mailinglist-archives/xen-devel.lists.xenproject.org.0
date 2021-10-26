Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 546AC43B684
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 18:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216525.376165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfOzw-00031o-PL; Tue, 26 Oct 2021 16:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216525.376165; Tue, 26 Oct 2021 16:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfOzw-0002za-LX; Tue, 26 Oct 2021 16:08:24 +0000
Received: by outflank-mailman (input) for mailman id 216525;
 Tue, 26 Oct 2021 16:08:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gydQ=PO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mfOzu-0002xh-VM
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 16:08:22 +0000
Received: from mail-ed1-x52a.google.com (unknown [2a00:1450:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43f52045-a0c7-41f1-a812-8143ae00020a;
 Tue, 26 Oct 2021 16:08:20 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w12so9829486edd.11
 for <xen-devel@lists.xenproject.org>; Tue, 26 Oct 2021 09:08:20 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id eu9sm4025195ejc.14.2021.10.26.09.05.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 09:05:19 -0700 (PDT)
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
X-Inumbo-ID: 43f52045-a0c7-41f1-a812-8143ae00020a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=bAVBWRDZRgubnRSuBYCl4clj0aVWREQm4G5cX+KG1p4=;
        b=IRDZVkn1hy6HTn6NCAY05VCjxdq5sZSzZ/zhkxVxmJgo79/McEOL3/iJ/d1r//8JgI
         35NahJ8ril6M+lshDWp+3AU6poeOYlGjmAXVxV0JB2UQL7Ghwxjz0h0vXbMxSRi3nhiv
         xwxv03QLNDivyn9pXc3PkfJSCC6JURlI+0JbfKbO1J8bMFt2GGA5kOsgNU/HTwVxY80e
         9OfKFDdZSXoFBP4DwuPaGMAnk0jS7qW24jrn7NgJDPscT59nn5Lffb/EvmJKmH2fJObN
         kWg+uYQvl2aryBOblgagD4nMXooTtyuPn5IHQ4xv843vNj1zyR3C10vYR4P6CImPG352
         f1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bAVBWRDZRgubnRSuBYCl4clj0aVWREQm4G5cX+KG1p4=;
        b=0i78pUflsEl7pzlfxFPdStbsQrVL6kr8arez70EYJwWG3nQVY2kTn2tZhD5bm7BazM
         UlYcg/Dd2taH1LPdynCca96AyONRJzKlcwqRr+vQ129Zvs6VkvEiOYzpsV8zcLg3EB90
         9PcDULkZw6KiI2oScNAn24erFZtq/vOXT4eGgpd85WEZq24wPx5s3fxmGNWluMGiEGa8
         Bk0ges2X2v7WcS+q9VFPpns+EvWAHvNJUbgiKliFuf7RCN4vx12VL7Lin5RsaFXSht9B
         8ZGMyJ8r+ZfbsSkeT7JQaj/N4ay1w4VI9ArQMokZfwn7wyggojuMJMj53OAcNfX2W73S
         QKzg==
X-Gm-Message-State: AOAM530EZfAsdexRZswoa7mzfgetOhCm1epuZGf5dToBkWREpctYcw1y
	PC+whj9HcTX9jqiQire4uNjau3HI0Iw=
X-Google-Smtp-Source: ABdhPJxtMgA2kyKQC10zrMOP8KtcHqswMqEj2qKkSjTogokVg/wr2Px2E1gCaIw0gu0zlXxwCQNP+g==
X-Received: by 2002:a17:907:76cc:: with SMTP id kf12mr18527547ejc.228.1635264319752;
        Tue, 26 Oct 2021 09:05:19 -0700 (PDT)
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
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH V2 0/4] xen: Add support of extended regions (safe ranges) on Arm
Date: Tue, 26 Oct 2021 19:05:08 +0300
Message-Id: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

You can find the RFC patch series at [1].

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
"reg" property under hypervisor node in the guest device-tree [2]. As region 0 is reserved
for grant table space (always present), the indexes for extended regions are 1...N.
No device tree bindings update is needed, guest infers the presence of extended regions
from the number of regions in "reg" property.
    
Please note the following:
- The ACPI case is not covered for now
- patch series was created in a way to retain existing behavior on x86

The patch series is based on v5.15-rc7 and also available at [3], it was fully
tested on Arm64 and only compile tested on x86.

[1] https://lore.kernel.org/all/1627490656-1267-1-git-send-email-olekstysh@gmail.com/
    https://lore.kernel.org/all/1627490656-1267-2-git-send-email-olekstysh@gmail.com/

[2] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob_plain;f=docs/misc/arm/device-tree/guest.txt;hb=refs/heads/master

[3] https://github.com/otyshchenko1/linux/commits/map_opt_ml5

Oleksandr Tyshchenko (4):
  xen/unpopulated-alloc: Drop check for virt_addr_valid() in fill_list()
  arm/xen: Switch to use gnttab_setup_auto_xlat_frames() for DT
  xen/unpopulated-alloc: Add mechanism to use Xen resource
  arm/xen: Read extended regions from DT and init Xen resource

 arch/arm/xen/enlighten.c        | 144 ++++++++++++++++++++++++++++++++++++++--
 drivers/xen/Kconfig             |   2 +-
 drivers/xen/unpopulated-alloc.c |  90 +++++++++++++++++++++++--
 include/xen/xen.h               |   2 +
 4 files changed, 226 insertions(+), 12 deletions(-)

-- 
2.7.4


