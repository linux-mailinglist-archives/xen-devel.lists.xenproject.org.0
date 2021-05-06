Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7293375546
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123537.233027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeY0-00061s-Rl; Thu, 06 May 2021 14:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123537.233027; Thu, 06 May 2021 14:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeY0-0005w6-NA; Thu, 06 May 2021 14:00:12 +0000
Received: by outflank-mailman (input) for mailman id 123537;
 Thu, 06 May 2021 14:00:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeXy-0003iB-Nv
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:10 +0000
Received: from mail-qk1-x72a.google.com (unknown [2607:f8b0:4864:20::72a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffb43a8e-7703-447f-b2a4-bb32925fd77c;
 Thu, 06 May 2021 13:59:58 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id q136so4938929qka.7
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 06:59:58 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.06.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:59:57 -0700 (PDT)
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
X-Inumbo-ID: ffb43a8e-7703-447f-b2a4-bb32925fd77c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tdayrghQPCz70YHcLBlydERZJ3sNcRxWDd88jzJUALc=;
        b=Xl/6BPBiUg0uCStcneFXNCblFkA8fBAAtMd99bvBPHjbgibrYEP1QXTqKXo9sFK2Z5
         gBXVLKXVqBdSWl02EOWV4NOjwuUZlL1zDlb4luMTk5auVsFRYYvfR54w9Ouss6yRGKXe
         gLxa1QleBm2hdwpQhzM21wn6jgKwxK/wI3FL9rd8ZY1a9qyPfB5p78CHL3H6IazL6DaJ
         +Twf8D/zUSS12p6Iv6KpGpI59jm+qNGigZ7ni1m7wDlw2b0tVfXo5ETW7391UCIuuHiq
         fwb8P3vbExxHQ5LERzLIOzdspbb6V+PxP4HksLyRBhPIEJmthbRcL8RlN6anKQl9HJzQ
         GLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tdayrghQPCz70YHcLBlydERZJ3sNcRxWDd88jzJUALc=;
        b=StLLP4vrM1Wj2H1RksxUkl/v5DHqkdkWpN1dmCrIWnKsirisxU9SK1ejfr8nmslAKW
         bup5jblHYQYQ4xIrCtRZGB1P1oh84opsSgluTyU6Z0P5yzx+x0eOQ5Hnjeeo86zexFlm
         B4jkWVl3yxyChze8qdai4C8zOgFg2Yg8/0nnTHPdh2EzF7amWJ6gJ/iKyYpFg69uM/rT
         sjjFbd2/dTsIYsW8vFUrytYxiT1aeFT040oJxfmCzWMtHVvFq4i2NZsg3UETh8TDvAMD
         Zc1QaKvbcM0NCnFiF4marSDdCloZl1bLa3853GhjsXOA9SOFIXrVsHYgCgvPKEdRqYNI
         k4lw==
X-Gm-Message-State: AOAM531S2OZpzbJxAFx0632UgCgqMrZPdMRC0eDBAp4yzdhWq61kNbqA
	3do/VdikcKv4CCWXnbjXBi6XJ/G0UKs=
X-Google-Smtp-Source: ABdhPJyk/YfrpM7kXpRPeGB7iQ5jVt6CcqzOeDiOnzgAYg+rwg1wDpdcBKYx0JbzqpuI+EhhMyuCqA==
X-Received: by 2002:a05:620a:13e2:: with SMTP id h2mr3875260qkl.235.1620309597850;
        Thu, 06 May 2021 06:59:57 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 04/13] vtpmmgr: Allow specifying srk_handle for TPM2
Date: Thu,  6 May 2021 09:59:14 -0400
Message-Id: <20210506135923.161427-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bypass taking ownership of the TPM2 if an srk_handle is specified.

This srk_handle must be usable with Null auth for the time being.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2: Use "=" seperator
---
 docs/man/xen-vtpmmgr.7.pod |  7 +++++++
 stubdom/vtpmmgr/init.c     | 11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
index 875dcce508..3286954568 100644
--- a/docs/man/xen-vtpmmgr.7.pod
+++ b/docs/man/xen-vtpmmgr.7.pod
@@ -92,6 +92,13 @@ Valid arguments:
 
 =over 4
 
+=item srk_handle=<HANDLE>
+
+Specify a srk_handle for TPM 2.0.  TPM 2.0 uses a key hierarchy, and
+this allow specifying the parent handle for vtpmmgr to create its own
+key under.  Using this option bypasses vtpmmgr trying to take ownership
+of the TPM.
+
 =item owner_auth=<AUTHSPEC>
 
 =item srk_auth=<AUTHSPEC>
diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
index 1506735051..130e4f4bf6 100644
--- a/stubdom/vtpmmgr/init.c
+++ b/stubdom/vtpmmgr/init.c
@@ -302,6 +302,11 @@ int parse_cmdline_opts(int argc, char** argv, struct Opts* opts)
             goto err_invalid;
          }
       }
+      else if(!strncmp(argv[i], "srk_handle=", 11)) {
+         if(sscanf(argv[i] + 11, "%x", &vtpm_globals.srk_handle) != 1) {
+            goto err_invalid;
+         }
+      }
       else if(!strncmp(argv[i], "tpmdriver=", 10)) {
          if(!strcmp(argv[i] + 10, "tpm_tis")) {
             opts->tpmdriver = TPMDRV_TPM_TIS;
@@ -586,7 +591,11 @@ TPM_RESULT vtpmmgr2_create(void)
 {
     TPM_RESULT status = TPM_SUCCESS;
 
-    TPMTRYRETURN(tpm2_take_ownership());
+    if ( vtpm_globals.srk_handle == 0 ) {
+        TPMTRYRETURN(tpm2_take_ownership());
+    } else {
+        tpm2_AuthArea_ctor(NULL, 0, &vtpm_globals.srk_auth_area);
+    }
 
    /* create SK */
     TPM2_Create_Params_out out;
-- 
2.30.2


