Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3210372A57
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122286.230638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUY-00063D-9J; Tue, 04 May 2021 12:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122286.230638; Tue, 04 May 2021 12:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUY-00062U-3x; Tue, 04 May 2021 12:49:34 +0000
Received: by outflank-mailman (input) for mailman id 122286;
 Tue, 04 May 2021 12:49:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lduUW-0005hX-Rg
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:49:32 +0000
Received: from mail-qk1-x733.google.com (unknown [2607:f8b0:4864:20::733])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49133945-3ed6-47e0-953f-deaafcdad809;
 Tue, 04 May 2021 12:49:16 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id i17so8324308qki.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 05:49:16 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:92e5:6d58:b544:4daa])
 by smtp.gmail.com with ESMTPSA id
 i11sm2355001qtv.8.2021.05.04.05.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:49:15 -0700 (PDT)
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
X-Inumbo-ID: 49133945-3ed6-47e0-953f-deaafcdad809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EcH+63aPNYFng4f+xHjI7oU7HEm0WiVbIzYTc1mGNtw=;
        b=XicsVm3VzRnST1nHLjHEHOgRNYyW3z62WGVZqJgCZ2WUO2n+pVVbUqhmvPjK64iTqh
         cjWqp2Wqm4fhQPgxTgGtT8Pu5jDLckiRX6+Y9bX5WWn10ufb3LAW9e94l+hesFvbquYE
         UJv/vDZlTzXFfQdYSX3r8Ya8pT2tK9VyTQUhK2vYpfvKOmByM+lnqIW4b9M61x81jKN/
         OGIG/h/2oIjwgMcGUR0lms9XodeXi1ARLH5DuNaxQtg0EaWRBXiVmBpQ3pMd+Jk298//
         /A7eHTBilOMl9WxV2ATRn3NEVHd8bIP83L+ZtZNiT5mkYMDJ8/RswJv5RLnKjDZbdFwa
         zy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EcH+63aPNYFng4f+xHjI7oU7HEm0WiVbIzYTc1mGNtw=;
        b=rUQsA6sVteIZsGY7mN1yYf/wpLSV1J5uV41Oj35HZObAintTk/4xzAl8WuINuVTt6d
         MAAKd2yF1mNrbIJUfW0KYgSbBOUSVypcCVeNbzVLM6s7XjwEPq0aiKjV5i0bsynYb/yf
         QnIqIwN5wGNamqMNbWAZmCJzm0/vkS9ZdS0cjBwL0wW+P3R/gsakvOjvXsTfzBRLL6FK
         6mTeDtCoKWcFqwg9uDWHhHeJ6c6RrOw7VDKpYqbVKUGFYUr8hjLMnwtGcWQMjLZHIoG6
         1W0k2+0sVltzWLUErKKMq89TYnjtuZP64l53qR2dpZMKzBK0OsID/Mt3TxaI7/RT0lcT
         njaQ==
X-Gm-Message-State: AOAM533RuI/aW+gd/NSmSsEHSB1oyUOd+yaYiXiUOwo8MRKoN/wNCq1F
	BoXgmGSWhzXTM4+7vIFbeuS3OpPh080=
X-Google-Smtp-Source: ABdhPJw/+ohffaaA5Um631ptKNm5wa1RdxFRcwvA4+8PC+zZc3l8NcdkTmCvJba514s3Jrryj5dFhg==
X-Received: by 2002:a05:620a:1230:: with SMTP id v16mr1496277qkj.14.1620132555775;
        Tue, 04 May 2021 05:49:15 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 5/9] vtpmmgr: Move vtpmmgr_shutdown
Date: Tue,  4 May 2021 08:48:38 -0400
Message-Id: <20210504124842.220445-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504124842.220445-1-jandryuk@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reposition vtpmmgr_shutdown so it can call flush_tpm2 without a forward
declaration.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/vtpmmgr/init.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
index c01d03e9f4..569b0dd1dc 100644
--- a/stubdom/vtpmmgr/init.c
+++ b/stubdom/vtpmmgr/init.c
@@ -503,20 +503,6 @@ egress:
    return status;
 }
 
-void vtpmmgr_shutdown(void)
-{
-   /* Cleanup TPM resources */
-   TPM_TerminateHandle(vtpm_globals.oiap.AuthHandle);
-
-   /* Close tpmback */
-   shutdown_tpmback();
-
-   /* Close tpmfront/tpm_tis */
-   close(vtpm_globals.tpm_fd);
-
-   vtpmloginfo(VTPM_LOG_VTPM, "VTPM Manager stopped.\n");
-}
-
 /* TPM 2.0 */
 
 static void tpm2_AuthArea_ctor(const char *authValue, UINT32 authLen,
@@ -797,3 +783,17 @@ abort_egress:
 egress:
     return status;
 }
+
+void vtpmmgr_shutdown(void)
+{
+   /* Cleanup TPM resources */
+   TPM_TerminateHandle(vtpm_globals.oiap.AuthHandle);
+
+   /* Close tpmback */
+   shutdown_tpmback();
+
+   /* Close tpmfront/tpm_tis */
+   close(vtpm_globals.tpm_fd);
+
+   vtpmloginfo(VTPM_LOG_VTPM, "VTPM Manager stopped.\n");
+}
-- 
2.30.2


