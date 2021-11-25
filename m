Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7214445D8AB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230873.399125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWo-0001da-Kf; Thu, 25 Nov 2021 11:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230873.399125; Thu, 25 Nov 2021 11:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWo-0001az-Cu; Thu, 25 Nov 2021 11:02:58 +0000
Received: by outflank-mailman (input) for mailman id 230873;
 Thu, 25 Nov 2021 11:02:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWm-0001K8-6i
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:02:56 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3db56a18-4ddf-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:02:55 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id 207so11700519ljf.10
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:02:55 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:02:53 -0800 (PST)
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
X-Inumbo-ID: 3db56a18-4ddf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qWes27X+ww95HfJk0LcTwAiWNNZYkATb656Jfq7wn4Q=;
        b=TfYgaQKGfxpbN/HfHfvDYvLeGaJVBWx6pnGSuK/XRZWj9QtRdyVs9TVG1VwZ6e0wsO
         ci7aVDOwpNje0N/tZHLY0rncYEDwic8+GD/wO2cyhdMedfHodH2qpJhoftazi11+EkyV
         fuTF8OISAgnATCSv4tLW2/37XmnkhrMEwLJMdEdVE+83ZSgWWn06VTKo0NRABercPnxW
         t77q9RmRB8YIK4qHbGMbFIob2WRBRiV0bTuaP9k9U8jkrpLqFeoXYx6eHy9Nx/vWNYae
         yvALdD0gY/mrUkSFMZJcIHL0/xqSrVvHFWloj/PQiF7QSEz7nkvsskw8AcS6MDTT4SoK
         y8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qWes27X+ww95HfJk0LcTwAiWNNZYkATb656Jfq7wn4Q=;
        b=Da5nUuArkA5k5G/w21lpJG0+aqK43LKawGzQjNJ+QwDK9FgX4vsZtwuEmJnfFyw4IQ
         nF/mEpnNVjat/lIKBrU3ax7PDOb4OQ/3jIh1HUZZzowTPrbQlAr+lT4Hz+LlTElTGiX6
         zgLAaMJzN+H+Hbd/Atdm1B/H3V7KCYdnhnHSi5U48ScFC8ipmU+/gEWaPa/vd4Earlim
         Qv7ijrBVRofukhjjYK0Kvr8u+8v2YqNVbIM0DxWjOinIQkiDRibGypSNhG+RMA/DDAcw
         ghHzuM1lXzRVyXQbQcAw1wg9vf7sL/vWSQJsXAikZWmvdlbNDRRC+7nM5Nyw3rCY5lyt
         TeqQ==
X-Gm-Message-State: AOAM533JqjCJrGUXx4Zk8JxTGYcOCwuTMQlFXS8lG55rZ3puBhVOFtjG
	lczgahl+g1esC8E2DS4jMZ9l0d3GUSzJDQ==
X-Google-Smtp-Source: ABdhPJzT9tUL7xkscIRcsW3Uf7EI3BnU4+bn/XI6is9iOshm3fDYlKUdkaEfavkmkaG24GOH5ijfkw==
X-Received: by 2002:a05:651c:50c:: with SMTP id o12mr24253873ljp.438.1637838174135;
        Thu, 25 Nov 2021 03:02:54 -0800 (PST)
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
Subject: [PATCH v5 00/14] PCI devices passthrough on Arm, part 3
Date: Thu, 25 Nov 2021 13:02:37 +0200
Message-Id: <20211125110251.2877218-1-andr2000@gmail.com>
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
[PATCH v5 03/13] vpci: move lock outside of struct vpci

This way the lock can be used to check whether vpci is present, and
removal can be performed while holding the lock, in order to make
sure there are no accesses to the contents of the vpci struct.
Previously removal could race with vpci_read for example, since the
lock was dropped prior to freeing pdev->vpci.
This also solves synchronization issues between all vPCI code entities
which could run in parallel.

4. There is an outstanding TODO left unimplemented by this series:
for unprivileged guests vpci_{read|write} need to be re-worked
to not passthrough accesses to the registers not explicitly handled
by the corresponding vPCI handlers: without fixing that passthrough
to guests is completely unsafe as Xen allows them full access to
the registers.

Xen needs to be sure that every register a guest accesses is not
going to cause the system to malfunction, so Xen needs to keep a
list of the registers it is safe for a guest to access.

For example, we should only expose the PCI capabilities that we know
are safe for a guest to use, i.e.: MSI and MSI-X initially.
The rest of the capabilities should be blocked from guest access,
unless we audit them and declare safe for a guest to access.

As a reference we might want to look at the approach currently used
by QEMU in order to do PCI passthrough. A very limited set of PCI
capabilities known to be safe for untrusted access are exposed to the
guest and registers need to be explicitly handled or else access is
rejected. Xen needs a fairly similar model in vPCI or else none of
this will be safe for unprivileged access.

5. The series was also tested on:
 - x86 PVH Dom0 and doesn't break it.
 - x86 HVM with PCI passthrough to DomU and doesn't break it.

Thank you,
Oleksandr

[1] https://lore.kernel.org/xen-devel/20180717094830.54806-2-roger.pau@citrix.com/

Oleksandr Andrushchenko (13):
  rangeset: add RANGESETF_no_print flag
  vpci: fix function attributes for vpci_process_pending
  vpci: cancel pending map/unmap on vpci removal
  vpci: add hooks for PCI device assign/de-assign
  vpci/header: implement guest BAR register handlers
  vpci/header: handle p2m range sets per BAR
  vpci/header: program p2m with guest BAR view
  vpci/header: emulate PCI_COMMAND register for guests
  vpci/header: reset the command register when adding devices
  vpci: add initial support for virtual PCI bus topology
  xen/arm: translate virtual PCI bus topology for guests
  xen/arm: account IO handlers for emulated PCI MSI-X
  vpci: add TODO for the registers not explicitly handled

Roger Pau Monne (1):
  vpci: move lock outside of struct vpci

 tools/tests/vpci/emul.h       |   5 +-
 tools/tests/vpci/main.c       |   4 +-
 xen/arch/arm/vpci.c           |  33 +++-
 xen/arch/x86/hvm/vmsi.c       |   8 +-
 xen/common/rangeset.c         |   5 +-
 xen/drivers/Kconfig           |   4 +
 xen/drivers/passthrough/pci.c |  11 ++
 xen/drivers/vpci/header.c     | 352 +++++++++++++++++++++++++++-------
 xen/drivers/vpci/msi.c        |  11 +-
 xen/drivers/vpci/msix.c       |   8 +-
 xen/drivers/vpci/vpci.c       | 252 +++++++++++++++++++++---
 xen/include/xen/pci.h         |   6 +
 xen/include/xen/rangeset.h    |   7 +-
 xen/include/xen/sched.h       |   8 +
 xen/include/xen/vpci.h        |  47 ++++-
 15 files changed, 644 insertions(+), 117 deletions(-)

-- 
2.25.1


