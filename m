Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E11BB4F0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHVh-0000jX-B6; Tue, 28 Apr 2020 04:06:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHVg-0000it-1v
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:16 +0000
X-Inumbo-ID: 92d151c0-8905-11ea-ae69-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92d151c0-8905-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:01 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id v38so9754348qvf.6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Arrq//I+mnu3nWRhCeF/WBnbP/Hq+npxYP1a8HiQr4M=;
 b=hZfZ4crkIQkgZ0ilyZj7UayWCfCwD+E4gTg95iTtvNGHVCXBpP6JO+EKbfFAtbur5/
 XMrybm1+PWaWtIxOHwg9ezkODI7gtMF+TRNy8bsmHT+5fOxh0Z0WbGbVLUnjUbWsUg0X
 on3C8KGJlx3lJvEEJGeqIg9nZptVUuQ1gqM6kHFBOeDXexsHcffQQ5lseJF3DZnot1nx
 PwDAxQyDm2bHa4n5OeUgI3eTvGIsiAO4HMGMzPO4TFsDmq0vsVmLDFEmUQe8EEPA+qrT
 FXYnrF1Y5Ers0Vm4oLNZck/PgVHoN/hGxQ50IXLmRrFxtyxeRSs8hyuV5zZKN1GAbsJL
 ffrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Arrq//I+mnu3nWRhCeF/WBnbP/Hq+npxYP1a8HiQr4M=;
 b=YS36gTsCkhzUJPT900QzpDX3jxC5geWVUSLaljhTQac2Sv/HBzdsAc+xff+4oXxBIg
 cD1angYxLzn95GzAOdzrtez8239dnQnLX8srek786iuiUKPSDuPWZIM3ASddYFtJBgTZ
 OK9cYKP8Vuy0+oPGOxdsiaT/P+1iafZWdCKo0Ytq2qPzfkc+xaj52VvLS1NW2BSC0Ref
 Etm3YUifqnlb2pwaqv/4wYfwo6WCHUeMRJR3hIhwgfhdRBEvI+QI/bLSJSIXlct7SgIp
 /k0KHInXEJ3gGI88ECmlA9o4r3ZmEZOSTaqPw11x53nCqsHDDlRel+dRrBz8tfFpZxUT
 iGTg==
X-Gm-Message-State: AGi0PuanxHEss2z2iuai4v0F2sMLSxBgV/voNRUy6aKxUM1EYkI9e3o7
 UqmM00eBta5ns/OziRAB6ZBYiuva
X-Google-Smtp-Source: APiQypJSQIX/p45NGmrU9FSEZUsYzvUfUxsQE748u+PA4e1GlPc+Pgs202mVFF7tbxjemvGsvyfuHA==
X-Received: by 2002:a0c:dd8c:: with SMTP id v12mr25165846qvk.134.1588046761385; 
 Mon, 27 Apr 2020 21:06:01 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:00 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 10/21] tools: add missing libxenvchan cflags
Date: Tue, 28 Apr 2020 00:04:22 -0400
Message-Id: <20200428040433.23504-11-jandryuk@gmail.com>
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

libxenvchan.h include xenevtchn.h and xengnttab.h, so applications built
with it needs applicable -I in CFLAGS too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/Rules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 9bac15c8d1..078eb7230a 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -159,7 +159,7 @@ SHDEPS_libxenstat  = $(SHLIB_libxenctrl) $(SHLIB_libxenstore)
 LDLIBS_libxenstat  = $(SHDEPS_libxenstat) $(XEN_LIBXENSTAT)/libxenstat$(libextension)
 SHLIB_libxenstat   = $(SHDEPS_libxenstat) -Wl,-rpath-link=$(XEN_LIBXENSTAT)
 
-CFLAGS_libxenvchan = -I$(XEN_LIBVCHAN)
+CFLAGS_libxenvchan = -I$(XEN_LIBVCHAN) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
 SHDEPS_libxenvchan = $(SHLIB_libxentoollog) $(SHLIB_libxenstore) $(SHLIB_libxenevtchn) $(SHLIB_libxengnttab)
 LDLIBS_libxenvchan = $(SHDEPS_libxenvchan) $(XEN_LIBVCHAN)/libxenvchan$(libextension)
 SHLIB_libxenvchan  = $(SHDEPS_libxenvchan) -Wl,-rpath-link=$(XEN_LIBVCHAN)
-- 
2.20.1


