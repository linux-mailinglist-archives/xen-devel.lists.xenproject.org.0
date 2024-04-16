Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0C08A63A1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706586.1103812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwc9m-0006TB-Ai; Tue, 16 Apr 2024 06:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706586.1103812; Tue, 16 Apr 2024 06:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwc9m-0006Qh-7R; Tue, 16 Apr 2024 06:19:02 +0000
Received: by outflank-mailman (input) for mailman id 706586;
 Tue, 16 Apr 2024 06:19:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwc9l-0006Qb-I6
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:19:01 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3304ebd7-fbb9-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 08:18:58 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id D6D852D883;
 Tue, 16 Apr 2024 02:18:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id CFC7D2D882;
 Tue, 16 Apr 2024 02:18:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 93E2F2D881;
 Tue, 16 Apr 2024 02:18:49 -0400 (EDT)
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
X-Inumbo-ID: 3304ebd7-fbb9-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=6vHxZ/33ITDABcWjUxehnpnesNP5eX6D9AJ2QQAQcSI=; b=f/OK
	V2KA+4C7xO9OTO2UxHdjZM4j87ScpiAlQmEmrQ2Dxht2gIhq5V40nuIxZmLbTurD
	AtDyhzFY3QkDlAe07sZ2xe3nNGbQJcOBOjr3iOd30WutRndMlt8n00Q4GRMo3OO1
	bBts8jYvPgWnbuKRLM06vrjGqS4AODvDZnMpLS4=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v1 00/15] x86: make cpu virtualization support configurable
Date: Tue, 16 Apr 2024 09:18:45 +0300
Message-Id: <20240416061845.3467822-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 307F5F0A-FBB9-11EE-8F54-A19503B9AAD1-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

This series aims to continue what Xenia started a year ago:

https://lore.kernel.org/xen-devel/20230213145751.1047236-1-burzalodowa@gm=
ail.com/

Here's an attempt to provide a means to render the cpu virtualization
technology support in Xen configurable.
Currently, irrespectively of the target platform, both AMD-V and Intel VT=
-x
drivers are built.
The series adds two new Kconfig controls, SVM and VMX, that can be
used to switch to a finer-grained configuration for a given platform, and
reduce dead code.

The code separation is done using the new config guards.

Since the initial RFC series felt rather welcomed, I took a courage namin=
g
it v1 and continuing from there. New changes are:

v1:
 * changed Kconfig options naming
 * use IS_ENABLED() instead of #ifdef where possible
 * move altp2m code apart from p2m & hide under VMX option
 * introduce helper in cpu_has_vmx_* macros
 * and address other comments from Jan

Sergiy Kibrik (6):
  x86/monitor: guard altp2m usage
  x86/p2m: guard altp2m init/teardown
  x86/p2m: move altp2m-related code to separate file
  x86/p2m: guard altp2m code with CONFIG_VMX option
  x86/vpmu: separate amd/intel vPMU code
  x86/vmx: introduce helper function for vmcs macro

Xenia Ragiadakou (9):
  x86: introduce AMD-V and Intel VT-x Kconfig options
  x86/hvm: guard AMD-V and Intel VT-x hvm_function_table initializers
  x86/p2m: guard vmx specific ept functions with CONFIG_VMX
  x86/traps: guard vmx specific functions with CONFIG_VMX
  x86/domain: guard svm specific functions with CONFIG_SVM
  x86/oprofile: guard svm specific symbols with CONFIG_SVM
  x86: wire cpu_has_{svm/vmx}_* to false when svm/vmx not enabled
  x86/ioreq: guard VIO_realmode_completion with CONFIG_VMX
  x86/hvm: make AMD-V and Intel VT-x support configurable

 xen/arch/x86/Kconfig                    |  20 +
 xen/arch/x86/cpu/Makefile               |   4 +-
 xen/arch/x86/domain.c                   |  10 +-
 xen/arch/x86/hvm/Makefile               |   4 +-
 xen/arch/x86/hvm/emulate.c              |   2 +
 xen/arch/x86/hvm/hvm.c                  |   4 +-
 xen/arch/x86/hvm/ioreq.c                |   2 +
 xen/arch/x86/hvm/monitor.c              |   4 +-
 xen/arch/x86/include/asm/altp2m.h       |   5 +-
 xen/arch/x86/include/asm/hvm/hvm.h      |   7 +
 xen/arch/x86/include/asm/hvm/svm/svm.h  |   8 +
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  96 ++--
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  28 +-
 xen/arch/x86/include/asm/p2m.h          |  18 +-
 xen/arch/x86/include/asm/vpmu.h         |  19 +
 xen/arch/x86/mm/Makefile                |   5 +-
 xen/arch/x86/mm/altp2m.c                | 631 +++++++++++++++++++++++
 xen/arch/x86/mm/hap/Makefile            |   2 +-
 xen/arch/x86/mm/p2m-basic.c             |  23 +-
 xen/arch/x86/mm/p2m.c                   | 636 +-----------------------
 xen/arch/x86/mm/p2m.h                   |   3 +
 xen/arch/x86/oprofile/op_model_athlon.c |   2 +-
 xen/arch/x86/traps.c                    |   8 +-
 xen/drivers/passthrough/Kconfig         |   4 +-
 xen/include/xen/sched.h                 |   2 +-
 25 files changed, 834 insertions(+), 713 deletions(-)

--=20
2.25.1


