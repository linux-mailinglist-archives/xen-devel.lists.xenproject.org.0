Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A6776E5DD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576253.902180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVpD-0006VN-0Z; Thu, 03 Aug 2023 10:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576253.902180; Thu, 03 Aug 2023 10:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVpC-0006SN-TB; Thu, 03 Aug 2023 10:44:58 +0000
Received: by outflank-mailman (input) for mailman id 576253;
 Thu, 03 Aug 2023 10:44:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRVpA-0006R6-8b
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:44:56 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c63f1b36-31ea-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 12:44:53 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691059486980177.53896160741135;
 Thu, 3 Aug 2023 03:44:46 -0700 (PDT)
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
X-Inumbo-ID: c63f1b36-31ea-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691059489; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CqoqPxcMhQKOSPFPL1drpXXXj7+fRTAJ065EQiu+d3/RZWmCBOxKTYxkoNW0znDCFQCB2HU28ZG5sgdO9InvX317KkviZ5E7o/csXC+paN9dRbe4jHgjAF4sALIGdGE6YXN+H3KAlPp4xSQNF/eTCtGPIBp+damKCr5ITyIZ1gk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691059489; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=NI9QzLntlpPNBsuyFhfQihukqMkII5427Tj801yySmU=; 
	b=kEjtLWi8Lbe/Ka4h1xTWx+HbSP9Nk+QG1yXefTfGfhRxiFQvWBs48WYpl8Jmo6JBWanGygIGyu9diKMjggV6clEofmBGBG/xyTJFlcH/magttwCpPBLhohqdeZzyKw2FceNMXlYVYAo1OlaaDhiGtmYh4I2QFw+OJiHci09DYZk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691059489;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=NI9QzLntlpPNBsuyFhfQihukqMkII5427Tj801yySmU=;
	b=XGLVUR7VAywlrnre4hu8LGiM+TSyiMlU32+vC4hs6p+z7cnekY60dFtDQELPZ0Bj
	a/CRNKLPhdwcC5+3tVvudpmujnFUkWF93hyJEA6hZQizm8CImupluQfbATikoW2ZOQC
	aGtu9n9FWv1GfQr7vokcj5YnOep085W1Je7YiGx8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Rich Persaud <persaur@gmail.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 0/2] Rebranding dom0less to hyperlaunch part 1
Date: Thu,  3 Aug 2023 06:44:36 -0400
Message-Id: <20230803104438.24720-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This is the first series of the proposal put forth on moving to have dom0less
folded under and thus rebranded as a part of hyperlaunch. As laid out in the
proposal, the series updates the hyperlaunch device tree documentation and
applies the general refactoring of FDT parsing to make core logic common.

Changes in v2
 - removed original function declarations from arch/arm/include/asm/setup.h
 - corrected the new F: entries in the FDT section of MAINTAINERS
 - alphabetized the F: entries in the FDT section of MAINTAINERS

Daniel P. Smith (2):
  docs: update hyperlaunch device tree
  fdt: make fdt handling reusable across arch

 MAINTAINERS                                   |  17 +-
 .../designs/launch/hyperlaunch-devicetree.rst | 566 ++++++++++--------
 xen/arch/arm/bootfdt.c                        | 141 +----
 xen/arch/arm/domain_build.c                   |   1 +
 xen/arch/arm/include/asm/setup.h              |   6 -
 xen/common/Kconfig                            |   4 +
 xen/common/Makefile                           |   3 +-
 xen/common/fdt.c                              | 153 +++++
 xen/include/xen/device_tree.h                 |  50 +-
 xen/include/xen/fdt.h                         |  79 +++
 10 files changed, 555 insertions(+), 465 deletions(-)
 create mode 100644 xen/common/fdt.c
 create mode 100644 xen/include/xen/fdt.h

-- 
2.20.1


