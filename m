Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28832F8CD1
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 11:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68966.123625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0iu0-0005vg-3T; Sat, 16 Jan 2021 10:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68966.123625; Sat, 16 Jan 2021 10:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0itz-0005uV-TR; Sat, 16 Jan 2021 10:33:51 +0000
Received: by outflank-mailman (input) for mailman id 68966;
 Sat, 16 Jan 2021 10:33:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=czoR=GT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0ity-0005tA-9F
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 10:33:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26c9f7aa-1ad3-4f8c-badf-f8e799106bb8;
 Sat, 16 Jan 2021 10:33:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DB54ACAD;
 Sat, 16 Jan 2021 10:33:42 +0000 (UTC)
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
X-Inumbo-ID: 26c9f7aa-1ad3-4f8c-badf-f8e799106bb8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610793222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZkrkKRYbRbGujP+a/VqDWTW7SF+5zTeIlTsIcgVlzuw=;
	b=pNiJkh+6r2/R16dVSomGLR0TUhgsJi2mvGUVxkayLjU7bWQC9wa+5Hls7NfCg6KEoqJCsx
	u7XFgRomVIKP2BNYT7tFFrTgajyPQGgpoftZkUjp/aOBWh8WPixUuGiANpCRF/UfsYNujD
	p9xljcTxXW1MdSmdCulNDpCdOYFluKA=
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
Subject: [PATCH v6 0/3] xen: add support for automatic debug key actions in case of crash
Date: Sat, 16 Jan 2021 11:33:36 +0100
Message-Id: <20210116103339.21708-1-jgross@suse.com>
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

Changes in V5:
- better bug frame construction on Arm (patch 1)
- addressed comments

Changes in V6:
- rework of patch 1 due to Arm 32-bit problems

Juergen Gross (3):
  xen/arm: add support for run_in_exception_handler()
  xen: enable keyhandlers to work without register set specified
  xen: add support for automatic debug key actions in case of crash

 docs/misc/xen-command-line.pandoc | 41 ++++++++++++++++++
 xen/arch/arm/traps.c              |  8 ++++
 xen/arch/arm/xen.lds.S            |  2 +
 xen/common/kexec.c                |  8 ++--
 xen/common/keyhandler.c           | 72 +++++++++++++++++++++++++++++--
 xen/common/shutdown.c             |  4 +-
 xen/common/virtual_region.c       |  2 -
 xen/drivers/char/console.c        |  2 +-
 xen/include/asm-arm/arm32/bug.h   |  2 +
 xen/include/asm-arm/arm64/bug.h   |  2 +
 xen/include/asm-arm/bug.h         | 31 ++++++++++---
 xen/include/xen/kexec.h           | 10 ++++-
 xen/include/xen/keyhandler.h      | 10 +++++
 13 files changed, 175 insertions(+), 19 deletions(-)

-- 
2.26.2


