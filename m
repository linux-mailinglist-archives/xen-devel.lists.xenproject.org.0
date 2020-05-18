Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2680D1D6E72
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUNG-0000DE-TF; Mon, 18 May 2020 01:15:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUNF-0000Ch-SK
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:15:21 +0000
X-Inumbo-ID: ff2e7cfe-98a4-11ea-b9cf-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff2e7cfe-98a4-11ea-b9cf-bc764e2007e4;
 Mon, 18 May 2020 01:15:01 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id fb16so3938787qvb.5
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2CXxR3/fu54dMwhCVd1DE62O7N45m5o1SIg5x3dwKzg=;
 b=mCL9Oj5OXtEdRROI5LWby0nOvw900mzZIO5quk28U2jZm7/NqQivU/+iz8T33e8u7n
 0Rdw/N3idGWCnRxdlKRP6uBL757h6LtBgRE8M+JB7jfXk8LADSvphGsrJB3s2o8/qY+o
 K0NSDTLYpotXWpS4QQ3Y2lq7Rk1yvJ8gNLzNoh951rp2ZET3V74ubyPS2Fw2zenZN9y3
 krvC9GyvDK/4v/RFW3exy7p6rnFYRy1NAdUzBvGglAVgxEUgwQjdfk6FHGozg+bLlY31
 Io/uKp/qNsde8PkJ1e+/FgTGLjLZUcFYZwbuG9ULUAnmAElEa4aIxFEpZ/dx2FSkcGDi
 7awQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2CXxR3/fu54dMwhCVd1DE62O7N45m5o1SIg5x3dwKzg=;
 b=V+GgUHS1dAJAKf0fMREca28VNsF3dAxI1K/bqFLeG3qVN87wWOYu5quo5IclOmwO6X
 VempTt90uk/CoBA8cQdmlqE1X55aLlYoMgEjSX5ePK2aQ9oa56EhdSR373dilX6FiDVE
 y26TKdYgQ/5uj68pAtlC5h79spwDW0OmWwfIH0DJqFBdVjggupzEx6iqzUq6y/myoiO8
 h6lHrE0xloVBHNOJR623wBI5cHsVa3s5UOdQCX25+ZmKQqT6zdpVemgeKT5VjaYSITTZ
 ObbX9matIhjOfZLl2/falr6Ce21vbfMLOVq1n4f1uKedm+kqOLcn34XYEh+ruEBSHIiS
 xSHQ==
X-Gm-Message-State: AOAM530w+mC7DzCtIPtnFPLl+jKlmSLwN2WNEr7x4dVgOdiV4Nr1LMy5
 uadhDWHnt2qCwjasLZNjEviSgjjC
X-Google-Smtp-Source: ABdhPJzsmUptP5Ebhlwr3EDVbW73cYfMgRTMTBrbkkwiyvDk64mLowA/Oynu9LaJ72tUt7A9HNHUUg==
X-Received: by 2002:a0c:99d3:: with SMTP id y19mr13638364qve.72.1589764500653; 
 Sun, 17 May 2020 18:15:00 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:15:00 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 08/18] tools/libvchan: notify server when client is
 connected
Date: Sun, 17 May 2020 21:13:43 -0400
Message-Id: <20200518011353.326287-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
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


