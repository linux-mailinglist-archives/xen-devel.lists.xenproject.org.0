Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3BA2D93BA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 08:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51922.90833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koiiS-00085T-Ux; Mon, 14 Dec 2020 07:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51922.90833; Mon, 14 Dec 2020 07:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koiiS-000854-RX; Mon, 14 Dec 2020 07:56:20 +0000
Received: by outflank-mailman (input) for mailman id 51922;
 Mon, 14 Dec 2020 07:56:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XC/h=FS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1koiiR-00084u-39
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 07:56:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04d04060-3d0f-4ddf-96bd-56a524aa508e;
 Mon, 14 Dec 2020 07:56:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41D90AC10;
 Mon, 14 Dec 2020 07:56:17 +0000 (UTC)
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
X-Inumbo-ID: 04d04060-3d0f-4ddf-96bd-56a524aa508e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607932577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=M+3a3E8bow1XpCbEoYeJd2DUDpP7T6AQXwF6GP582zA=;
	b=Qvs2RwsUE39y6vI3cPpHrlaAursFOniDfvKEMCna0UL/iCcmwyCplpS+cx3+5LKjJ876+2
	A6WWSKDSyHk/Rw2emh1aLL9gcUNbrus7SsPqGyt2sUOFJD/XPazuCjqyK2AUdR2LxgB9I3
	15lk7CxfG0dd+FvqUc5wJ6Oyc6931aA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/3] xen: add support for automatic debug key actions in case of crash
Date: Mon, 14 Dec 2020 08:56:12 +0100
Message-Id: <20201214075615.25038-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the host crashes it would sometimes be nice to have additional
debug data available which could be produced via debug keys, but
halting the server for manual intervention might be impossible due to
the need to reboot/kexec rather sooner than later.

Add support for automatic debug key actions in case of crashes which
can be activated via boot- or runtime-parameter.

Changes in V4:
- addressed comments (now patch 3)
- added patches 1 and 2

Some further remarks to the new patches added:

Patch 1 adds Arm support for run_in_exception_handler(). Constructing
the related bug_frame is unfortunately not as easy as on x86.

I have verified that %c in inline assembly isn't supported by gcc 7 for
arm64, so this was the only way I've found to support this feature. In
theory it might be possible to add a variable referencing the called
function and to discard that variable again when linking, but I'd like
to add this more intrusive modification only if really wanted.

There is more potential for unifying struct bug_frame between x86 and
Arm, either by:
- using the Arm layout on x86, too (resulting in a grow of the bugframe
  data for the cases without messages)
- trying to construct the data in C instead of inline assembly, which
  will need to either keep the x86 assembler BUG_FRAME construction, or
  to add a few functions issuing the ASSERT/BUG/WARN which would then
  need to be called from *.S files.

Patch 2 opens up more potential for simplification: in theory there is
no need any more to call any key handler with the regs parameter,
allowing to use the same prototype for all handlers. The downside would
be to have an additional irq frame on the stack for the dump_registers()
and the do_debug_key() handlers. In case this is acceptable I'd be
happy to send a related cleanup patch.

Juergen Gross (3):
  xen/arm: add support for run_in_exception_handler()
  xen: enable keyhandlers to work without register set specified
  xen: add support for automatic debug key actions in case of crash

 docs/misc/xen-command-line.pandoc | 41 +++++++++++++++++
 xen/arch/arm/traps.c              | 10 ++++-
 xen/common/kexec.c                |  8 ++--
 xen/common/keyhandler.c           | 73 +++++++++++++++++++++++++++++--
 xen/common/shutdown.c             |  4 +-
 xen/drivers/char/console.c        |  2 +-
 xen/drivers/char/ns16550.c        |  3 +-
 xen/include/asm-arm/bug.h         | 32 +++++++++-----
 xen/include/xen/kexec.h           | 10 ++++-
 xen/include/xen/keyhandler.h      | 10 +++++
 10 files changed, 169 insertions(+), 24 deletions(-)

-- 
2.26.2


