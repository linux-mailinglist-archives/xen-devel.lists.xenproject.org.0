Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882D49F51A0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 18:07:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859580.1271760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb24-0007yy-2H; Tue, 17 Dec 2024 17:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859580.1271760; Tue, 17 Dec 2024 17:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb23-0007wM-Ub; Tue, 17 Dec 2024 17:06:51 +0000
Received: by outflank-mailman (input) for mailman id 859580;
 Tue, 17 Dec 2024 17:06:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+zK=TK=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNb22-0006B0-22
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 17:06:50 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4de667a8-bc99-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 18:06:49 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so1053199566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 09:06:49 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963910f7sm461362666b.166.2024.12.17.09.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:06:48 -0800 (PST)
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
X-Inumbo-ID: 4de667a8-bc99-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734455209; x=1735060009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrreipUOqvu+e4eZhr8owwgZAEd1TzrMBSTgToeJEUs=;
        b=u5tVwYtQFHX0aTcLsu/aXOfStxknP2Af0R7Wi92nfYNeUDHIxpFSfW9gKVzMc2goAH
         wuUXan7318HACfcXb2fYQ0OxFHl59qdl8waAimMu3RcCMHjECA1+VuKSeod89SKjz/cP
         ICTI5MAQc01l5qjwSyyO7QGNxsEL6T4CHdJOZtYnyh86q6B77xkLOqspWEBcxb6WX+0S
         sySpJknP1oMi5lonnYj1Su7GO7ALwIJaDZ1NFmnBBCUMm36gAywvg3yvsb64DqDubUJ0
         2S9uPsU7F4lR7OSnSgCLxzTB9SVSAjuEQoBIMaS0m1FXG1nWOtXh0nr7IV3Yhk/WyCtH
         fXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734455209; x=1735060009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrreipUOqvu+e4eZhr8owwgZAEd1TzrMBSTgToeJEUs=;
        b=ODNbS5mf4AjbkPVUjGayu2g+38JANRpL1np7CtCVMbGHUwgmXjg4KpwtMq51zNnlLy
         rMda/nizn11NH9nT/lHQe6XyY7p9Md1zydFa+idcnX8e6CjADSBE2og6JPnqYig+y5/U
         7ae2iCvP7F/Gd2I45LegYPYrQ+hJEJew8OsXoaYQXF5FOOFzuCajp1M2wEI36xQ+4nr/
         ktgMe7IpDkMrSfw7LloSaPYSAtlQqsMOEJf2QDKLPQ6I6hjYqdfW+67GbmbSEIdhFEwQ
         lv8MB0Ewh1x07imWUBxI+Djo3thcA/HwqJQIrJIGjKCV49rEclY6zkNw0bRujw75rcCc
         qvSQ==
X-Gm-Message-State: AOJu0YwidKP2XkGC8JD1Lu1zuY0h6+LoWKQyLg2LPV/ufxoWbfwrYAvn
	EEFZm7eH3XBhMzZXYEpm4esNGNeOafl2wTAmVQTjE228jmyKSgec+Ia+s/WMGEld+uGPsIT/6ky
	Q+p4=
X-Gm-Gg: ASbGncsQ69F5bUj8miI/DZGU0KAZJZ0z5dtTkLz+Wvq5K69jRnYGS6/fWon98SS7rUH
	uNIBh7o+Fyfrs6KY9BFJP4d8H8ojYZ3tN8/hGpAuGv3mBdp7QPhRsSwdBC5X+RG9mZDnmuH+N9O
	19fVvLmErrn4ylj3KBgxJVGcJEa6ySXlXb3TnzMhWDSQi2LoGBXAIMw7XIL6DzL7t4fyWMOpzgc
	kNdfccmtxlGOyyO/ULZpyCT67wl5t7L91IfYFgzccA3DBgjlxWwmLI2AUP4oS6xIf+p4XCuqutu
	Z2Gb7Inyx3+IMXWM63gYyd9adIV4UcRwYWtYCn8+P7g2/6GSuGyYzkCyTZA=
X-Google-Smtp-Source: AGHT+IFuCSa53dAt3X2uYHYt3kSIWw1yJmJ/rrSQ+FLSFp9jh3JwOm6m4Wkm74+jmHFUlcpIQOHKYA==
X-Received: by 2002:a17:906:23e1:b0:aa6:96be:2bed with SMTP id a640c23a62f3a-aab77ee8ae6mr1461073066b.59.1734455208785;
        Tue, 17 Dec 2024 09:06:48 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v13 08/12] xen/page_alloc: introduce preserved page flags macro
Date: Tue, 17 Dec 2024 18:06:33 +0100
Message-ID: <20241217170637.233097-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PGC_static and PGC_extra need to be preserved when assigning a page.
Define a new macro that groups those flags and use it instead of or'ing
every time.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v13:
- no changes
v12:
- fixed wrong patch sent in v11
- added comment on PGC_preserved
v11:
- removed PGC_broken from PGC_preserved
- removed PGC preservation from mark_page_free()
v10:
- fixed commit message
v9:
- add PGC_broken to PGC_preserved
- clear PGC_extra in alloc_domheap_pages() only if MEMF_no_refcount is set
v8:
- fixed PGC_extra ASSERT fail in alloc_domheap_pages() by removing PGC_extra
  before freeing
v7:
- PGC_preserved used also in mark_page_free()
v6:
- preserved_flags renamed to PGC_preserved
- PGC_preserved is used only in assign_pages()
v5:
- new patch
---
 xen/common/page_alloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index da505a79f6..6dc8e0d5c9 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -161,6 +161,10 @@
 #endif
 
 #define PGC_no_buddy_merge PGC_static
+/*
+ * Flags that are preserved in assign_pages() (and only there)
+ */
+#define PGC_preserved (PGC_extra | PGC_static)
 
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
@@ -2385,7 +2389,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
+            ASSERT(!(pg[i].count_info & ~PGC_preserved));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2445,7 +2449,7 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
+            (pg[i].count_info & PGC_preserved) | PGC_allocated | 1;
 
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
-- 
2.43.0


