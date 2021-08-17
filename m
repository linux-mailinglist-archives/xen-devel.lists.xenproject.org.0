Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF153EEE87
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 16:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167903.306547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG06n-0005gn-AC; Tue, 17 Aug 2021 14:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167903.306547; Tue, 17 Aug 2021 14:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG06n-0005e8-73; Tue, 17 Aug 2021 14:30:29 +0000
Received: by outflank-mailman (input) for mailman id 167903;
 Tue, 17 Aug 2021 14:30:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mG06l-0005dw-QC
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 14:30:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 048a9a84-02ec-4583-b396-9bf4a52fff6d;
 Tue, 17 Aug 2021 14:30:26 +0000 (UTC)
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
X-Inumbo-ID: 048a9a84-02ec-4583-b396-9bf4a52fff6d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629210626;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QCMDonI9QAIns3fWcj2O28yxoeTGFZ3ntzDimEZpecs=;
  b=cC58nAiJ/bPjE+m5TpV5mlureMeh2UQsUuACCrFgMhuoFHdaZiryiKj/
   MFnufWXwNZ6xAXD8ORlVilMr7FKFmCn4PzUMnk8Ro8iOiL/r3Zlkt7vY8
   IsiaL4zmAE4eDJ5T3RUTZOjp6ziKQQv9XmIUmQ8OK8DgAl94HqlR8bFL2
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: C3yMzzi8Bpl0gTzxBm/IAfdVKF6EhpHaye1zgCfhEh9QCsXFgbNTXrDdwcphdvMJwq9hZ+JqLs
 48sXKwSvIe673wYdLBSqZouHhX1m3JfMC79Fq3KV3hdCZO1jq3ihDs9HYvxaX/lc2cY+hT3hiW
 q0dGu9bYwAS//0ONZ01EK0BbHj7Qfy9M+nPMTKezo0OCX5qIiXEk8Yc/E2NOfY/bBW4ssVkfKE
 VPpLM4YbW8hfNBErLnvRnmwnHsYohwqskN6Ip1f9KpN4QLSwGl6kyFNBQoawYBo4IDZaOQbQUP
 BlkGasrgCuI9pOBWZ6zTeE4/
X-SBRS: 5.1
X-MesageID: 50281657
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zYO75azYPfTLtbC5pdV0KrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.84,329,1620705600"; 
   d="scan'208";a="50281657"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] x86/amd: Hardware speculative controls
Date: Tue, 17 Aug 2021 15:30:03 +0100
Message-ID: <20210817143006.2821-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is the very beginning the work to start using AMD hardware speculative
controls on Zen2 or later.

The extent of the work is very tangled, and breaks down roughly like this:

1) Teach Xen to use AMD's MSR_SPEC_CTRL and context switch per vCPU.  It
   requires editing the common MSR_SPEC_CTRL logic, at which point it would be
   short sighted not to include Intel's eIBRS at the same time.
2) Expose MSR_SPEC_CTRL to AMD guests, along with all the hint bits.
3) Implement MSR_VIRT_SPEC_CTRL for guests, in terms of MSR_SPEC_CTRL.SSBD.
   Will be off by default on Zen2 and later, but needs to be usable for
   migration compatibility.
4) Implement legacy Memory Disambiguation context switching for pre-Zen2
   parts, and expose MSR_VIRT_SPEC_CTRL to guests on older parts.

In terms of end results, this is what the hardware feature look like on
various generations of AMD CPU:

Fam15h (Opteron 6212):
  (XEN) Speculative mitigation facilities:
  (XEN)   Hardware hints:
  (XEN)   Hardware features: IBPB
  (XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
  (XEN)   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other: IBPB BRANCH_HARDEN
  (XEN)   Support for HVM VMs: RSB
  (XEN)   Support for PV VMs: RSB
  (XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
  (XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled

Zen1:
  (XEN) Speculative mitigation facilities:
  (XEN)   Hardware hints:
  (XEN)   Hardware features: IBPB
  (XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
  (XEN)   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other: IBPB BRANCH_HARDEN
  (XEN)   Support for HVM VMs: RSB
  (XEN)   Support for PV VMs: RSB
  (XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
  (XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled

Zen2:
  (XEN) Speculative mitigation facilities:
  (XEN)   Hardware hints: IBRS_FAST IBRS_SAME_MODE
  (XEN)   Hardware features: IBPB IBRS STIBP SSBD
  (XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
  (XEN)   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other: IBPB BRANCH_HARDEN
  (XEN)   Support for HVM VMs: RSB
  (XEN)   Support for PV VMs: RSB
  (XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
  (XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled

Zen3:
  (XEN) Speculative mitigation facilities:
  (XEN)   Hardware hints: STIBP_ALWAYS IBRS_FAST IBRS_SAME_MODE
  (XEN)   Hardware features: IBPB IBRS STIBP SSBD PSFD
  (XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
  (XEN)   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other: IBPB BRANCH_HARDEN
  (XEN)   Support for HVM VMs: RSB
  (XEN)   Support for PV VMs: RSB
  (XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (with PCID)
  (XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled

Although full support for all of this is a way off yet.

To start with, make the existing `spec-ctrl=no-ssbd` command line option
actually work on Zen3.

Andrew Cooper (3):
  x86/spec-ctrl: Split the "Hardware features" diagnostic line
  x86/amd: Enumeration for speculative features/hints
  x86/amd: Use newer SSBD mechanisms if they exist

 tools/libs/light/libxl_cpuid.c              | 10 +++++
 tools/misc/xen-cpuid.c                      |  8 +++-
 xen/arch/x86/cpu/amd.c                      | 69 +++++++++++++++++++++--------
 xen/arch/x86/cpu/cpu.h                      |  1 +
 xen/arch/x86/cpu/hygon.c                    | 10 +----
 xen/arch/x86/hvm/svm/svm.c                  |  1 +
 xen/arch/x86/hvm/svm/vmcb.c                 |  1 +
 xen/arch/x86/spec_ctrl.c                    | 44 +++++++++++-------
 xen/include/asm-x86/cpufeature.h            |  5 +++
 xen/include/asm-x86/hvm/svm/svm.h           |  2 +
 xen/include/asm-x86/hvm/svm/vmcb.h          |  4 +-
 xen/include/asm-x86/msr-index.h             |  3 ++
 xen/include/public/arch-x86/cpufeatureset.h | 10 +++++
 13 files changed, 122 insertions(+), 46 deletions(-)

-- 
2.11.0


