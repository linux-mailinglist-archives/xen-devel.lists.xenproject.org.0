Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340164A9407
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265003.458265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBW-0008Gf-IM; Fri, 04 Feb 2022 06:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265003.458265; Fri, 04 Feb 2022 06:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBW-0008Dn-BM; Fri, 04 Feb 2022 06:35:06 +0000
Received: by outflank-mailman (input) for mailman id 265003;
 Fri, 04 Feb 2022 06:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBU-0008DW-BO
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:04 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94951977-8584-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 07:35:01 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id bu18so10750523lfb.5
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:01 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:00 -0800 (PST)
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
X-Inumbo-ID: 94951977-8584-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZtTP0vCKvp+IYYxFasqhvmaqt9iKhL0NT56BNAzsirA=;
        b=QRuFvihoVYidWIZ4bw9oCMJgOve+jackLzUmJ5jUw0pQNniIwsKgOA+oUOPRhgKHPw
         C6vA0NdUuOkfRBKTtWsq7ZV2ASMy+wfTdJBJKtukSkXjpfhHGXLGHCgggN/G/14PhmGx
         9hUg1Rx0O5LVqYWcaxxBb0KMi4mf2Hg+3ogGIKsrrw5fWFp/yThpxG1Q4oBvb2vOc2gb
         ylfMs/QhLr28xz91RHiwsEtfiwJ5BYZAj4aaqiMCOZyE/luUh2NjkkYP7+X+Kb+aPYZk
         FbA/4tTXRzt5p4QhIG/XnhQiAIgVvCL0DlPVy3oWD8CC85c3t4rlJ7eaeokLcmppVehh
         ATRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZtTP0vCKvp+IYYxFasqhvmaqt9iKhL0NT56BNAzsirA=;
        b=GzICe0hJGbQQ6RYn5LerMaY0acu4qTF5/yr4f3/V+HGckwJ/mABGELGAZ83ThbkuCW
         pyIbbR95WjfcL10TX9oJj/U3i+XEBYswZhF6WAlibm4Sl5LsfD/gaLOWjOOEiNWGndPt
         tLxBAu3k6pX3ln9UbkZCQ8VIy1Rthl2R9ohgkqFdf9b1jg4/kcNhnR5sWH0Ca4WyvT32
         6IO3XO83BiIhUxPNLE4NlXPTapDNW6h/BpeblXngDUo3ei/pdzswXSB7K3TrvI9cv1jB
         GDTFBQcUM7k6HMDCg8+QZ9pcAb9qmgzlCS4WpNSmNc7UCQKERMr2leXRB5f+I6p4VDnA
         sCxA==
X-Gm-Message-State: AOAM531Ewkx8ZTLezUJ/ln0y2kTlb/CIN/ULOeV5840fbnQJ5JWQPcZD
	kg6mRx3bAiEWuCL+IvUlLVtWN2O9SGk=
X-Google-Smtp-Source: ABdhPJzTYRa1imZc1Halu4szk4xYwY4WPYb6taPvwofWEBnmAOcXNAjTHC1EpxQheJivPrNGgeMznw==
X-Received: by 2002:a05:6512:3a91:: with SMTP id q17mr1308919lfu.628.1643956501075;
        Thu, 03 Feb 2022 22:35:01 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 00/13] PCI devices passthrough on Arm, part 3
Date: Fri,  4 Feb 2022 08:34:46 +0200
Message-Id: <20220204063459.680961-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hi, all!

1. This patch series is focusing on vPCI and adds support for non-identity
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

2. The series also adds support for virtual PCI bus topology for guests:
 - We emulate a single host bridge for the guest, so segment is always 0.
 - The implementation is limited to 32 devices which are allowed on
   a single PCI bus.
 - The virtual bus number is set to 0, so virtual devices are seen
   as embedded endpoints behind the root complex.

3. The series has complete re-work of the locking scheme used/absent before with
the help of the work started by Roger [1]:
[PATCH v6 03/13] vpci: move lock outside of struct vpci

This way the lock can be used to check whether vpci is present, and
removal can be performed while holding the lock, in order to make
sure there are no accesses to the contents of the vpci struct.
Previously removal could race with vpci_read for example, since the
lock was dropped prior to freeing pdev->vpci.
This also solves synchronization issues between all vPCI code entities
which could run in parallel.

4. For unprivileged guests vpci_{read|write} has been re-worked
to not passthrough accesses to the registers not explicitly handled
by the corresponding vPCI handlers: without that passthrough
to guests is completely unsafe as Xen allows them full access to
the registers.
During development this can be reverted for debugging purposes.

5. The series was also tested on:
 - x86 PVH Dom0 and doesn't break it.
 - x86 HVM with PCI passthrough to DomU and doesn't break it.
 - Arm

Thank you,
Oleksandr

[1] https://lore.kernel.org/xen-devel/20180717094830.54806-2-roger.pau@citrix.com/

Oleksandr Andrushchenko (12):
  xen/pci: arm: add stub for is_memory_hole
  rangeset: add RANGESETF_no_print flag
  vpci: restrict unhandled read/write operations for guests
  vpci: add hooks for PCI device assign/de-assign
  vpci/header: implement guest BAR register handlers
  vpci/header: handle p2m range sets per BAR
  vpci/header: program p2m with guest BAR view
  vpci/header: emulate PCI_COMMAND register for guests
  vpci/header: reset the command register when adding devices
  vpci: add initial support for virtual PCI bus topology
  xen/arm: translate virtual PCI bus topology for guests
  xen/arm: account IO handlers for emulated PCI MSI-X

Roger Pau Monné (1):
  vpci: move lock outside of struct vpci

 tools/tests/vpci/emul.h       |   5 +-
 tools/tests/vpci/main.c       |   3 +-
 xen/arch/arm/mm.c             |   6 +
 xen/arch/arm/vpci.c           |  31 ++-
 xen/arch/x86/hvm/vmsi.c       |   8 +-
 xen/common/rangeset.c         |   5 +-
 xen/drivers/Kconfig           |   4 +
 xen/drivers/passthrough/pci.c |   7 +
 xen/drivers/vpci/header.c     | 407 +++++++++++++++++++++++++++-------
 xen/drivers/vpci/msi.c        |  15 +-
 xen/drivers/vpci/msix.c       |  43 +++-
 xen/drivers/vpci/vpci.c       | 232 ++++++++++++++++---
 xen/include/xen/pci.h         |   1 +
 xen/include/xen/rangeset.h    |   5 +-
 xen/include/xen/sched.h       |   8 +
 xen/include/xen/vpci.h        |  43 +++-
 16 files changed, 688 insertions(+), 135 deletions(-)

-- 
2.25.1


