Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2AA41D4CB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199498.353594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqrk-00019o-BI; Thu, 30 Sep 2021 07:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199498.353594; Thu, 30 Sep 2021 07:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqrk-00017l-87; Thu, 30 Sep 2021 07:52:28 +0000
Received: by outflank-mailman (input) for mailman id 199498;
 Thu, 30 Sep 2021 07:52:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqrj-00017f-5u
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:52:27 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfc4d3ba-e8ea-410a-b0d1-6b24c80b1834;
 Thu, 30 Sep 2021 07:52:26 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j5so16802725lfg.8
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:26 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:24 -0700 (PDT)
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
X-Inumbo-ID: cfc4d3ba-e8ea-410a-b0d1-6b24c80b1834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f1lP+PWhUKzqxJrgjRUDJ6qHEEYJMmdke3MY78TaS4Q=;
        b=lpL7Q9gwdueyTmaOwbFQ/AG0v61hiI3nn0kvPZnOSWcI/gQEohI5AoM+x/intb990j
         vlA4edTT+NZbMuQBc1aIOqUklDTiTDoyQwFftukdjo1Q60vZZHAv1dh+nebIo7Hj1OZn
         E0AgbpKPplxnTcOD8RmpbZ9NizL9zbSgZsNMsh8Rmd2S8MNxe2CFr4C9Dhy8E6AQjjuZ
         ja7Odwqk8P+fkrs7OYhhEjUCVZ772IdQqlXLVjvDt6GCzC4WneeWUoeC/Xu8uv3iZB0k
         Dm+XNBkZwEH8DIZlHHdiIIwIoGAz11jqn8+8rNMY2Aue3jwRxr9PxO6GIZa05lMc1X5T
         Wgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f1lP+PWhUKzqxJrgjRUDJ6qHEEYJMmdke3MY78TaS4Q=;
        b=JOv5/ceYXKlfEwcjnVXyQbVy9iIgPYSk+L8Nbo45u2Dqq4s/DgIU4/Sgr6yeBs6qWd
         4KNKfj6r9BIW7R7tYectPoSnugOVQtrHvw3ZLsrjBm3Jfh6XhsyYYGfRBMPjfkHrYZdb
         vVE+BuVnRB9kdcJx+wTG6L3qNH7nLgtI+4yNs3I7mER7zLzc4pywtfKeMblWOh58b02B
         HjzxF+nGzNBXIdPg9ea0s1tPgOBhegJRfSbtdeJokUPFsN7mVrQSQ/5xzLdIL46P8WTA
         eW6Pp0USEY6X4qk7m09bSMkb2rENBS2oJpHgdGV9rhy8AOoJev264AtahrbtzP4pBLqM
         wz9w==
X-Gm-Message-State: AOAM532CrAv1sH4kKG0183BuyaodngfOpOVgK7J7DjTfcl5qhAQ6txpc
	KjmxkqEKcsF3hucRwyVjBOfnIfVwPIE=
X-Google-Smtp-Source: ABdhPJy00kRD3QeitcjiG131mSv12tgDLeW24qU+z8p5OfcujYnsG7AADcTi51YcrW05Is1n8wKKig==
X-Received: by 2002:a05:6512:3da5:: with SMTP id k37mr4744888lfv.359.1632988344762;
        Thu, 30 Sep 2021 00:52:24 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v3 00/11] PCI devices passthrough on Arm, part 3
Date: Thu, 30 Sep 2021 10:52:12 +0300
Message-Id: <20210930075223.860329-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hi, all!

This patch series is focusing on vPCI and adds support for non-identity
PCI BAR mappings which is required while passing through a PCI device to
a guest. The highlights are:

- Add relevant vpci register handlers when assigning PCI device to a domain
  and remove those when de-assigning. This allows having different
  handlers for different domains, e.g. hwdom and other guests.

- Emulate guest BAR register values based on physical BAR values.
  This allows creating a guest view of the registers and emulates
  size and properties probe as it is done during PCI device enumeration by
  the guest.

- Instead of handling a single range set, that contains all the memory
  regions of all the BARs and ROM, have them per BAR.

- Take into account guest's BAR view and program its p2m accordingly:
  gfn is guest's view of the BAR and mfn is the physical BAR value as set
  up by the host bridge in the hardware domain.
  This way hardware doamin sees physical BAR values and guest sees
  emulated ones.

The series also adds support for virtual PCI bus topology for guests:
 - We emulate a single host bridge for the guest, so segment is always 0.
 - The implementation is limited to 32 devices which are allowed on
   a single PCI bus.
 - The virtual bus number is set to 0, so virtual devices are seen
   as embedded endpoints behind the root complex.

The series was also tested on:
 - x86 PVH Dom0 and doesn't break it.
 - x86 HVM with PCI passthrough to DomU and doesn't break it.

Thank you,
Oleksandr

Oleksandr Andrushchenko (11):
  vpci: Make vpci registers removal a dedicated function
  vpci: Add hooks for PCI device assign/de-assign
  vpci/header: Move register assignments from init_bars
  vpci/header: Add and remove register handlers dynamically
  vpci/header: Implement guest BAR register handlers
  vpci/header: Handle p2m range sets per BAR
  vpci/header: program p2m with guest BAR view
  vpci/header: Emulate PCI_COMMAND register for guests
  vpci/header: Reset the command register when adding devices
  vpci: Add initial support for virtual PCI bus topology
  xen/arm: Translate virtual PCI bus topology for guests

 xen/arch/arm/domain.c         |   1 +
 xen/arch/arm/vpci.c           |  86 ++++++-
 xen/arch/arm/vpci.h           |   3 +
 xen/common/domain.c           |   3 +
 xen/drivers/Kconfig           |   4 +
 xen/drivers/passthrough/pci.c |  94 ++++++++
 xen/drivers/vpci/header.c     | 411 +++++++++++++++++++++++++++-------
 xen/drivers/vpci/vpci.c       |  42 +++-
 xen/include/asm-arm/pci.h     |   1 +
 xen/include/xen/pci.h         |  23 ++
 xen/include/xen/sched.h       |  10 +
 xen/include/xen/vpci.h        |  36 ++-
 12 files changed, 623 insertions(+), 91 deletions(-)

-- 
2.25.1


