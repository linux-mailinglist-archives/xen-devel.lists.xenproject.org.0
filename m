Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8791A7C54C1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 15:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615494.956751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYsW-0002Ea-Hc; Wed, 11 Oct 2023 13:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615494.956751; Wed, 11 Oct 2023 13:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYsW-0002Ct-DI; Wed, 11 Oct 2023 13:03:56 +0000
Received: by outflank-mailman (input) for mailman id 615494;
 Wed, 11 Oct 2023 13:03:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJaT=FZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqYsV-0002Cf-7y
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 13:03:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a17bf212-6836-11ee-98d4-6d05b1d4d9a1;
 Wed, 11 Oct 2023 15:03:54 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 883F14EE0744;
 Wed, 11 Oct 2023 15:03:52 +0200 (CEST)
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
X-Inumbo-ID: a17bf212-6836-11ee-98d4-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19] xen/include: make enum perfcounter anonymous
Date: Wed, 11 Oct 2023 15:03:49 +0200
Message-Id: <d739fefde6f142cec10899ed2c5eb81f91618bf0.1697028983.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using enumerators declared in a named enum, such as the one modified,
as operands to arithmetic operators is not allowed by MISRA C:2012 Rule 10.1.
The enumerators of an anonymous enum can be used instead.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This violation manifeststs itself, for instance, in all uses of macro
'perfc_incra' from xen/include/xen/perfc.h, because the expansion
contains an arithmetic operation on two enum constants from enum perfcounter.

( (*nr) <= PERFC_LAST_hypercalls - PERFC_hypercalls ?  [...]

---
 docs/misra/rules.rst    | 3 +++
 xen/include/xen/perfc.h | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3139ca7ae6dd..26c3ff819948 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -341,6 +341,9 @@ maintainers if you want to suggest a change.
            compilers' extensions)
          - Implicit conversions to boolean for conditionals (?: if while
            for) and logical operators (! || &&)
+         - The essential type model allows the constants defined by anonymous
+           enums (e.g., enum { A, B, C }) to be used as operands to arithmetic
+           operators, as they have a signed essential type.

    * - `Rule 10.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_02.c>`_
      - Required
diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
index 7c5ce537bd02..96022c07481e 100644
--- a/xen/include/xen/perfc.h
+++ b/xen/include/xen/perfc.h
@@ -39,7 +39,7 @@
 #define PERFSTATUS       PERFCOUNTER
 #define PERFSTATUS_ARRAY PERFCOUNTER_ARRAY

-enum perfcounter {
+enum {
 #include <xen/perfc_defn.h>
 	NUM_PERFCOUNTERS
 };
--
2.34.1

