Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB2E441D49
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219240.379939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ6l-0008Gp-Uk; Mon, 01 Nov 2021 15:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219240.379939; Mon, 01 Nov 2021 15:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ6l-0008DM-QE; Mon, 01 Nov 2021 15:20:23 +0000
Received: by outflank-mailman (input) for mailman id 219240;
 Mon, 01 Nov 2021 15:20:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ6j-0008DB-RS
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:21 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38ddb02b-3b27-11ec-8548-12813bfff9fa;
 Mon, 01 Nov 2021 15:20:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3004221952;
 Mon,  1 Nov 2021 15:20:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6DC813A4A;
 Mon,  1 Nov 2021 15:20:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id H99AM7IFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:18 +0000
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
X-Inumbo-ID: 38ddb02b-3b27-11ec-8548-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pc+ZDZ5m0F/zaKgmtGogr6rujd2Fm5UVHDOoHCAIoLs=;
	b=RYS3UsBWsFyr/NTMTJzjf408htvB8kTYf6IkUNJkY14s1JOyE6S2qq1W68tLJeMF8wNnoV
	UByY3Xcq1N7pWLtpnThPUxGYHWLgjhhfcfrDC9E12WihsTvyMJZyeXPeBC+eNS6mpaXMRZ
	afjX20aoPvGXA3a3BfekKBfaAE/XgIM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v2 00/15] xen: drop hypercall function tables
Date: Mon,  1 Nov 2021 16:20:00 +0100
Message-Id: <20211101152015.28488-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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

Juergen Gross (15):
  xen: limit number of hypercall parameters to 5
  xen: move do_vcpu_op() to arch specific code
  xen: harmonize return types of hypercall handlers
  xen/x86: modify hvm_memory_op() prototype
  xen: don't include asm/hypercall.h from C sources
  add .gitignore entries for *.[is] below xen
  xen: generate hypercall interface related code
  xen: use generated prototypes for hypercall handlers
  x86/pv-shim: don't modify hypercall table
  xen/x86: don't use hypercall table for calling compat hypercalls
  xen/x86: call hypercall handlers via generated macro
  xen/arm: call hypercall handlers via generated macro
  xen/x86: add hypercall performance counters for hvm, correct pv
  xen: drop calls_to_multicall performance counter
  tools/xenperf: update hypercall names

 .gitignore                               |   5 +-
 tools/misc/xenperf.c                     |   5 +
 xen/Makefile                             |  10 +
 xen/arch/arm/domain.c                    |  15 +-
 xen/arch/arm/hvm.c                       |   3 +-
 xen/arch/arm/physdev.c                   |   2 +-
 xen/arch/arm/platform_hypercall.c        |   1 +
 xen/arch/arm/traps.c                     | 124 ++-------
 xen/arch/x86/compat.c                    |  14 +-
 xen/arch/x86/cpu/vpmu.c                  |   1 +
 xen/arch/x86/domain.c                    |  11 +-
 xen/arch/x86/domctl.c                    |   4 +-
 xen/arch/x86/hvm/hypercall.c             | 176 ++-----------
 xen/arch/x86/hypercall.c                 |  59 -----
 xen/arch/x86/mm.c                        |   1 -
 xen/arch/x86/mm/paging.c                 |   3 +-
 xen/arch/x86/platform_hypercall.c        |   1 +
 xen/arch/x86/pv/callback.c               |  20 +-
 xen/arch/x86/pv/emul-priv-op.c           |   2 +-
 xen/arch/x86/pv/hypercall.c              | 192 ++------------
 xen/arch/x86/pv/iret.c                   |   5 +-
 xen/arch/x86/pv/misc-hypercalls.c        |  14 +-
 xen/arch/x86/pv/shim.c                   |  54 ++--
 xen/arch/x86/traps.c                     |   2 +-
 xen/arch/x86/x86_64/compat.c             |   1 -
 xen/arch/x86/x86_64/compat/mm.c          |   1 +
 xen/arch/x86/x86_64/domain.c             |  16 +-
 xen/arch/x86/x86_64/mm.c                 |   2 -
 xen/arch/x86/x86_64/platform_hypercall.c |   3 +-
 xen/common/argo.c                        |  12 +-
 xen/common/compat/domain.c               |  14 +-
 xen/common/compat/grant_table.c          |   1 +
 xen/common/compat/multicall.c            |   2 +-
 xen/common/domain.c                      |  11 +-
 xen/common/event_channel.c               |  10 +
 xen/common/grant_table.c                 |  10 +
 xen/common/kexec.c                       |   6 +-
 xen/common/multicall.c                   |   2 +-
 xen/common/trace.c                       |   2 +-
 xen/include/asm-arm/hypercall.h          |   7 +-
 xen/include/asm-x86/hypercall.h          | 204 ++++-----------
 xen/include/asm-x86/paging.h             |   3 -
 xen/include/asm-x86/pv/shim.h            |   3 +
 xen/include/hypercall-defs.c             | 285 +++++++++++++++++++++
 xen/include/xen/hypercall.h              | 181 +-------------
 xen/include/xen/perfc_defn.h             |   1 -
 xen/scripts/gen_hypercall.awk            | 306 +++++++++++++++++++++++
 47 files changed, 870 insertions(+), 937 deletions(-)
 create mode 100644 xen/include/hypercall-defs.c
 create mode 100644 xen/scripts/gen_hypercall.awk

-- 
2.26.2


