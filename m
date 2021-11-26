Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDA345EEAB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232819.403911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawo-0000do-5t; Fri, 26 Nov 2021 13:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232819.403911; Fri, 26 Nov 2021 13:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawm-00009T-VO; Fri, 26 Nov 2021 13:07:24 +0000
Received: by outflank-mailman (input) for mailman id 232819;
 Fri, 26 Nov 2021 13:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqav3-0003W9-E5
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89df46d3-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:33 +0100 (CET)
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
X-Inumbo-ID: 89df46d3-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ih31JwK4ZhE/5fbqj/U4g/nJspiAVJIOtl0WbTPrTf0=;
  b=dnkpZw9By2ciYTOoif79R0RC1YKV36CdVT/xSCa/CWU+75u4X9OfGsLe
   yYPWo55WdUBXCYKtmm5UJZJlDSDQ6zV4ECeKr2WQIYZaDZZDfnh4+DoQX
   QS7hbwXJBSB2SqdePzow38zOgk+OmqqSp1WKbbpJ6KQwXhQ3xdDZJW3xF
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oQYG/ml5g7RQdhWOqKM8ehXsmYO6tNQXLbV0T35CpvWN8fP4ijOePptef0de3U+4Fvw7E6Afgf
 fGJNLtDuXjRhHEIiLhWHLXHquZyiYbxWupRdqcXA1PNRxLfFao420lWf90R7S/IDcrqtUM3eid
 8c7JO4wYJy7LPHlNpjOfycW6PPCRspcv44CbZHZ/xam0uMCK2pemo2S0au7zgE8R3nyFLZntjU
 Zk9uNwcqpLNPxXQWwEGzO5nqhReeb0pvgiPIffjwbplAmVaBhHRNkzOe5UBOOVDJedORv00E3r
 lX3Qfv1Gy3wLpa7LfylUBek1
X-SBRS: 5.1
X-MesageID: 60695284
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GBM0VKLfPwP3pyKFFE+RHJIlxSXFcZb7ZxGr2PjKsXjdYENS0jEFm
 jZKUTzSPvyLamD8L9F/bozg8B8D6p/cz4NhHARlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Ygfpvk
 8d29qWLchhyZqvTvck0SglhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glo2JETR6aCD
 yYfQWA0ZSbEOwxgAFNUNdFuhuT3gmjmazIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCs7wA2RYFCKK4D0zqSkfLS/CO0L3EUd2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRONHNi2+AswGzARN8wGCxFQLpU
 J8swZX20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Lv2EgeRg4bphYIlcFh
 XM/XysKv/e/21PwMMdKj3+ZUZx2ncAM6/y5PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0DCrCjOXeOrtZIRb3IRFBiba3LRwVsXrbrCmJb9KsJUpc9GJstJN5ombp7jODN8
 i3vU0NU0gOn13bGNR+LejZob7a2BcRzqncyPCoNO1e02id8PdbzvflHL5ZnL6M68OFDzOJvS
 6VXccu3HfkSGC/M/C4QbMehodU6Jgirnw+HIwGsfCM7I8x7XwXM99K9Jlnv+SACAzCZr8w7p
 7H8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6epheJw/Cyz2W0
 xetLS0Z/eSd8ZUo9NTphLyfq9v7GeVJAUcHTXLQ6qy7NHeG8zP7k5NASuuBYRvUSHjwpPe5f
 exQwvzxbK8HkVJNv9YuGrpn1/tjtd7mprscxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOXbIt7hHX4QOBEhP7aK2vwjkzXP6eg4fRfh7yht8bvbCUhfMnFgUsCGwGeZ5G/9/
 dochQ==
IronPort-HdrOrdr: A9a23:DATMja9wuWdEpyQ097Juk+DLI+orL9Y04lQ7vn2ZKCYlEfBw+P
 rFoB1273LJYVUqOE3I++rvBEDoexq1nqKdh7N8AV7IZmjbUQWTQ72LKeDZsljd8+qUzJ8+6Z
 td
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="60695284"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 59/65] x86/traps: Rework write_stub_trampoline() to not hardcode the jmp
Date: Fri, 26 Nov 2021 12:34:40 +0000
Message-ID: <20211126123446.32324-60-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For CET-IBT, we will need to optionally insert an endbr64 instruction at the
start of the stub.  Don't hardcode the jmp displacement assuming that it
starts at byte 24 of the stub.

Also add extra comments describing what is going on.  The mix of %rax and %rsp
is far from trivial to follow.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/traps.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index d661d7ffcaaf..6f3c65bedc7a 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -293,30 +293,38 @@ static unsigned int write_stub_trampoline(
     unsigned char *stub, unsigned long stub_va,
     unsigned long stack_bottom, unsigned long target_va)
 {
+    unsigned char *p = stub;
+
+    /* Store guest %rax into %ss slot */
     /* movabsq %rax, stack_bottom - 8 */
-    stub[0] = 0x48;
-    stub[1] = 0xa3;
-    *(uint64_t *)&stub[2] = stack_bottom - 8;
+    *p++ = 0x48;
+    *p++ = 0xa3;
+    *(uint64_t *)p = stack_bottom - 8;
+    p += 8;
 
+    /* Store guest %rsp in %rax */
     /* movq %rsp, %rax */
-    stub[10] = 0x48;
-    stub[11] = 0x89;
-    stub[12] = 0xe0;
+    *p++ = 0x48;
+    *p++ = 0x89;
+    *p++ = 0xe0;
 
+    /* Switch to Xen stack */
     /* movabsq $stack_bottom - 8, %rsp */
-    stub[13] = 0x48;
-    stub[14] = 0xbc;
-    *(uint64_t *)&stub[15] = stack_bottom - 8;
+    *p++ = 0x48;
+    *p++ = 0xbc;
+    *(uint64_t *)p = stack_bottom - 8;
+    p += 8;
 
+    /* Store guest %rsp into %rsp slot */
     /* pushq %rax */
-    stub[23] = 0x50;
+    *p++ = 0x50;
 
     /* jmp target_va */
-    stub[24] = 0xe9;
-    *(int32_t *)&stub[25] = target_va - (stub_va + 29);
+    *p++ = 0xe9;
+    *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
+    p += 4;
 
-    /* Round up to a multiple of 16 bytes. */
-    return 32;
+    return p - stub;
 }
 
 DEFINE_PER_CPU(struct stubs, stubs);
-- 
2.11.0


