Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3985594BA82
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 12:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773840.1184276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc02m-000080-50; Thu, 08 Aug 2024 10:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773840.1184276; Thu, 08 Aug 2024 10:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc02m-00005e-1m; Thu, 08 Aug 2024 10:06:52 +0000
Received: by outflank-mailman (input) for mailman id 773840;
 Thu, 08 Aug 2024 10:06:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkzM=PH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sc02k-0008M5-6G
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 10:06:50 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec37f939-556d-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 12:06:48 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id DEDC12CEB0;
 Thu,  8 Aug 2024 06:06:46 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id D47162CEAF;
 Thu,  8 Aug 2024 06:06:46 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 79F2C2CEAE;
 Thu,  8 Aug 2024 06:06:45 -0400 (EDT)
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
X-Inumbo-ID: ec37f939-556d-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=FfmIVgfH8XoLD7cO63wuh0h1UGmD3rJp5C7+5+dQn00=; b=L7XD
	UqgYPwO5fpfgGSLUs+jwrS1gP+vuPgj7pqSxU3pRvn4/ghsAGfMfwdK9rO4IFMv0
	2tbnK09FzbtFG0iOIYZGNaiWFStORrCsfCxvZddSkJRWIhE6QUUWmx/ZbQdgY0qw
	VsCs4z83hGXyXCHsmVdf+Y3+RTFYOm8irsks1Tk=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v6 0/3] x86: make CPU virtualisation support configurable
Date: Thu,  8 Aug 2024 13:06:43 +0300
Message-Id: <cover.1723110344.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 EB0EA8CC-556D-11EF-88B1-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

These are final 3 patches of the series for making VMX/SVM support in Xen
configurable:

https://lore.kernel.org/xen-devel/cover.1722333634.git.Sergiy_Kibrik@epam=
.com/

Minor changes comparing to v5, changelogs are provided per-patch.

  -Sergiy=20

Sergiy Kibrik (1):
  x86/vmx: guard access to cpu_has_vmx_* in common code

Xenia Ragiadakou (2):
  ioreq: do not build arch_vcpu_ioreq_completion() for non-VMX
    configurations
  x86/hvm: make AMD-V and Intel VT-x support configurable

 xen/Kconfig                             |  6 ++
 xen/arch/arm/ioreq.c                    |  6 --
 xen/arch/x86/Kconfig                    | 19 +++++-
 xen/arch/x86/hvm/ioreq.c                |  2 +
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 90 ++++++++++++++++---------
 xen/include/xen/ioreq.h                 | 10 +++
 6 files changed, 95 insertions(+), 38 deletions(-)

--=20
2.25.1


