Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72187972C7D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 10:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795108.1204250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwY2-000082-Ez; Tue, 10 Sep 2024 08:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795108.1204250; Tue, 10 Sep 2024 08:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwY2-00005y-Bi; Tue, 10 Sep 2024 08:48:30 +0000
Received: by outflank-mailman (input) for mailman id 795108;
 Tue, 10 Sep 2024 08:48:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0jq=QI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1snwY1-00085x-4M
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 08:48:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72c09513-6f51-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 10:48:28 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 220454EE079F;
 Tue, 10 Sep 2024 10:48:27 +0200 (CEST)
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
X-Inumbo-ID: 72c09513-6f51-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725958107; bh=SXKsEOptmRry5h0GSDZg8BBELNJJXJidRP9+4uwEjXE=;
	h=From:To:Cc:Subject:Date:From;
	b=N+gG/pD8lx9SAFjzlMA89x29yOp/rFDGeK0CyR3+kH1KAE7mnsTGU5NwDue6EUDq8
	 rAJrb/AA/F84o306jvKmrFSdRP1aXpoUB6RHi+epnxYHeNxReOElR0tWxxissOfQ8K
	 6T5eRdUQljNbVldyuG0rq+8nlLhGepM6iKvbFb7ZW7PTfsqAF1NSiG/+Sts+6U3Bf3
	 vXFh4Tp75rJogHvkzEYguRPl1FuZGk1Do2COf3DWciQ+S16yqdnf0R5xBvr4o3H3E8
	 S/xMxb8m/xX0jy16AtmBan65bk/3t7WoyG8mo86xKpMwZIxPgoH6IlD/+fsRq3+nB7
	 2crh1oRDYnKpQ==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] x86/cpufreq: address MISRA Rule 7.3 violation
Date: Tue, 10 Sep 2024 10:48:24 +0200
Message-ID: <c5aa988e00f94cf793b7ecae49a4eb94db785dee.1725958056.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 7.3 states:
"The lowercase character l shall not be used in a literal suffix",
but the INTEL_MSR_RANGE macro uses the "ull" suffix.
The "u" is transformed in uppercase for consistency.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/acpi/cpufreq/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index c6d7d02faa56..06f6c99d4cc1 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -25,7 +25,7 @@ enum {
     SYSTEM_IO_CAPABLE,
 };
 
-#define INTEL_MSR_RANGE         (0xffffull)
+#define INTEL_MSR_RANGE         (0xffffULL)
 
 static bool __read_mostly acpi_pstate_strict;
 boolean_param("acpi_pstate_strict", acpi_pstate_strict);
-- 
2.43.0


