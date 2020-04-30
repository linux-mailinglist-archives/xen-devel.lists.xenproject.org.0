Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60D61C087B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG2z-0002oT-5s; Thu, 30 Apr 2020 20:44:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG2x-0002oO-34
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:44:39 +0000
X-Inumbo-ID: 67ddbcb8-8b23-11ea-9aaf-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67ddbcb8-8b23-11ea-9aaf-12813bfff9fa;
 Thu, 30 Apr 2020 20:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=65lvQ4PbPRxi9d54dSLD9/wIHTVMii+HQcXJixzddik=; b=RYV6TpNPcZAXOe47Tm8GnwMS4n
 Ak++zpff4XuAzR+W5jzfjNi6XjfPVrIzK47yGEw9HrWmZ3errmV/NfoTp6TfDpiDJTfvFIvBazLOM
 gL/dBGhV6zvnwwb1LzIkh//lr7xOZLFBSjOwjTQ+mUlPpiwrPDajxnR+W1tw8kKqTaqg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG2u-0004Ko-Nk; Thu, 30 Apr 2020 20:44:36 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG2u-0005wj-Cw; Thu, 30 Apr 2020 20:44:36 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 00/16] Remove the direct map
Date: Thu, 30 Apr 2020 21:44:09 +0100
Message-Id: <cover.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

This series depends on Xen page table domheap conversion:
https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg01374.html.

After breaking the reliance on the direct map to manipulate Xen page
tables, we can now finally remove the direct map altogether.

This series:
- fixes many places that use the direct map incorrectly or assume the
  presence of an always-mapped direct map in a wrong way.
- includes the early vmap patches for global mappings.
- initialises the mapcache for all domains, disables the fast path that
  uses the direct map for mappings.
- maps and unmaps xenheap on-demand.
- adds a boot command line switch to enable or disable the direct map.

This previous version was in RFC state and can be found here:
https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg02647.html,
which has since been broken into small series.

Hongyan Xia (12):
  acpi: vmap pages in acpi_os_alloc_memory
  x86/numa: vmap the pages for memnodemap
  x86/srat: vmap the pages for acpi_slit
  x86: map/unmap pages in restore_all_guests.
  x86/pv: rewrite how building PV dom0 handles domheap mappings
  x86/mapcache: initialise the mapcache for the idle domain
  x86: add a boot option to enable and disable the direct map
  x86/domain_page: remove the fast paths when mfn is not in the
    directmap
  xen/page_alloc: add a path for xenheap when there is no direct map
  x86/setup: leave early boot slightly earlier
  x86/setup: vmap heap nodes when they are outside the direct map
  x86/setup: do not create valid mappings when directmap=no

Wei Liu (4):
  x86/setup: move vm_init() before acpi calls
  x86/pv: domheap pages should be mapped while relocating initrd
  x86: add Persistent Map (PMAP) infrastructure
  x86: lift mapcache variable to the arch level

 docs/misc/xen-command-line.pandoc |  12 +++
 xen/arch/arm/setup.c              |   4 +-
 xen/arch/x86/Makefile             |   1 +
 xen/arch/x86/domain.c             |   4 +-
 xen/arch/x86/domain_page.c        |  53 ++++++++-----
 xen/arch/x86/mm.c                 |   8 +-
 xen/arch/x86/numa.c               |   8 +-
 xen/arch/x86/pmap.c               |  87 +++++++++++++++++++++
 xen/arch/x86/pv/dom0_build.c      |  75 ++++++++++++++----
 xen/arch/x86/setup.c              | 125 +++++++++++++++++++++++++-----
 xen/arch/x86/srat.c               |   3 +-
 xen/arch/x86/x86_64/entry.S       |  27 ++++++-
 xen/common/page_alloc.c           |  85 +++++++++++++++++---
 xen/common/vmap.c                 |  37 +++++++--
 xen/drivers/acpi/osl.c            |   9 ++-
 xen/include/asm-arm/mm.h          |   5 ++
 xen/include/asm-x86/domain.h      |  12 +--
 xen/include/asm-x86/fixmap.h      |   3 +
 xen/include/asm-x86/mm.h          |  17 +++-
 xen/include/asm-x86/pmap.h        |  10 +++
 xen/include/xen/vmap.h            |   5 ++
 21 files changed, 495 insertions(+), 95 deletions(-)
 create mode 100644 xen/arch/x86/pmap.c
 create mode 100644 xen/include/asm-x86/pmap.h

-- 
2.24.1.AMZN


