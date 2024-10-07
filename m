Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4A9938E6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812488.1225264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxv64-0005tT-O9; Mon, 07 Oct 2024 21:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812488.1225264; Mon, 07 Oct 2024 21:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxv64-0005qi-KV; Mon, 07 Oct 2024 21:16:52 +0000
Received: by outflank-mailman (input) for mailman id 812488;
 Mon, 07 Oct 2024 21:16:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siVB=RD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sxv62-0005cZ-Q7
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 21:16:50 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 775dd5cf-84f1-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 23:16:49 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5398e33155fso6148915e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 14:16:49 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d214sm945051e87.132.2024.10.07.14.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 14:16:47 -0700 (PDT)
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
X-Inumbo-ID: 775dd5cf-84f1-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728335809; x=1728940609; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOZFp0KYwy2xarbmigXeGI5Kh1b1KEGSJbQb+7v41UY=;
        b=ciWCKC877jDoBu+nQy8mdklxzVY0cll1eTi/IkSbRhKTD2pZEaRc/VuHOL6w+vWXMs
         g7Agbyi691eXU/rxRKQ0CA/bp9cVqX5jBOKHcGs3vX0K+0xAmIB/mCiLgjbDVZKfKxPr
         D48GrXXbjlcutIvKT/a1XkuhkN/zMNyPlLzTSd3H3jy2OLGj4EvGn69mQ1udX967aE8j
         S75tPAjE9gntII0BeaDJpbu0VItYRYxTBNzrDXDMlbZclBJirWybveAB8Hvk0l5puGUe
         B31Kq922qWjT1gB908sRZFR2VHSsw/jXK+Q7AyzLXxaYZENH3YAQA/gIWCPSFOAyJnf0
         58xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728335809; x=1728940609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOZFp0KYwy2xarbmigXeGI5Kh1b1KEGSJbQb+7v41UY=;
        b=jaYmD3HwOb5XqBnMcp4NaPGs9uXcDqwgi6efyg/b5C1I6vClHrraS7mdsB1144qbxs
         6d14IFyMWhj0JlbMzfrbsgvSQZOK+J4uUA1ItLqKeyM93BU8Ufpw0TaQLWwhZI5nhg79
         22LNfMOmqIZojs5WW2prnpwYHe5/Mm/1NeM2TLIoeLDK9cacMatS9BjioyGrAicJscpQ
         RDcnEtyhBtlUREy2v5+6WXfDL5eNyoEdq2jNvXLYkJ8ADuB90Akw43xqYzmfTkqFF6Kn
         iBq5M6k+OWC0D3guMiQ9ZFOkTImIHRhCa/xoo7LaGl9S/dthsGAmyFXKaSIFKtJoX6lZ
         h5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWyXrPHlShBN8oq1EY68cPlXWnLJHpp7s+Zrty2HolLURtUo+bSFiFHl8IHPu6nVPt8TtjnaT2hx0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsZeCunnBwJZfhtW6byJ1nvsvnmjHNGdmLkMWLNqduodgck6P7
	0PCH4VWqaM+/kJeK1uRlq26SQ+tm/Sxye6HcNQqNUanOs9v9gkkz
X-Google-Smtp-Source: AGHT+IEDn3064h8cU2IDaRl8of4yOaXKWQsj91WD4UsSn5HTEcpmp2TwGmNka3Rpk/B+XuSHazDZAQ==
X-Received: by 2002:a05:6512:304b:b0:539:93b2:1383 with SMTP id 2adb3069b0e04-539ab9e1738mr6600333e87.46.1728335808875;
        Mon, 07 Oct 2024 14:16:48 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v1 1/1] hw/xen: Avoid use of uninitialized bufioreq_evtchn
Date: Mon,  7 Oct 2024 23:16:42 +0200
Message-ID: <20241007211643.1572271-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007211643.1572271-1-edgar.iglesias@gmail.com>
References: <20241007211643.1572271-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Avoid use of uninitialized bufioreq_evtchn. It should only
be used if buffered IOREQs are enabled.

Resolves: Coverity CID 1563383
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-hvm-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 7d2b72853b..7ffbbfea23 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -752,9 +752,10 @@ static int xen_map_ioreq_server(XenIOState *state)
         return -1;
     }
 
-    trace_xen_map_ioreq_server_buffered_io_evtchn(bufioreq_evtchn);
-
-    state->bufioreq_remote_port = bufioreq_evtchn;
+    if (state->has_bufioreq) {
+        trace_xen_map_ioreq_server_buffered_io_evtchn(bufioreq_evtchn);
+        state->bufioreq_remote_port = bufioreq_evtchn;
+    }
 
     return 0;
 }
-- 
2.43.0


