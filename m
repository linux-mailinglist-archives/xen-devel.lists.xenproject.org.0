Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D234265CE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 10:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204507.359656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYl6e-0006v1-7X; Fri, 08 Oct 2021 08:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204507.359656; Fri, 08 Oct 2021 08:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYl6e-0006t0-4E; Fri, 08 Oct 2021 08:19:52 +0000
Received: by outflank-mailman (input) for mailman id 204507;
 Fri, 08 Oct 2021 08:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HhL2=O4=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mYl6c-0006su-O6
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 08:19:50 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a3e88728-6dc4-417a-84de-b9cbf4dccaac;
 Fri, 08 Oct 2021 08:19:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 582846D;
 Fri,  8 Oct 2021 01:19:48 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.24.215])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB6A43F70D;
 Fri,  8 Oct 2021 01:19:44 -0700 (PDT)
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
X-Inumbo-ID: a3e88728-6dc4-417a-84de-b9cbf4dccaac
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/3] Expose PMU to the guests
Date: Fri,  8 Oct 2021 10:19:30 +0200
Message-Id: <20211008081933.18546-1-michal.orzel@arm.com>
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
 tools/libs/light/libxl_create.c      |  4 +++
 tools/libs/light/libxl_types.idl     |  3 ++
 tools/ocaml/libs/xc/xenctrl.ml       |  2 ++
 tools/ocaml/libs/xc/xenctrl.mli      |  2 ++
 tools/xl/xl_info.c                   |  5 +--
 tools/xl/xl_parse.c                  |  2 ++
 xen/arch/arm/domain.c                | 10 ++++--
 xen/arch/arm/setup.c                 |  1 +
 xen/common/domain.c                  | 11 ++++++-
 xen/common/sysctl.c                  |  3 ++
 xen/include/asm-arm/cpufeature.h     | 49 ++++++++++++++++++++++++++--
 xen/include/asm-arm/domain.h         |  1 +
 xen/include/public/domctl.h          |  4 ++-
 xen/include/public/sysctl.h          |  6 ++--
 xen/include/xen/domain.h             |  2 ++
 20 files changed, 135 insertions(+), 10 deletions(-)

-- 
2.29.0


