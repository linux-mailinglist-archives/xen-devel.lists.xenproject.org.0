Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3118476C8DB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 10:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574808.900395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR7gU-00030a-CC; Wed, 02 Aug 2023 08:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574808.900395; Wed, 02 Aug 2023 08:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR7gU-0002xX-9P; Wed, 02 Aug 2023 08:58:22 +0000
Received: by outflank-mailman (input) for mailman id 574808;
 Wed, 02 Aug 2023 08:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qR7gT-0002xR-Hr
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 08:58:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba0df38c-3112-11ee-b25e-6b7b168915f2;
 Wed, 02 Aug 2023 10:58:19 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A030B4EE0737;
 Wed,  2 Aug 2023 10:58:17 +0200 (CEST)
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
X-Inumbo-ID: ba0df38c-3112-11ee-b25e-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2] x86/cpu-policy: justify a violation of MISRA C:2012 Rule 1.3
Date: Wed,  2 Aug 2023 10:57:59 +0200
Message-Id: <30fdada8b08b2060c6f1ccc2ecb06d418efd97b0.1690966632.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The empty feature set 'str_7c1' in 'tools/misc/xen-cpuid.c' causes the
struct declaration to have no named members, hence violating
Rule 1.3:
"There shall be no occurrence of undefined or critical unspecified behaviour"
because it is forbidden by ISO/IEC 9899:1999(E), Section 6.7.2.1.7:
"If the struct-declaration-list contains no named
members, the behavior is undefined."

Given that Xen is using an undocumented GCC extension that specifies the
behaviour upon defining a struct with no named member, this construct is
well-defined and thus it is marked as safe.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Added a comment mentioning the use of a GCC extension.

Note for v1:
As agreed during the MISRA C group meetings, this violation is dealt
with by means of a comment deviation, as future changes may eliminate the
root cause, which is the empty feature set.
My justification for the claim and the commit message may need some adjusting.

Note for v2:
Note that GCC does not document the particular usage of non-empty structs
with no named members, but it works as expected nonetheless.
---
 docs/misra/safe.json                 | 9 +++++++++
 xen/include/xen/lib/x86/cpu-policy.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index e3c8a1d8eb..ec2bd58777 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -12,6 +12,15 @@
         },
         {
             "id": "SAF-1-safe",
+            "analyser": {
+                "eclair": "MC3R1.R1.3",
+                "text": "The following declaration of a struct with no named members is deliberate and the use of an undocumented GCC extension ensures that the behaviour is fully defined for that compiler."
+            },
+            "name": "Sentinel",
+            "text": "Next ID to be used"
+        },
+        {
+            "id": "SAF-2-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index bab3eecda6..6b52f080c9 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -203,6 +203,7 @@ struct cpu_policy
             };
             union {
                 uint32_t _7c1;
+                /* SAF-1-safe */
                 struct { DECL_BITFIELD(7c1); };
             };
             union {
-- 
2.34.1


