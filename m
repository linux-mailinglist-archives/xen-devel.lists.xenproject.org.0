Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6154B5123
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271754.466477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3z-0005Zw-CO; Mon, 14 Feb 2022 13:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271754.466477; Mon, 14 Feb 2022 13:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3y-0005K7-Gp; Mon, 14 Feb 2022 13:06:42 +0000
Received: by outflank-mailman (input) for mailman id 271754;
 Mon, 14 Feb 2022 13:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2y-0008IH-15
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd88c665-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:38 +0100 (CET)
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
X-Inumbo-ID: cd88c665-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=4p8+U7bQUnOYzkSxSSSq0ARZQ5aCAjglSKvDPx7PBXU=;
  b=cdBPF2rTlXP97cxC5uEypg64F2+pKnF/dTu/cYMAJiqW97waMsrs3ZhY
   yNQEjlFVpvuRwFsiyogqWv5PyzfVSDLspM4SLnZJnxbgeuUfj22BJhq0X
   MjMSoD+u9yZgPewdf060FWipMPIF4Rj04ad5hy+xtgSjv0ZzlsAlDjrWA
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: I3xCB+3fYRW2bTBtXxPA9LKnhh8j+kIIwyPJaxWpSWbX0yPGAxBsOCiFCeFL2z8YUP2i2QNjmE
 FuQ+uuwjc8RCpCLbQYpu8t3j0lKvL95ukJnmxd6HFtb5HcJqiUYLZPJtFUJ+vpMwKGaDUqwwsL
 dThtQs3O9pu9DALvZtuqo/EjqgiD2xRQ9SiIyBLBO9NmaFMf2lQvGvkehcPSttwwWMn2NH9Xkw
 AQLscSxktHCugoZ0xvvFAxiD1+/KavASYX1/Oxx/54T9hz5wGMAAEf9zkK702/VqoC+nF3QGuy
 V4LidFhyYeC6kTylrBo6DuQK
X-SBRS: 5.1
X-MesageID: 64149412
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uiZ6yqJZVFsbZxGpFE+RzpIlxSXFcZb7ZxGr2PjKsXjdYENS1TcBz
 GcbXWjVOPjYM2GkKdB1b4/k90tVusTTxoVgSwJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6x7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Qo/Bj0
 cgdk6brEx8yYZDCwsI+f0VhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gls35wfQa+ED
 yYfQRVuQh+DOC8fA24WT8Iag6CIgHzkczIN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7tIjhguiBthUTufhsKc33hvDnQT/FSH6S3Oindmrk1PufegEc
 VQPpRcg944R2BCSG4yVswKDnFaIuRsVWtx1GuI86R2Qxqe83zt1FlToXRYaNoV46ZZeqSgCk
 wbQwoi3XWAHXKi9FCrFnop4uw9eLsT8wYUqQSYfBTUI7ND4yG3YpkKeF40zeEJZYzCcJN0R/
 9xohHVk71nwpZRSv0lewbwgq2jyzqUltiZvum3qspuNt2uVnrKNaY2y8kT85v1dNoufRVTpl
 CFax5TBvLBTUMnUz3blrAAx8FaBvajtDdEhqQQ3Q8lJG8qFpxZPgry8EBkhfRw0Y67oiBfiY
 VPJuBM52XOgFCDCUEODWKroU55C5fG5TbzND6mIBvITMskZXFLWp0lGOB/Pt10BZWBxyMnTz
 7/AKp3yZZvbYIw6pAeLqxA1j+N1mHBkmD+7qFKS503P7IdyrUW9Ed8tWGZipMhjhE9diAmKo
 dtZKeWQzBBTDL/3biXNqNZBJlEWN3krQ5vxrpUPJOKEJwNnHkAnCuPQnux9K9A0wfwNm7ea5
 Gy5V29Z1EH72S/NJzKVZy0xc7joR5t+8y42ZHR+IVay1nE/So+z96NDJYAvdLwq+bU7n/55R
 vUIYeuaBfFLRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZn+
 u+uzALWR5YHVj9ONseOZaL91U61sFgchPl2AxnCLO5MdRi+64NtMSHw0KM6epleNRXZyzKG/
 A+KGhNE9/LVqoo4/dSV16CJq4ClT7l3EkZARjSJ6L+3MW/R/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxQ+Rx0KYzx9rzvLsLnA1rEULCY0mvFr49cGKN2tNCt/EVy7JU0edst
 pljJjWO1W21Bf7Y
IronPort-HdrOrdr: A9a23:Ig21wK/4+ssNKksLZx9uk+DcI+orL9Y04lQ7vn2YSXRuE/Bw9v
 re5MjzuiWE6wr5NEtOpTnEAtjlfZq+z+8N3WByB8bBYOCOggLBR+sOgbcKgQeQfBEWntQts5
 uIGJIfNDSfNzZHZL7BkWyFL+o=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149412"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 35/70] x86/ucode: CFI hardening
Date: Mon, 14 Feb 2022 12:50:52 +0000
Message-ID: <20220214125127.17985-36-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/cpu/microcode/amd.c   |  9 +++++----
 xen/arch/x86/cpu/microcode/core.c  |  4 ++--
 xen/arch/x86/cpu/microcode/intel.c | 10 +++++-----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index fe92e594f129..0afa2192bf1d 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -91,7 +91,7 @@ static struct {
     uint16_t id;
 } equiv __read_mostly;
 
-static void collect_cpu_info(void)
+static void cf_check collect_cpu_info(void)
 {
     struct cpu_signature *csig = &this_cpu(cpu_sig);
 
@@ -204,7 +204,7 @@ static enum microcode_match_result compare_header(
     return compare_revisions(old->patch_id, new->patch_id);
 }
 
-static enum microcode_match_result compare_patch(
+static enum microcode_match_result cf_check compare_patch(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
     /* Both patches to compare are supposed to be applicable to local CPU. */
@@ -214,7 +214,7 @@ static enum microcode_match_result compare_patch(
     return compare_header(new, old);
 }
 
-static int apply_microcode(const struct microcode_patch *patch)
+static int cf_check apply_microcode(const struct microcode_patch *patch)
 {
     int hw_err;
     unsigned int cpu = smp_processor_id();
@@ -299,7 +299,8 @@ static int scan_equiv_cpu_table(const struct container_equiv_table *et)
     return -ESRCH;
 }
 
-static struct microcode_patch *cpu_request_microcode(const void *buf, size_t size)
+static struct microcode_patch *cf_check cpu_request_microcode(
+    const void *buf, size_t size)
 {
     const struct microcode_patch *saved = NULL;
     struct microcode_patch *patch = NULL;
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 841364208053..c07f68ba350e 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -291,12 +291,12 @@ static int wait_for_condition(bool (*func)(unsigned int data),
     return 0;
 }
 
-static bool wait_cpu_callin(unsigned int nr)
+static bool cf_check wait_cpu_callin(unsigned int nr)
 {
     return cpumask_weight(&cpu_callin_map) >= nr;
 }
 
-static bool wait_cpu_callout(unsigned int nr)
+static bool cf_check wait_cpu_callout(unsigned int nr)
 {
     return atomic_read(&cpu_out) >= nr;
 }
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f6d01490e0ab..d3864b5ab03e 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -116,7 +116,7 @@ static bool signature_matches(const struct cpu_signature *cpu_sig,
     return cpu_sig->pf & ucode_pf;
 }
 
-static void collect_cpu_info(void)
+static void cf_check collect_cpu_info(void)
 {
     struct cpu_signature *csig = &this_cpu(cpu_sig);
     uint64_t msr_content;
@@ -271,7 +271,7 @@ static enum microcode_match_result microcode_update_match(
     return compare_revisions(cpu_sig->rev, mc->rev);
 }
 
-static enum microcode_match_result compare_patch(
+static enum microcode_match_result cf_check compare_patch(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
     /*
@@ -284,7 +284,7 @@ static enum microcode_match_result compare_patch(
     return compare_revisions(old->rev, new->rev);
 }
 
-static int apply_microcode(const struct microcode_patch *patch)
+static int cf_check apply_microcode(const struct microcode_patch *patch)
 {
     uint64_t msr_content;
     unsigned int cpu = smp_processor_id();
@@ -323,8 +323,8 @@ static int apply_microcode(const struct microcode_patch *patch)
     return 0;
 }
 
-static struct microcode_patch *cpu_request_microcode(const void *buf,
-                                                     size_t size)
+static struct microcode_patch *cf_check cpu_request_microcode(
+    const void *buf, size_t size)
 {
     int error = 0;
     const struct microcode_patch *saved = NULL;
-- 
2.11.0


