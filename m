Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60EF1E4E09
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1aS-0004AE-25; Wed, 27 May 2020 19:19:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1aP-00048o-Ps
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:19:33 +0000
X-Inumbo-ID: f367e02a-a04e-11ea-9dbe-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f367e02a-a04e-11ea-9dbe-bc764e2007e4;
 Wed, 27 May 2020 19:19:14 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ljXFLm6vJNGuhH71VFga8ld5yUtQeikwNp2tlkhaq8oVuyij+A1TdxM7HaHaOeTzmRI0VV0Zng
 HPQ13O3QjuMhFyqsliSE9jkK/Ce6AvmjGeUJepoaWmrpp4JfUzKmXdGJkbqvc7Q7Jhdx9do5UB
 emcVV+uXPT4q3xgZ/xY8QjEMkUBayoYw1RdyT4cZ0tF3ltQDIcv9MUiKnqtvjlD3kq+MfHX42g
 MxgWRqulkEy6NI10dLzawMQC/ucVuUk/qbDFYjDht43OowdxWcaRE8p1ZcoNWlWNu0QNRjafMQ
 3ac=
X-SBRS: 2.7
X-MesageID: 19333919
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="19333919"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 00/14] x86: Support for CET Supervisor Shadow Stacks
Date: Wed, 27 May 2020 20:18:33 +0100
Message-ID: <20200527191847.17207-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This series implements Shadow Stack support for Xen to use.

You'll need a CET-capable toolchain (Binutils >= 2.29 or LLVM >= 7), but no
specific compiler support required.

CET-SS makes PV32 unusable, so using shadow stacks prevents the use of 32bit
PV guests.  Compatibilty can be obtained using PV Shim.

See patches for individual changes.

Andrew Cooper (14):
  x86/traps: Clean up printing in {do_reserved,fatal}_trap()
  x86/traps: Factor out extable_fixup() and make printing consistent
  x86/shstk: Introduce Supervisor Shadow Stack support
  x86/traps: Implement #CP handler and extend #PF for shadow stacks
  x86/shstk: Re-layout the stack block for shadow stacks
  x86/shstk: Create shadow stacks
  x86/cpu: Adjust enable_nmis() to be shadow stack compatible
  x86/cpu: Adjust reset_stack_and_jump() to be shadow stack compatible
  x86/spec-ctrl: Adjust DO_OVERWRITE_RSB to be shadow stack compatible
  x86/extable: Adjust extable handling to be shadow stack compatible
  x86/alt: Adjust _alternative_instructions() to not create shadow stacks
  x86/entry: Adjust guest paths to be shadow stack compatible
  x86/S3: Save and restore Shadow Stack configuration
  x86/shstk: Activate Supervisor Shadow Stacks

 docs/misc/xen-command-line.pandoc   |  25 ++++
 xen/arch/x86/Kconfig                |  18 +++
 xen/arch/x86/acpi/wakeup_prot.S     |  58 +++++++++
 xen/arch/x86/alternative.c          |  14 +++
 xen/arch/x86/boot/x86_64.S          |  35 +++++-
 xen/arch/x86/cpu/common.c           |  39 +++++-
 xen/arch/x86/crash.c                |   7 ++
 xen/arch/x86/mm.c                   |  46 ++++---
 xen/arch/x86/setup.c                |  56 +++++++++
 xen/arch/x86/smpboot.c              |   3 +-
 xen/arch/x86/spec_ctrl.c            |   8 ++
 xen/arch/x86/traps.c                | 239 ++++++++++++++++++++++++++----------
 xen/arch/x86/x86_64/compat/entry.S  |   1 +
 xen/arch/x86/x86_64/entry.S         |  50 +++++++-
 xen/include/asm-x86/asm_defns.h     |   8 +-
 xen/include/asm-x86/config.h        |   5 +
 xen/include/asm-x86/cpufeature.h    |   1 +
 xen/include/asm-x86/cpufeatures.h   |   1 +
 xen/include/asm-x86/current.h       |  60 +++++++--
 xen/include/asm-x86/mm.h            |   1 -
 xen/include/asm-x86/msr-index.h     |   3 +
 xen/include/asm-x86/page.h          |   1 +
 xen/include/asm-x86/processor.h     |  60 ++++++---
 xen/include/asm-x86/spec_ctrl_asm.h |  16 ++-
 xen/include/asm-x86/x86-defns.h     |  35 ++++++
 xen/include/asm-x86/x86_64/page.h   |   1 +
 xen/scripts/Kconfig.include         |   4 +
 27 files changed, 664 insertions(+), 131 deletions(-)

-- 
2.11.0


