Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FC3AB87AF
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985306.1371210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYTL-0001Kp-5t; Thu, 15 May 2025 13:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985306.1371210; Thu, 15 May 2025 13:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYTL-0001JM-2o; Thu, 15 May 2025 13:18:03 +0000
Received: by outflank-mailman (input) for mailman id 985306;
 Thu, 15 May 2025 13:18:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYTJ-0001J6-UA
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:18:01 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0596ba8e-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:18:00 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315071104666.9716373647635;
 Thu, 15 May 2025 06:17:51 -0700 (PDT)
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
X-Inumbo-ID: 0596ba8e-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315073; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=faX6nSsGO58O1nIxYucS98oBwIQly17YAiRMmQ1WNCdjvR7Z9FrGErfV778wGoAei7f6wMULXQopzcnDp7rRXwXrAWo/4SpT/p90f52BmCgmvZKgwKHs75swWecRk9h6bbGc9bzDPDcK5wytpJtue1YGkPxCw0ZtfqCRboZZra4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315073; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q/A32VJqv7n9/PtkY06URGkF1PXb70iXPAI3jSPTTiQ=; 
	b=kBYC+3ZiKOaLO5vPLX9sh1u0n8xWIEGzffbuOqB8QFyx5ix+jWweTf4zFT2NtfrtLiDdMUKvTHjunBF+UjCh4zWOjgrH/SPCJtYJBQiskrp6gdDTDEYddemI8HttNPOv4pBfi4eJTxFrO2iESzrlfKcK8ZcrbKndbQ+0v1ySYVI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315073;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Q/A32VJqv7n9/PtkY06URGkF1PXb70iXPAI3jSPTTiQ=;
	b=d6qIUR3OWFtSzfRoAetJlMAA5mN2e+Y/4aCDC4DOufih1tJPmzHvNcLWhxdHU+VY
	Ye1q6V6cJo0Icc1nGFNTEmIM9Zo8dlV3Qp0BJlYS3TklTx20u1nMEyqyr7vNPd2Qqjk
	zER5/ZOoYAxFB5Rrh1V98yrl2OQb0cK9C3DYt5wc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com
Subject: [RFCv2 00/38]  Hyperlaunch domain builder
Date: Thu, 15 May 2025 09:17:06 -0400
Message-Id: <20250515131744.3843-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

NOTE: Sending this series as an RFC as it is a follow-on to the hyperlaunch
dom0 device tree series going through rounds of review right now. This
iteration of the RFC series is based off of v6 of the dom0 device tree series.

The Hyperlaunch domain builder series is the third split out for the
introduction of the Hyperlaunch domain builder logic. These changes focus on
introducing the ability to create multiple PVH domains at boot. The definition
for those domains will come from the Device Tree capability introduced in the
dom0 device tree series.

Significant Changes in v2:
- bzimage renetrant was dropped for a proper refactoring of kernel headroom and
  expansion
- While there is concern on the affect for pv construction, event channel
  allocation has been delayed to a newly introduced builder_finalize function
  called after all construction has completed


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
  x86/hyperlaunch: introduce arch builder finalize
  x86/hyperlaunch: allocate xenstore for domu
  x86/hyperlaunch: allocate console for domu
  x86/hyperlaunch: introduce concept of core domains
  common/gzip: add function to read isize field
  x86/hyperlaunch: move headroom under domain builder
  x86/hyperlaunch: move kernel extraction under domain builder
  x86/hyperlaunch: introduce multidomain kconfig option
  x86/hyperlaunch: add multidomain construction logic
  x86/hyperlaunch: enable unpausing mulitple domains
  x86/hyperlaunch: generalize domid assignment
  tools: introduce hyperlaunch domain late init

 .gitignore                                |    1 +
 MAINTAINERS                               |   11 +
 tools/helpers/Makefile                    |   12 +
 tools/helpers/late-init-domains.c         |  364 +++++++
 tools/helpers/late-init-domains.h         |   18 +
 tools/helpers/xs-helpers.c                |  117 +++
 tools/helpers/xs-helpers.h                |   26 +
 xen/arch/x86/Makefile                     |    1 +
 xen/arch/x86/bzimage.c                    |   87 +-
 xen/arch/x86/dom0_build.c                 |  120 +--
 xen/arch/x86/domain-builder/Makefile      |    2 +
 xen/arch/x86/domain-builder/core.c        |  140 +++
 xen/arch/x86/domain-builder/domain.c      |  480 ++++++++++
 xen/arch/x86/hvm/Makefile                 |    1 +
 xen/arch/x86/hvm/dom0_build.c             |  600 +-----------
 xen/arch/x86/hvm/dom_build.c              | 1047 +++++++++++++++++++++
 xen/arch/x86/include/asm/boot-domain.h    |   24 +-
 xen/arch/x86/include/asm/bootinfo.h       |   28 +-
 xen/arch/x86/include/asm/bzimage.h        |    6 +-
 xen/arch/x86/include/asm/dom0_build.h     |   19 +-
 xen/arch/x86/include/asm/domain-builder.h |   33 +
 xen/arch/x86/include/asm/setup.h          |    4 +-
 xen/arch/x86/pv/dom0_build.c              |   21 +-
 xen/arch/x86/setup.c                      |  214 +----
 xen/common/domain-builder/Kconfig         |   12 +
 xen/common/domain-builder/fdt.c           |   40 +-
 xen/common/gzip/gunzip.c                  |   12 +
 xen/common/sched/core.c                   |   12 -
 xen/include/xen/domain-builder.h          |   14 +
 xen/include/xen/gunzip.h                  |   12 +
 xen/include/xen/sched.h                   |    1 -
 31 files changed, 2526 insertions(+), 953 deletions(-)
 create mode 100644 tools/helpers/late-init-domains.c
 create mode 100644 tools/helpers/late-init-domains.h
 create mode 100644 tools/helpers/xs-helpers.c
 create mode 100644 tools/helpers/xs-helpers.h
 create mode 100644 xen/arch/x86/domain-builder/Makefile
 create mode 100644 xen/arch/x86/domain-builder/core.c
 create mode 100644 xen/arch/x86/domain-builder/domain.c
 create mode 100644 xen/arch/x86/hvm/dom_build.c
 create mode 100644 xen/arch/x86/include/asm/domain-builder.h

-- 
2.30.2


