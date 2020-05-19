Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24B91D8D62
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarUp-0000Y8-Ig; Tue, 19 May 2020 01:56:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarUo-0000Xe-MK
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:42 +0000
X-Inumbo-ID: e98f2748-9973-11ea-b07b-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e98f2748-9973-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 01:56:10 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id fb16so5737183qvb.5
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67muXVTuajJEPjuiVYNz+RE396Rty6mUCKX18cQDly8=;
 b=fBhPiLx6vGxfX8RquZzoRxZDDliU6MKbftuDKBQ/hqIWz/3AJ+r8jOdcrEgX6Qlul9
 2URZxy/+snCKgAtOfzAbp9+PmijswCxfGVWdZhXBMAjfTowVb2aK/ZnZVZzqrN//E7+5
 qAHg4b8GhduyH4eyQ+tQWv9uSEdUgjKT/6s9hJ0/zXcqJU15gTy6wJFfB0DJV3HojOqy
 01RRG1x3y3iuOD4r+yEDNyrYOB4MPxsfZUuZ2pYSAgoc4MNuUlQl8poyupqNwP4BEElw
 yyDTC/eaib/pmo7bivFMu32MyyjqKWqw8aziMiTNd69vIKwLSuwDZ95N+M4t0GAukk+x
 Il/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67muXVTuajJEPjuiVYNz+RE396Rty6mUCKX18cQDly8=;
 b=Ox9ApQvLabky7vgL6y4k+hYtlnuniTYfZuqtVIwneWstGqqXH+LgMlXG6RL5AspPx2
 YRH1j7hPwkkRxauUwkGxQkiBdeOpgn6G3TaHRAXWH77tcs08er2hAFQTpg8/yo8AJacK
 KrYSUCQakoXl00zyJsZWnGcirEtzGyafg+J+rn6xx2sukC6E7oSWPgLYpb9peG3P2eHP
 QWXZrpShvm36EMxurh3MyuyFnW1GWcHkoNOnG5U37SNKBiWIiAz3lkUVOHm82nph1ot3
 3V5lleDN6ioAt5+oD28IB5/RvH78Xoks+iXSLIH7aUtF+8HOMNAN5vGHLlUz2AIkOFUR
 Yqtw==
X-Gm-Message-State: AOAM532nonNWXicP+UWt/MZRZL2Sk2eqiREiEBkrODnV/X9nSHGRqgdE
 xRfu/grYSnaODU0Pc8keSzJlM3ox
X-Google-Smtp-Source: ABdhPJxvCLHrLRHDGiZ2w3ADAvYvBlO5SG181DgeU83f4KwNeDp8MsclnwQltBEYw30Yz14dq2Jzgg==
X-Received: by 2002:ad4:5506:: with SMTP id az6mr17650121qvb.136.1589853370138; 
 Mon, 18 May 2020 18:56:10 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:09 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 11/19] tools: add missing libxenvchan cflags
Date: Mon, 18 May 2020 21:54:55 -0400
Message-Id: <20200519015503.115236-12-jandryuk@gmail.com>
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
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
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6
 - Add Acked-by: Ian Jackson
---
 tools/Rules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 5b8cf748ad..59c72e7a88 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -157,7 +157,7 @@ SHDEPS_libxenstat  = $(SHLIB_libxenctrl) $(SHLIB_libxenstore)
 LDLIBS_libxenstat  = $(SHDEPS_libxenstat) $(XEN_LIBXENSTAT)/libxenstat$(libextension)
 SHLIB_libxenstat   = $(SHDEPS_libxenstat) -Wl,-rpath-link=$(XEN_LIBXENSTAT)
 
-CFLAGS_libxenvchan = -I$(XEN_LIBVCHAN)
+CFLAGS_libxenvchan = -I$(XEN_LIBVCHAN) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
 SHDEPS_libxenvchan = $(SHLIB_libxentoollog) $(SHLIB_libxenstore) $(SHLIB_libxenevtchn) $(SHLIB_libxengnttab)
 LDLIBS_libxenvchan = $(SHDEPS_libxenvchan) $(XEN_LIBVCHAN)/libxenvchan$(libextension)
 SHLIB_libxenvchan  = $(SHDEPS_libxenvchan) -Wl,-rpath-link=$(XEN_LIBVCHAN)
-- 
2.25.1


