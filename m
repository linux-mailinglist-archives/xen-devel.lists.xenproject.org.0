Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E03D27EA32
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720.2443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcQh-00053W-I8; Wed, 30 Sep 2020 13:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720.2443; Wed, 30 Sep 2020 13:45:59 +0000
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
	id 1kNcQh-000536-EP; Wed, 30 Sep 2020 13:45:59 +0000
Received: by outflank-mailman (input) for mailman id 720;
 Wed, 30 Sep 2020 13:45:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNcQg-00052v-5r
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:45:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe83335b-cb33-4138-add6-4174f5b7dbf7;
 Wed, 30 Sep 2020 13:45:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNcQg-00052v-5r
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:45:58 +0000
X-Inumbo-ID: fe83335b-cb33-4138-add6-4174f5b7dbf7
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fe83335b-cb33-4138-add6-4174f5b7dbf7;
	Wed, 30 Sep 2020 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601473557;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TZ9x/Ohzoh4n1ndBYbApyLx+gvyJLcECZULnS9hqokI=;
  b=YiNM4f/4N8nnSf1t2uKyxzRzZENuoe1D+P5CntD4CfAufsJqAAFcoarA
   J2pLsQA1FwQOGENRQ+NcyzlGe0myCH5vmlt9XLgPrRBY8zANdEjCmFcZv
   CKDl+JFcavHEViEGoU1GEfhnIhs8rTawNFP6xp71yLTzNd8QpQM1uHDS+
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Oqt/MOi9iU3AQhWJHV77xFD9vwCmaApZehT6+VP0GGT7oA1+4mh/Teh1vg4grb/isfar6v3b36
 f42i52328a5XZ1PT+JfsO+W0ynUjQWN9T9gOLL+UBwlkt4G1txC5hwiVc92jtRnIZARTwSJeNE
 9ZxtYD/61tk6eY7ps1CBCYCkg60yC2602ZuXEb3FCnx6eRnj6zI9KLCoUApeLzYZSv3ORcLUS7
 KmrcJtClzzmp+Yd60r5wsLpf4izAXzEAmAGpitGzAqRlUf9xt72EX0UgiEUfveAi2JiHpu7UWA
 glo=
X-SBRS: None
X-MesageID: 28239629
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28239629"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH 0/8] x86: Untangle Nested virt and CPUID interactions
Date: Wed, 30 Sep 2020 14:42:40 +0100
Message-ID: <20200930134248.4918-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is the final bit of untangling for existing CPUID handling, as well as
the logical next step in nested-virt work to start making it usable.

Patch 4 was previously posted in isolation.  It is unchanged in this series.

Andrew Cooper (8):
  tools/libxl: Simplify DOMCTL_CDF_ flags handling in libxl__domain_make()
  xen/domctl: Simplify DOMCTL_CDF_ checking logic
  xen/domctl: Introduce and use XEN_DOMCTL_CDF_nested_virt
  tools/cpuid: Plumb nested_virt down into xc_cpuid_apply_policy()
  x86/hvm: Obsolete the use of HVM_PARAM_NESTEDHVM
  xen/xsm: Drop xsm_hvm_param_nested()
  x86/hvm: Drop restore boolean from hvm_cr4_guest_valid_bits()
  x86/cpuid: Move VMX/SVM out of the default policy

 tools/flask/policy/modules/xen.if           |  2 +-
 tools/libs/ctrl/include/xenctrl.h           |  4 +--
 tools/libs/guest/xg_cpuid_x86.c             | 14 ++++------
 tools/libxl/libxl_cpuid.c                   |  3 +-
 tools/libxl/libxl_create.c                  | 13 ++++++---
 tools/libxl/libxl_x86.c                     |  5 ----
 tools/ocaml/libs/xc/xenctrl.ml              |  1 +
 tools/ocaml/libs/xc/xenctrl.mli             |  1 +
 xen/arch/x86/domain.c                       | 14 ++++++++--
 xen/arch/x86/hvm/domain.c                   |  2 +-
 xen/arch/x86/hvm/hvm.c                      | 41 ++++++---------------------
 xen/arch/x86/hvm/svm/svmdebug.c             |  6 ++--
 xen/arch/x86/hvm/vmx/vmx.c                  |  2 +-
 xen/arch/x86/hvm/vmx/vvmx.c                 |  2 +-
 xen/common/domain.c                         | 43 +++++++++++++++++------------
 xen/include/asm-x86/hvm/hvm.h               |  2 +-
 xen/include/asm-x86/hvm/nestedhvm.h         |  5 ++--
 xen/include/public/arch-x86/cpufeatureset.h |  4 +--
 xen/include/public/domctl.h                 |  4 ++-
 xen/include/public/hvm/params.h             |  4 +--
 xen/include/xsm/dummy.h                     |  6 ----
 xen/include/xsm/xsm.h                       |  6 ----
 xen/xsm/dummy.c                             |  1 -
 xen/xsm/flask/hooks.c                       |  6 ----
 xen/xsm/flask/policy/access_vectors         |  2 --
 25 files changed, 81 insertions(+), 112 deletions(-)

-- 
2.11.0


