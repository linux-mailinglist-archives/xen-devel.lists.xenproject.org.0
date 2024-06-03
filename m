Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5858D808C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734798.1140870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5Vb-0006nB-BU; Mon, 03 Jun 2024 11:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734798.1140870; Mon, 03 Jun 2024 11:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5Vb-0006k5-84; Mon, 03 Jun 2024 11:05:47 +0000
Received: by outflank-mailman (input) for mailman id 734798;
 Mon, 03 Jun 2024 11:05:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5Va-0006jz-KL
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:05:46 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 375ab25f-2199-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:05:43 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id A5527272C0;
 Mon,  3 Jun 2024 07:05:40 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 9C69A272BF;
 Mon,  3 Jun 2024 07:05:40 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 4CFD5272BE;
 Mon,  3 Jun 2024 07:05:32 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 375ab25f-2199-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=QaiSGXogYi2owIsVlMMKiyc+5dmbop+tdzhMcxRnQ+o=; b=D2oL
	eEzRqIEaJ7zNqTatP09PLPsJBgx0kSXGrYT8gRy6Gy+xSyLqP++ZMch2IEN/0/wl
	p8BhrWvjvGSpoEnJaRKFImGr8OpfKPUrUdQAypL8aKOcrLdZhpDxitnIQLYvIBOE
	u9VvvsjNmV61UCxrYFUi39UFf3kBYdpWNMa1Tno=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v3 00/16] x86: make cpu virtualization support configurable
Date: Mon,  3 Jun 2024 14:05:28 +0300
Message-Id: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 31F0C22E-2199-11EF-9A9D-ACC938F0AE34-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

This is yet another attempt to provide a means to render the cpu virtuali=
zation
technology support in Xen configurable.
Currently, irrespectively of the target platform, both AMD-V and Intel VT=
-x
drivers are built.
The series adds three new Kconfig controls, ALT2PM, SVM and VMX, that can=
 be
used to switch to a finer-grained configuration for a given platform, and
reduce dead code.

The code separation is done using the new config guards.

Major changes in this series, comparing to v2, are introduction and adopt=
ion of
using_vmx & using_svm macros, and turning of arch_vcpu_ioreq_completion()=
 into
optional callback. The latter is more rfc-style change, kind of a perspec=
tive
on how things might look.
More specific changes are provided in per-patch changelog.=20

v2 series here:
https://lore.kernel.org/xen-devel/cover.1715761386.git.Sergiy_Kibrik@epam=
.com/

 -Sergiy

Sergiy Kibrik (9):
  x86/altp2m: check if altp2m active when giving away p2midx
  x86/p2m: guard altp2m routines
  x86: introduce CONFIG_ALTP2M Kconfig option
  x86: introduce using_{svm,vmx} macros
  x86/nestedhvm: switch to using_{svm,vmx} check
  x86/vmx: guard access to cpu_has_vmx_* in common code
  x86/vpmu: guard calls to vmx/svm functions
  ioreq: make arch_vcpu_ioreq_completion() an optional callback
  x86/vmx: replace CONFIG_HVM with CONFIG_VMX in vmx.h

Xenia Ragiadakou (7):
  x86: introduce AMD-V and Intel VT-x Kconfig options
  x86/hvm: guard AMD-V and Intel VT-x hvm_function_table initializers
  x86/p2m: guard EPT functions with using_vmx macro
  x86/traps: guard vmx specific functions with usinc_vmx macro
  x86/domain: guard svm specific functions with usinc_svm macro
  x86/oprofile: guard svm specific symbols with CONFIG_SVM
  x86/hvm: make AMD-V and Intel VT-x support configurable

 xen/arch/arm/ioreq.c                    |  6 -----
 xen/arch/x86/Kconfig                    | 31 +++++++++++++++++++++++++
 xen/arch/x86/cpu/vpmu_amd.c             |  9 +++----
 xen/arch/x86/cpu/vpmu_intel.c           | 16 +++++++------
 xen/arch/x86/domain.c                   |  8 +++----
 xen/arch/x86/hvm/Makefile               |  4 ++--
 xen/arch/x86/hvm/hvm.c                  |  6 ++---
 xen/arch/x86/hvm/ioreq.c                | 23 ------------------
 xen/arch/x86/hvm/nestedhvm.c            |  4 ++--
 xen/arch/x86/hvm/viridian/viridian.c    |  4 ++--
 xen/arch/x86/hvm/vmx/vmx.c              | 16 +++++++++++++
 xen/arch/x86/include/asm/altp2m.h       | 15 +++++++-----
 xen/arch/x86/include/asm/hvm/hvm.h      |  5 +++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 12 +++++-----
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  2 +-
 xen/arch/x86/include/asm/p2m.h          | 17 +++++++++++++-
 xen/arch/x86/mm/Makefile                |  5 ++--
 xen/arch/x86/mm/hap/Makefile            |  2 +-
 xen/arch/x86/mm/p2m-basic.c             | 13 ++++++-----
 xen/arch/x86/mm/p2m-ept.c               |  2 +-
 xen/arch/x86/oprofile/op_model_athlon.c |  2 +-
 xen/arch/x86/traps.c                    | 13 ++++-------
 xen/common/ioreq.c                      |  5 +++-
 xen/include/xen/ioreq.h                 |  2 +-
 24 files changed, 132 insertions(+), 90 deletions(-)

--=20
2.25.1


