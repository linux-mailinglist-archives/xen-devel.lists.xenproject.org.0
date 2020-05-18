Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC4F1D6E7B
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUNR-0000M2-H9; Mon, 18 May 2020 01:15:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUNP-0000Ko-TU
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:15:31 +0000
X-Inumbo-ID: 016d70ec-98a5-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 016d70ec-98a5-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 01:15:04 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id z18so6870011qto.2
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67muXVTuajJEPjuiVYNz+RE396Rty6mUCKX18cQDly8=;
 b=D4T5H0vbM6abA4IPQnX96kkmnRgQT1VWkXvM5OKBk1oIKycc7dDzOFxd8SbWWve1AU
 HTtYsY5V6j/jarOmwrKf5FVXK/IQPUX/JYod5mnmMnQIrOyr6Icixd5KKi0hyELi3Pnj
 b96SVQ3gEvZyVaGU6DSe5Qd8c9c43K2ktSCpiTvMRQRVv/XurUDFIrzrNef9mZrbkI+j
 5TYudBhi4LF5agAUHdpuHRQbrw++PhdOxME4+7TwD4beWhLuRjIErTSnARsfmghGJtP9
 8NdG/FUm8PwVNwqRLhpjJR51H+RQTDBGj1o+sfX+TiBJV9ZuS69NRwJecGZvOVXw2ex9
 nGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67muXVTuajJEPjuiVYNz+RE396Rty6mUCKX18cQDly8=;
 b=H91FW7Ydlt++MwFxXZg3eY5pY1/qW2C/3MXRREwRWozrVXtKqINCi579OKQLjUjCoS
 S0tXJRY/KWrNTwuv7LPzdrgPoGf+PmCvwd/VL1cPQVdlxEO8oWuHkukuztk1IxBU7a0F
 fsDz/OQZnG1OPWatXCXZXzUTNEMlnUYNybJyjgy+/KJM4/w3JDLFWcf5AKg6sym33qMl
 qf2dJyTXBMzGuSQC/bH3iEYEKWiq91e86p2+a8SNE9D9V/C/3AYpQbIJquxwWRgt1Vh3
 tfoYxN8SwHbovXzu8Lvxjetzz5kzwdloCAIkSNB+HNaikmTm2kJM1E1sOrBX2499way9
 nsXQ==
X-Gm-Message-State: AOAM533GECx7PB36b1y/iVEvJ9hFEHQukZD14FyD6hapWUhN37PH847R
 z3H+4MMXT/VGrohX6bRfsLwCWgX0
X-Google-Smtp-Source: ABdhPJxtLH9rX6Ck17bZx1k313hMMaEQ8RldeRFajSKvDhUMnZIgE9mHv3ehOVt3GiNAChejL2Z6WA==
X-Received: by 2002:aed:20d1:: with SMTP id 75mr7791829qtb.1.1589764504323;
 Sun, 17 May 2020 18:15:04 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:15:03 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 10/18] tools: add missing libxenvchan cflags
Date: Sun, 17 May 2020 21:13:45 -0400
Message-Id: <20200518011353.326287-11-jandryuk@gmail.com>
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


