Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B396B415EFD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194124.345857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOHn-00026A-Ar; Thu, 23 Sep 2021 12:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194124.345857; Thu, 23 Sep 2021 12:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOHn-00023S-6I; Thu, 23 Sep 2021 12:57:11 +0000
Received: by outflank-mailman (input) for mailman id 194124;
 Thu, 23 Sep 2021 12:57:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOGw-0004it-5t
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:56:18 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b26bf262-48c3-45ed-bbc2-aa8f8a0ed16e;
 Thu, 23 Sep 2021 12:55:07 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u18so25609793lfd.12
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:07 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:03 -0700 (PDT)
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
X-Inumbo-ID: b26bf262-48c3-45ed-bbc2-aa8f8a0ed16e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xjptWExU6TWM7wvE9QyWUsFVZpNpHRTTMdpxk2EhC08=;
        b=qKoY6kLGWNocUC9YkflO59mYUD/aorNBD60p3xgQ2vM+uFVxL45hsNzjZhiDVSldyt
         vYa6gNOodlA9lptZuPstRE52EhHkvCvAtsyyfp7ChzF4xhwVNMLBiRmPgWyz9imHUYv+
         7o1AywfCBf2Ok2/x1Yk8aIbBbI5sMmg/dtFM06U7oGTGSJnGptkgWmnSt07Qp78WaLZy
         MbA5gvhVyYKQH0f6s6d8rOVjetw2uTvxCEp0RK8jYTar4QidFIJemDkSl2I6yS63kJB3
         2Se4o/x4n36AIjDzDYPMStgYdii2TqjxvlyAtbyehQ5adOyKrEVeWpiEOZx0QnMUZ9WO
         R7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xjptWExU6TWM7wvE9QyWUsFVZpNpHRTTMdpxk2EhC08=;
        b=N/lXeT7cqTRc+V5RmuGAd+iB7mzzi0Wtv4/e0KVOJThM3fki9jqQmxxiyeKh4dm4uO
         B7eNPexuRvBmvNRv5XlYWiZ5BbrB5J5fd9ptyNBScCAR0v9agfaNQkAlBP6lGVK5NPeA
         dnrqxWMbe6BOSgQpyyl6CKetTV6wqj4YLEe0QdLPqlSKcEWlzM5wDMkbq9SDPuhKiTLl
         xhYQEn50IKjAGkVWlkL/Z71OzH4K+gkkntjLWc4PoWFtSvur0XlQLg833txUrnDsw7PH
         RoQuKgX30Est5bDnoZ0wwKTNUtfrTMsbb27goW52KTTVbsxvL4POsgV1oODZCWXuktFN
         EBdw==
X-Gm-Message-State: AOAM530c75IBikLNpC1KxUvGYffMBSnShg2KcoAKcfsf0raeWzgxaVJh
	uzL4aXgf4TArjXMBrqGd1DrzZ0zK4lKX3Q==
X-Google-Smtp-Source: ABdhPJxwYqEoAkmKlLJL7pG8wGA8T/J8LGPSsCQnLc2yjHBgONmMkR8ingCNcm4T6tjqEAz/b6x9Jg==
X-Received: by 2002:ac2:5467:: with SMTP id e7mr3860249lfn.537.1632401703781;
        Thu, 23 Sep 2021 05:55:03 -0700 (PDT)
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
Subject: [PATCH v2 00/11] PCI devices passthrough on Arm, part 3
Date: Thu, 23 Sep 2021 15:54:50 +0300
Message-Id: <20210923125501.234252-1-andr2000@gmail.com>
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

The series was also tested on x86 PVH Dom0 and doesn't break it.

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
 xen/arch/arm/vpci.c           |  87 ++++++-
 xen/arch/arm/vpci.h           |   3 +
 xen/common/domain.c           |   1 +
 xen/drivers/Kconfig           |   4 +
 xen/drivers/passthrough/pci.c |  91 ++++++++
 xen/drivers/vpci/header.c     | 412 +++++++++++++++++++++++++++-------
 xen/drivers/vpci/vpci.c       |  48 +++-
 xen/include/asm-arm/pci.h     |   1 +
 xen/include/xen/pci.h         |  19 ++
 xen/include/xen/sched.h       |   8 +
 xen/include/xen/vpci.h        |  34 ++-
 12 files changed, 617 insertions(+), 92 deletions(-)

-- 
2.25.1


