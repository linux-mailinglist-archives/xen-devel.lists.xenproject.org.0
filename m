Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75394D41E0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 08:34:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288150.488612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDJb-0000c7-Nc; Thu, 10 Mar 2022 07:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288150.488612; Thu, 10 Mar 2022 07:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDJb-0000Zm-I3; Thu, 10 Mar 2022 07:34:27 +0000
Received: by outflank-mailman (input) for mailman id 288150;
 Thu, 10 Mar 2022 07:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHx9=TV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nSDJa-0000ZP-7B
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 07:34:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 802a1181-a044-11ec-8539-5f4723681683;
 Thu, 10 Mar 2022 08:34:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7A09E1F381;
 Thu, 10 Mar 2022 07:34:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18F2913FA3;
 Thu, 10 Mar 2022 07:34:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qi80BACqKWIkIAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 10 Mar 2022 07:34:24 +0000
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
X-Inumbo-ID: 802a1181-a044-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646897664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VW0S7DOLYYudVpiuotx3ct2mnfrTAcmlNP9qLbkTpQk=;
	b=pyzIy+dXZ6ehQV3VomECVrN5ky7eAhoAvzw028GJz+HKEhpwG1iYqzrO3fpLmEONgQgfog
	PFQ84nuwwnY4DQb9CoHu90sQtz6Mjv+3eXyA+9RQllxS8YQtJA7mvPFzMQ/NyuIYSvcy8j
	1xDOkPbfsgT7R795lJEX/qa60Bo1vJc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 00/11] xen: drop hypercall function tables
Date: Thu, 10 Mar 2022 08:34:09 +0100
Message-Id: <20220310073420.15622-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to avoid indirect function calls on the hypercall path as
much as possible this series is removing the hypercall function tables
and is replacing the hypercall handler calls via the function array
by automatically generated call macros.

Another by-product of generating the call macros is the automatic
generating of the hypercall handler prototypes from the same data base
which is used to generate the macros.

This has the additional advantage of using type safe calls of the
handlers and to ensure related handler (e.g. PV and HVM ones) share
the same prototypes.

A very brief performance test (parallel build of the Xen hypervisor
in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
the performance with the patches applied. The test was performed using
a PV and a PVH guest.

Changes in V2:
- new patches 6, 14, 15
- patch 7: support hypercall priorities for faster code
- comments addressed

Changes in V3:
- patches 1 and 4 removed as already applied
- comments addressed

Changes in V4:
- 5 patches removed al already applied
- new patches 1, 3 and 11
- avoid switching Arm hypercall handlers to return long (no change of
  handlers returning long already)

Juergen Gross (11):
  xen/arm: rename do_phydev_op() to do_arm_physdev_op()
  xen: move do_vcpu_op() to arch specific code
  xen: switch non style compliant hypercall handler parameter types
  xen: harmonize return types of hypercall handlers
  xen: don't include asm/hypercall.h from C sources
  xen: include compat/platform.h from hypercall.h
  xen: generate hypercall interface related code
  xen: use generated prototypes for hypercall handlers
  xen/x86: call hypercall handlers via generated macro
  xen/arm: call hypercall handlers via generated macro
  xen/x86: remove cf_check attribute from hypercall handlers

 .gitignore                               |   1 +
 xen/arch/arm/domain.c                    |  15 +-
 xen/arch/arm/hvm.c                       |   3 +-
 xen/arch/arm/include/asm/hypercall.h     |   7 +-
 xen/arch/arm/physdev.c                   |   2 +-
 xen/arch/arm/platform_hypercall.c        |   1 +
 xen/arch/arm/traps.c                     | 124 ++-------
 xen/arch/x86/compat.c                    |   6 +-
 xen/arch/x86/cpu/mcheck/mce.c            |   2 +-
 xen/arch/x86/cpu/vpmu.c                  |   3 +-
 xen/arch/x86/domain.c                    |  11 +-
 xen/arch/x86/domctl.c                    |   4 +-
 xen/arch/x86/hvm/dm.c                    |   2 +-
 xen/arch/x86/hvm/hvm.c                   |   2 +-
 xen/arch/x86/hvm/hypercall.c             | 177 ++-----------
 xen/arch/x86/hypercall.c                 |  59 -----
 xen/arch/x86/include/asm/hypercall.h     | 201 ++++-----------
 xen/arch/x86/include/asm/paging.h        |   3 -
 xen/arch/x86/mm.c                        |  13 +-
 xen/arch/x86/mm/paging.c                 |   3 +-
 xen/arch/x86/physdev.c                   |   2 +-
 xen/arch/x86/platform_hypercall.c        |   3 +-
 xen/arch/x86/pv/callback.c               |  26 +-
 xen/arch/x86/pv/descriptor-tables.c      |   8 +-
 xen/arch/x86/pv/emul-priv-op.c           |   2 +-
 xen/arch/x86/pv/hypercall.c              | 187 ++------------
 xen/arch/x86/pv/iret.c                   |   5 +-
 xen/arch/x86/pv/misc-hypercalls.c        |  22 +-
 xen/arch/x86/pv/shim.c                   |   4 +-
 xen/arch/x86/traps.c                     |   2 +-
 xen/arch/x86/x86_64/compat/mm.c          |   3 +-
 xen/arch/x86/x86_64/domain.c             |  16 +-
 xen/arch/x86/x86_64/mm.c                 |   2 -
 xen/arch/x86/x86_64/platform_hypercall.c |   3 +-
 xen/common/argo.c                        |   8 +-
 xen/common/compat/domain.c               |  15 +-
 xen/common/compat/grant_table.c          |   3 +-
 xen/common/compat/kernel.c               |   2 +-
 xen/common/compat/memory.c               |   3 +-
 xen/common/dm.c                          |   2 +-
 xen/common/domain.c                      |  14 +-
 xen/common/domctl.c                      |   2 +-
 xen/common/event_channel.c               |   3 +-
 xen/common/grant_table.c                 |   4 +-
 xen/common/hypfs.c                       |   2 +-
 xen/common/kernel.c                      |   2 +-
 xen/common/kexec.c                       |   6 +-
 xen/common/memory.c                      |   2 +-
 xen/common/multicall.c                   |   4 +-
 xen/common/sched/compat.c                |   2 +-
 xen/common/sched/core.c                  |   4 +-
 xen/common/sysctl.c                      |   2 +-
 xen/common/xenoprof.c                    |   2 +-
 xen/drivers/char/console.c               |   2 +-
 xen/include/Makefile                     |  13 +
 xen/include/hypercall-defs.c             | 285 ++++++++++++++++++++
 xen/include/xen/hypercall.h              | 185 +------------
 xen/scripts/gen_hypercall.awk            | 314 +++++++++++++++++++++++
 xen/xsm/xsm_core.c                       |   4 +-
 59 files changed, 865 insertions(+), 944 deletions(-)
 create mode 100644 xen/include/hypercall-defs.c
 create mode 100644 xen/scripts/gen_hypercall.awk

-- 
2.34.1


