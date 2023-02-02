Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62209687B90
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488659.756837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSC-0002uU-Bi; Thu, 02 Feb 2023 11:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488659.756837; Thu, 02 Feb 2023 11:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSC-0002sj-89; Thu, 02 Feb 2023 11:08:32 +0000
Received: by outflank-mailman (input) for mailman id 488659;
 Thu, 02 Feb 2023 11:08:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BK1=56=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pNXSB-0002sX-AQ
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:08:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id eb3fd583-a2e9-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 12:08:28 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60140C14;
 Thu,  2 Feb 2023 03:09:09 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 046C93F64C;
 Thu,  2 Feb 2023 03:08:24 -0800 (PST)
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
X-Inumbo-ID: eb3fd583-a2e9-11ed-b63b-5f92e7d2e73a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 00/10] SVE feature for arm guests
Date: Thu,  2 Feb 2023 11:08:06 +0000
Message-Id: <20230202110816.1252419-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie is introducing the possibility for Dom0 and DomU guests to use
sve/sve2 instructions.

SVE feature introduces new instruction and registers to improve performances on
floating point operations.

The SVE feature is advertised using the ID_AA64PFR0_EL1 register, SVE field, and
when available the ID_AA64ZFR0_EL1 register provides additional information
about the implemented version and other SVE feature.

New registers added by the SVE feature are Z0-Z31, P0-P15, FFR, ZCR_ELx.

Z0-Z31 are scalable vector register whose size is implementation defined and
goes from 128 bits to maximum 2048, the term vector length will be used to refer
to this quantity.
P0-P15 are predicate registers and the size is the vector length divided by 8,
same size is the FFR (First Fault Register).
ZCR_ELx is a register that can control and restrict the maximum vector length
used by the <x> exception level and all the lower exception levels, so for
example EL3 can restrict the vector length usable by EL3,2,1,0.

The platform has a maximum implemented vector length, so for every value
written in ZCR register, if this value is above the implemented length, then the
lower value will be used. The RDVL instruction can be used to check what vector
length is the HW using after setting ZCR.

For an SVE guest, the V0-V31 registers are part of the Z0-Z31, so there is no
need to save them separately, saving Z0-Z31 will save implicitly also V0-V31.

SVE usage can be trapped using a flag in CPTR_EL2, hence in this serie the
register is added to the domain state, to be able to trap only the guests that
are not allowed to use SVE.

This serie is introducing a command line parameter to enable Dom0 to use SVE and
to set its maximum vector length that by default is 0 which means the guest is
not allowed to use SVE. Values from 128 to 2048 mean the guest can use SVE with
the selected value used as maximum allowed vector length (which could be lower
if the implemented one is lower).
For DomUs, an XL parameter with the same way of use is introduced and a dom0less
DTB binding is created.

The context switch is the most critical part because there can be big registers
to be saved, in this serie an easy approach is used and the context is
saved/restored every time for the guests that are allowed to use SVE.

Luca Fancellu (10):
  xen/arm: enable SVE extension for Xen
  xen/arm: add sve_vl_bits field to domain
  xen/arm: Expose SVE feature to the guest
  xen/arm: add SVE exception class handling
  arm/sve: save/restore SVE context switch
  xen/arm: enable Dom0 to use SVE feature
  xen/physinfo: add arm SVE arch capability and vector length
  tools: add SVE capability and SVE vector length for physinfo
  xen/tools: add sve parameter in XL configuration
  xen/arm: add sve property for dom0less domUs

 docs/man/xl.cfg.5.pod.in                 |  11 ++
 docs/misc/arm/device-tree/booting.txt    |   9 ++
 docs/misc/xen-command-line.pandoc        |  13 ++
 tools/golang/xenlight/helpers.gen.go     |   6 +
 tools/golang/xenlight/types.gen.go       |   3 +
 tools/include/libxl.h                    |  13 ++
 tools/libs/light/libxl.c                 |   3 +
 tools/libs/light/libxl_arm.c             |   2 +
 tools/libs/light/libxl_types.idl         |   3 +
 tools/ocaml/libs/xc/xenctrl.ml           |   4 +-
 tools/ocaml/libs/xc/xenctrl.mli          |   4 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c      |  17 +-
 tools/python/xen/lowlevel/xc/xc.c        |  17 +-
 tools/xl/xl_info.c                       |  10 ++
 tools/xl/xl_parse.c                      |  22 ++-
 xen/arch/arm/Kconfig                     |  10 +-
 xen/arch/arm/arm64/Makefile              |   1 +
 xen/arch/arm/arm64/cpufeature.c          |   7 +-
 xen/arch/arm/arm64/sve.c                 | 118 ++++++++++++++
 xen/arch/arm/arm64/sve_asm.S             | 189 +++++++++++++++++++++++
 xen/arch/arm/arm64/vfp.c                 |  79 ++++++----
 xen/arch/arm/arm64/vsysreg.c             |  39 ++++-
 xen/arch/arm/cpufeature.c                |   6 +-
 xen/arch/arm/domain.c                    |  48 +++++-
 xen/arch/arm/domain_build.c              |  11 ++
 xen/arch/arm/include/asm/arm64/sve.h     |  72 +++++++++
 xen/arch/arm/include/asm/arm64/sysregs.h |   4 +
 xen/arch/arm/include/asm/arm64/vfp.h     |  10 ++
 xen/arch/arm/include/asm/cpufeature.h    |  14 ++
 xen/arch/arm/include/asm/domain.h        |   8 +
 xen/arch/arm/include/asm/processor.h     |   3 +
 xen/arch/arm/setup.c                     |   5 +-
 xen/arch/arm/sysctl.c                    |   7 +
 xen/arch/arm/traps.c                     |  40 +++--
 xen/include/public/arch-arm.h            |   3 +
 xen/include/public/domctl.h              |   2 +-
 xen/include/public/sysctl.h              |  11 +-
 37 files changed, 751 insertions(+), 73 deletions(-)
 create mode 100644 xen/arch/arm/arm64/sve.c
 create mode 100644 xen/arch/arm/arm64/sve_asm.S
 create mode 100644 xen/arch/arm/include/asm/arm64/sve.h

-- 
2.25.1


