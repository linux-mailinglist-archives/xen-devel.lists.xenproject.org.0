Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088FE415EEC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194108.345813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFu-0007NC-46; Thu, 23 Sep 2021 12:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194108.345813; Thu, 23 Sep 2021 12:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFt-0007HH-Uz; Thu, 23 Sep 2021 12:55:13 +0000
Received: by outflank-mailman (input) for mailman id 194108;
 Thu, 23 Sep 2021 12:55:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOFt-0004it-3g
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:55:13 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57490847-57d1-49bd-b0a4-403c336c5255;
 Thu, 23 Sep 2021 12:54:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id e15so26186690lfr.10
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:48 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:46 -0700 (PDT)
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
X-Inumbo-ID: 57490847-57d1-49bd-b0a4-403c336c5255
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1NF2VdRzcAopkt/ag2bsT0u3KlYDxtxCU6z2CshuS9A=;
        b=c3W4pHiP0SQbXwXikrCRW/5HNiXnuy0GiKtdlTMWgAt+q5OKH4BJh+UUyzBsXiVDS4
         zPujaViJYEAM1QBWCUMzgq0wdSiZnFKwIkmo4ONopW1JG57hen9QfipVt6XjuZv5dpHN
         +YZTLjE3or8uWGVSg/JLS4x8b8vO46ynKoDjhM76qSZMVy23quiQ7/h5HTNam0Chti+d
         cHX6/fjEQyzwcG8VH0oaZiSQfWyva9YO9Pn+bnG6KgJL3cn/+TJLLMZxWdxC67rMJN3b
         78QCugavjre0R6syfKKbFQJo858XMtYRKwARobETSbeIjp/EG7uAtioOjwSw/slcBrGg
         KlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1NF2VdRzcAopkt/ag2bsT0u3KlYDxtxCU6z2CshuS9A=;
        b=MIqAw/6marq3Squ39n51JKi53v5TAx7FPvbNOGOVkEkTaJ3+6NldJ016FN+7++bHqZ
         xYn+p77TsjnqH+DvuDrA9dCxhvY+HnA3v/WXfBD7d7tcz4oSPI+fVNDTXEWCPi5K4efy
         W9ua1lUu0jThWaOcvJJ3QOsnSksoHbxswNiWjlQbPgIktBLfgW8yzMelec5855Sh39k/
         aq+X37Dq7YZhN6mpeSipeMaUJODjheBoaavj70IxDEncNVp347fYyZnzVEWAsPknI5DP
         hCvsISO+LPuAO6xot2d1omY5STNdIZsSZMKb1rBKlUv8szPVTNNCwqlUWP3/iAZvTFQH
         RcaQ==
X-Gm-Message-State: AOAM533dDIMSbctiEsiG9Kj8UEovxrU00HoOAJHPR0HihxHZx1gX1deh
	YLm8bRUc5aJVgD0jkceQsHAdQogl7cRTzw==
X-Google-Smtp-Source: ABdhPJzELccAtlQYBFFcQSEcUG96n2lCiiukq2T8exQ27ScjvOLHxHZt3jzH71KXNO1heo96QkLGcw==
X-Received: by 2002:a05:651c:3c3:: with SMTP id f3mr5182916ljp.222.1632401687403;
        Thu, 23 Sep 2021 05:54:47 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [PATCH v2 06/11] xen/domain: Call pci_release_devices() when releasing domain resources
Date: Thu, 23 Sep 2021 15:54:33 +0300
Message-Id: <20210923125438.234162-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125438.234162-1-andr2000@gmail.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is the very same that we already do for DT devices. Moreover, x86
already calls pci_release_devices().

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Since v1:
 - re-wording in the commit message
---
 xen/arch/arm/domain.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index f7ed130023d5..854e8fed0393 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -985,7 +985,8 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
  * function which may return -ERESTART.
  */
 enum {
-    PROG_tee = 1,
+    PROG_pci = 1,
+    PROG_tee,
     PROG_xen,
     PROG_page,
     PROG_mapping,
@@ -1022,6 +1023,12 @@ int domain_relinquish_resources(struct domain *d)
 #ifdef CONFIG_IOREQ_SERVER
         ioreq_server_destroy_all(d);
 #endif
+#ifdef CONFIG_HAS_PCI
+    PROGRESS(pci):
+        ret = pci_release_devices(d);
+        if ( ret )
+            return ret;
+#endif
 
     PROGRESS(tee):
         ret = tee_relinquish_resources(d);
-- 
2.25.1


