Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606A67FDB2C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643993.1004591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQk-0002CF-Cp; Wed, 29 Nov 2023 15:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643993.1004591; Wed, 29 Nov 2023 15:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQk-00028O-97; Wed, 29 Nov 2023 15:24:50 +0000
Received: by outflank-mailman (input) for mailman id 643993;
 Wed, 29 Nov 2023 15:24:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQo/=HK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8MQi-0001PY-6x
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:24:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e5ba655-8ecb-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 16:24:47 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.152])
 by support.bugseng.com (Postfix) with ESMTPSA id B76B84EE0744;
 Wed, 29 Nov 2023 16:24:46 +0100 (CET)
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
X-Inumbo-ID: 6e5ba655-8ecb-11ee-98e3-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 4/7] x86/viridian: make build_assertions static
Date: Wed, 29 Nov 2023 16:24:22 +0100
Message-Id: <1fc043cb040a24515e2355a5a908c42f20a39418.1701270983.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701270983.git.nicola.vetrini@bugseng.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is consistent with other instances of the same function
and also resolves a violation of MISRA C:2012 Rule 8.4.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/viridian/synic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index 8cf600cec68f..3375e55e95ca 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -18,7 +18,7 @@
 #include "private.h"
 
 
-void __init __maybe_unused build_assertions(void)
+static void __init __maybe_unused build_assertions(void)
 {
     BUILD_BUG_ON(sizeof(struct hv_message) != HV_MESSAGE_SIZE);
 }
-- 
2.34.1


