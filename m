Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC139779D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134984.251038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6za-00070t-53; Tue, 01 Jun 2021 16:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134984.251038; Tue, 01 Jun 2021 16:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zZ-0006xx-S2; Tue, 01 Jun 2021 16:11:45 +0000
Received: by outflank-mailman (input) for mailman id 134984;
 Tue, 01 Jun 2021 16:11:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zX-0005X1-Vi
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:44 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.169])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81fbc3a2-15f3-4487-9727-c00067a00375;
 Tue, 01 Jun 2021 16:11:35 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBT1BE
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:29 +0200 (CEST)
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
X-Inumbo-ID: 81fbc3a2-15f3-4487-9727-c00067a00375
ARC-Seal: i=1; a=rsa-sha256; t=1622563889; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=T9QrHmjHticlOV5jT7XpL4jjdUnulJExOzssvTbvpX60wpSvZyO9ov7fUxpNbmF8BL
    g07dtudMcsazpJVJFxnAvJ0CbMB9BwB15OtZKb1X8uciw2h0QuJ83AQPlANkVmLb2g4v
    G33hNxTSFxEdhnjfj02XcSWzxIEUDZ4nGpkAA9rcCFhzkhDZFpwT3WcmiFuoQmuLw3IG
    6cWPG3Reu162mWKvFoJxEAa+mkaFdJbX2F5fsdMSfWsKoAZWdQOFH3qJ24V4ZqpdPeE1
    7SN4X6IkVg7VThgmhP2BbycjHjK9pACxpySLHLuIgD7ZKeOc4s0i3ESTGfS/Hl1kAdNE
    evMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563889;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=5ichTSe1XRD84BJzTM12jbhc1IFgz0uXqluaqXpByoA=;
    b=ZPQOqOMWFGKx8XkLHojU2CYmvcs4NIy2WrFgZEttDQmjmZ4LtbvrlEZ2gqa+pswchB
    EDzF8134fStSRlndZTWwQGiYJ6V1AmvEPQKY7CkD12JbhcfC1JmGLSTqqFzbVThcwus3
    wSu/ety/n3pgDCTEoECb1PysUN94j0nG7++0jomdTJ0IaKCLQKZ6+e1HCdCYNlbZIMVt
    W+FJRjCSekYJWON/lcwSIxN509pB8KmgkAxhqcrFrqpRnu98S4X0jl7hgM4+3l1HqSks
    ORk8UFcL16IBOnWz03HzTJw2M4beoz58f/sAx+4h5GmIEe4Y+lN+OouKs6NNp/tgPhwn
    S4/Q==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563889;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=5ichTSe1XRD84BJzTM12jbhc1IFgz0uXqluaqXpByoA=;
    b=bEZ+OWbk1tg7oZ5SRTFU6lDhU0LescHmqXSi48yjAbmsag1gAtNFCZ0h6RNNgTIQFy
    Q3FuZO0dlhzO1Cayc4FQ/UECK8TL/8t88uUSoFtFWFthuQqBYjw3a/v0Oco8p/RFd79y
    BEP0tptNLxxaHJh4bHYzyXzwjG6xWXS0RX/Y7PaPGdqedIX493aOaSBYlIwfUDilNKww
    VNFWIGH8zwZT3pJ9Gr68GxZYh3cYncjKM/Vh7k4yndwB57NWvbwsq6D6XG709aAajm7e
    +otmb88g75ABukbnR7RMSWKCfis0KexEwArRWpWgMLo99Rw+c3spOa5vRzRWouLuiVud
    IeFQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 09/38] tools/guest: prepare to allocate arrays once
Date: Tue,  1 Jun 2021 18:10:49 +0200
Message-Id: <20210601161118.18986-10-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hotpath 'send_dirty_pages' is supposed to do just one thing: sending.
The other end 'handle_page_data' is supposed to do just receiving.

But instead both do other costly work like memory allocations and data moving.
Do the allocations once, the array sizes are a compiletime constant.
Avoid unneeded copying of data by receiving data directly into mapped guest memory.

This patch is just prepartion, subsequent changes will populate the arrays.

Once all changes are applied, migration of a busy HVM domU changes like that:

Without this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a20963b3 xen_testing):
2020-10-29 10:23:10.711+0000: xc: show_transfer_rate: 23663128 bytes + 2879563 pages in 55.324905335 sec, 203 MiB/sec: Internal error
2020-10-29 10:23:35.115+0000: xc: show_transfer_rate: 16829632 bytes + 2097552 pages in 24.401179720 sec, 335 MiB/sec: Internal error
2020-10-29 10:23:59.436+0000: xc: show_transfer_rate: 16829032 bytes + 2097478 pages in 24.319025928 sec, 336 MiB/sec: Internal error
2020-10-29 10:24:23.844+0000: xc: show_transfer_rate: 16829024 bytes + 2097477 pages in 24.406992500 sec, 335 MiB/sec: Internal error
2020-10-29 10:24:48.292+0000: xc: show_transfer_rate: 16828912 bytes + 2097463 pages in 24.446489027 sec, 335 MiB/sec: Internal error
2020-10-29 10:25:01.816+0000: xc: show_transfer_rate: 16836080 bytes + 2098356 pages in 13.447091818 sec, 609 MiB/sec: Internal error

With this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a20963b3 xen_unstable):
2020-10-28 21:26:05.074+0000: xc: show_transfer_rate: 23663128 bytes + 2879563 pages in 52.564054368 sec, 213 MiB/sec: Internal error
2020-10-28 21:26:23.527+0000: xc: show_transfer_rate: 16830040 bytes + 2097603 pages in 18.450592015 sec, 444 MiB/sec: Internal error
2020-10-28 21:26:41.926+0000: xc: show_transfer_rate: 16830944 bytes + 2097717 pages in 18.397862306 sec, 445 MiB/sec: Internal error
2020-10-28 21:27:00.339+0000: xc: show_transfer_rate: 16829176 bytes + 2097498 pages in 18.411973339 sec, 445 MiB/sec: Internal error
2020-10-28 21:27:18.643+0000: xc: show_transfer_rate: 16828592 bytes + 2097425 pages in 18.303326695 sec, 447 MiB/sec: Internal error
2020-10-28 21:27:26.289+0000: xc: show_transfer_rate: 16835952 bytes + 2098342 pages in 7.579846749 sec, 1081 MiB/sec: Internal error

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  | 8 ++++++++
 tools/libs/saverestore/restore.c | 8 ++++++++
 tools/libs/saverestore/save.c    | 4 +++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index f5fe23caad..80b2e878aa 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -223,6 +223,12 @@ static inline int update_blob(struct xc_sr_blob *blob,
     return 0;
 }
 
+struct xc_sr_save_arrays {
+};
+
+struct xc_sr_restore_arrays {
+};
+
 struct xc_sr_context
 {
     xc_interface *xch;
@@ -260,6 +266,7 @@ struct xc_sr_context
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            struct xc_sr_save_arrays *m;
         } save;
 
         struct /* Restore data. */
@@ -311,6 +318,7 @@ struct xc_sr_context
 
             /* Sender has invoked verify mode on the stream. */
             bool verify;
+            struct xc_sr_restore_arrays *m;
         } restore;
     };
 
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 700f9e74b5..a6cf9ee41c 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -739,6 +739,13 @@ static int setup(struct xc_sr_context *ctx)
     }
     ctx->restore.allocated_rec_num = DEFAULT_BUF_RECORDS;
 
+    ctx->restore.m = malloc(sizeof(*ctx->restore.m));
+    if ( !ctx->restore.m ) {
+        ERROR("Unable to allocate memory for arrays");
+        rc = -1;
+        goto err;
+    }
+
  err:
     return rc;
 }
@@ -757,6 +764,7 @@ static void cleanup(struct xc_sr_context *ctx)
         xc_hypercall_buffer_free_pages(
             xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->restore.p2m_size)));
 
+    free(ctx->restore.m);
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
 
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 760ca04a84..1662e3ee50 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -853,8 +853,9 @@ static int setup(struct xc_sr_context *ctx)
     ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
                                   sizeof(*ctx->save.batch_pfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+    ctx->save.m = malloc(sizeof(*ctx->save.m));
 
-    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.m || !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
@@ -886,6 +887,7 @@ static void cleanup(struct xc_sr_context *ctx)
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
     free(ctx->save.batch_pfns);
+    free(ctx->save.m);
 }
 
 /*

