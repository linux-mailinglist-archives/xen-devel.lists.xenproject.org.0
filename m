Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673688A8627
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707570.1105638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6RD-0007rG-EJ; Wed, 17 Apr 2024 14:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707570.1105638; Wed, 17 Apr 2024 14:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6RD-0007oQ-Ay; Wed, 17 Apr 2024 14:39:03 +0000
Received: by outflank-mailman (input) for mailman id 707570;
 Wed, 17 Apr 2024 14:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNGY=LW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rx6RC-0004w5-8J
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:39:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39d23e12-fcc8-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 16:39:00 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713364653140328.45670023206253;
 Wed, 17 Apr 2024 07:37:33 -0700 (PDT)
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
X-Inumbo-ID: 39d23e12-fcc8-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1713364655; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GQUI1Xad/9W+P86/QcwV2bVy5l9v8UjrYvnPNS6etEkyZOILzBph9gqpzUQcCrG6GN8lR10G35FA3tOetf7IZfdLrV44ZqrkJz8ckUz0nMZaDL5xvQ56/oW8DTsqt/Lkka9a3AtvGN+iGA2xGZWi+ogNuDtV7wdeFIEMxwHBnSA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713364655; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zy3QMlmFlvRnd4VIdLPcMDUc+UIQW7lW3Z2AoT0uE1Y=; 
	b=R6p8+5CjDPaXgWndfHry9vJ53WpopLeRCvmsmRkG+r+Ob8pyRaIJa87G6mC3l6plTcOcKkaKouBuPMDz+T0n1OU2jbUz/EoCg9zkAMlRvvjqFXsuOqt60Mg472kcVITxPc2K3CzMVG04w9MPErH07emw+vU7hySrbd7VeQQvQXY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713364655;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=zy3QMlmFlvRnd4VIdLPcMDUc+UIQW7lW3Z2AoT0uE1Y=;
	b=Jh7txosGZD300ljMpQFAQ1HSXcJrvLC5+R3STBpwdDyIK05WaqCg8BGOn7reiIPZ
	ogslMgd3S5j0OwFDcL8VUXp68H1tcC28bVmJ0P80I+jf3OPP58C1hWF/qYYq5t/4IMi
	K5xMyzuon8pbGeX/ypIHXEDqvn0J0NyDCmrYIV8o=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 6/6] gzip: drop huffman code table tracking
Date: Wed, 17 Apr 2024 10:37:16 -0400
Message-Id: <20240417143716.27189-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240417143716.27189-1-dpsmith@apertussolutions.com>
References: <20240417143716.27189-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The "tracking" bits does not appear to be used, so dropping from the code.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/inflate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index c18ce20210b0..15bc187c2bbe 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -264,8 +264,6 @@ static const int dbits = 6;          /* bits in base distance lookup table */
 #define BMAX 16         /* maximum bit length of any code (16 for explode) */
 #define N_MAX 288       /* maximum number of codes in any set */
 
-static unsigned __initdata hufts;      /* track memory usage */
-
 /*
  * Given a list of code lengths and a maximum table size, make a set of
  * tables to decode that set of codes.  Return zero on success, one if
@@ -445,7 +443,6 @@ static int __init huft_build(
                     goto out;
                 }
                 DEBG1("4 ");
-                hufts += z + 1;         /* track memory usage */
                 *t = q + 1;             /* link to list for huft_free() */
                 *(t = &(q->v.t)) = (struct huft *)NULL;
                 u[h] = ++q;             /* table starts after link */
@@ -1028,15 +1025,12 @@ static int __init inflate(struct gzip_state *s)
     /* decompress until the last block */
     h = 0;
     do {
-        hufts = 0;
 #ifdef ARCH_HAS_DECOMP_WDOG
         arch_decomp_wdog();
 #endif
         r = inflate_block(s, &e);
         if (r)
             return r;
-        if (hufts > h)
-            h = hufts;
     } while (!e);
 
     /* Undo too much lookahead. The next read will be byte aligned so we
-- 
2.30.2


