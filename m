Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6A28A8617
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707554.1105588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Q5-0005KB-0a; Wed, 17 Apr 2024 14:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707554.1105588; Wed, 17 Apr 2024 14:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Q4-0005HQ-TM; Wed, 17 Apr 2024 14:37:52 +0000
Received: by outflank-mailman (input) for mailman id 707554;
 Wed, 17 Apr 2024 14:37:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNGY=LW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rx6Q4-0004w5-5q
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:37:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1009bbc9-fcc8-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 16:37:50 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713364646408459.7510772310741;
 Wed, 17 Apr 2024 07:37:26 -0700 (PDT)
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
X-Inumbo-ID: 1009bbc9-fcc8-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1713364648; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fiW719O+jy6AkTMMrnoTdKzP/YeOnARtF3DjH02aysdQTY/TSWIARARBKKpdp6JF0e9hc6Ba0N8sU8vgqXx4Fei3990JSGoBlcfa0G1mwb1HB/RRN9Tjy4Nkk5C8PIzEzgsJwDF4ObGMjDcOsXhoNOWEqpZlsDzYcgZb0OUKmQw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713364648; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8+kt8iMSGPzyGhHCaIhcFst+HrU8xeK5CDMlGfOE44I=; 
	b=S0jnYwjsyEYHuvpb2LknHXGOqECg3e8mG0+gC70PCB+fH0astSedWAjg0LKBAueGh9cZphvBQ92h+sOUH6ZJiklZBGFwp5QXh/jV188haLefNx8ci+MYblz01mFirEaBAu/34M/gTMQ8to032UuKY55vOIHYuHHQ2GyWnbPdKjs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713364648;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=8+kt8iMSGPzyGhHCaIhcFst+HrU8xeK5CDMlGfOE44I=;
	b=oNn1170Q+4NC/ObBtwvQnY4jFWlgHc73x042n1pn+8VVkeIzfGYo3hlee2qae8yI
	BUQUCUYBeAFjOB5fuvdN6V3FW5QnNyn36xG0ZqHg6Fow2/NP1+2wYJpXMFDla7Qhy5g
	gUlEk1C/Jpu1sT7U+XZjSDJ/Ib4N6TN90z4uUbgs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/6] gzip: drop unused define checks
Date: Wed, 17 Apr 2024 10:37:11 -0400
Message-Id: <20240417143716.27189-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240417143716.27189-1-dpsmith@apertussolutions.com>
References: <20240417143716.27189-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Dropping the define checks for PKZIP_BUG_WORKAROUND and NOMEMCPY define as they
never are set.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/inflate.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 58f263d9e852..e95db2de4d9b 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -661,7 +661,6 @@ static int __init inflate_codes(
                 /* do the copy */
                 do {
                     n -= (e = (e = WSIZE - ((d &= WSIZE-1) > w ? d : w)) > n ? n : e);
-#if !defined(NOMEMCPY) && !defined(DEBUG)
                     if (w - d >= e)         /* (this test assumes unsigned comparison) */
                     {
                         memcpy(slide + w, slide + d, e);
@@ -669,7 +668,6 @@ static int __init inflate_codes(
                         d += e;
                     }
                     else                      /* do it slow to avoid memcpy() overlap */
-#endif /* !NOMEMCPY */
                         do {
                             slide[w++] = slide[d++];
                             Tracevv((stderr, "%c", slide[w-1]));
@@ -845,11 +843,7 @@ static int noinline __init inflate_dynamic(void)
 
     DEBG("<dyn");
 
-#ifdef PKZIP_BUG_WORKAROUND
-    ll = malloc(sizeof(*ll) * (288+32));  /* literal/length and distance code lengths */
-#else
     ll = malloc(sizeof(*ll) * (286+30));  /* literal/length and distance code lengths */
-#endif
 
     if (ll == NULL)
         return 1;
@@ -869,11 +863,7 @@ static int noinline __init inflate_dynamic(void)
         NEEDBITS(4)
         nb = 4 + ((unsigned)b & 0xf);         /* number of bit length codes */
     DUMPBITS(4)
-#ifdef PKZIP_BUG_WORKAROUND
-        if (nl > 288 || nd > 32)
-#else
             if (nl > 286 || nd > 30)
-#endif
             {
                 ret = 1;             /* bad lengths */
                 goto out;
@@ -989,16 +979,11 @@ static int noinline __init inflate_dynamic(void)
         DEBG("dyn5d ");
         if (i == 1) {
             error("incomplete distance tree");
-#ifdef PKZIP_BUG_WORKAROUND
-            i = 0;
-        }
-#else
         huft_free(td);
     }
     huft_free(tl);
     ret = i;                   /* incomplete code set */
     goto out;
-#endif
 }
 
 DEBG("dyn6 ");
-- 
2.30.2


