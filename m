Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F027445FEA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222085.384108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9P-0008Gr-Lk; Fri, 05 Nov 2021 06:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222085.384108; Fri, 05 Nov 2021 06:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9P-0008Em-HX; Fri, 05 Nov 2021 06:56:35 +0000
Received: by outflank-mailman (input) for mailman id 222085;
 Fri, 05 Nov 2021 06:56:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9O-0008Eb-09
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:34 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82974e6f-3e05-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 07:56:33 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id r4so29011706edi.5
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:32 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:31 -0700 (PDT)
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
X-Inumbo-ID: 82974e6f-3e05-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a4FUkdMsQS3UMD1e/TXUYRGM7Cd9GNBhZoSGHnn8tNU=;
        b=p0nx9qG8DXRvGhpB8qRkZOY2v/FaidEi1JYGN0aqO38mnDOR0/jvbyFDYG3ZpNOmwb
         4BbVMLquu31+W3oRsmZGrOaaR1wms5Q01urhxZU6/YbJbx/7ZCzEwOThW3TyIyzXEZLn
         JpMvJqzszrS/ww/3PWhHBwhf7YSoOJhArl65o72v2qNGO8J5MHK1Vm/wtxJrROkVxczT
         6T3YOjsDF+8meMMBZjvf3Rij66EZv+j5WqUV13Kutu2Zw20AAKb7+EN1vg5VOVBJyRMJ
         zU33Do7iKn/w98NrxAOsoJ4TuB3k8UFMpoVN8Dk2N+EaKyUMvMsSIPa762aIWEeGP20M
         HjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a4FUkdMsQS3UMD1e/TXUYRGM7Cd9GNBhZoSGHnn8tNU=;
        b=O5LF2ce1dkcwJGl1oM1wFvCdsNBHXfMFQ2NPKe21pPnGMu/lhsJv/ApUoHLCePxwZq
         Adu4J9Q+jVCIRM8Y+Wp+zp3LC38FZOdI7dxaP+fug9ix9yEcIeYZWhr1iToPhNKsmz4n
         6Yd+t997gdaMOuiLkZnXQ4W5ajTtl8jZns6vjhs5HMtflFy+AqXSTr4NoJXshIX+qf9n
         VlVMTM7JG7jJ1AJHbnjyW8RLNrn6/p6Yi/DoIMSmKjpdEr9/AibC/ZDUo1hSgM9uX8tU
         U0k7StyOkXvDH2lV58Xmizj4LQTtXOlSbcMxAuXGw4cmkrdbM0E8BKhi8gG3HYQkbZ3G
         zkpQ==
X-Gm-Message-State: AOAM533+1r8xmJMbvLQw3U1GtnLKPgodYT7acq7kpjQu7G6NiUHqNmbk
	uO1eiWJJPhhxwI8HWNOYawSG56fV4VF4Sw==
X-Google-Smtp-Source: ABdhPJxbde+Ldfjs0/Ym06Gexd73P66Ot7Is1QOkm4yGhVAtAG+y5LISGl4R+AqOCF+pIbNiRnBWkA==
X-Received: by 2002:a05:6402:4309:: with SMTP id m9mr14242106edc.93.1636095392375;
        Thu, 04 Nov 2021 23:56:32 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Date: Fri,  5 Nov 2021 08:56:18 +0200
Message-Id: <20211105065629.940943-1-andr2000@gmail.com>
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
  vpci: fix function attributes for vpci_process_pending
  vpci: cancel pending map/unmap on vpci removal
  vpci: make vpci registers removal a dedicated function
  vpci: add hooks for PCI device assign/de-assign
  vpci/header: implement guest BAR register handlers
  vpci/header: handle p2m range sets per BAR
  vpci/header: program p2m with guest BAR view
  vpci/header: emulate PCI_COMMAND register for guests
  vpci/header: reset the command register when adding devices
  vpci: add initial support for virtual PCI bus topology
  xen/arm: translate virtual PCI bus topology for guests

 xen/arch/arm/vpci.c           |  18 ++
 xen/drivers/Kconfig           |   4 +
 xen/drivers/passthrough/pci.c |   6 +
 xen/drivers/vpci/header.c     | 320 +++++++++++++++++++++++++++-------
 xen/drivers/vpci/vpci.c       | 163 ++++++++++++++++-
 xen/include/xen/sched.h       |   8 +
 xen/include/xen/vpci.h        |  37 +++-
 7 files changed, 484 insertions(+), 72 deletions(-)

-- 
2.25.1


