Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OSsJuiL5mmZyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395C433B7A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286465.1567522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBI-0001qW-6R; Mon, 20 Apr 2026 20:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286465.1567522; Mon, 20 Apr 2026 20:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBH-0001nb-Sh; Mon, 20 Apr 2026 20:25:19 +0000
Received: by outflank-mailman (input) for mailman id 1286465;
 Mon, 20 Apr 2026 19:50:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEudt-0006FK-Mp
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEuds-004tZC-Kz
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68380-2eae-0a2a0a5409dd-0a2a4501a5ac-36
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:48 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68397-c1f2-0a2a45010019-22cac1c584b0-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:48 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:46 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=cQ3Kj18vTq+h+BnFJ531gezYODBGfokD+/LNu0kYWa16sn1xWZcfla/MM9fmKszMJiIqmmNTOzuqiSf4XwexfKtk19lamJ0H5B5JSrmrBux+Lxw9SqbJjry0lKcQWvCibE4GMH3pUvKUcN6Hi2qEfq/eNE5uAaGQvKeYGAWk9/OqbJIDMfNwjUIF3WGAhvNVsp8eeLUPo3GHb+3JjX7/Blug9TsSkxaI5s97x1To5/i+f/PpcCI1pA8ijcGMm8xAMcLSRXTpVvpiiMpj2rfwJjY37i/fci4qkiul5oB8iYiYPUBpi6IZF1E0PQPqDrsxD0YgNkfn/EgAVa4sqDjJug==; s=purelymail1; d=purelymail.com; v=1; bh=lNTQ4fq1EGY2M7SJPoOmAlK5TMMs/JCORxDPd0QwIXw=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [RFC PATCH v6 00/43] altp2m: Move altp2m routines to common code and add ARM support
Date: Mon, 20 Apr 2026 15:49:59 -0400
Message-Id: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-d62444/1776714648-B6A61FF4-907AD702/0/0
X-purgate-type: clean
X-purgate-size: 9570
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:tamas@tklengyel.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:rahul.singh@arm.com,m:julien.grall@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.795];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3395C433B7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

Hi all,

For the past few months, myself and Aqib Javid have been working to port
altp2m to ARM with support from Stewart Hildebrand and Stefano Stabellini.
At the recent Spring Xen Summit, Aqib and Stewart gave a presentation which
discussed the motivation behind this, along with an overview of the
rebasing and testing process. While this effort started as a rebase[1] of
the v5 patch series[2] by Sergej Proskurin and Tamas Lengyel, I have been
reworking the branch to make most of the altp2m code common between x86 and
ARM. This should address the major concerns that came up during review of
the original patch series. For a quick overview of altp2m functionality and
scope of the patch series, here's an excerpt from Sergej's cover letter:

> In this patch series, we provide an implementation of the altp2m
> subsystem for ARM. Our implementation is based on the altp2m subsystem fo=
r
> x86, providing additional --alternate-- views on the guest's physical
> memory by means of the ARM 2nd stage translation mechanism. The patches
> introduce new HVMOPs and extend the p2m subsystem. [...] To be more
> precise, altp2m allows to create and switch to additional p2m views (i.e.
> gfn to mfn mappings). These views can be manipulated and activated as wil=
l
> through the provided HVMOPs. In this way, the active guest instance in
> question can seamlessly proceed execution without noticing that anything
> has changed.

As of right now, I've reworked patch series up through the
HVMOP_altp2m_set_domain_state command and plan to continue implementing the
remaining altp2m features. I've continued the patch series versioning by
labeling my notes as v6, and the patch notes from v1-v5 have been preserved
where applicable. I am hoping for some feedback on the general approach
I've taken with this patch series, and I can incorporate any changes
requested into the actual patch series submission.

This is a pretty big patch series, so I've tried to make it as easy as
possible to follow. I've tried to minimize the number of changes in each
patch; there are quite a lot of patches so if it would be preferred to
combine some patches I can do so. Here is the general approach I used
throughout the patch series to turn x86 altp2m code into common altp2m
code with ARM support:

- Move function(s) from arch/x86/mm/altp2m.c to common/altp2m.c, gating
  declarations/definitions with #ifdef CONFIG_X86
- Add any additional features to ARM code needed to implement these
  functions
- Make any changes necessary to functions to support ARM, and remove #ifdef
  CONFIG_X86

This approach makes it possible to separate out code movement patches from
the actual changes needed to support ARM. Furthermore, each patch in the
patch series still compiles for both x86 and ARM.

Additionally, I've split the patch series into a number of "phases" to make
it easier to understand the context of each patch. Each patch description
indicates which phase it's a part of.
- Preparation (8 commits)
- Common do_altp2m_op (2 commits)
- get_domain_state (1 commit)
- altp2m_{init,teardown} routines (12 commits)
- altp2m_{get,set}_altp2m (4 commits)
  - Needed for altp2m_vcpu_{initialise,destroy}
- altp2m_vcpu_{initialise,destroy} (2 commits)
  - Needed for HVMOP_set_domain_state
- altp2m view visibility (5 commits)
  - Needed for altp2m_init_by_id, altp2m_flush
- altp2m_activate_altp2m (2 commits)
  - Needed for altp2m_init_by_id
- altp2m_init_by_id (2 commits)
  - Needed for HVMOP_altp2m_set_domain_state
- altp2m_reset_altp2m (2 commits)
  - Needed for altp2m_flush
- altp2m_flush (2 commits)
  - Needed for HVMOP_altp2m_set_domain_state
- set_domain_state (1 commit)

The code for this patch series can also be found on GitLab:
https://gitlab.com/xen-project/people/elektrobit/xen/-/tree/altp2m-arm-rewo=
rk-rfc

Best,
Rose Spangler

[1] Rebase of original patch series:
https://gitlab.com/xen-project/people/elektrobit/xen/-/commits/altp2m-arm-r=
ebase

[2] Original patch series:
v1: https://lore.kernel.org/xen-devel/20160704114605.10086-1-proskurin@sec.=
in.tum.de/
v2: https://lore.kernel.org/xen-devel/20160801171028.11615-1-proskurin@sec.=
in.tum.de/
v3: https://lore.kernel.org/xen-devel/20160816221714.22041-1-proskurin@sec.=
in.tum.de/
v4: https://lore.kernel.org/xen-devel/20170830183258.14612-1-proskurin@sec.=
in.tum.de/
v5 was never submitted to mailing list, but is available on GitHub:
https://github.com/sergej-proskurin/xen/tree/arm-altp2m-v5


Rose Spangler (38):
  altp2m: Add template common altp2m.c/altp2m.h
  altp2m: Move altp2m_active to common domain struct
  altp2m: Move altp2m_p2m to common domain struct
  x86/altp2m: Rename hvm_altp2m_supported to altp2m_supported
  altp2m: Move altp2m_supported to arch header
  arm/altp2m: Add template arch-specific altp2m.c/altp2m.h
  arm/altp2m: Introduce CONFIG_ALTP2M Kconfig option
  altp2m: Rename p2m_*_altp2m functions and move declarations out of
    p2m.h
  altp2m: Move do_altp2m_op to common code
  altp2m: Add ARM support to do_altp2m_op
  arm/altp2m: Add support for HVMOP_altp2m_get_domain_state
  x86/p2m: Move p2m_{init,free}_one declarations to arch header
  x86/altp2m: Add lock functions accessible from common code
  altp2m: Move altp2m_{init,teardown} to common code
  arm/p2m: Allocate hostp2m with xzalloc
  arm/p2m: Move hostp2m init/teardown to individual functions
  arm/p2m: Invalidate root page table entries and flush TLB in
    p2m_flush_table
  arm/altp2m: Add support for altp2m init/teardown routines
  altp2m: Move altp2m_{get,set}_altp2m to common code
  arm/altp2m: Add altp2m index to arch_vcpu
  altp2m: Add altp2m_set_vcpu_idx
  arm/altp2m: Add support for altp2m_{get,set}_altp2m
  altp2m: Move altp2m_vcpu_{initialise,destroy} to common code
  arm/altp2m: Add support for altp2m_vcpu_{initialise,destroy}
  arm/altp2m: Add altp2m view validity/visibility indicator
  altp2m: Add altp2m_view_is_{valid,visible}
  x86/altp2m: Add altp2m_set_view_visibility_locked
  arm/altp2m: Add altp2m_set_view_visibility{,_locked} support
  arm/altp2m: Add support for HVMOP_altp2m_set_visibility
  x86/altp2m: Add altp2m_activate_altp2m declaration to arch header
  arm/altp2m: Add support for altp2m_activate_altp2m
  altp2m: Move altp2m_init_by_id to common code
  arm/altp2m: Add support for altp2m_init_by_id
  x86/altp2m: Add altp2m_reset_altp2m declaration to arch header
  arm/altp2m: Add altp2m_reset_altp2m routine
  altp2m: Move altp2m_flush to common code
  arm/altp2m: Add support for altp2m_flush
  arm/p2m: Add support for HVMOP_altp2m_set_domain_state

Sergej Proskurin (5):
  arm/p2m: Cosmetic fix - substitute _gfn(ULONG_MAX) for INVALID_GFN
  arm/p2m: Change function prototype of p2m_alloc_table
  arm/p2m: Rename parameter in p2m_alloc_vmid
  arm/p2m: Change func prototype and impl of p2m_{alloc,free}_vmid
  arm/p2m: Introduce p2m_is_{hostp2m,altp2m}

 xen/arch/arm/Kconfig                     |  11 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/altp2m.c                    | 122 +++++
 xen/arch/arm/domain.c                    |   2 +-
 xen/arch/arm/hvm.c                       |   9 +
 xen/arch/arm/include/asm/Makefile        |   1 -
 xen/arch/arm/include/asm/altp2m.h        |  84 ++++
 xen/arch/arm/include/asm/domain.h        |  19 +-
 xen/arch/arm/include/asm/p2m.h           |  41 +-
 xen/arch/arm/mm.c                        |   2 +-
 xen/arch/arm/mmu/p2m.c                   | 162 ++++++-
 xen/arch/arm/p2m.c                       |  31 +-
 xen/arch/arm/traps.c                     |   2 +-
 xen/arch/x86/domain.c                    |   3 +-
 xen/arch/x86/hvm/emulate.c               |   1 +
 xen/arch/x86/hvm/hvm.c                   | 413 +----------------
 xen/arch/x86/hvm/monitor.c               |   3 +-
 xen/arch/x86/hvm/vmx/vmx.c               |   9 +-
 xen/arch/x86/include/asm/altp2m.h        | 115 ++++-
 xen/arch/x86/include/asm/domain.h        |   5 -
 xen/arch/x86/include/asm/hvm/hvm.h       |  11 -
 xen/arch/x86/include/asm/p2m.h           | 112 +----
 xen/arch/x86/mm/altp2m.c                 | 242 +++-------
 xen/arch/x86/mm/hap/hap.c                |  17 +-
 xen/arch/x86/mm/mem_access.c             |  22 +-
 xen/arch/x86/mm/mem_sharing.c            |   3 +-
 xen/arch/x86/mm/p2m-basic.c              |   7 +-
 xen/arch/x86/mm/p2m-ept.c                |  13 +-
 xen/arch/x86/mm/p2m-pt.c                 |   1 +
 xen/arch/x86/mm/p2m.c                    |   9 +-
 xen/arch/x86/mm/p2m.h                    |   6 -
 xen/common/Makefile                      |   1 +
 xen/common/altp2m.c                      | 551 +++++++++++++++++++++++
 xen/common/monitor.c                     |   1 +
 xen/common/vm_event.c                    |   2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |   2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |   2 +-
 xen/drivers/passthrough/arm/smmu.c       |   2 +-
 xen/include/asm-generic/altp2m.h         |   5 +-
 xen/include/xen/altp2m.h                 |  98 ++++
 xen/include/xen/p2m-common.h             |   2 +-
 xen/include/xen/sched.h                  |   3 +
 42 files changed, 1330 insertions(+), 818 deletions(-)
 create mode 100644 xen/arch/arm/altp2m.c
 create mode 100644 xen/arch/arm/include/asm/altp2m.h
 create mode 100644 xen/common/altp2m.c
 create mode 100644 xen/include/xen/altp2m.h

--=20
2.34.1


