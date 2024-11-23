Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3629D6AC2
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842120.1257537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuku-0005sd-Hw; Sat, 23 Nov 2024 18:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842120.1257537; Sat, 23 Nov 2024 18:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuku-0005pU-DG; Sat, 23 Nov 2024 18:21:16 +0000
Received: by outflank-mailman (input) for mailman id 842120;
 Sat, 23 Nov 2024 18:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEuks-0005pL-5F
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:21:14 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2de7249-a9c7-11ef-99a3-01e77a169b0f;
 Sat, 23 Nov 2024 19:21:05 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386051024795.9445222351329;
 Sat, 23 Nov 2024 10:20:51 -0800 (PST)
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
X-Inumbo-ID: b2de7249-a9c7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImIyZGU3MjQ5LWE5YzctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMzg2MDY1LjU1Nzk0LCJzZW5kZXIiOiJkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; t=1732386055; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cyr6SphN1TzNA5gVS8DhTzUN93cgAFFXdGuRoThv4ntaDTU6ssmkHmFgQuSRZmuVSbqPQ9fVoUlyVgZqbRxkEUeJR2SB40gfmtA+2uDPLQCk/rOGavH5rsZGBl8Rm94HAnPXdkLvWiPpNa54LKIoDJXk44oEEbfytr16NWp5DKs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386055; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VWLTMeVY/BgSfVokbokg8/c1048zkf8Kiscp++nQonw=; 
	b=npSU/XQdxDzvPR/l1F/F1APkuEE7dQg9ixQEt/UsOa3NmdBnaYMy7tqym5EISH9yJBRGd7ckQomj08uZ9JJl6bHlPP74M8RwbmD78xD4iHJjFYAPgw86QQEehC5ZlXWoMUF0OcesZis1QCc/p/nkaqqKUrCVVzYpfJbcOu3C2ss=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386055;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=VWLTMeVY/BgSfVokbokg8/c1048zkf8Kiscp++nQonw=;
	b=YrPGO1rFkrHMxnhLbVDapM+uuoQIq8730l1DXntjuEDkp7ZQ5SdAvKEMRnEvrlEo
	Y+3OMQCUJXmvgPAXaz12YQ4pLEDlMi7HhvnC5QfLFk9Ihcgt2gur4M5QGdhO4ffRsxc
	bhLOK28V73NP+o1OmdT/H17FnHRPeURzKpOOjC1s=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com
Subject: [PATCH 00/15] Hyperlaunch device tree for dom0
Date: Sat, 23 Nov 2024 13:20:29 -0500
Message-Id: <20241123182044.30687-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The Hyperlaunch device tree for dom0 series is the second split out for the
introduction of the Hyperlaunch domain builder logic. These changes focus on
introducing the ability to express a domain configuration that is then used to
populate the struct boot_domain structure for dom0. This ability to express a
domain configuration provides the next step towards a general domain builder.

The splitting of Hyperlaunch into a set of series are twofold, to reduce the
effort in reviewing a much larger series, and to reduce the effort in handling
the knock-on effects to the construction logic from requested review changes.

Much thanks to AMD for supporting this work.

Documentation on Hyperlaunch:
https://wiki.xenproject.org/wiki/Hyperlaunch

Original Hyperlaunch v1 patch series:
https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00345.html

V/r,
Daniel P. Smith

Daniel P. Smith (15):
  x86/boot: introduce boot domain
  x86/boot: introduce domid field to struct boot_domain
  x86/boot: add cmdline to struct boot_domain
  kconfig: introduce option to independently enable libfdt
  kconfig: introduce domain builder config option
  x86/hyperlaunch: introduce the domain builder
  x86/hyperlaunch: initial support for hyperlaunch device tree
  x86/hyperlaunch: locate dom0 kernel with hyperlaunch
  x86/hyperlaunch: obtain cmdline from device tree
  x86/hyperlaunch: locate dom0 initrd with hyperlaunch
  x86/hyperlaunch: add domain id parsing to domain config
  x86/hyperlaunch: specify dom0 mode with device tree
  x86/hyperlaunch: add memory parsing to domain config
  x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
  x86/hyperlaunch: add capabilities to boot domain

 xen/arch/x86/Kconfig                     |   2 +
 xen/arch/x86/Makefile                    |   2 +
 xen/arch/x86/dom0_build.c                |  19 +-
 xen/arch/x86/domain_builder/Kconfig      |  15 +
 xen/arch/x86/domain_builder/Makefile     |   3 +
 xen/arch/x86/domain_builder/core.c       | 109 +++++++
 xen/arch/x86/domain_builder/fdt.c        | 395 +++++++++++++++++++++++
 xen/arch/x86/domain_builder/fdt.h        |  94 ++++++
 xen/arch/x86/hvm/dom0_build.c            |  23 +-
 xen/arch/x86/include/asm/bootdomain.h    |  53 +++
 xen/arch/x86/include/asm/bootinfo.h      |  15 +-
 xen/arch/x86/include/asm/dom0_build.h    |   6 +-
 xen/arch/x86/include/asm/domainbuilder.h |  12 +
 xen/arch/x86/include/asm/setup.h         |   4 +-
 xen/arch/x86/pv/dom0_build.c             |  28 +-
 xen/arch/x86/setup.c                     | 140 +++++---
 xen/common/Kconfig                       |   4 +
 xen/common/Makefile                      |   2 +-
 18 files changed, 836 insertions(+), 90 deletions(-)
 create mode 100644 xen/arch/x86/domain_builder/Kconfig
 create mode 100644 xen/arch/x86/domain_builder/Makefile
 create mode 100644 xen/arch/x86/domain_builder/core.c
 create mode 100644 xen/arch/x86/domain_builder/fdt.c
 create mode 100644 xen/arch/x86/domain_builder/fdt.h
 create mode 100644 xen/arch/x86/include/asm/bootdomain.h
 create mode 100644 xen/arch/x86/include/asm/domainbuilder.h

-- 
2.30.2


