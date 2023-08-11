Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F00B778801
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 09:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582279.911950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRA-0003lk-0m; Fri, 11 Aug 2023 07:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582279.911950; Fri, 11 Aug 2023 07:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMR9-0003hx-Rp; Fri, 11 Aug 2023 07:19:55 +0000
Received: by outflank-mailman (input) for mailman id 582279;
 Fri, 11 Aug 2023 07:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r9U=D4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qUMR7-0003ey-Ot
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 07:19:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77448417-3817-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 09:19:53 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 985C04EE0742;
 Fri, 11 Aug 2023 09:19:52 +0200 (CEST)
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
X-Inumbo-ID: 77448417-3817-11ee-b284-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH 1/6] x86/hpet: make variable 'per_cpu__cpu_bc_channel' static
Date: Fri, 11 Aug 2023 09:19:26 +0200
Message-Id: <5e13888db7b69cee21e5367ce8750fbdc1e22d5c.1691676251.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691676251.git.nicola.vetrini@bugseng.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable is only ever used inside the file where it's
defined, therefore it can have static storage. This also
resolves a violation of MISRA C:2012 Rule 8.4 due to the absence
of a declaration prior to the definition.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
---
 xen/arch/x86/hpet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index a2df1c7df401..79c07f6a9e09 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -49,7 +49,7 @@ static struct hpet_event_channel *__read_mostly hpet_events;
 /* msi hpet channels used for broadcast */
 static unsigned int __read_mostly num_hpets_used;
 
-DEFINE_PER_CPU(struct hpet_event_channel *, cpu_bc_channel);
+static DEFINE_PER_CPU(struct hpet_event_channel *, cpu_bc_channel);
 
 unsigned long __initdata hpet_address;
 int8_t __initdata opt_hpet_legacy_replacement = -1;
-- 
2.34.1


