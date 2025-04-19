Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8E9A945A5
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960020.1352075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GMy-00051g-G9; Sat, 19 Apr 2025 22:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960020.1352075; Sat, 19 Apr 2025 22:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GMy-0004yo-DG; Sat, 19 Apr 2025 22:09:04 +0000
Received: by outflank-mailman (input) for mailman id 960020;
 Sat, 19 Apr 2025 22:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GMw-0004ik-JG
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:09:02 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4f715a3-1d6a-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:09:00 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 17451005092371023.849891890091;
 Sat, 19 Apr 2025 15:08:29 -0700 (PDT)
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
X-Inumbo-ID: e4f715a3-1d6a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100512; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KY9xIV6D1qIKDm7tQZZ3DwwdQxIbJaMpxrUzWQFBWf4ZuRI0DD6mYBa7SuyxRlcfpsTb78z5XVGIxgHht1d/3pzPav8m/3OGzBYwBNSt7kbzl0b5/fVL2ng1ZqNIoTWgt7QJ7D3JCo1azGDxvu4teS6oN+c8+BHisBRHwqyk998=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100512; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NzmQ6uolA8E5w5U/XEFdVN2iE4YPjBizc0u4UT10BuI=; 
	b=MmQn+SO5FNcY1qNOsYUujRgjATfSneLSIVBaBEww3x5k+n7/nm2GOhaarbNCKOTYUjBSv5O6zoyjBPG3JKAdcSCOcayh67xfqUtN0XLEq5qfdK18+pGvtSKy7F3AelksdzZy4bv29MRK26C3hyhyxKfCEUvRKwluw1gwC1ehZSw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100512;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=NzmQ6uolA8E5w5U/XEFdVN2iE4YPjBizc0u4UT10BuI=;
	b=LNg/BvTDhj2VHPq5wbqm7p2xLJtHhQip1i7OEGm539DgQcPUIJRopEy0DXH8kjI5
	FI1Fw/6QWC/PNKhfpqyA2XTi0HBspISsGiOcd5ERmFxOGY3gE7p00mf6OfC8HMlmxfp
	jWI2iEhdcJ7q3zoTH60fj2Ges9kS3tWlkZ3TnOQQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com
Subject: [RFC 00/38] Hyperlaunch domain builder
Date: Sat, 19 Apr 2025 18:07:42 -0400
Message-Id: <20250419220820.4234-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

NOTE: Sending this series as an RFC as it is a follow-on to the hyperlaunch
dom0 device tree series going through rounds of review right now. This specific
iteration is based off of v3 with the exception of one fix found here and
already incorporated into v4.

The Hyperlaunch domain builder series is the third split out for the
introduction of the Hyperlaunch domain builder logic. These changes focus on
introducing the ability to create multiple PVH domains at boot. The definition
for those domains will come from the Device Tree capability introduced in the
dom0 device tree series.

Documentation on Hyperlaunch:
https://wiki.xenproject.org/wiki/Hyperlaunch

Original Hyperlaunch v1 patch series:
https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00345.html

V/r,
Daniel P. Smith

Daniel P. Smith (38):
  maintainers: add new section for hyperlaunch
  x86/hyperlaunch: correct the naming of domain ramdisk field
  x86/hyperlaunch: convert max vcpu determination to domain builder
  x86/hyperlaunch: convert vcpu0 creation to domain builder
  x86/hyperlaunch: move dom0 cpuid policy behind capability check
  x86/hyperlaunch: add hardware domain capability support
  x86/hyperlaunch: introduce pvh domain builder
  x86/hyperlaunch: move initial hwdom setup to dom_construct_pvh
  x86/boot: convert dom0 page calculation to use boot domain
  x86/boot: refactor dom0 page calculation
  x86/boot: generalize paging pages calculation
  x86/boot: generalize compute number of domain pages
  x86/hyperlaunch: move page computation to domain builder
  x86/hyperlaunch: move pvh p2m init to domain builder
  x86/hyperlaunch: move iommu init to domain builder
  x86/boot: move and rename sched_setup_dom0_vcpus
  x86/hyperlaunch: move pvh_setup_cpus to domain builder
  x86/boot: rename pvh acpi setup function
  x86/hyperlaunch: add domu memory map construction
  x86/hyperlaunch: move populating p2m under domain builder
  x86/hyperlaunch: move remaining pvh dom0 construction
  x86/hyperlaunch: relocate pvh_steal_ram to domain builder
  x86/hyperlaunch: add domu acpi construction
  x86/boot: export command line processing
  x86/hyperlaunch: convert create_dom0 to arch_create_dom
  x86/hyperlaunch: remove dom0-isms from arch_create_dom
  x86/hyperlaunch: introduce domain builder general dom creation
  x86/hyperlaunch: add xenstore boot capabilities flag
  x86/hyperlaunch: allocate console for domu
  x86/hyperlaunch: allocate xenstore for domu
  x86/hyperlaunch: move boot module discard to domain builder
  x86/hyperlaunch: introduce concept of core domains
  x86/boot: refactor bzimage parser to be re-enterant
  x86/hyperlaunch: introduce multidomain kconfig option
  x86/hyperlaunch: add multidomain construction logic
  x86/hyperlaunch: enable unpausing mulitple domains
  x86/hyperlaunch: generalize domid assignment
  tools: introduce hyperlaunch domain late init

 .gitignore                                |    1 +
 MAINTAINERS                               |    9 +
 tools/helpers/Makefile                    |   12 +
 tools/helpers/late-init-domains.c         |  364 +++++++
 tools/helpers/late-init-domains.h         |   18 +
 tools/helpers/xs-helpers.c                |  117 +++
 tools/helpers/xs-helpers.h                |   26 +
 xen/arch/x86/bzimage.c                    |   38 +-
 xen/arch/x86/dom0_build.c                 |  120 +--
 xen/arch/x86/domain-builder/Kconfig       |   12 +
 xen/arch/x86/domain-builder/Makefile      |    1 +
 xen/arch/x86/domain-builder/core.c        |  127 ++-
 xen/arch/x86/domain-builder/domain.c      |  421 ++++++++
 xen/arch/x86/domain-builder/fdt.c         |   37 +-
 xen/arch/x86/hvm/Makefile                 |    1 +
 xen/arch/x86/hvm/dom0_build.c             |  600 +-----------
 xen/arch/x86/hvm/dom_build.c              | 1063 +++++++++++++++++++++
 xen/arch/x86/include/asm/boot-domain.h    |   21 +-
 xen/arch/x86/include/asm/bootinfo.h       |   28 +-
 xen/arch/x86/include/asm/bzimage.h        |    5 +-
 xen/arch/x86/include/asm/dom0_build.h     |   19 +-
 xen/arch/x86/include/asm/domain-builder.h |   29 +
 xen/arch/x86/include/asm/setup.h          |    4 +-
 xen/arch/x86/pv/dom0_build.c              |   19 +-
 xen/arch/x86/setup.c                      |  207 +---
 xen/common/sched/core.c                   |   12 -
 xen/include/xen/sched.h                   |    1 -
 27 files changed, 2412 insertions(+), 900 deletions(-)
 create mode 100644 tools/helpers/late-init-domains.c
 create mode 100644 tools/helpers/late-init-domains.h
 create mode 100644 tools/helpers/xs-helpers.c
 create mode 100644 tools/helpers/xs-helpers.h
 create mode 100644 xen/arch/x86/domain-builder/domain.c
 create mode 100644 xen/arch/x86/hvm/dom_build.c

-- 
2.30.2


