Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA412AB89C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22466.48773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6d4-0003u5-0C; Mon, 09 Nov 2020 12:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22466.48773; Mon, 09 Nov 2020 12:50:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6d3-0003tk-TB; Mon, 09 Nov 2020 12:50:37 +0000
Received: by outflank-mailman (input) for mailman id 22466;
 Mon, 09 Nov 2020 12:50:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6d2-0003tf-It
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:50:36 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dcd4d05-209e-4199-bb38-9a78a5bd1e58;
 Mon, 09 Nov 2020 12:50:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id f11so5952999lfs.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:35 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:33 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6d2-0003tf-It
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:50:36 +0000
X-Inumbo-ID: 0dcd4d05-209e-4199-bb38-9a78a5bd1e58
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0dcd4d05-209e-4199-bb38-9a78a5bd1e58;
	Mon, 09 Nov 2020 12:50:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id f11so5952999lfs.3
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h2r3TXE0gZ6mXMUUJiLgoTTMIZl9z2Lfa74lW8k4XfI=;
        b=vSFlYWxpVF240AWqf8fGEZ+65UCAt8j6lMW1SZBUfcv8EnnK+q1CJcetDzGqAfAz47
         rua+roT3tiXFPPdpDqaiFhpcgqu8EPSDAULvWKLN+3TLXYdOJSDLxHRvPsRNloLi1On/
         q/1918k0bbexGoCe1QRmDkGUY4Gp82rDhA0CrbU8SIkBcsPX6kdrY/22Q7xuuHEYjzAk
         OeFpM7fjx5xKBaJ4EtJpuhOKyGqt8hbUTdScaWy1HHMjo8K9t3nA8bePs9iHqtWf2DKi
         sYry+0bDt/SEIzzY3TSpO/VvJpidozApCSy+pHW9i9OP9i8/7Kl/ugwqfpyQAJfaRaOT
         WY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h2r3TXE0gZ6mXMUUJiLgoTTMIZl9z2Lfa74lW8k4XfI=;
        b=WYYgz47LGyRXIjDvGghRaWuTe4yABxIhzBNmcfugBJdMWk8huI/cIUKlj1S004b2Yd
         XBJQ0ZESt7QxcASCEw2qF6ynypMLL1PwtcpY0T1T30YZCGG5afA4Nz6fYLtRRBLatUAm
         dhzbr6R9AjknPwn+V+ai9Ik1zuIQ/H0RPsMw8zbo4+4u1eOCOdm1gm3yyUvMsBeAG1YL
         AqbkcJo7FbDH46iGACFP6Xpmg29IGb+TMDhBFu8iPCk0mIFqjoTDrPgVUHMPDeXoEC4s
         MfsvNnXg5pT+ZsYHVmV1xSnqCI96dBX+lNhaAq7O+jsThNPSr35YCyrQPJhbg8iOZTkC
         X/Eg==
X-Gm-Message-State: AOAM533S5Q3aJ8KJFHoBAv/UTG/Zat57DD8TVjYfiCNnbbyU6qKzHaqz
	qtWP1rstgiSiawhyoCg8//k=
X-Google-Smtp-Source: ABdhPJyZYUSyPkePQiSWsS7LFCclMAQlrATb7zRXQpicfcf1CPu2lrxaTkwYriA+oyiekWji3mXuyg==
X-Received: by 2002:a19:82d4:: with SMTP id e203mr3523564lfd.58.1604926233757;
        Mon, 09 Nov 2020 04:50:33 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:33 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Rahul.Singh@arm.com,
	Bertrand.Marquis@arm.com,
	julien.grall@arm.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	wl@xen.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 00/10] [RFC] ARM PCI passthrough configuration and vPCI
Date: Mon,  9 Nov 2020 14:50:21 +0200
Message-Id: <20201109125031.26409-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hello, all!

This is an RFC and an attempt to understand the best way to progress with ARM
PCI passthrough configuration. This includes, but not limited to, configuration
of assignable PCI devices, (legacy IRQs, MSI/MSI-X are not yet supported), MMIO
etc.

This is based on the original RFC from ARM [1] and bits of the possible
configuration approaches were discussed before [2]. So, I tried to implement
something, so we can discuss it in more detail. (Rahul, Bertrand: if you are
interested we can discuss all this in detail, so we can use this as a part of
ARM PCI passthrough solution).

This is all work in progress, so without having some other minor patches one
won’t be able to run that, but still the patches show the direction, which
should be fine for the RFC. Those interested in the full working example I have
created a branch [3], but please note that this was fully tested on R-Car Gen3
platform only which has a non-ECAM PCI host controller and only partially it
was tested on QEMU (without running guest domains, Domain-0 only).

In this RFC I only submit some patches which I would like to get community's
view on.  I will highlight some of them below and the rest is documented in
their commit messages:

1. [WORKAROUND] xen/arm: Update hwdom's p2m to trap ECAM space

This is a workaround to be able to trap ECAM address space in Domain-0 which is
normally not possible because PCI host bridge is mapped into Domain-0, so there
is a need in some special handling of such devices. I have discussed this with
Julien on IRC, but haven't implemented anything of production quality yet.

2. arm/pci: Maintain PCI assignable list

This patch needs a decision on pci-back use. As of now what is not covered is
the assignment of legacy IRQs (MMIOs and MSIs are handled by Xen without the
toolstack's help - am I right here?). MMIOs are assigned by vPCI code.  We
discussed [2] a possibility to run a "limited" version of the pci-back driver
for ARM, but I’d like to bring back that discussion here as it seems that only
some bits of the pci-back may now be used, so profit of having pci-back
in the picture is not clear.

3. vpci: Make every domain handle its own BARs

This is a big change in vPCI code which allows non-identity mappings for guest
domains. This also handles MMIO configuration for the guests without using the
toolstack which does the same via reading PCI bus sysfs entries in Domain-0.
(Thank you Roger for making lots of thing clear for me.) This implements PCI
headers per domain.

4. vpci/arm: Allow updating BAR's header for non-ECAM bridges

This allows non-ECAM bridges, which are not trapped by vPCI for Domain-0/hwdom,
to update vPCI's view of the real values of the BARs. The assumption here is
that Domain-0/hwdom won't relocate BARs which is usually the case.


5. Some code is for R-Car Gen3 which is not ECAM compatible. It is good for the
demostration of where generic ARM PCI framwork should be changed to support
such controllers.

Thank you,
Oleksandr Andrushchenko

P.S. I would like to thank Roger, Juilien and Jan for their attention
and time.

[1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg77422.html
[2] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg84452.html
[3] https://github.com/andr2000/xen/tree/vpci_rfc

Oleksandr Andrushchenko (10):
  pci/pvh: Allow PCI toolstack code run with PVH domains on ARM
  arm/pci: Maintain PCI assignable list
  xen/arm: Setup MMIO range trap handlers for hardware domain
  [WORKAROUND] xen/arm: Update hwdom's p2m to trap ECAM space
  xen/arm: Process pending vPCI map/unmap operations
  vpci: Make every domain handle its own BARs
  xen/arm: Do not hardcode phycial PCI device addresses
  vpci/arm: Allow updating BAR's header for non-ECAM bridges
  vpci/rcar: Implement vPCI.update_bar_header callback
  [HACK] vpci/rcar: Make vPCI know DomD is hardware domain

 tools/libxc/include/xenctrl.h         |   9 +
 tools/libxc/xc_domain.c               |   1 +
 tools/libxc/xc_misc.c                 |  46 ++++
 tools/libxl/Makefile                  |   8 +
 tools/libxl/libxl_pci.c               | 109 +++++++++-
 xen/arch/arm/domain_build.c           |  10 +-
 xen/arch/arm/pci/pci-host-common.c    |  44 ++++
 xen/arch/arm/pci/pci-host-generic.c   |  43 +++-
 xen/arch/arm/pci/pci-host-rcar-gen3.c |  69 ++++++
 xen/arch/arm/sysctl.c                 |  66 +++++-
 xen/arch/arm/traps.c                  |   6 +
 xen/arch/arm/vpci.c                   |  16 +-
 xen/drivers/passthrough/pci.c         |  93 +++++++++
 xen/drivers/vpci/header.c             | 289 +++++++++++++++++++++++---
 xen/drivers/vpci/vpci.c               |   1 +
 xen/include/asm-arm/pci.h             |  17 ++
 xen/include/public/arch-arm.h         |   9 +-
 xen/include/public/sysctl.h           |  40 ++++
 xen/include/xen/pci.h                 |  12 ++
 xen/include/xen/vpci.h                |  24 ++-
 20 files changed, 857 insertions(+), 55 deletions(-)

-- 
2.17.1


