Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC5A193BD3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:28:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOmA-0007JK-0R; Thu, 26 Mar 2020 09:26:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RX0V=5L=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jHOm7-0007J1-Rx
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:26:07 +0000
X-Inumbo-ID: d217598c-6f43-11ea-8783-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d217598c-6f43-11ea-8783-12813bfff9fa;
 Thu, 26 Mar 2020 09:26:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6AE8AC5F;
 Thu, 26 Mar 2020 09:26:05 +0000 (UTC)
From: Miroslav Benes <mbenes@suse.cz>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 jpoimboe@redhat.com
Date: Thu, 26 Mar 2020 10:26:01 +0100
Message-Id: <20200326092603.7230-1-mbenes@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v3 0/2] x86/xen: Make idle tasks reliable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: andrew.cooper3@citrix.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 jbeulich@suse.com, live-patching@vger.kernel.org,
 xen-devel@lists.xenproject.org, Miroslav Benes <mbenes@suse.cz>,
 jslaby@suse.cz
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The unwinder reports idle tasks' stack on XEN PV as unreliable which
complicates things for at least live patching. The two patches in the
series try to amend that by using similar approach as non-XEN x86 does.

v2->v3:
- change prototype of asm_cpu_bringup_and_idle()
- replace %_ASM_SP with %rsp and %esp respectively
- fix build for !CONFIG_XEN_PV_SMP

v1->v2:
- call instruction used instead of push+jmp
- initial_stack used directly

v1 https://lore.kernel.org/live-patching/20200312142007.11488-1-mbenes@suse.cz/
v2 https://lore.kernel.org/live-patching/20200319095606.23627-1-mbenes@suse.cz/

Miroslav Benes (2):
  x86/xen: Make the boot CPU idle task reliable
  x86/xen: Make the secondary CPU idle tasks reliable

 arch/x86/xen/smp_pv.c   |  3 ++-
 arch/x86/xen/xen-head.S | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.25.1


