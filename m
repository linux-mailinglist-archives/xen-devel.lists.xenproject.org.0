Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996326F15E0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 12:41:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527253.819678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXq-00030u-TN; Fri, 28 Apr 2023 10:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527253.819678; Fri, 28 Apr 2023 10:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXq-0002x7-Pb; Fri, 28 Apr 2023 10:41:42 +0000
Received: by outflank-mailman (input) for mailman id 527253;
 Fri, 28 Apr 2023 10:41:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19My=AT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1psLXp-0002tZ-Di
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 10:41:41 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41b60cc2-e5b1-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 12:41:39 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso6128360f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 03:41:39 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002e71156b0fcsm20930378wrc.6.2023.04.28.03.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:41:37 -0700 (PDT)
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
X-Inumbo-ID: 41b60cc2-e5b1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682678498; x=1685270498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUhXin/OPZZXRGBUuqUwhDZyM+uQc0DAORSurlrGu/k=;
        b=DbzyUqqc6Cw2R8dr9vtDR53PFmBj/RuOITN0eOZONHdDlyEjXuN8SgfQV9y3x3WQUd
         Gx+j2mLhyNZRtRgHwB6UDFDSN9ROX1Kr/3PmRwwCts2TXhztfqeGuzzrBOMJh0iBplqA
         A6nM4qi7FXDYzCR+VP6cewiBdvF9NK0xzzCGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682678498; x=1685270498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUhXin/OPZZXRGBUuqUwhDZyM+uQc0DAORSurlrGu/k=;
        b=WhQpPhuqU+k7k3ehiQK8YNZqE1e/aK0If0pfgQ4WiK4pDPUAcKKtZ6C8fg65ukd9KH
         6le6o6jnhIoNOn7APhMSCqE5wBOzwiJJih6Ss9BYuK7xceb35F5oj1HA2z9PXsJ7nSdC
         ev5Jo/aLsWkESGcKGz64BNzN9BpYyaq4j+MlDY9QEXR6zDYBoRI8VYbMZkBOMYVCNsXs
         47FuGH41meOYxXh+LR8U80upKFpS0xMIP4qM69s4u68mBB1W/x+gjAwpNKA5N5/CtNe7
         WBwkY+YLOqRVlvBbm1GWmFHBUojlHnLLr/g87mc758SPgrfe/PX3HcptxKzoHvjbQr8f
         vEFw==
X-Gm-Message-State: AC+VfDxJ5QSMRnS8k87rHdH/rB1uPSa+DtVhwV0vzV+OlsuYqwZiS4UY
	1DIW2wl4W80TpYtHiQG+Rcf1YwhdfVtGGT39f20=
X-Google-Smtp-Source: ACHHUZ4zH2UeGBP+lfx0B2dTM3GHzvvs90ipnwa4Jzx0cFPfM1bp7lgtg0zeJbuzU+pqxW/QVhNW7Q==
X-Received: by 2002:a5d:49c3:0:b0:2d8:47c7:7b52 with SMTP id t3-20020a5d49c3000000b002d847c77b52mr3576746wrs.9.1682678498391;
        Fri, 28 Apr 2023 03:41:38 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 3/7] tools: Refactor console/io.c to avoid using xc_domain_getinfo()
Date: Fri, 28 Apr 2023 11:41:20 +0100
Message-Id: <20230428104124.1044-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has 2 avoidable occurences

* Check whether a domain is valid, which can be done faster with
    xc_domain_getinfo_single()
* Domain discovery, which can be done much faster with the sysctl
    interface through xc_domain_getinfolist().

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/console/daemon/io.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index 6bfe96715b..c5972cb721 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -405,13 +405,7 @@ static void buffer_advance(struct buffer *buffer, size_t len)
 
 static bool domain_is_valid(int domid)
 {
-	bool ret;
-	xc_dominfo_t info;
-
-	ret = (xc_domain_getinfo(xc, domid, 1, &info) == 1 &&
-	       info.domid == domid);
-		
-	return ret;
+	return xc_domain_getinfo_single(xc, domid, NULL) == 0;
 }
 
 static int create_hv_log(void)
@@ -961,24 +955,33 @@ static unsigned enum_pass = 0;
 
 static void enum_domains(void)
 {
-	int domid = 1;
-	xc_dominfo_t dominfo;
+	/**
+	 * Memory set aside to query the state of every
+	 * domain in the hypervisor in a single hypercall.
+	 */
+	 static xc_domaininfo_t domaininfo[DOMID_FIRST_RESERVED - 1];
+
+	int ret;
 	struct domain *dom;
 
 	enum_pass++;
 
-	while (xc_domain_getinfo(xc, domid, 1, &dominfo) == 1) {
-		dom = lookup_domain(dominfo.domid);
-		if (dominfo.dying) {
+	/* Fetch info on every valid domain except for dom0 */
+	ret = xc_domain_getinfolist(xc, 1, DOMID_FIRST_RESERVED - 1, domaininfo);
+	if (ret < 0)
+		return;
+
+	for (size_t i = 0; i < ret; i++) {
+		dom = lookup_domain(domaininfo[i].domain);
+		if (domaininfo[i].flags & XEN_DOMINF_dying) {
 			if (dom)
 				shutdown_domain(dom);
 		} else {
 			if (dom == NULL)
-				dom = create_domain(dominfo.domid);
+				dom = create_domain(domaininfo[i].domain);
 		}
 		if (dom)
 			dom->last_seen = enum_pass;
-		domid = dominfo.domid + 1;
 	}
 }
 
-- 
2.34.1


