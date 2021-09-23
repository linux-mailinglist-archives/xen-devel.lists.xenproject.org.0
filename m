Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FD415EE7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194099.345746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFQ-0004lR-Sn; Thu, 23 Sep 2021 12:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194099.345746; Thu, 23 Sep 2021 12:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFQ-0004iz-Ps; Thu, 23 Sep 2021 12:54:44 +0000
Received: by outflank-mailman (input) for mailman id 194099;
 Thu, 23 Sep 2021 12:54:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOFP-0004it-4o
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:54:43 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3881b06-f829-4810-91a3-ac72710915f8;
 Thu, 23 Sep 2021 12:54:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p29so25905886lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:42 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:40 -0700 (PDT)
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
X-Inumbo-ID: a3881b06-f829-4810-91a3-ac72710915f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MNFbIgyk0Jd8aG2ETpYU3f61p4SY/XICQ38rzboeHCY=;
        b=Q3s1F2qrT4ycOqCWrlTdxbCjScIxh7VvKaITEIkGWKwodHAyjx063hx6SU0MWOrHBw
         FQBiwqr39XH0vX9VlveiL1I+WcWhCO4kXTNlhShbdIyO3d0xdiUtw94iXUjId97eixcC
         mnzHdO0GpNq/5DFzQflALpqmgZBZnMrFKi9EtqjYnCQ+qKkCvRlFKCW2o2pdzD+rtSfy
         zeaVZemgPR3YV6JiAXG2gLEkK9tF1035gCduUrq/FvjsQIDTI8jgPlhF5oDGvGOdbPg7
         6FJHWUwwW83QGmEojDgpLTI39dayUkgsUKkdxq4OqLMrzG5Ek54ypBby2BEqt6EYqMFZ
         Lc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MNFbIgyk0Jd8aG2ETpYU3f61p4SY/XICQ38rzboeHCY=;
        b=jQfaMQQ3vKucKW/ARFdphcfs4+zsU/9dNy5dSjG0nPJNJ2q5nQunS+4eoV7KKKdVH3
         Qm5OXYvPuCDmGeZbRS171nDqcfoxlN72PD+6k8u48tA4flfKP8+k3MVb0LF9tOJbWA9y
         A1goIcyrGaEaH9Lvd3X74DzNR3zqrYFUs6Y48+TXKY9y/diSqEO4b5yAt0eBCmSSzUZ9
         HRYnYF4XhmW/nG2U9ZaMztDhSd/mxBc5oimcTpfDVk63twU672/gKQY/KsAeDn6haJ8t
         VFAlu/RhRCFCI1pn93YlJQXwdQKB6WKcar1atIat3AT67BaEwveu0yVyhTVfydRvJA9j
         4xWg==
X-Gm-Message-State: AOAM5322LUR/IyQelCcoSO9xBIemX8IYAJixbWakBmZcyEJOkBqt9zUc
	HSlZ91FiysZZM/tJaoRGzViV+Ud0PpTv9A==
X-Google-Smtp-Source: ABdhPJyeQSYMT1AM394oHTbiIcYviBjWCf4DhHILZQpEtnl9FzOVrK6UyeMAWky5pN3O8yYhaV4nUw==
X-Received: by 2002:a05:6512:12c6:: with SMTP id p6mr3971226lfg.271.1632401680882;
        Thu, 23 Sep 2021 05:54:40 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 00/11] PCI devices passthrough on Arm, part 2
Date: Thu, 23 Sep 2021 15:54:27 +0300
Message-Id: <20210923125438.234162-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hi, all!

This is an assorted series of patches which aim is to make some further
basis for PCI passthrough on Arm support. The series continues the work
published earlier by Arm [1] and adds new helpers and clears the way for
vPCI changes which will follow.

RFC is at [2], [3]. Design presentation can be found at [4].

Thank you,
Oleksandr

[1] https://patchwork.kernel.org/project/xen-devel/list/?series=550933
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01184.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads.html#01184
[4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthrough_On_Arm.pdf


Oleksandr Andrushchenko (10):
  xen/arm: Fix dev_is_dt macro definition
  xen/arm: Add new device type for PCI
  xen/arm: Introduce pci_find_host_bridge_node helper
  xen/device-tree: Make dt_find_node_by_phandle global
  xen/arm: Mark device as PCI while creating one
  libxl: Allow removing PCI devices for all types of domains
  libxl: Only map legacy PCI IRQs if they are supported
  xen/arm: Setup MMIO range trap handlers for hardware domain
  xen/arm: Do not map PCI ECAM and MMIO space to Domain-0's p2m
  xen/arm: Process pending vPCI map/unmap operations

Oleksandr Tyshchenko (1):
  xen/domain: Call pci_release_devices() when releasing domain resources

 tools/libs/light/Makefile          |  4 ++
 tools/libs/light/libxl_pci.c       | 15 ++++-
 xen/arch/arm/domain.c              | 11 +++-
 xen/arch/arm/domain_build.c        | 38 ++++++++----
 xen/arch/arm/pci/ecam.c            | 14 +++++
 xen/arch/arm/pci/pci-host-common.c | 93 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-zynqmp.c |  1 +
 xen/arch/arm/pci/pci.c             | 10 ++++
 xen/arch/arm/traps.c               | 13 +++++
 xen/arch/arm/vpci.c                | 33 +++++++++++
 xen/arch/arm/vpci.h                |  6 ++
 xen/arch/x86/hvm/hvm.c             |  6 ++
 xen/common/device_tree.c           |  2 +-
 xen/common/ioreq.c                 |  9 ---
 xen/drivers/passthrough/pci.c      |  3 +
 xen/include/asm-arm/device.h       |  6 +-
 xen/include/asm-arm/pci.h          | 24 ++++++++
 xen/include/asm-arm/setup.h        | 13 +++++
 xen/include/xen/device_tree.h      |  2 +
 19 files changed, 275 insertions(+), 28 deletions(-)

-- 
2.25.1


