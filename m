Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A8E375544
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123539.233039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeY6-0006af-6L; Thu, 06 May 2021 14:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123539.233039; Thu, 06 May 2021 14:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeY5-0006YV-WD; Thu, 06 May 2021 14:00:18 +0000
Received: by outflank-mailman (input) for mailman id 123539;
 Thu, 06 May 2021 14:00:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeY3-0003iB-Ni
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:15 +0000
Received: from mail-qk1-x72c.google.com (unknown [2607:f8b0:4864:20::72c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f2b0a8a-1094-4fc4-b780-cb8eb8f45673;
 Thu, 06 May 2021 13:59:59 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id x8so4970604qkl.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 06:59:59 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.06.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:59:58 -0700 (PDT)
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
X-Inumbo-ID: 7f2b0a8a-1094-4fc4-b780-cb8eb8f45673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jlS7YCsZWAJRCh7VQeSElH9c4MLj2HkvcGmj37dX+gg=;
        b=pVdEJP/iDrGELOtr9qRnBVOIPZ2ZN0l0ZfloCS2HRZitIANAaey0IPnF7UmqjLIn96
         n/JRq1SY5EL/IBGqmnbMFmSx/QWGztcQle9WuuUrSG+BYWRzpZUdxmV3QHR8hnGfbv//
         Ije3dTarTSN0P+MyqQ4/EE+KKcrfzzZBZPb8JGfjOk7LxYam3vXT8WnN7h2GIv0ulPSa
         YwGlJoaSSHzoCBFDdTVzVcOl2lKURv4aLZOM7AaagnwNM6E4jKxJ0F8lXwrObKix13KL
         R5MYM0VNqy9uYBMR4ePJ2VwPQCPuBsHewBg/JntIZBzqBT3yUxgO6eoGi7dL1JFsLSie
         202g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jlS7YCsZWAJRCh7VQeSElH9c4MLj2HkvcGmj37dX+gg=;
        b=kaaDUKbLUOxh+JHrKWsSui9oApRPegu1IA5IAwLPrCItDq4qxgXAnl37/dhXQMCuwn
         bZQhjmeQVugg85aWoTjCNuhoI6Dap7TX07gvtevN1dq80omX5/XarPQBfTnmcgUOH3hZ
         sG62ZdDBF6Y69+fqOya1FECrQ9d71/xfGKLtawZSmeNRm8A9BNGGS54LqtotB4gRIWwS
         wAbH65sLQse31ZLDPY34UEYOJb5+HVuVTnVI641GQ+4A28UkeuDreQ7u+Pgtsoypif0t
         XPAyNDko6ADA4D3DeToVR9c11T9fuFGR2NS6cH7guwbtf1OaOpwGcwllDFcuA4jeAx40
         TGsg==
X-Gm-Message-State: AOAM533NpPqWQu000l+X+eMI6yKVLdIYorP+pyI2SAXY8lsJzkc+6etK
	yEF9wTNvubcg1lRs04L3Urzb2DPCpz4=
X-Google-Smtp-Source: ABdhPJwSnWOKEZY6X4zaxq3gEapAmbN8i/Fn9uZbztWZrw1J2bhZYr6B32L2xUaFQxx4LT/XNVZUpQ==
X-Received: by 2002:a37:8744:: with SMTP id j65mr4376689qkd.304.1620309598982;
        Thu, 06 May 2021 06:59:58 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 05/13] vtpmmgr: Move vtpmmgr_shutdown
Date: Thu,  6 May 2021 09:59:15 -0400
Message-Id: <20210506135923.161427-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reposition vtpmmgr_shutdown so it can call flush_tpm2 without a forward
declaration.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 stubdom/vtpmmgr/init.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
index 130e4f4bf6..decf8e8b4d 100644
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


