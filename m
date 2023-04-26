Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C28A6EF6FA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 16:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526750.818709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcX-0001kD-Ig; Wed, 26 Apr 2023 14:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526750.818709; Wed, 26 Apr 2023 14:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcX-0001hI-FS; Wed, 26 Apr 2023 14:59:49 +0000
Received: by outflank-mailman (input) for mailman id 526750;
 Wed, 26 Apr 2023 14:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxt2=AR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1prgcV-0000bz-LF
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:59:47 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb69d864-e442-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 16:59:46 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so38226505e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 07:59:46 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b003047ea78b42sm6654116wrr.43.2023.04.26.07.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:59:43 -0700 (PDT)
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
X-Inumbo-ID: fb69d864-e442-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682521184; x=1685113184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oGcNamzq83RSDTcW0FBMjk99Wl1dp80foK2pDBAN98=;
        b=Hl26xmLqoalAyuUskJWFwA3NyNZTQ4t0E3QRIP/EjrPvqlwP0GA+lZ5HPpxo22DWOk
         pHhSuN+K9ghqHpKB7yXMaHhl+i220M/gAiv/M5QWyxLBr39B8H0iRdk2SPvXTNyrVhbF
         T4niznkfbKGC1wFypzTlkqYkA76mF1hKmEGXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682521184; x=1685113184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oGcNamzq83RSDTcW0FBMjk99Wl1dp80foK2pDBAN98=;
        b=SAJFJlpOw58rTu0mo07Lyxx/Dg+nV1xLxEE6nDSDCQf1aBZPBH+yqVYMkzGxnCUEWg
         GMbg2NsxUCFWUsP1/Aj3vTLzsFB8qaumgweXuLFURzy/b3+e1Y3nSxiaCfe7pUW+oErA
         h4zzS0/yUL8twBsHtfc4nII4joF3eEzzf7LRb70plJ7PNpYtknEGhEseyF61O21lk7Yp
         hjtKJB7Vdid9E9jO3krW6UA94UxTeLoj+s1fWPjHYk2KbSdDDuknCBjQIMYonW8WzxKC
         7YwfiNvNaRxXh+b2VQ1CI3tbU6T2gmA9t5yWScqtjarvv423Gyq5EB2GO7Q8wIyPctUu
         NJXA==
X-Gm-Message-State: AAQBX9ft1HIOXr5VFS5MLU8145giN5ET3cx/FUlr+g33YT8FCYKR3Xya
	9WBfrSOuTt4PgjXMHJ6yFEAIvRJnuS7UYXIo65rpwQ==
X-Google-Smtp-Source: AKy350bcd+UvEAzKLO6obU/iO59tbgHrProju74w+psAGKtSZ6hWKlorVHdNsC37N2u/GIcK0atBMw==
X-Received: by 2002:a7b:ce04:0:b0:3f0:f3ee:9e2a with SMTP id m4-20020a7bce04000000b003f0f3ee9e2amr13094550wmc.35.1682521184572;
        Wed, 26 Apr 2023 07:59:44 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.org>
Subject: [PATCH 4/7] tools: Make init-xenstore-domain use xc_domain_getinfolist()
Date: Wed, 26 Apr 2023 15:59:29 +0100
Message-Id: <20230426145932.3340-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It currently relies on xc_domain_getinfo() returning the next available
domain past "first_domid", which is a feature that will disappear in a
future patch.

Furthermore and while at it, make it so the hypercall tries to fetch information
about more than one domain per hypercall so we can (hopefully) get away with a
single hypercall in a typical system.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Juergen Gross <jgross@suse.org>
---
 tools/helpers/init-xenstore-domain.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 0950ba7dc5..5f40901d31 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -21,6 +21,7 @@
 #define LAPIC_BASE_ADDRESS  0xfee00000UL
 #define MB(x)               ((uint64_t)x << 20)
 #define GB(x)               ((uint64_t)x << 30)
+#define ARRAY_SIZE(x)       (sizeof(x) / sizeof((x)[0]))
 
 static uint32_t domid = ~0;
 static char *kernel;
@@ -322,16 +323,19 @@ err:
 
 static int check_domain(xc_interface *xch)
 {
-    xc_dominfo_t info;
+    xc_domaininfo_t info[8];
     uint32_t dom;
     int ret;
 
     dom = 1;
-    while ( (ret = xc_domain_getinfo(xch, dom, 1, &info)) == 1 )
+    while ( (ret = xc_domain_getinfolist(xch, dom, ARRAY_SIZE(info), info)) > 0 )
     {
-        if ( info.xenstore )
-            return 1;
-        dom = info.domid + 1;
+        for ( size_t i = 0; i < ret; i++ )
+        {
+            if ( info[i].flags & XEN_DOMINF_xs_domain )
+                return 1;
+        }
+        dom = info[ret - 1].domain + 1;
     }
     if ( ret < 0 && errno != ESRCH )
     {
-- 
2.34.1


