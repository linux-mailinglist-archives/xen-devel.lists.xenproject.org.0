Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59F1D8D5F
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarUf-0000Qo-R6; Tue, 19 May 2020 01:56:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarUe-0000Q1-M7
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:32 +0000
X-Inumbo-ID: e79c0834-9973-11ea-9887-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e79c0834-9973-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 01:56:07 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id d1so5777994qvl.6
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2CXxR3/fu54dMwhCVd1DE62O7N45m5o1SIg5x3dwKzg=;
 b=AKhBNPAcoTZToHpSRZE5KrTgrDLx7XfXdXFxBJNg7lYrrzSOzsoWnKqqFozWnmA9Cl
 n2peygGD3HfXEuDgP9E/gTEK23cgcDdGCtmZD8H7nypC8v571/5mZ1vlVpsiJsocOx9U
 w+Gx58vsJOSJS3foDSvkIg8MV1zlNjYoXbsmJvVBS5Hx39kEbaI9A/pD8bjuMFxrbjXv
 FIimCXiDuUZAsTPMFNLXQiW1z+HkqHKYZWzQxF1cza4zQ6qem47RYV37cGLYTFeHcejJ
 RjwhHpwmqUVlwIbD6hBx0cEEfO55YJAjrbIS8OgISFfGcPIhySXFb8ttHD/1MWOKwJCl
 Gc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2CXxR3/fu54dMwhCVd1DE62O7N45m5o1SIg5x3dwKzg=;
 b=QuByHL+9D6da2fLBtQy6KVBJbcaoPmIYuntABZftdpevoI4xzkLU0qaAmJY4bOYBpR
 hWlewhLZs4UtUcyF7haxjZHTLAHnbrTEzSxzCQIiaZjAC/RAVCOwzWh51OIjJ73/SXYU
 MhD0Du5Hpy0IRwwr50UCWwaBzVKsJ3TiAHWzrYGsm97jZoqyJIbTwpU0qjleSg/oBmYt
 RJjOFJGIeq6x3Tdd7CFe8XPDxBs4ktp2BK6vJeuQpALnKtQgnYLWste/fE0wtnZYBkWb
 IGh4F8FR4lgHYbDm6xiGb9qXB2cjohkPUc2i2FJgPYssw6GhSUBbtsHsTLBMRuUIIrbu
 hdrA==
X-Gm-Message-State: AOAM531HYCwyDq57XPemDZqnBuVYU1k+tBAlbGdabeuUA5NnTreUHsdN
 aAQZ71JvgK6bAu1co7oEiokMMcVg
X-Google-Smtp-Source: ABdhPJwTXzjvx4qmTPZqyVC7gX6iM1nyvCSo9BTAgYUCX/xOWafExMXAS2HimiKJ/82sLt8AVE7eIw==
X-Received: by 2002:a0c:b5c4:: with SMTP id o4mr18315483qvf.229.1589853366849; 
 Mon, 18 May 2020 18:56:06 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:06 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 09/19] tools/libvchan: notify server when client is
 connected
Date: Mon, 18 May 2020 21:54:53 -0400
Message-Id: <20200519015503.115236-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ian Jackson <ian.jackson@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Let the server know when the client is connected. Otherwise server will
notice only when client send some data.
This change does not break existing clients, as libvchan user should
handle spurious notifications anyway (for example acknowledge of remote
side reading the data).

Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Replace spaces with tabs to match the file's whitespace.
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
Marek: I had this patch in Qubes for a long time and totally forgot it
wasn't upstream thing...

Changes in v6:
 - Add Acked-by: Ian Jackson
 - CC Daniel De Graaf
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
2.25.1


