Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F421E1C2105
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 00:59:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUecs-00083b-Md; Fri, 01 May 2020 22:59:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUecr-00082n-4H
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 22:59:21 +0000
X-Inumbo-ID: 5cf85420-8bff-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cf85420-8bff-11ea-ae69-bc764e2007e4;
 Fri, 01 May 2020 22:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588373948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gDqmpBaBuFtcNPsY5Y83vtQt6FtCDBM6ODRWWUkB7Wo=;
 b=Tv0lhi3k/l1WKgwwMevpenyJaZiXE5d/s5JPp1EflcHKkfquzlW2lTDk
 4l+6JycZ1EzRzbKNjQ8ML2MD0BIaQoJWuaufKLndS/1yA5hCCVDhBWb4Q
 jHUUoTITvB0kI5sZxMKSioGZKw6nKfLyQwGlZZVZVipMge/krzE+hPwkI E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tvG01VWEhW9lEFXuYuSyuiQfsPHtPwE54KCT0FZT3ZQyrETbooExtlWNlIk+4j9NJ3pKOEm75Q
 b+x+EVLcXMtWpDKddHDvArnH8eIcgctc+pYmuZ8TqWNIRxrmeFL9W70A2t42ehsVoQ6CQoOt/V
 83Jgdw1iHZ4S7hCaYmL5XCCzVNDkTlPXvE6cUoeTo1eHWK8GF4abRoi4yzrYRrpgimmFNQvGIx
 lAJ10SqevCFFx0nt3KE9hptBvQdCVuC4g1p6LoktErRxOAQqLqJ0m0czbOJ99siyvkFBRkwvxx
 NbE=
X-SBRS: 2.7
X-MesageID: 16854947
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16854947"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 00/16] x86: Support for CET Supervisor Shadow Stacks
Date: Fri, 1 May 2020 23:58:22 +0100
Message-ID: <20200501225838.9866-1-andrew.cooper3@citrix.com>
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

You'll need a CET-capable toolchain (Binutils 2.32 and later), but no specific
compiler support required.

CET-SS makes PV32 unusable, so using shadow stacks prevents the use of 32bit
PV guests.  Compatibilty can be obtained using PV Shim

Andrew Cooper (16):
  x86/traps: Drop last_extable_addr
  x86/traps: Clean up printing in do_reserved_trap()/fatal_trap()
  x86/traps: Factor out exception_fixup() and make printing consistent
  x86/smpboot: Write the top-of-stack block in cpu_smpboot_alloc()
  x86/shstk: Introduce Supervisor Shadow Stack support
  x86/traps: Implement #CP handler and extend #PF for shadow stacks
  x86/shstk: Re-layout the stack block for shadow stacks
  x86/shstk: Create shadow stacks
  x86/cpu: Adjust enable_nmis() to be shadow stack compatible
  x86/cpu: Adjust reset_stack_and_jump() to be shadow stack compatible
  x86/spec-ctrl: Adjust DO_OVERWRITE_RSB to be shadow stack compatible
  x86/extable: Adjust extable handling to be shadow stack compatible
  x86/ioemul: Rewrite stub generation to be shadow stack compatible
  x86/alt: Adjust _alternative_instructions() to not create shadow stacks
  x86/entry: Adjust guest paths to be shadow stack compatible
  x86/shstk: Activate Supervisor Shadow Stacks

 xen/arch/x86/Kconfig                |  17 +++
 xen/arch/x86/acpi/wakeup_prot.S     |  56 ++++++++++
 xen/arch/x86/alternative.c          |  14 +++
 xen/arch/x86/boot/x86_64.S          |  30 +++++-
 xen/arch/x86/cpu/common.c           |  34 +++++-
 xen/arch/x86/crash.c                |   7 ++
 xen/arch/x86/ioport_emulate.c       |  11 +-
 xen/arch/x86/mm.c                   |  41 ++++---
 xen/arch/x86/pv/emul-priv-op.c      |  91 ++++++++++++----
 xen/arch/x86/pv/gpr_switch.S        |  37 ++-----
 xen/arch/x86/setup.c                |  56 ++++++++++
 xen/arch/x86/smpboot.c              |  10 +-
 xen/arch/x86/spec_ctrl.c            |   8 ++
 xen/arch/x86/traps.c                | 206 ++++++++++++++++++++++--------------
 xen/arch/x86/x86_64/compat/entry.S  |   2 +-
 xen/arch/x86/x86_64/entry.S         |  39 ++++++-
 xen/include/asm-x86/cpufeature.h    |   1 +
 xen/include/asm-x86/cpufeatures.h   |   1 +
 xen/include/asm-x86/current.h       |  59 ++++++++---
 xen/include/asm-x86/io.h            |   3 +-
 xen/include/asm-x86/mm.h            |   1 -
 xen/include/asm-x86/msr-index.h     |   3 +
 xen/include/asm-x86/page.h          |   1 +
 xen/include/asm-x86/processor.h     |  60 +++++++----
 xen/include/asm-x86/spec_ctrl_asm.h |  16 ++-
 xen/include/asm-x86/x86-defns.h     |  36 +++++++
 xen/include/asm-x86/x86_64/page.h   |   1 +
 xen/scripts/Kconfig.include         |   4 +
 28 files changed, 640 insertions(+), 205 deletions(-)

-- 
2.11.0


