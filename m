Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9191BB4ED
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHVX-0000cR-OF; Tue, 28 Apr 2020 04:06:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHVW-0000bQ-1q
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:06 +0000
X-Inumbo-ID: 8f39d6e0-8905-11ea-9887-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f39d6e0-8905-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 04:05:55 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id e17so12875241qtp.7
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cw7c/W+2mWKsQFqee8I2XqBHCRi5cVGdl4h/Cw+zkCI=;
 b=deeKyblR46LgGqs9LOHt2LrBIUW7UhBvbPlNksDocNlNzNQXfU0IRiWcxIj4fzHDvq
 +ZnbUyKwrkSubIidY3mhQDZ7mYKBnwLDbllr1DULYmbPtMCDo4mY07K2NFekai+aq1W0
 DuNJPDKdvX3hGjbdZSQ5ThdLfj5jsgmJb12UCM7+FTU8KxoeJYdSlHVzN+5+MmmJUWTE
 +PHzKolEnL61VD9ofKDuF3nJpdlHSD9oG4378SrNombZBkv8nn181IGhqHdS38Cqdr5N
 1cB52mtMUP4/+P/hO0ZwmiLsd5QdJB8ivXvVD877DJUYBr5KI3GVTe4csXLB0gWdRTn6
 F+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cw7c/W+2mWKsQFqee8I2XqBHCRi5cVGdl4h/Cw+zkCI=;
 b=FJdY94niJoIiLt54dQeyOVAIoWGwSoKwrTBEHMABJh8sjivSNeI6GLHJFLquf4BZbu
 Auof7MJnuPDNmshiNrJg1E1fFMYNwwVf8vxqJzHFytfnoUz53goDVFb9k9tOvPIvkUbu
 HTs093ilWoayBzwv0r8r519otfM3sA9DLj4O7qrYk0cKDwQC4z6Rj2svOM3UxLG+6G/w
 Mvf0NvfD668pmzhQ5njazHTMUilXEojaKmzXJhxEOt2IFodG0tpL1t6F0mqkdbl3PimG
 N4PXJ0gcxSSu1be5YSOXG9A3tbQpcnEft7WzNl6JdRLhJeJLiELnhM3gp0lZL0cWv59e
 x+iA==
X-Gm-Message-State: AGi0PuZWkCkkAk/cgYatK25CUBviJhi1HLmRboPQVzUtihoCToCkMkmz
 ngufZnZcpkJkTO8X+eSZh+/++vnd
X-Google-Smtp-Source: APiQypJehUmb9f9TUjkaI9CqrTXfXqqf+UmnSUDU0BrdPRFrcHyxJvAdCWseTeNJ8YwjyqRJyeHMug==
X-Received: by 2002:ac8:4757:: with SMTP id k23mr26167284qtp.206.1588046755362; 
 Mon, 27 Apr 2020 21:05:55 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:05:54 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 08/21] tools/libvchan: notify server when client is
 connected
Date: Tue, 28 Apr 2020 00:04:20 -0400
Message-Id: <20200428040433.23504-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Let the server know when the client is connected. Otherwise server will
notice only when client send some data.
This change does not break existing clients, as libvchan user should
handle spurious notifications anyway (for example acknowledge of remote
side reading the data).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Replace spaces with tabs to match the file's whitespace.
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Marek: I had this patch in Qubes for a long time and totally forgot it
wasn't upstream thing...
---
 tools/libvchan/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/libvchan/init.c b/tools/libvchan/init.c
index 180833dc2f..ad4b64fbe3 100644
--- a/tools/libvchan/init.c
+++ b/tools/libvchan/init.c
@@ -447,6 +447,9 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 	ctrl->ring->cli_live = 1;
 	ctrl->ring->srv_notify = VCHAN_NOTIFY_WRITE;
 
+	/* wake up the server */
+	xenevtchn_notify(ctrl->event, ctrl->event_port);
+
  out:
 	if (xs)
 		xs_daemon_close(xs);
-- 
2.20.1


