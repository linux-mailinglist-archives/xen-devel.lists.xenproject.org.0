Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDEE1F7B2F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjm3M-0006Jq-7X; Fri, 12 Jun 2020 15:57:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jjm3K-0006Jl-So
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:57:10 +0000
X-Inumbo-ID: 5f263faa-acc5-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f263faa-acc5-11ea-8496-bc764e2007e4;
 Fri, 12 Jun 2020 15:57:09 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 58hdpE5aYZQjUD+5z9VoYZhC8pEqoSGKdGRLfyrT+78DJpdDA/b5egTOJABc0bvneZ0ZAXaD1B
 nBi9vti3dzA3uLu2Q7Sl4AS7dUkyGZrH2dZ5pcT3O+pikLuC3MUauY9cX/nijCB+EzUPztOnRh
 X9ZbAOt9p8vgwEaUUO1W0iUpTb5yHMPUorHMwZzOxgKNoBNbm//G9N6s8HMItz/j2ZFKrJQida
 2aVgKonMUkjI1PxQ2WuJgpepOn+8II5MA+Buy8tX69titjRi4ZcyVGmy1fYGkLR8VAIMfO/kIB
 NBI=
X-SBRS: 2.7
X-MesageID: 20265876
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20265876"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 0/8] x86/vpt: fixes for vpt and enable vPIT for PVH
 dom0
Date: Fri, 12 Jun 2020 17:56:32 +0200
Message-ID: <20200612155640.4101-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

The first 6 patches on this series are fixes for HVM virtual timers or
for the handling of the emulated PIT. I think they are all candidates
for 4.14 since without those PIT is not usable (and likely other
emulated timers will also experience issues) unless the OS happens to
make a very specific use of it, ie: timers must be configured from vCPU
0 and the destination must also be set to vCPU 0. FreeBSD for example
doesn't follow such rules, as it will usually configure PIT timers from
vCPU 0 and the destination will be set to a random vCPU in the system,
and as a result gets a non functional PIT.

Patches 7 and 8 enable the usage of the emulated vPIT for PVH dom0,
which is said to be required for certain video BIOS. As I mostly test
PVH dom0 on headless systems I'm not able to assert how common this is,
but given that it's already enabled for a classic PV dom0 let's try to
not regress and also provide a working PIT for PVH dom0.

I think the whole batch is also a candidate for backporting.

Thanks, Roger.

Roger Pau Monne (8):
  x86/hvm: fix vIO-APIC build without IRQ0_SPECIAL_ROUTING
  x86/hvm: don't force vCPU 0 for IRQ 0 when using fixed destination
    mode
  x86/hvm: fix ISA IRQ 0 handling when set as lowest priority mode in IO
    APIC
  x86/vpt: only try to resume timers belonging to enabled devices
  x86/hvm: only translate ISA interrupts to GSIs in virtual timers
  x86/vpt: fix injection to remote vCPU
  x86/hvm: add hardware domain support to hvm_isa_irq_to_gsi
  x86/hvm: enable emulated PIT for PVH dom0

 xen/arch/x86/domain.c         |   5 +-
 xen/arch/x86/emul-i8254.c     |  12 +++-
 xen/arch/x86/hvm/irq.c        |  20 ++++++-
 xen/arch/x86/hvm/vioapic.c    |  47 +++++++---------
 xen/arch/x86/hvm/vpic.c       |   7 ++-
 xen/arch/x86/hvm/vpt.c        | 102 ++++++++++++++++++----------------
 xen/arch/x86/io_apic.c        |  16 +++---
 xen/include/asm-x86/hvm/irq.h |   2 +-
 xen/include/asm-x86/io_apic.h |   3 +
 9 files changed, 121 insertions(+), 93 deletions(-)

-- 
2.26.2


