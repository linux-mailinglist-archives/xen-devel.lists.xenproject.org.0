Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ABA3977BE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135023.251221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71H-0001J8-H5; Tue, 01 Jun 2021 16:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135023.251221; Tue, 01 Jun 2021 16:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71H-0001G5-A0; Tue, 01 Jun 2021 16:13:31 +0000
Received: by outflank-mailman (input) for mailman id 135023;
 Tue, 01 Jun 2021 16:13:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70W-0005X1-1K
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:44 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 278042e2-4acd-4f2f-8a00-3bcb9a4b4a4d;
 Tue, 01 Jun 2021 16:11:47 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBg1Bh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:42 +0200 (CEST)
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
X-Inumbo-ID: 278042e2-4acd-4f2f-8a00-3bcb9a4b4a4d
ARC-Seal: i=1; a=rsa-sha256; t=1622563902; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GeSymt4sBAtamqwu9Qf/zyFLkpCxODm6nO9s0ZiWqB94QdYonpmCondOY39DJhz7ab
    2M7Qu2AfX6KGmOO5H4L26EKPFJ4xTciT6GYke96FK3x6yOTCc6jwxMBzay/YP4RB/AS+
    nczvhI0gIHZfwKjJxHpPH2jiLTpgLSUmaRyHs3rFbK0TEKbZFb8dreXvElyKslcUoe5m
    AfyG9O2TsHZCnwIJwpxMLJ0KaAfW3dMgw2YZhSTehyGN7IJLjYq2pu4PuPSe/oXGAtcB
    1tcxssT/fo5jwJCEjwNY5ascx/5HesM9L3HQ0QF1n3pyDXmiej6NCkWQaVeSLY/6WUl0
    xsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563902;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6EezNi5nT36Er9YZKB+7tjmR7V8p17EAGCb3I0QL+5s=;
    b=UskJ41eWQFyxIqoSJ0UbrO2OZY0O5JRSH8qP2FMg5ktabG6ppN1i4yMHUb9fw7QZ77
    r6dV0UWdB16t2j+k94SZBhdhH7wqyWVBXcWjNSdR4kqmeWprjxyUnTYCM0/9jWUBBXTJ
    4MQE0HgWaXpQ9VHFxHTydxG6o4SCu4tYb9TJbcss4feKjK4mQiSqfc/BkLBElPYYKP/V
    96Fl0XaAmmqUykmd0UJjaSjitivygCRbB5GRQoIJqujhlvJ1x/SCd1+1z2Ev9K14tShO
    dEr+2jH7f+WKL4IaEKhAfjk2lwlh5MyZ7O9FFbdgJneEVG1g38AFwJLzXLjmp6BIw77k
    cF4g==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563902;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6EezNi5nT36Er9YZKB+7tjmR7V8p17EAGCb3I0QL+5s=;
    b=VYpxfqnSD8t0H6aLBhP5dxoK9sO90LouyqSEYxfqVVwdyE4vcLV6MnyJnAqJ6CxYB2
    iwgHF/J1IbQ7JQsfUaaMdOOs18zBBwqsFzp4e5naiSodmW9pGH8KzCZgd6Ylzf3y5Tly
    gTY15o14NCLZruKyIEwJ57UFGnKF6NPZX2QRzfJMppSrmMfU6NoW+WgSq1Uk+7q+nSaF
    XoNIQiQXQoiD8+OygNVgWo2teoYUGCvs2T/jfdNqftXE32ARgJGoYOn9R3d1yeYpBaUW
    9V5sp/L587S/AAOdyAb2r4le07PGPs+gLKrlsApjmYE+s9I6pM7wGo84vWqzqQRvTzdI
    3FEw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 37/38] tools: remove migration stream verify code
Date: Tue,  1 Jun 2021 18:11:17 +0200
Message-Id: <20210601161118.18986-38-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The verify code tries to make sure the transferred pages from the paused
domU were received correctly in the previous, final iteration. Every
page is transferred once again by the sender, the receiver compares the
content with what is already mapped into the not-yet started domU.

This does unfortunately not work because a domU has also a number of
pages in its grant table, so that frondend drivers can communicate with
the backend drivers. Since the backend drivers are unaware about the
ongoing saving of the domU, they will continue to write into the shared
pages. As a result the verification of the domU pages will fail.

This is not fixable, so remove the verification code.

The sending side will never send a REC_TYPE_VERIFY record again. It will
silently accept, and ignore the debug flag.

The receiving side will abort an almost complete migration in case it
sees a REC_TYPE_VERIFY record from an old sender. That record is sent at
the very end, it has no way to know in advance that verification was
requested.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  |  7 ------
 tools/libs/saverestore/restore.c | 43 ++++----------------------------
 tools/libs/saverestore/save.c    | 43 --------------------------------
 3 files changed, 5 insertions(+), 88 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index b323c1b71a..b8ca24e667 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -354,9 +354,6 @@ struct xc_sr_context
             /* Live migrate vs non live suspend. */
             bool live;
 
-            /* Further debugging information in the stream. */
-            bool debug;
-
             unsigned long p2m_size;
             size_t pages_sent;
             size_t overhead_sent;
@@ -418,10 +415,6 @@ struct xc_sr_context
             /* Bitmap of currently populated PFNs during restore. */
             struct xg_sr_bitmap populated_pfns;
 
-            /* Sender has invoked verify mode on the stream. */
-            bool verify;
-            void *verify_buf;
-
             struct xc_sr_restore_arrays *m;
             void *guest_mapping;
             uint32_t nr_mapped_pages;
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index d4657e8e57..9a7253a972 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -337,10 +337,7 @@ static int handle_incoming_page_data(struct xc_sr_context *ctx,
             continue;
 
         m->iov[iov_idx].iov_len = PAGE_SIZE;
-        if ( ctx->restore.verify )
-            m->iov[iov_idx].iov_base = ctx->restore.verify_buf + i * PAGE_SIZE;
-        else
-            m->iov[iov_idx].iov_base = m->guest_data[i];
+        m->iov[iov_idx].iov_base = m->guest_data[i];
         iov_idx++;
     }
 
@@ -369,15 +366,6 @@ static int handle_incoming_page_data(struct xc_sr_context *ctx,
 
         }
 
-        if ( ctx->restore.verify )
-        {
-            if ( memcmp(m->guest_data[i], m->iov[iov_idx].iov_base, PAGE_SIZE) )
-            {
-                ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
-                      m->pfns[i], m->types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
-            }
-        }
-
         iov_idx++;
     }
 
@@ -447,20 +435,7 @@ static int handle_buffered_page_data(struct xc_sr_context *ctx,
 
         }
 
-        if ( ctx->restore.verify )
-        {
-            if ( memcmp(m->guest_data[i], p, PAGE_SIZE) )
-            {
-                errno = EIO;
-                ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
-                      m->pfns[i], m->types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
-                goto err;
-            }
-        }
-        else
-        {
-            memcpy(m->guest_data[i], p, PAGE_SIZE);
-        }
+        memcpy(m->guest_data[i], p, PAGE_SIZE);
 
         idx++;
     }
@@ -737,17 +712,9 @@ static int process_buffered_record(struct xc_sr_context *ctx, struct xc_sr_recor
         break;
 
     case REC_TYPE_VERIFY:
-        DPRINTF("Verify mode enabled");
-        ctx->restore.verify = true;
-        if ( !ctx->restore.verify_buf )
-        {
-            ctx->restore.verify_buf = malloc(MAX_BATCH_SIZE * PAGE_SIZE);
-            if ( !ctx->restore.verify_buf )
-            {
-                rc = -1;
-                PERROR("Unable to allocate verify_buf");
-            }
-        }
+        errno = EINVAL;
+        PERROR("Verify mode is obsolete");
+        rc = -1;
         break;
 
     case REC_TYPE_CHECKPOINT:
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 523457eaba..2d34822509 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -707,41 +707,6 @@ static int suspend_and_send_dirty(struct xc_sr_context *ctx)
     return rc;
 }
 
-static int verify_frames(struct xc_sr_context *ctx)
-{
-    xc_interface *xch = ctx->xch;
-    xc_shadow_op_stats_t stats = { 0, ctx->save.p2m_size };
-    int rc;
-    struct xc_sr_record rec = { .type = REC_TYPE_VERIFY };
-
-    DPRINTF("Enabling verify mode");
-
-    rc = write_record(ctx, &rec);
-    if ( rc )
-        goto out;
-
-    xc_set_progress_prefix(xch, "Frames verify");
-    rc = send_all_pages(ctx);
-    if ( rc )
-        goto out;
-
-    if ( xc_shadow_control(
-             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_PEEK,
-             &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-             NULL, 0, &stats) != ctx->save.p2m_size )
-    {
-        PERROR("Failed to retrieve logdirty bitmap");
-        rc = -1;
-        goto out;
-    }
-
-    DPRINTF("  Further stats: faults %u, dirty %u",
-            stats.fault_count, stats.dirty_count);
-
- out:
-    return rc;
-}
-
 /*
  * Send all domain memory.  This is the heart of the live migration loop.
  */
@@ -761,13 +726,6 @@ static int send_domain_memory_live(struct xc_sr_context *ctx)
     if ( rc )
         goto out;
 
-    if ( ctx->save.debug )
-    {
-        rc = verify_frames(ctx);
-        if ( rc )
-            goto out;
-    }
-
  out:
     return rc;
 }
@@ -1005,7 +963,6 @@ int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
     /* GCC 4.4 (of CentOS 6.x vintage) can' t initialise anonymous unions. */
     ctx.save.callbacks = callbacks;
     ctx.save.live  = !!(flags & XCFLAGS_LIVE);
-    ctx.save.debug = !!(flags & XCFLAGS_DEBUG);
     ctx.save.recv_fd = recv_fd;
 
     if ( xc_domain_getinfo(xch, dom, 1, &ctx.dominfo) != 1 )

