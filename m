Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03322761C14
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569743.890768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJFs-0008FV-Qj; Tue, 25 Jul 2023 14:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569743.890768; Tue, 25 Jul 2023 14:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJFs-0008Dq-N7; Tue, 25 Jul 2023 14:43:16 +0000
Received: by outflank-mailman (input) for mailman id 569743;
 Tue, 25 Jul 2023 14:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1im=DL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qOJFr-0008DR-4m
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:43:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94a3c7b0-2af9-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 16:43:12 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.93.75])
 by support.bugseng.com (Postfix) with ESMTPSA id 53B3D4EE0739;
 Tue, 25 Jul 2023 16:43:11 +0200 (CEST)
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
X-Inumbo-ID: 94a3c7b0-2af9-11ee-8613-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/cpu: change parameter name in __cpu_up() declaration
Date: Tue, 25 Jul 2023 16:43:02 +0200
Message-Id: <5fdc284b6451dd19f2e84db97d12ab45efaf3bfd.1690295729.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter name from 'cpunum' to 'cpu' to keep consistency with
the name used in the corresponding definitions thus addressing a
violation of MISRA C:2012 Rule 8.3: "All declarations of an object or
function shall use the same names and type qualifiers".

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/cpu.h b/xen/include/xen/cpu.h
index e8eeb217a0..e1d4eb5967 100644
--- a/xen/include/xen/cpu.h
+++ b/xen/include/xen/cpu.h
@@ -69,7 +69,7 @@ int disable_nonboot_cpus(void);
 void enable_nonboot_cpus(void);
 
 /* Private arch-dependent helpers for CPU hotplug. */
-int __cpu_up(unsigned int cpunum);
+int __cpu_up(unsigned int cpu);
 void __cpu_disable(void);
 void __cpu_die(unsigned int cpu);
 
-- 
2.34.1


