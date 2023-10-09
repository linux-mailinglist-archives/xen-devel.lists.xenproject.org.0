Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C37BDCDD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 14:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614360.955375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjh-0007GI-Ld; Mon, 09 Oct 2023 12:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614360.955375; Mon, 09 Oct 2023 12:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjh-0007BN-HT; Mon, 09 Oct 2023 12:51:49 +0000
Received: by outflank-mailman (input) for mailman id 614360;
 Mon, 09 Oct 2023 12:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTJG=FX=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qppjg-00078l-HL
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 12:51:48 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b0f8110-66a2-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 14:51:46 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3231d6504e1so4169940f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 05:51:46 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm9589576wru.35.2023.10.09.05.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 05:51:45 -0700 (PDT)
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
X-Inumbo-ID: 9b0f8110-66a2-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696855906; x=1697460706; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6stkbuoMjurJJxIep2GjOtQsiPgi52HYjGuQHL8XeTA=;
        b=UkwUn+FIuR+viR52eNz1ac04R4sbTeOiJyacIMZ4XTIkFtKpfF6OFY2BvzCCi2nZ4K
         4cdLS3GE4lL+BtbmnkQayh3EG+0h5MlL6G0YefndyYQfu+s253UQa6L5va9AIFwhLymI
         0/GEQrAOlwLUOaPQ6ewFiZJyGHd3jS4ubhI5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696855906; x=1697460706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6stkbuoMjurJJxIep2GjOtQsiPgi52HYjGuQHL8XeTA=;
        b=hWTGRbPc1WXA1Jjy+tkdnk39Wxn1Bg+2uqI5SPxEkKdtb4dT+0hxhLe8GB4YWWHSMI
         Gbm2v3NHadNubN+u1F5KZ2JgbiE9/VDx84aJDZt3+TuzVt+IOIFJXgpe8z2Q5uWTld02
         RlFam3QEVl3ZVYzHaaYE8AK3MKJ85UWUY3HJb2Uf2SxGITHDo0nZvsDB/MmBBgR4kMMV
         tSlxJFYo86DwybE2sT84OGvvV+34WcpAJ5fKCg3oySkg3e39bUHH221RxTEyGIA/0nri
         UEEA/10NKLvVEucOWZuocbNUGYUZnFNLShBWpqV+/yXEA4qlZ6vi3HF2rJC6I3qj19o2
         vCpg==
X-Gm-Message-State: AOJu0YxdbuprtNlDIZX7wbm+i0AuGYT/o3Hj5SOy2w9loNblAiyqtq48
	43aqkqXdZeenGzPpG5Df+J//9G8JFRgad66rYmI=
X-Google-Smtp-Source: AGHT+IHlGUQPPC9qfmT0Qyh34OC4lfMNEfG2cjBVEKz0WNNE916f49D85GHpAAladmXXCTSP3Uq15Q==
X-Received: by 2002:a5d:4cc3:0:b0:31f:e761:d47c with SMTP id c3-20020a5d4cc3000000b0031fe761d47cmr13041144wrt.32.1696855906074;
        Mon, 09 Oct 2023 05:51:46 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiodakou <xenia.ragiadakou@amd.com>
Subject: [PATCH for-4.18 1/5] xenalyze: Only accumulate data from one vmexit without a handler
Date: Mon,  9 Oct 2023 13:51:33 +0100
Message-Id: <20231009125137.1329146-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009125137.1329146-1-george.dunlap@cloud.com>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a vmentry/exit arc unexpectedly doesn't have a handler, we throw an
error, and then log the information under HVM event 0; thus those
particular traces within the vmexit reason will have stats gathered,
and will show up with "(no handler)".  This is useful in the event
that there are unusual paths through the hypervisor which don't have
trace points.

However, if there are more than one of these, then although we detect and warn
that this is happening, we subsequently continue to stuff data about all exits
into that one exit, even though we only show it in one place.

Instead, refator things to only allow a single exit reason to be
accumulated into any given event.

Also put a comment explaining what's going on, and how to fix it.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
Release justification: This is a bug fix; a minor one, but also in a
non-critical part of the code.

CC: Anthony Perard <anthony.perard@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Xenia Ragiodakou <xenia.ragiadakou@amd.com>
---
 tools/xentrace/xenalyze.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 4cb67062c9..1359e096f9 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -4652,6 +4652,19 @@ void hvm_generic_postprocess(struct hvm_data *h)
                       ? "[clipped]"
                       : h->exit_reason_name[h->exit_reason]);
             warned[h->exit_reason]=1;
+
+            /* 
+             * NB that we don't return here; the result will be that `evt`
+             * will be "0", and there will be a "(no handler)" entry for the
+             * given VMEXIT.
+             * 
+             * This does mean that if two different exits have no HVM
+             * handlers, that only the first one will accumulate data;
+             * if accumulating a separate "(no handler)" data for more
+             * than one exit reason is needed, we'll have to make Yet
+             * Another Array.  But for now, since we try to avoid
+             * it happening, just tolerate it.
+             */ 
         }
     }
 
@@ -4664,18 +4677,19 @@ void hvm_generic_postprocess(struct hvm_data *h)
     }
 
     if(opt.summary_info) {
-        update_cycles(&h->summary.generic[evt],
-                       h->arc_cycles);
-
         /* NB that h->exit_reason may be 0, so we offset by 1 */
         if ( registered[evt] )
         {
             static unsigned warned[HVM_EXIT_REASON_MAX] = { 0 };
-            if ( registered[evt] != h->exit_reason+1 && !warned[h->exit_reason])
+            if ( registered[evt] != h->exit_reason+1 )
             {
-                fprintf(warn, "%s: HVM evt %lx in %x and %x!\n",
-                        __func__, evt, registered[evt]-1, h->exit_reason);
-                warned[h->exit_reason]=1;
+                if ( !warned[h->exit_reason] )
+                {
+                    fprintf(warn, "%s: HVM evt %lx in %x and %x!\n",
+                            __func__, evt, registered[evt]-1, h->exit_reason);
+                    warned[h->exit_reason]=1;
+                }
+                return;
             }
         }
         else
@@ -4686,7 +4700,11 @@ void hvm_generic_postprocess(struct hvm_data *h)
                         __func__, ret);
             registered[evt]=h->exit_reason+1;
         }
-        /* HLT checked at hvm_vmexit_close() */
+
+        update_cycles(&h->summary.generic[evt],
+                       h->arc_cycles);
+
+       /* HLT checked at hvm_vmexit_close() */
     }
 }
 
-- 
2.25.1


