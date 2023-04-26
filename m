Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9346EF6F9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 16:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526749.818700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcU-0001Px-B1; Wed, 26 Apr 2023 14:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526749.818700; Wed, 26 Apr 2023 14:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcU-0001NU-7J; Wed, 26 Apr 2023 14:59:46 +0000
Received: by outflank-mailman (input) for mailman id 526749;
 Wed, 26 Apr 2023 14:59:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxt2=AR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1prgcS-0000cE-KT
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:59:44 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa67221c-e442-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 16:59:44 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso4622014f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 07:59:44 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b003047ea78b42sm6654116wrr.43.2023.04.26.07.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:59:42 -0700 (PDT)
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
X-Inumbo-ID: fa67221c-e442-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682521183; x=1685113183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/n8iDxY+gFzED/faB3xf5M0UlbwG5Zihhb3i4U/Bo0=;
        b=SL13iuQjTgVU85bnRoAsthjqKmb/1hm7tIYLgNQKtfXUyHNkx7wP6IrbLJpQedK0GJ
         Gh7/nCU/aYrUbDrsVfHLgRuBKx1syn2buHTJS60mKrRbPKZn/mPryg3+xCbpBvXkqPc+
         nEqHFC3wqzIfJJBVgdv2sjTOAb3EsSl51OCKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682521183; x=1685113183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/n8iDxY+gFzED/faB3xf5M0UlbwG5Zihhb3i4U/Bo0=;
        b=Jj1Tp6nKXQnZq4F1QNLlh4ODwZChQ8DLlspz0rQ0NUILM9q1VYs/Rh7Jt8LOQB1Py2
         kzGtNgw4u6RAVqiFV9ePpga0HhZC0QB9X8yvoRuKUNqHxUhX/+mHhW7irkf2Qw3AP2ns
         c/CKIM4kuD2o68yjn6U07PEyVV3iAegAg+wGUCDGjubi9iU9Uv1Z0E4XFUpExsS/8A74
         WgQbCjbJ4kS1NysWotb/y8kQiN7K3Gd8vz1Ws6vBFQ+IP7ZqUF8i5wYyk5meHRzbN/D7
         RFquYsh+9r9wKxpZ3AtNAbWMb3WA7qG9FaFJFN70zzZaJBzx73hkBXHnqodfFfO6V2oo
         Fn6g==
X-Gm-Message-State: AAQBX9cbItLD2EJCeDZ3JZzev7uYZwzemtdka0xe+DwGKUmq/4r9dD/F
	KYOFDpXAHHHE7L70vPCU7voCp7HIrZU9Jw5p6D8=
X-Google-Smtp-Source: AKy350b7muSWZSZZXgN3C3/C/ZlWpkhbbgWHWwL+RxuioWyLwpejK9lvwcfQqqvtbhaD/R+F0vRCyQ==
X-Received: by 2002:adf:dece:0:b0:2d8:47c7:7b52 with SMTP id i14-20020adfdece000000b002d847c77b52mr14977960wrn.9.1682521182906;
        Wed, 26 Apr 2023 07:59:42 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/7] tools: Refactor the console/io.c to avoid using xc_domain_getinfo()
Date: Wed, 26 Apr 2023 15:59:28 +0100
Message-Id: <20230426145932.3340-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
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
index 6bfe96715b..1fc56f6643 100644
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
@@ -959,26 +953,35 @@ static void shutdown_domain(struct domain *d)
 
 static unsigned enum_pass = 0;
 
+/**
+ * Memory set aside to query the state of every
+ * domain in the hypervisor in a single hypercall.
+ */
+static xc_domaininfo_t domaininfo[DOMID_FIRST_RESERVED - 1];
+
 static void enum_domains(void)
 {
-	int domid = 1;
-	xc_dominfo_t dominfo;
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


