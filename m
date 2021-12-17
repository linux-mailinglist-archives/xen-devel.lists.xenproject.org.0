Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079864794CF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248831.429213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIxh-0007Pf-WE; Fri, 17 Dec 2021 19:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248831.429213; Fri, 17 Dec 2021 19:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIxh-0007ME-S8; Fri, 17 Dec 2021 19:32:13 +0000
Received: by outflank-mailman (input) for mailman id 248831;
 Fri, 17 Dec 2021 19:32:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIxf-0007M8-MV
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:32:12 +0000
Received: from sender3-of-o52.zoho.com (sender3-of-o52.zoho.com
 [136.143.184.52]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05d0fe18-5f70-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 20:32:09 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639769522844320.4261730992407;
 Fri, 17 Dec 2021 11:32:02 -0800 (PST)
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
X-Inumbo-ID: 05d0fe18-5f70-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1639769525; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZnnYkCGvNy1IMBK7HZQhZxKLEhAiDZoT8A2Gm/V02WKcwczYudXJZWP6gOP65E5jV/ytYq/zf908cMAuLfRAA66/HNvQQWWlrmacX2ZN+AN4XtB1OH0avGCrAcAUMngSikTDitlb4orcOewsH1xeC7As+mm9j1qlqbR3o/H2XQ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769525; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=fa0wW/29nJurPMLwiV2rnoDa2hoPbWTa1Hg41W4npRw=; 
	b=JaCo0cT93rl4UAvZ32ReMGoqnM87o4UO/vFYi/Cad6Kk9f7Uj7WzQkrowbZXETT8KmEleND4E7bPDda4M64YhqBOuEJYBJoMCf0hwJy67QkXTg5QCZlrHHo7l0CWjS1h/qe+wdcXkaBRT5iQwSLKdlvicyDidTfvhzHqjJnQHwM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769525;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=fa0wW/29nJurPMLwiV2rnoDa2hoPbWTa1Hg41W4npRw=;
	b=JUDRoFf8M6mQ8J1xWe7bC//JADa6eCocRw+DHXGMXPEhu8/07qcxzBWX8KDdvbGQ
	ZNxi3REIz8Kq7Zb5vwWzHOlwccohW6toHol6KmDDim3lRWUCuYWAo0lDqDJPMoQaFUQ
	ytZyNOrJ3xmVTGjLaEvH26HTzRilQ0lEdv3uJDOo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	"Jan Beulich" <jbeulich@suse.com>,
	"Christopher Clark" <christopher.w.clark@gmail.com>,
	"Julien Grall" <julien@xen.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: [RFC 00/10] Hyperlaunch x86 Dom0 launch
Date: Fri, 17 Dec 2021 18:34:26 -0500
Message-Id: <20211217233437.13791-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This RFC is to provide the base approach of how hyperlaunch would integrate
into the x86 start sequence with the specific intention to vet the
implementation approach early. What this RFC provides is a working
implementation of hyperlaunch for x86 that is capable of strictly starting a
Dom0 configuration. Even so the majority of the remaining hyperlaunch work will
be focused on domain construction and enabling the transient boot domain (DomB)
ability.

It is important to note that for this RFC patch set the work was split into
smaller commits to ease review. When the first hyperlaunch patch set is
submitted for acceptance, it is expected to see 5-7 rolled up and 9 & 10 also
rolled up.

There are a couple of areas that explicitly need review and discussion and the
commit message for a patch with one of these in them has the details, which
will be repeated here for them to also all be centralized for comment.

- For hyperlaunch it has become necessary to track decompression headroom at an
individual boot module level. The most sensible place for this information on
x86 is in the module_t structure. The challenge encountered with this is that
Xen's multiboot support is implemented by reusing MB module_t structure as a
common structure for MB and MB2. Early in Xen's x86 startup the multiboot chain
is copied(MB)/converted(MB2) into the trampoline data heap. To minimize change
for this RFC the MB module_t reserved field was split into a bitfield to allow
it to serve the existing usage of the field (relocation flag) and for headroom
tracking. While this provided a clean solution, it is viewed as a short term
solution. A suggestion might be to unify the existing architectures'
representation of a boot module and refactor x86's reloc.c to convert MB and
MB2 module descriptions into this common representation. This would have the
added benefit of reducing the static allocations currently being used for
hyperlaunch.

- When enabling device tree for use with x86, it exposed some arch specific
code in the device tree code in common and shared includes. Specifically both
Arm and x86 define a `struct device` but are totally different structures. The
device tree code uses references to Arm's version of `struct device` which
creates a conflict when the device tree code is used under x86. It was also
found that generic device tree code was currently in the Arm arch tree. Patch 4
contains a work around for the first issue and patch 7 copies the reusable
device tree parsing code from Arm arch for local/internal usage. Each patch
provides a few additional details and ultimately a generalized solution for
both problems is the preferable approach versus a minimal solution for enabling
hyperlaunch 

- To ease getting a Dom0 construction working under hyperlaunch the existing
`create_dom0()` function was exposed and reused. This was for the RFC only
and will be dropped in lieu of hyperlaunch gaining its own more general domain
creation function.
 
Christopher Clark (2):
  introduce hyperlaunch kconfig and core
  is_system_domain: replace open-coded instances

Daniel P. Smith (8):
  multiboot: moving headroom to per module_t
  device-tree: split agnostic device-tree from arm
  hyperlaunch: update device tree documentation
  hyperlaunch: add structures to hold parsed dtb
  hyperlaunch: add parsing of dtb
  hyperlaunch: make create_dom0 externally callable
  hyperlaunch: add domain creation logic
  hyperlaunch: integrate dtb parse and domain creation

 .../designs/launch/hyperlaunch-devicetree.rst | 448 ++++++++++-------
 xen/arch/x86/boot/reloc.c                     |   1 +
 xen/arch/x86/cpu/vpmu.c                       |   2 +-
 xen/arch/x86/include/asm/setup.h              |   5 +
 xen/arch/x86/setup.c                          |  75 +--
 xen/common/Kconfig                            |  15 +
 xen/common/Makefile                           |   5 +-
 xen/common/device_tree.c                      |   2 +
 xen/common/domctl.c                           |   2 +-
 xen/common/sched/core.c                       |   4 +-
 xen/common/setup.c                            | 450 ++++++++++++++++++
 xen/include/xen/device_tree.h                 |   4 +
 xen/include/xen/multiboot.h                   |   3 +-
 xen/include/xen/sched.h                       |   5 +
 xen/include/xen/setup.h                       | 131 +++++
 15 files changed, 948 insertions(+), 204 deletions(-)
 create mode 100644 xen/common/setup.c
 create mode 100644 xen/include/xen/setup.h

-- 
2.20.1


