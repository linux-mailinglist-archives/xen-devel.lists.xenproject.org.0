Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF946429F88
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206861.362525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCut-0008UB-Cw; Tue, 12 Oct 2021 08:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206861.362525; Tue, 12 Oct 2021 08:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCut-0008Rd-9S; Tue, 12 Oct 2021 08:13:43 +0000
Received: by outflank-mailman (input) for mailman id 206861;
 Tue, 12 Oct 2021 08:13:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lNhP=PA=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1maCus-0008RX-2b
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:13:42 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id adb86a57-9eab-4fe5-81aa-b5f7cceecdac;
 Tue, 12 Oct 2021 08:13:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8522EED1;
 Tue, 12 Oct 2021 01:13:40 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.27.99])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 117383F694;
 Tue, 12 Oct 2021 01:13:36 -0700 (PDT)
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
X-Inumbo-ID: adb86a57-9eab-4fe5-81aa-b5f7cceecdac
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
Subject: [PATCH v5 0/3] Expose PMU to the guests
Date: Tue, 12 Oct 2021 10:13:20 +0200
Message-Id: <20211012081323.14141-1-michal.orzel@arm.com>
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

In the fifth version, SUPPORT.md is updated with the information about
vPMU feature and checks for platform PMU support are improved.

The current status is that the PMU registers are not virtualized
and the physical registers are directly accessible when "vpmu"
parameter is enabled in the guest config file. There is no interrupt
support and Xen will not save/restore the register values on context
switches. This is to be done in the future.

Michal Orzel (3):
  xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
  xen/arm: Check for PMU platform support
  xen: Expose the PMU to the guests

 SUPPORT.md                           |  9 +++++
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
 xen/arch/arm/domain.c                | 13 +++++--
 xen/arch/arm/setup.c                 |  3 ++
 xen/common/domain.c                  | 12 ++++++-
 xen/common/sysctl.c                  |  3 ++
 xen/include/asm-arm/cpufeature.h     | 51 ++++++++++++++++++++++++++--
 xen/include/asm-arm/domain.h         |  1 +
 xen/include/public/domctl.h          |  4 ++-
 xen/include/public/sysctl.h          |  6 ++--
 xen/include/xen/domain.h             |  2 ++
 21 files changed, 157 insertions(+), 11 deletions(-)

-- 
2.29.0


