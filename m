Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IICAnQmnGlfAAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:05:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC7174783
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238615.1540232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSoN-0007dX-KZ; Mon, 23 Feb 2026 10:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238615.1540232; Mon, 23 Feb 2026 10:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSoN-0007ZU-GE; Mon, 23 Feb 2026 10:05:07 +0000
Received: by outflank-mailman (input) for mailman id 1238615;
 Mon, 23 Feb 2026 10:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSoM-0007XS-2V
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:05:06 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fb2aa93-109f-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 11:05:05 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 7270741202FF;
 Mon, 23 Feb 2026 05:04:45 -0500 (EST)
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
X-Inumbo-ID: 1fb2aa93-109f-11f1-b164-2bf370ae4941
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/4] tools/tests/x86_emulator: avoid duplicating loop body
Date: Mon, 23 Feb 2026 10:04:53 +0000
Message-ID: <c0dc7da75ee36d10863a8b28fa2f19b3b4c8a316.1771840208.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771840208.git.edwin.torok@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.28 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url]
X-Rspamd-Queue-Id: AACC7174783
X-Rspamd-Action: no action

clang would duplicate the loop body and end up with a double definition
of the symbol:
```
/tmp/test_x86_emulator-0f3576.s:27823: Error: symbol `vmovsh_to_mem' is already defined
/tmp/test_x86_emulator-0f3576.s:27825: Error: symbol `.Lvmovsh_to_mem_end' is already defined
```

This is a valid transformation, that even GCC might do, see
https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Volatile-1 which
says that `%=` should be used instead. However the C code here also
needs to know the name of the label, so I don't immediately see how to
solve that.

For now mark the loop variable `volatile` to prevent the optimization as a
workaround.
(another way to fix this could be to move the loop body into a function,
but a compiler might inline it, or specialize it, leading to the same problem)

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/x86_emulator/test_x86_emulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tests/x86_emulator/test_x86_emulator.c b/tools/tests/x86_emulator/test_x86_emulator.c
index a25eca1634..cf4e5cc593 100644
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -5248,7 +5248,7 @@ int main(int argc, char **argv)
         memset(res + 3, ~0, 8);
         regs.eax = (unsigned long)res;
         regs.ecx = ~0;
-        for ( i = 0; i < 2; ++i )
+        for (volatile int i = 0; i < 2; ++i )
         {
             decl_insn(vmovsh_to_mem);
 
-- 
2.47.3


