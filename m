Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F446D788
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 16:56:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242354.419188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIi-0001O2-OG; Wed, 08 Dec 2021 15:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242354.419188; Wed, 08 Dec 2021 15:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIi-0001ME-Iw; Wed, 08 Dec 2021 15:56:12 +0000
Received: by outflank-mailman (input) for mailman id 242354;
 Wed, 08 Dec 2021 15:56:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muzIh-0001LM-66
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 15:56:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c89904e-583f-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 16:56:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C80A21FD3E;
 Wed,  8 Dec 2021 15:56:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7741C13C8E;
 Wed,  8 Dec 2021 15:56:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PW7OG5nVsGHIXwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 15:56:09 +0000
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
X-Inumbo-ID: 5c89904e-583f-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638978969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rQV7j0YW8AXR7oZuq5XEnisypq+N6I53xv0CTVE9+3M=;
	b=fiptY8MRyhZZUaImPizpJyybGwmsWQ+BlfeYSgYQ+HwpX+WLMq9CrLLjN82MSFczMNGUxu
	PJ6wIA7lA66VyB4gtQjL+dSj19kosRqmyU/n6Os9apeT9N6BmLU7WKadgW0jA5z6ymdd4u
	WsxH1rzcBfvFDHssuvwplK0w2zhL7ao=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v3 00/13] xen: drop hypercall function tables
Date: Wed,  8 Dec 2021 16:55:53 +0100
Message-Id: <20211208155606.20029-1-jgross@suse.com>
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

Changes in V3:
- patches 1 and 4 removed as already applied
- comments addressed

Juergen Gross (13):
  xen: move do_vcpu_op() to arch specific code
  xen: harmonize return types of hypercall handlers
  xen: don't include asm/hypercall.h from C sources
  xen: include compat/platform.h from hypercall.h
  xen: generate hypercall interface related code
  xen: use generated prototypes for hypercall handlers
  x86/pv-shim: don't modify hypercall table
  xen/x86: don't use hypercall table for calling compat hypercalls
  xen/x86: call hypercall handlers via generated macro
  xen/arm: call hypercall handlers via generated macro
  xen/x86: add hypercall performance counters for hvm, correct pv
  xen: drop calls_to_multicall performance counter
  tools/xenperf: update hypercall names

 .gitignore                               |   1 +
 tools/misc/xenperf.c                     |   5 +
 xen/arch/arm/domain.c                    |  15 +-
 xen/arch/arm/hvm.c                       |   3 +-
 xen/arch/arm/physdev.c                   |   2 +-
 xen/arch/arm/platform_hypercall.c        |   1 +
 xen/arch/arm/traps.c                     | 124 ++-------
 xen/arch/x86/compat.c                    |  14 +-
 xen/arch/x86/cpu/vpmu.c                  |   1 +
 xen/arch/x86/domain.c                    |  11 +-
 xen/arch/x86/domctl.c                    |   4 +-
 xen/arch/x86/hvm/hypercall.c             | 178 ++-----------
 xen/arch/x86/hypercall.c                 |  59 -----
 xen/arch/x86/mm.c                        |   1 -
 xen/arch/x86/mm/paging.c                 |   3 +-
 xen/arch/x86/platform_hypercall.c        |   1 +
 xen/arch/x86/pv/callback.c               |  20 +-
 xen/arch/x86/pv/emul-priv-op.c           |   2 +-
 xen/arch/x86/pv/hypercall.c              | 182 ++-----------
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
 xen/include/Makefile                     |  13 +
 xen/include/asm-arm/hypercall.h          |   7 +-
 xen/include/asm-x86/hypercall.h          | 205 ++++-----------
 xen/include/asm-x86/paging.h             |   3 -
 xen/include/asm-x86/pv/shim.h            |   3 +
 xen/include/hypercall-defs.c             | 280 ++++++++++++++++++++
 xen/include/xen/hypercall.h              | 184 +------------
 xen/include/xen/perfc_defn.h             |   1 -
 xen/scripts/gen_hypercall.awk            | 314 +++++++++++++++++++++++
 46 files changed, 874 insertions(+), 929 deletions(-)
 create mode 100644 xen/include/hypercall-defs.c
 create mode 100644 xen/scripts/gen_hypercall.awk

-- 
2.26.2


