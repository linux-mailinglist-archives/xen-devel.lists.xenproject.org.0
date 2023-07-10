Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F6074E5C0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 06:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561379.877969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ4rN-0006tP-Pe; Tue, 11 Jul 2023 04:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561379.877969; Tue, 11 Jul 2023 04:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ4rN-0006m3-MF; Tue, 11 Jul 2023 04:20:21 +0000
Received: by outflank-mailman (input) for mailman id 561379;
 Mon, 10 Jul 2023 19:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6PHc=C4=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qIwVJ-0005bW-3T
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 19:25:01 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75dd6d1f-1f57-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 21:24:59 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99364ae9596so627397366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 12:24:59 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a170906480f00b0096a6be0b66dsm110076ejq.208.2023.07.10.12.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 12:24:58 -0700 (PDT)
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
X-Inumbo-ID: 75dd6d1f-1f57-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689017099; x=1691609099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jAJrLaj81nDh4wW1pP27vJFmY8UiJKSEaQ+/Hb04Nc=;
        b=hnX3o4peRysHE4PlLHbB9M+JugRMzR7VVp6giACiIXm0TS66MpvDNrmpEM20fnHH2A
         oSFUd0VYZ/MdWgmzGsmXue6dq2b+VMz3GxtLT1LjmN2vOJPTyB1MlJVUP4Zg1582I7Ih
         bvByd4d2/2KrUOhapdZ5gYfpSGWLMwWzS/Wj/NbCJxGevCFI9QeDcs9Auy4zAcVQ/Tf8
         inx384WtL7/fUnA4qAcq/gmiQWcOE2I+2JT4Su/1IT5W/UTbkLOtSMHLNoEqNw2olwUV
         YBlaAEf7Uv05hM5H6jTxldHdo0TkB+So0trN2HA+X0Z1MAsWYaG52b6cC+vifMgd8TY2
         hLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689017099; x=1691609099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jAJrLaj81nDh4wW1pP27vJFmY8UiJKSEaQ+/Hb04Nc=;
        b=RRtbJCctKJmNo0eKgvj1WDRPlq+xdKEl+H8XbAYhmYSeReeiS4KMZoatnLrpU7l6/z
         ux94NcTHCjBC6FUCwx4TsallS7KHZMr4bzT/gm+15e8gQB1gsYSviI4RQP3qoLOom/YZ
         5bqmWAxDEKQHgkhlZaLjyewgYtpSFYG+m1JtXn5WySCLzWY9J7+K7GvjijUZfAF3W4FA
         A3P8UsWpWThHCG1J7Ko2w7tw576M0Rf8As7CyzJv5iU3VhYi5WkggAF7rsOi5uYfR+AU
         mxHxyGAJFQgxxeYVl1smHhodXXs0g8VvQFjpY/wVmnNhNQYm1eDKSfi2YSP6DvhVJIh1
         w2nQ==
X-Gm-Message-State: ABy/qLaqg4WIvLUwVSVipAj6v2k4lGmOm23bTpnNdJPUQIzbV+yVj5aN
	aXoPt4Mb8mP6NIhD88HHrBE=
X-Google-Smtp-Source: APBJJlHwVT5frp02REiaP08Tw2FykEOwGxdLWWsPCiw5aMtj6jXyTUwf06D5IHzSoxQJfVL+VWOmXA==
X-Received: by 2002:a17:906:5307:b0:993:f996:52d3 with SMTP id h7-20020a170906530700b00993f99652d3mr6394846ejo.25.1689017099074;
        Mon, 10 Jul 2023 12:24:59 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH 3/3] xen: Illustrate the transition to sync_try_cmpxchg
Date: Mon, 10 Jul 2023 21:21:56 +0200
Message-ID: <20230710192440.47140-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710192440.47140-1-ubizjak@gmail.com>
References: <20230710192440.47140-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch illustrates the transition to sync_try_cmpxchg.
It is not intended to be merged as-is.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 drivers/xen/events/events_fifo.c | 26 ++++++++++++--------------
 drivers/xen/grant-table.c        | 10 ++++------
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/xen/events/events_fifo.c b/drivers/xen/events/events_fifo.c
index ad9fe51d3fb3..655775db7caf 100644
--- a/drivers/xen/events/events_fifo.c
+++ b/drivers/xen/events/events_fifo.c
@@ -226,21 +226,20 @@ static bool evtchn_fifo_is_masked(evtchn_port_t port)
  */
 static bool clear_masked_cond(volatile event_word_t *word)
 {
-	event_word_t new, old, w;
+	event_word_t new, old;
 
-	w = *word;
+	old = *word;
 
 	do {
-		if (!(w & (1 << EVTCHN_FIFO_MASKED)))
+		if (!(old & (1 << EVTCHN_FIFO_MASKED)))
 			return true;
 
-		if (w & (1 << EVTCHN_FIFO_PENDING))
+		if (old & (1 << EVTCHN_FIFO_PENDING))
 			return false;
 
-		old = w & ~(1 << EVTCHN_FIFO_BUSY);
+		old = old & ~(1 << EVTCHN_FIFO_BUSY);
 		new = old & ~(1 << EVTCHN_FIFO_MASKED);
-		w = sync_cmpxchg(word, old, new);
-	} while (w != old);
+	} while (!sync_try_cmpxchg(word, &old, new));
 
 	return true;
 }
@@ -259,17 +258,16 @@ static void evtchn_fifo_unmask(evtchn_port_t port)
 
 static uint32_t clear_linked(volatile event_word_t *word)
 {
-	event_word_t new, old, w;
+	event_word_t new, old;
 
-	w = *word;
+	old = *word;
 
 	do {
-		old = w;
-		new = (w & ~((1 << EVTCHN_FIFO_LINKED)
-			     | EVTCHN_FIFO_LINK_MASK));
-	} while ((w = sync_cmpxchg(word, old, new)) != old);
+		new = (old & ~((1 << EVTCHN_FIFO_LINKED)
+			       | EVTCHN_FIFO_LINK_MASK));
+	} while (!sync_try_cmpxchg(word, &old, new));
 
-	return w & EVTCHN_FIFO_LINK_MASK;
+	return old & EVTCHN_FIFO_LINK_MASK;
 }
 
 static void consume_one_event(unsigned cpu, struct evtchn_loop_ctrl *ctrl,
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index e1ec725c2819..211d083d4fbe 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -427,16 +427,14 @@ EXPORT_SYMBOL_GPL(gnttab_grant_foreign_access);
 
 static int gnttab_end_foreign_access_ref_v1(grant_ref_t ref)
 {
-	u16 flags, nflags;
-	u16 *pflags;
+	u16 *pflags = &gnttab_shared.v1[ref].flags;
+	u16 flags;
 
-	pflags = &gnttab_shared.v1[ref].flags;
-	nflags = *pflags;
+	flags = *pflags;
 	do {
-		flags = nflags;
 		if (flags & (GTF_reading|GTF_writing))
 			return 0;
-	} while ((nflags = sync_cmpxchg(pflags, flags, 0)) != flags);
+	} while (!sync_try_cmpxchg(pflags, &flags, 0));
 
 	return 1;
 }
-- 
2.41.0


