Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2547BDCDE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 14:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614362.955398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjn-0007yC-9M; Mon, 09 Oct 2023 12:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614362.955398; Mon, 09 Oct 2023 12:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjn-0007vX-5X; Mon, 09 Oct 2023 12:51:55 +0000
Received: by outflank-mailman (input) for mailman id 614362;
 Mon, 09 Oct 2023 12:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTJG=FX=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qppjl-0007s6-7M
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 12:51:53 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c46ed85-66a2-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 14:51:48 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31c5cac3ae2so4057909f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 05:51:48 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm9589576wru.35.2023.10.09.05.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 05:51:47 -0700 (PDT)
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
X-Inumbo-ID: 9c46ed85-66a2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696855908; x=1697460708; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nhjljp1hIYeTK8QNgAPsHEKUsnXQ5nu3twtO4N6FJQ8=;
        b=g6KASNx/Bog4uPepRD/A2p29Ni5PXtZQviC9mw0jQ2FyEbJqgBIC4ef3Uwqfy4pyTV
         czQzXvOl+qI+ZHjdojQfSTd6GHw0IVWjdJJdMVKlrXYCRFpzX+M+aKvzYo2OHuC35HfI
         lyk0DSYZ1FHt9RbRFMT35t0UFm6XXPa9zhJFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696855908; x=1697460708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nhjljp1hIYeTK8QNgAPsHEKUsnXQ5nu3twtO4N6FJQ8=;
        b=KwlOSQJl4I22deEogY5S3beZyF2+H/MQVb9i6efWRMVKqA48VotPzYVGm7GLlyh8sk
         YnNOQmJLnzBe5masAmzhura8jeOnAc3ZQF5/9KQMKu10F0UkzATsD7mkLZ4OWxfvRqcM
         Btu/zzMlvM137Niv+Ahn5Y8CIRAhymvwJXSLEVno5Bq45LpSPH2Fdbmgoy1LyWmgecru
         Pby8NUOGXD55xFB5Srqxnbvx4F+vTWLpWrzQTgNbWODSHxWHdQY4ODYkT7y1RCFdA0k0
         ax43WNztJSDcACdy1JlohYHxNaMVXAMStmwhtSzeJ1klevumwHaYp7SBWxiDp6Q+Sk7h
         sSug==
X-Gm-Message-State: AOJu0YyA+wPP4G4HLerib43CoLIFWl182OJkrrjfBuftCqI6IKzVcPRA
	LeHXyJc08JK0cHno6U2nkvJtwvuZygTvVxCjNU0=
X-Google-Smtp-Source: AGHT+IGAIWOrXAv49CGPWktBV8PFQWL29FrsyRsuJ2gKs92LU+0NH/i0uCDvwzkLHmCwqrXMt+hN3Q==
X-Received: by 2002:a05:6000:110b:b0:31f:a259:73c with SMTP id z11-20020a056000110b00b0031fa259073cmr13213365wrw.27.1696855908096;
        Mon, 09 Oct 2023 05:51:48 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiodakou <xenia.ragiadakou@amd.com>
Subject: [PATCH for-4.18 4/5] xenalyze: Fix interrupt EIP reporting
Date: Mon,  9 Oct 2023 13:51:36 +0100
Message-Id: <20231009125137.1329146-5-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009125137.1329146-1-george.dunlap@cloud.com>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EIP lists are generalized across several use cases.  For many of them,
it make sense to have a cycle per sample; but not really for interrupt
EIP lists.  For this reason, it normally just passes 0 as for the tsc
value, which will in turn down at the bottom of update_cycles(),
update only the summary.event_count, but nothing else.

The dump_eip() function attempted to handle this by calling the generic
cycle print handler if the summary contained *any* cycles, and by collecting
and printing its own stats, based solely on counts, if not.

Unfortunately, it used the wrong element for this: it collected the
total from samples.count rather samples.event_count; in the case that
there are no cycles, this will always be zero.  It then divided by
this zero value.  This results in output that looked like this:

```
  ffff89d29656                                             :        0  -nan%
  ffff89d298b6                                             :        0  -nan%
  ffff89d298c0                                             :        0  -nan%
```

It's better than nothing, but a lot less informative than one would
like.

Use event_count rather than count for collecting the total, and the
reporting when there are no cycles in the summary information.  This results
in output that looks like this:

```
   ffff89d29656                                             :        2  1.21%
   ffff89d298b6                                             :        1  0.61%
   ffff89d298c0                                             :        1  0.61%
```

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
Rationale: This is a bug fix.  It's a minor one, but it's also in a
non-critical part of the code.

CC: Anthony Perard <anthony.perard@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Xenia Ragiodakou <xenia.ragiadakou@amd.com>
---
 tools/xentrace/xenalyze.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 2faf66500d..4b6db59d87 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -2866,7 +2866,7 @@ void dump_eip(struct eip_list_struct *head) {
 
     for(p=head; p; p=p->next)
     {
-        total += p->summary.count;
+        total += p->summary.event_count;
         N++;
     }
 
@@ -2901,8 +2901,8 @@ void dump_eip(struct eip_list_struct *head) {
                           p->eip,
                           find_symbol(p->eip));
             printf(" %7d %5.2lf%%\n",
-                   p->summary.count,
-                   ((double)p->summary.count*100)/total);
+                   p->summary.event_count,
+                   ((double)p->summary.event_count*100)/total);
         }
 
 
-- 
2.25.1


