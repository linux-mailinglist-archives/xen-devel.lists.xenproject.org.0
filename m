Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE7848CBB
	for <lists+xen-devel@lfdr.de>; Sun,  4 Feb 2024 11:21:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675527.1050945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWZch-0000XX-AU; Sun, 04 Feb 2024 10:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675527.1050945; Sun, 04 Feb 2024 10:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWZch-0000VA-6a; Sun, 04 Feb 2024 10:21:15 +0000
Received: by outflank-mailman (input) for mailman id 675527;
 Sun, 04 Feb 2024 10:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yZno=JN=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rWZcf-0000V4-IY
 for xen-devel@lists.xenproject.org; Sun, 04 Feb 2024 10:21:13 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1df6788b-c347-11ee-8a45-1f161083a0e0;
 Sun, 04 Feb 2024 11:21:11 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fd446d4ceso5876675e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 04 Feb 2024 02:21:10 -0800 (PST)
Received: from localhost.localdomain (82-64-138-184.subs.proxad.net.
 [82.64.138.184]) by smtp.googlemail.com with ESMTPSA id
 l30-20020a05600c1d1e00b0040eee852a3dsm5291730wms.10.2024.02.04.02.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 02:21:09 -0800 (PST)
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
X-Inumbo-ID: 1df6788b-c347-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1707042070; x=1707646870; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXr9s7Gve9HSkvnZjmir4x9yxXlIr/2oW7d2MgJIizE=;
        b=uAqkBH6G4JzJvlvk38i4yaGbtz9gVHhmv0+/je5iq0YFWGDiwQavgAJ0O7ZKhoUYeK
         Yq72cbhMGs9YLM0QjtF5r1VDMXuKuXGbYPrzKXGa7VwsnZQxYnPy3mbXFBsWX/sevcJv
         t0IIu3/Srs5BlftnB0xvDUGe14tXI5yED5v7EFnQFXwvXo8R9mIyp0pvcv4sF4YXjXZY
         5llk65iryueTNELUSjttePAz4CYHyndPjh7uxrezI6WqPGhBuA8MVYi4w77IFTqbsm4o
         nmsc+DP9oUgG4hKXypLHZGK49/fpQqpTv+eB8I5ScFRA9MIv4DdU2tEG2bJVqUFI5H6K
         AgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707042070; x=1707646870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXr9s7Gve9HSkvnZjmir4x9yxXlIr/2oW7d2MgJIizE=;
        b=Nw4t5IgL82ul39tOKhQFRjZOdwAnEV+oyT8wq8w262cN373lp/VUlnsgTxlU67ISiu
         p2AEI/DeFQYtQb+1lJFYBy0qkTAcAHOtQgB/rK9Wrdeq/U/72cy/DrBU6tr1jiLGf3xf
         2X/HPLr1hUBLNwaQB5fbgfs5joJHRZ3eZyl44qJiOO/LpjxdAWJP0hn9VgXe18jM5cC6
         LoGEo8RsODCUb+pSJ0upKzSIiGFRDsM6+tDph0vxNJ0/YG2RvN98bn3CJVI6A9/OG9Wi
         SjF9C0YerUfhs2OkazbWDacbDTTgHi27rZpS212+wz4f74pjxWptvUUQG2u0VVGPrztb
         ShuQ==
X-Gm-Message-State: AOJu0Yx6NszHHvaqDNIO/sbpkoupyQnCVPIqe+o4BNovdMd7O+tCzck1
	7u1LbXHmS+DyNwXfUor49VNs346aPGzE6the0Fgss7hRKjGoXP0nhLrSzUKBeo7fFbroOkwcUTl
	KSUA=
X-Google-Smtp-Source: AGHT+IFXauec+v82sndPjUeNUGFJuDh0jNuxkThnYday7jYQTu6Z3KDLWhlvdukLBE141RYkNOPcOQ==
X-Received: by 2002:a05:600c:a01:b0:40f:c1f9:c884 with SMTP id z1-20020a05600c0a0100b0040fc1f9c884mr2465373wmp.39.1707042070275;
        Sun, 04 Feb 2024 02:21:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVFLYBAaYhUIBbpb8TXk/ZjTglOToDvWIujNIfIeqjP9qfv6CBN6m2fl9vzm7kPer5M82gXG4f2iPpFkT3O7IdUhVC9HhmS5vEG9pkY1LueliAwp/TJ
From: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Cyril=20R=C3=A9bert?= <slack@rabbit.lu>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xentop: fix sorting bug for some columns
Date: Sun,  4 Feb 2024 11:19:40 +0100
Message-Id: <1bb93dbf9d09091fa36a3966ad8ffbccdb742166.1707041980.git.slack@rabbit.lu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Cyril Rébert <slack@rabbit.lu>

Sort doesn't work on columns VBD_OO, VBD_RD, VBD_WR and VBD_RSECT.
Fix by adjusting variables names in compare functions.
Bug fix only. No functional change.

Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
---
 tools/xentop/xentop.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index 950e8935c4..545bd5e96d 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -684,7 +684,7 @@ static int compare_vbd_oo(xenstat_domain *domain1, xenstat_domain *domain2)
 	unsigned long long dom1_vbd_oo = 0, dom2_vbd_oo = 0;
 
 	tot_vbd_reqs(domain1, FIELD_VBD_OO, &dom1_vbd_oo);
-	tot_vbd_reqs(domain1, FIELD_VBD_OO, &dom2_vbd_oo);
+	tot_vbd_reqs(domain2, FIELD_VBD_OO, &dom2_vbd_oo);
 
 	return -compare(dom1_vbd_oo, dom2_vbd_oo);
 }
@@ -711,9 +711,9 @@ static int compare_vbd_rd(xenstat_domain *domain1, xenstat_domain *domain2)
 	unsigned long long dom1_vbd_rd = 0, dom2_vbd_rd = 0;
 
 	tot_vbd_reqs(domain1, FIELD_VBD_RD, &dom1_vbd_rd);
-	tot_vbd_reqs(domain1, FIELD_VBD_RD, &dom2_vbd_rd);
+	tot_vbd_reqs(domain2, FIELD_VBD_RD, &dom2_vbd_rd);
 
-	return -compare(dom1_vbd_rd, dom1_vbd_rd);
+	return -compare(dom1_vbd_rd, dom2_vbd_rd);
 }
 
 /* Prints number of total VBD READ requests statistic */
@@ -738,7 +738,7 @@ static int compare_vbd_wr(xenstat_domain *domain1, xenstat_domain *domain2)
 	unsigned long long dom1_vbd_wr = 0, dom2_vbd_wr = 0;
 
 	tot_vbd_reqs(domain1, FIELD_VBD_WR, &dom1_vbd_wr);
-	tot_vbd_reqs(domain1, FIELD_VBD_WR, &dom2_vbd_wr);
+	tot_vbd_reqs(domain2, FIELD_VBD_WR, &dom2_vbd_wr);
 
 	return -compare(dom1_vbd_wr, dom2_vbd_wr);
 }
@@ -765,7 +765,7 @@ static int compare_vbd_rsect(xenstat_domain *domain1, xenstat_domain *domain2)
 	unsigned long long dom1_vbd_rsect = 0, dom2_vbd_rsect = 0;
 
 	tot_vbd_reqs(domain1, FIELD_VBD_RSECT, &dom1_vbd_rsect);
-	tot_vbd_reqs(domain1, FIELD_VBD_RSECT, &dom2_vbd_rsect);
+	tot_vbd_reqs(domain2, FIELD_VBD_RSECT, &dom2_vbd_rsect);
 
 	return -compare(dom1_vbd_rsect, dom2_vbd_rsect);
 }
-- 
2.39.2


