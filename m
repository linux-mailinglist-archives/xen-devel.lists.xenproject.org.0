Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E533F79D523
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 17:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600552.936304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5Uu-0008Uo-Bk; Tue, 12 Sep 2023 15:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600552.936304; Tue, 12 Sep 2023 15:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5Uu-0008Pd-5d; Tue, 12 Sep 2023 15:40:16 +0000
Received: by outflank-mailman (input) for mailman id 600552;
 Tue, 12 Sep 2023 15:40:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qg5Us-00073d-FS
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 15:40:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa2691c6-5182-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 17:40:13 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 4565D4EE0749;
 Tue, 12 Sep 2023 17:40:13 +0200 (CEST)
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
X-Inumbo-ID: aa2691c6-5182-11ee-8786-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Gianluca Luparini <gianluca.luparini@bugseng.com>
Subject: [XEN PATCH v6 6/7] xen/mcheck: address violations of MISRA C:2012 Rule 7.2
Date: Tue, 12 Sep 2023 17:39:03 +0200
Message-Id: <3a9bd4547d64902998bceba58acd611e09779f57.1694532795.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694532795.git.simone.ballarin@bugseng.com>
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type.

For the sake of uniformity, the following change is made:
- add the 'U' suffix to all first macro's arguments

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

---
Changes in v6:
- new patch obtained by splitting mcheck related changes from
"xen/x86: address violations of MISRA C:2012 Rule 7.2 (v5)"
---
 xen/arch/x86/cpu/mcheck/mce-apei.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce-apei.c b/xen/arch/x86/cpu/mcheck/mce-apei.c
index 53b6735896..b895020882 100644
--- a/xen/arch/x86/cpu/mcheck/mce-apei.c
+++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
@@ -37,10 +37,10 @@
 #include "mce.h"
 
 #define CPER_CREATOR_MCE						\
-	UUID_LE(0x75a574e3, 0x5052, 0x4b29, 0x8a, 0x8e, 0xbe, 0x2c,	\
+	UUID_LE(0x75a574e3U, 0x5052, 0x4b29, 0x8a, 0x8e, 0xbe, 0x2c,	\
 		0x64, 0x90, 0xb8, 0x9d)
 #define CPER_SECTION_TYPE_MCE						\
-	UUID_LE(0xfe08ffbe, 0x95e4, 0x4be7, 0xbc, 0x73, 0x40, 0x96,	\
+	UUID_LE(0xfe08ffbeU, 0x95e4, 0x4be7, 0xbc, 0x73, 0x40, 0x96,	\
 		0x04, 0x4a, 0x38, 0xfc)
 
 /*
-- 
2.34.1


