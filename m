Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3427F7A6B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 18:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640860.999615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6a0g-0002vT-AH; Fri, 24 Nov 2023 17:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640860.999615; Fri, 24 Nov 2023 17:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6a0g-0002qs-5Z; Fri, 24 Nov 2023 17:30:34 +0000
Received: by outflank-mailman (input) for mailman id 640860;
 Fri, 24 Nov 2023 17:30:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6a0e-0002YK-1z
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 17:30:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 288bb92e-8aef-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 18:30:27 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 4C8A84EE0740;
 Fri, 24 Nov 2023 18:30:27 +0100 (CET)
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
X-Inumbo-ID: 288bb92e-8aef-11ee-9b0e-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 1/3] automation/eclair: tag function calls to address violations of MISRA C:2012 Rule 13.1
Date: Fri, 24 Nov 2023 18:29:41 +0100
Message-Id: <fc3e04e5d0432b280110414136f0587a1433d9b0.1700844359.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700844359.git.simone.ballarin@bugseng.com>
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 13.1: Initializer lists shall not contain persistent side effects

Invocations of functions in initializer lists cause violations of rule
13.1 if the called functions are not tagged with __attribute_pure__ or
__attribute_const__ as they can produce persistent side effects.

Handling these violations with  attributes is not always possible: the
pure and const attributes may cause unwanted and potentially dangerous
optimisations.

To avoid this problem ECLAIR allows using the same attributes in the
-call_properties setting. Additionally, it adds the noeffect attribute
with the following definition:
"like pure but can also read volatile variable not triggering side effects"

These patch tags some functions used in initializer lists to address
violations of Rule 13.1.

No functional changes.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
New patch partly based on "xen/arm: address violations of MISRA C:2012 Rule 13.1"
and "xen/include: add pure and const attributes". This new patch uses
ECL tagging instead of compiler attributes.
---
 .../ECLAIR/call_properties.ecl                | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/call_properties.ecl b/automation/eclair_analysis/ECLAIR/call_properties.ecl
index 3f7794bf8b..c2b2a6182e 100644
--- a/automation/eclair_analysis/ECLAIR/call_properties.ecl
+++ b/automation/eclair_analysis/ECLAIR/call_properties.ecl
@@ -73,6 +73,17 @@
 -call_properties+={"macro(^va_start$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
 -call_properties+={"macro(^memcmp$)", {"pointee_write(1..2=never)", "taken()"}}
 -call_properties+={"macro(^memcpy$)", {"pointee_write(1=always&&2..=never)", "pointee_read(1=never&&2..=always)", "taken()"}}
+-call_properties+={"name(get_cpu_info)",{pure}}
+-call_properties+={"name(pdx_to_pfn)",{pure}}
+-call_properties+={"name(is_pci_passthrough_enabled)",{const}}
+-call_properties+={"name(get_cycles)", {"noeffect"}}
+-call_properties+={"name(msi_gflags)",{const}}
+-call_properties+={"name(hvm_save_size)",{pure}}
+-call_properties+={"name(cpu_has)",{pure}}
+-call_properties+={"name(boot_cpu_has)",{pure}}
+-call_properties+={"name(get_cpu_info)",{pure}}
+-call_properties+={"name(put_pte_flags)",{const}}
+-call_properties+={"name(is_pv_vcpu)",{pure}}
 
 -doc_begin="Property inferred as a consequence of the semantics of device_tree_get_reg"
 -call_properties+={"name(acquire_static_memory_bank)", {"pointee_write(4..=always)", "pointee_read(4..=never)", "taken()"}}
@@ -104,3 +115,14 @@ Furthermore, their uses do initialize the involved variables as needed by futher
 -call_properties+={"macro(^(__)?(raw_)?copy_from_(paddr|guest|compat)(_offset)?$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
 -call_properties+={"macro(^(__)?copy_to_(guest|compat)(_offset)?$)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
 -doc_end
+
+-doc_begin="Functions generated by build_atomic_read cannot be considered pure
+since the input pointer is volatile, but they do not produce any persistent side
+effect."
+-call_properties+={"^read_u(8|16|32|64|int)_atomic.*$", {noeffect}}
+-doc_end
+
+-doc_begin="Functions generated by TYPE_SAFE are const."
+-call_properties+={"^(mfn|gfn|pfn)_x\\(.*$",{const}}
+-call_properties+={"^_(mfn|gfn|pfn)\\(.*$",{const}}
+-doc_end
-- 
2.34.1


