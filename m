Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06B0899DD0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701287.1095630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjAV-0005gK-UK; Fri, 05 Apr 2024 12:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701287.1095630; Fri, 05 Apr 2024 12:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjAV-0005dx-R8; Fri, 05 Apr 2024 12:59:43 +0000
Received: by outflank-mailman (input) for mailman id 701287;
 Fri, 05 Apr 2024 12:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUTm=LK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsjAV-0005dp-1u
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:59:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d8ba420-f34c-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 14:59:40 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 0360B4EE073E;
 Fri,  5 Apr 2024 14:59:38 +0200 (CEST)
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
X-Inumbo-ID: 5d8ba420-f34c-11ee-a1ef-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH] xen/compiler: address violation of MISRA C Rule 20.9
Date: Fri,  5 Apr 2024 14:59:35 +0200
Message-Id: <d7c9e5cdabbcc3262f0e23fbf914cd6bb7e47990.1712321857.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rule states:
"All identifiers used in the controlling expression of #if or #elif
preprocessing directives shall be #define'd before evaluation".
In this case, using defined(identifier) is a MISRA-compliant
way to achieve the same effect.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This is the only outstanding violation of the rule, given the current
configurations. There are likely other sites that may benefit from
a gradual refactor.
---
 xen/include/xen/compiler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index fc87a2edad7f..179ff23e62c5 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -30,7 +30,7 @@
 
 #define __weak        __attribute__((__weak__))
 
-#if !CONFIG_CC_IS_CLANG || CONFIG_CLANG_VERSION >= 140000
+#if !defined(CONFIG_CC_IS_CLANG) || CONFIG_CLANG_VERSION >= 140000
 # define nocall       __attribute__((__error__("Nonstandard ABI")))
 #else
 # define nocall
-- 
2.34.1


