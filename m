Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F642894D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 11:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205524.360845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrBA-0002gF-K8; Mon, 11 Oct 2021 09:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205524.360845; Mon, 11 Oct 2021 09:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrBA-0002dJ-GD; Mon, 11 Oct 2021 09:01:04 +0000
Received: by outflank-mailman (input) for mailman id 205524;
 Mon, 11 Oct 2021 09:01:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tf9x=O7=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mZrB9-0002dD-D0
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:01:03 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 494c8b0d-5351-4794-8348-34b080d3b138;
 Mon, 11 Oct 2021 09:01:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D7981FB;
 Mon, 11 Oct 2021 02:01:01 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.19.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C1143F66F;
 Mon, 11 Oct 2021 02:00:58 -0700 (PDT)
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
X-Inumbo-ID: 494c8b0d-5351-4794-8348-34b080d3b138
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH v4 0/3] Expose PMU to the guests
Date: Mon, 11 Oct 2021 11:00:44 +0200
Message-Id: <20211011090047.8878-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is a rework of an already pushed patch
exposing PMU to the guests. Since the second version the vpmu
parameter is common and prework in the form of reporting
availability of vPMU on the hardware is added.

The third version of the patch series removes the redundant check
from x86 code and modifies the way to define the flags XEN_DOMCTL_CDF and
XEN_SYSCTL_PHYSCAP, meaning not to define bit position and mask separately.

In the fourth version, the additional check is added so that we fail
if vpmu is set in the config file but XEN_SYSCTL_PHYSCAP_vpmu is not available.

The current status is that the PMU registers are not virtualized
and the physical registers are directly accessible when "vpmu"
parameter is enabled in the guest config file. There is no interrupt
support and Xen will not save/restore the register values on context
switches. This is to be done in the future.

Michal Orzel (3):
  xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
  xen/arm: Check for PMU platform support
  xen: Expose the PMU to the guests

 docs/man/xl.cfg.5.pod.in             | 17 ++++++++++
 tools/golang/xenlight/helpers.gen.go |  8 +++++
 tools/golang/xenlight/types.gen.go   |  2 ++
 tools/include/libxl.h                | 12 +++++++
 tools/libs/light/libxl.c             |  1 +
 tools/libs/light/libxl_create.c      | 10 ++++++
 tools/libs/light/libxl_types.idl     |  3 ++
 tools/ocaml/libs/xc/xenctrl.ml       |  2 ++
 tools/ocaml/libs/xc/xenctrl.mli      |  2 ++
 tools/xl/xl_info.c                   |  5 +--
 tools/xl/xl_parse.c                  |  2 ++
 xen/arch/arm/domain.c                | 12 +++++--
 xen/arch/arm/setup.c                 |  1 +
 xen/common/domain.c                  | 12 ++++++-
 xen/common/sysctl.c                  |  3 ++
 xen/include/asm-arm/cpufeature.h     | 49 ++++++++++++++++++++++++++--
 xen/include/asm-arm/domain.h         |  1 +
 xen/include/public/domctl.h          |  4 ++-
 xen/include/public/sysctl.h          |  6 ++--
 xen/include/xen/domain.h             |  2 ++
 20 files changed, 143 insertions(+), 11 deletions(-)

-- 
2.29.0


