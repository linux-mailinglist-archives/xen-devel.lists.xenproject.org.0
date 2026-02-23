Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJm6IXUmnGlfAAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:05:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63715174795
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238618.1540258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSoP-0008Bh-Ea; Mon, 23 Feb 2026 10:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238618.1540258; Mon, 23 Feb 2026 10:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSoP-00083d-9U; Mon, 23 Feb 2026 10:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1238618;
 Mon, 23 Feb 2026 10:05:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSoO-0007Xe-Eg
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:05:08 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20a8c1e0-109f-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 11:05:06 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 0066C41202E0;
 Mon, 23 Feb 2026 05:04:46 -0500 (EST)
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
X-Inumbo-ID: 20a8c1e0-109f-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 4/4] tools/tests/x86_emulator: disable xmm* tests on clang
Date: Mon, 23 Feb 2026 10:04:55 +0000
Message-ID: <9e380de50b64e45e9044a2f4bcf1a5bdb7e74a29.1771840208.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771840208.git.edwin.torok@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.23 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63715174795
X-Rspamd-Action: no action

clang-21 doesn't support `-ffixed-xmm0`, so `%xmm0` won't have the
expected value.
Disable these tests on clang.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/x86_emulator/test_x86_emulator.c | 44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tools/tests/x86_emulator/test_x86_emulator.c b/tools/tests/x86_emulator/test_x86_emulator.c
index cf4e5cc593..3d0ad07c6b 100644
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2683,6 +2683,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing fxsave 4(%ecx)...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_fxsr )
     {
         const uint16_t nine = 9;
@@ -2712,6 +2713,7 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing fxrstor -4(%ecx)...");
@@ -2748,6 +2750,7 @@ int main(int argc, char **argv)
 
 #ifdef __x86_64__
     printf("%-40s", "Testing fxsaveq 8(%edx)...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_fxsr )
     {
         memset(res + 0x80, 0xcc, 0x400);
@@ -2765,6 +2768,7 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 #endif
 
@@ -2816,6 +2820,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing movq %xmm0,32(%ecx)...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_sse2 )
     {
         decl_insn(movq_to_mem2);
@@ -2837,9 +2842,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing movq 32(%ecx),%xmm1...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_sse2 )
     {
         decl_insn(movq_from_mem2);
@@ -2860,9 +2867,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm1,32(%edx)...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx )
     {
         decl_insn(vmovq_to_mem);
@@ -2884,9 +2893,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq 32(%edx),%xmm0...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx )
     {
         decl_insn(vmovq_from_mem);
@@ -2907,9 +2918,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm1,32(%edx)...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx512f )
     {
         decl_insn(evex_vmovq_to_mem);
@@ -2931,9 +2944,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq 32(%edx),%xmm0...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx512f )
     {
         decl_insn(evex_vmovq_from_mem);
@@ -2954,9 +2969,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing movdqu %xmm2,(%ecx)...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_sse2 )
     {
         decl_insn(movdqu_to_mem);
@@ -2976,9 +2993,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing movdqu (%edx),%xmm4...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_sse2 )
     {
         decl_insn(movdqu_from_mem);
@@ -3001,6 +3020,7 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu %ymm2,(%ecx)...");
@@ -3386,6 +3406,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing movd %xmm2,32(%edx)...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_sse2 )
     {
         decl_insn(movd_to_mem2);
@@ -3407,9 +3428,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing movd 32(%edx),%xmm3...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_sse2 )
     {
         decl_insn(movd_from_mem2);
@@ -3435,9 +3458,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovd %xmm1,32(%ecx)...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx )
     {
         decl_insn(vmovd_to_mem);
@@ -3459,9 +3484,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovd 32(%ecx),%xmm2...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx )
     {
         decl_insn(vmovd_from_mem);
@@ -3487,6 +3514,7 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm3,32(%ecx)...");
@@ -3597,6 +3625,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing movd %xmm2,%ebx...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_sse2 )
     {
         decl_insn(movd_to_reg2);
@@ -3619,6 +3648,7 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing movd %ebx,%xmm3...");
@@ -3651,6 +3681,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovd %xmm1,%ebx...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx )
     {
         decl_insn(vmovd_to_reg);
@@ -3673,6 +3704,7 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovd %ebx,%xmm2...");
@@ -3705,6 +3737,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm2,%ebx...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx512f )
     {
         decl_insn(evex_vmovd_to_reg);
@@ -3728,6 +3761,7 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %ebx,%xmm1...");
@@ -3781,6 +3815,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing movq %xmm2,32(%edx)...");
+#ifndef __clang__
     if ( stack_exec )
     {
         decl_insn(movq_to_mem4);
@@ -3802,9 +3837,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm1,32(%ecx)...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx )
     {
         decl_insn(vmovq_to_mem2);
@@ -3830,9 +3867,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm11,32(%ecx)...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx512f )
     {
         decl_insn(evex_vmovq_to_mem2);
@@ -3860,6 +3899,7 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing movq %mm3,%rbx...");
@@ -3883,6 +3923,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing movq %xmm2,%rbx...");
+#ifndef __clang__
     if ( stack_exec )
     {
         decl_insn(movq_to_reg2);
@@ -3900,9 +3941,11 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm1,%rbx...");
+#ifndef __clang__
     if ( stack_exec && cpu_has_avx )
     {
         decl_insn(vmovq_to_reg);
@@ -3920,6 +3963,7 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+#endif
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm22,%rbx...");
-- 
2.47.3


