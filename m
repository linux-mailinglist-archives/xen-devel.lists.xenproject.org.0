Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A91308382
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77634.140819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J4E-0007U5-8X; Fri, 29 Jan 2021 01:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77634.140819; Fri, 29 Jan 2021 01:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J4D-0007SK-JJ; Fri, 29 Jan 2021 01:59:21 +0000
Received: by outflank-mailman (input) for mailman id 77634;
 Fri, 29 Jan 2021 01:59:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5IwA-0004da-Mg
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:51:02 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58414d95-ebcd-4cd3-8746-1465072b0bc8;
 Fri, 29 Jan 2021 01:49:35 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id u4so7195324ljh.6
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:30 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:28 -0800 (PST)
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
X-Inumbo-ID: 58414d95-ebcd-4cd3-8746-1465072b0bc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w2jodtzQLDzvAchjFYRZnoQG4edeafDW+VyX5zm624g=;
        b=CWMGn14UoxB28w/EHBx9ohKHRbCy45I1mUi8GsWqvanZiSScuJPEaQ1RFBaTLUWjPT
         UWZINdBFPifhzecPH+9zZ7ZadrawLvHmoLveuK5S6JluF+TNbZgx8WrpBGSu6HN1uZud
         YbHglSjkYE7qH7n6g7mTJVQQgnDeIchjPx4AkaWXauTdSb53S8gvD97Py+SEuhazlkV+
         I+eP5DDuQgwVYCKa5Vo4qbPK3XC57uovorPPbZ/xomQKtUEtwaRC9k/ALGposn+YCpIM
         m00WLbKVVe6YN3F9gAfnj/9muK693j1QsahhNOuKqzJZYXE1u1nlPOswP9C+1iIOxKe8
         kWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w2jodtzQLDzvAchjFYRZnoQG4edeafDW+VyX5zm624g=;
        b=a8YdogXjJTx0AZH3ofD34FMkHJ1+TYKGqdUsOXgjINW6Xw3uZwNi+RplaMl8xvkLpI
         e07a7Rnxa0IImKE78hfQOBbxOusQOjy6MruMMjOCQXInfmi98odjPv62xvyZGTYWTTzt
         zE1xSJ9tWFF5Zh4D/oJogXY4wfLT9NiYvGgHytwcuPJDNz6aaTdu0bj3BwWCgqq/06s6
         G/4PGcQ4Qy6AWdo1FKtXozw3+uBbkpZ9hmVc69fvy+YuodisaY5Rnv+RY9usH0Q9GnSN
         xo92K2ann6u215SupI5PXVR5Xh/p8mO8/P3dTRZGUGesE0nmFnTcGxNYO++e0sNSv0eS
         f2WA==
X-Gm-Message-State: AOAM531ozECjjett+o+59pPgMmYsGkDDzeo7yxAXvjQMsO5AlEmSpMkn
	wSO3qF8OTj2yP9OdIM3E2kIPsYvQ2VcAvQ==
X-Google-Smtp-Source: ABdhPJxlh0nXRKSpDhyrFViWuzk9V2z+ug2B/eR+grgHMD5Yg2y47pxlPiWzhN5OFzvVl1RvMcTFFg==
X-Received: by 2002:a2e:7607:: with SMTP id r7mr1097953ljc.168.1611884969269;
        Thu, 28 Jan 2021 17:49:29 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH V6 23/24] xen/ioreq: Do not let bufioreq to be used on other than x86 arches
Date: Fri, 29 Jan 2021 03:48:51 +0200
Message-Id: <1611884932-1851-24-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch prevents the device model running on other than x86
systems to use buffered I/O feature for now.

Please note, there is no caller which requires to send buffered
I/O request on Arm currently and the purpose of this check is
to catch any future user of bufioreq.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V5 -> V6:
   - new patch
---
---
 xen/common/ioreq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 67ef1f7..a36137d 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -629,6 +629,9 @@ static int ioreq_server_create(struct domain *d, int bufioreq_handling,
     unsigned int i;
     int rc;
 
+    if ( !IS_ENABLED(CONFIG_X86) && bufioreq_handling )
+        return -EINVAL;
+
     if ( bufioreq_handling > HVM_IOREQSRV_BUFIOREQ_ATOMIC )
         return -EINVAL;
 
-- 
2.7.4


