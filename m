Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8659FCC05
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 17:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863235.1274650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrBQ-000298-GX; Thu, 26 Dec 2024 16:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863235.1274650; Thu, 26 Dec 2024 16:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrBQ-00026Z-D2; Thu, 26 Dec 2024 16:58:00 +0000
Received: by outflank-mailman (input) for mailman id 863235;
 Thu, 26 Dec 2024 16:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrBP-00026T-0h
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:57:59 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d344f70-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:57:56 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232269626530.7045485100999;
 Thu, 26 Dec 2024 08:57:49 -0800 (PST)
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
X-Inumbo-ID: 8d344f70-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232270; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ENbSCjkzn2rYdwuAHr5dGskezSy5g8U2mMmRYV9bHZxIyoVRefBww2Q7kMAXX1LNqIZ037Nsm+NWeDoF3/9k0ErwxCTCJKa8WjpeVZG8Psmx5ZuPP1wasZ94CM1Q9Mg8Fno3DRAD5/YEEZBkub7Ld369yoLA7Jj+buPZEwSlMbs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232270; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nIHuSYK2rqiQJcqL0lovxzV4K0yQcvSsSbKym5BNNWY=; 
	b=j+IEelVi8Y5HoH98I/3di4emV+ocTXH5baFYM8KfWGhd+7BjSa4jhgqzCJBH1UouApb7WrcA1V06T5Lu2qYNaslW/dpTSimjBnx3pA0k7rz4SUuLu1XUK23I7U9u15o8P1DKxcH3bymhGnQ8rdTz7c6+dz4V5APPvYTqHOk+bfo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232270;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=nIHuSYK2rqiQJcqL0lovxzV4K0yQcvSsSbKym5BNNWY=;
	b=G2Q86o5v/JMX+S/qTXSEkD1vEgyQLge6hrWy4VXPdUB2O8E2SmyDDg0ssgmn+gPt
	2AM/x8+pJIozcjVEPe3kbgPR2/qHZeEsJTjek9w68Bhegq+CULI0a4FYqFENq6r2m0z
	SZfpgM5PptdMgPoUrp+4OqmS439BhaxJAq6ORgHs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com
Subject: [PATCH v2 00/15] Hyperlaunch device tree for dom0
Date: Thu, 26 Dec 2024 11:57:25 -0500
Message-Id: <20241226165740.29812-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/domain-builder/Kconfig      |  15 +
 xen/arch/x86/domain-builder/Makefile     |   3 +
 xen/arch/x86/domain-builder/core.c       | 112 +++++++
 xen/arch/x86/domain-builder/fdt.c        | 389 +++++++++++++++++++++++
 xen/arch/x86/domain-builder/fdt.h        |  53 +++
 xen/arch/x86/hvm/dom0_build.c            |  37 +--
 xen/arch/x86/include/asm/bootdomain.h    |  49 +++
 xen/arch/x86/include/asm/bootinfo.h      |  15 +-
 xen/arch/x86/include/asm/dom0_build.h    |   6 +-
 xen/arch/x86/include/asm/domainbuilder.h |  12 +
 xen/arch/x86/include/asm/setup.h         |   4 +-
 xen/arch/x86/pv/dom0_build.c             |  28 +-
 xen/arch/x86/setup.c                     | 162 ++++++----
 xen/common/Kconfig                       |   4 +
 xen/common/Makefile                      |   2 +-
 xen/include/xen/libfdt/libfdt-xen.h      | 118 +++++++
 19 files changed, 922 insertions(+), 110 deletions(-)
 create mode 100644 xen/arch/x86/domain-builder/Kconfig
 create mode 100644 xen/arch/x86/domain-builder/Makefile
 create mode 100644 xen/arch/x86/domain-builder/core.c
 create mode 100644 xen/arch/x86/domain-builder/fdt.c
 create mode 100644 xen/arch/x86/domain-builder/fdt.h
 create mode 100644 xen/arch/x86/include/asm/bootdomain.h
 create mode 100644 xen/arch/x86/include/asm/domainbuilder.h

-- 
2.30.2


