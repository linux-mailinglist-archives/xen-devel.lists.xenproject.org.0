Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60795375542
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123542.233051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeYA-00078d-EI; Thu, 06 May 2021 14:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123542.233051; Thu, 06 May 2021 14:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeYA-00075y-9J; Thu, 06 May 2021 14:00:22 +0000
Received: by outflank-mailman (input) for mailman id 123542;
 Thu, 06 May 2021 14:00:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeY8-0003iB-Nn
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:20 +0000
Received: from mail-qv1-xf34.google.com (unknown [2607:f8b0:4864:20::f34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddcf99ed-964d-469e-ac1c-2014191c38bb;
 Thu, 06 May 2021 14:00:00 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id j3so3073994qvs.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 07:00:00 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.06.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:59:59 -0700 (PDT)
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
X-Inumbo-ID: ddcf99ed-964d-469e-ac1c-2014191c38bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bPkiWxfn9TxWci7jUlEYMQpJFIgv4BLfsaWuHMIMW38=;
        b=RzyJ90eZH5ru3q2u6T6ceR4GUw/nWf3Qjqw0TYkDxibbXmtpbqI/pO8Qes2hxE9/Vk
         gKsiYCh2ThxppnjzMny+C/OZ9y5Bjl03yJQHVE1e98bQ2Ti/CB51ChHj9Fk7ZAlMtyEd
         LJH75WHXqRvFcddwwwn1SgMGPYhYq4kdpBOTTaYH3BZgrmkdC0nkUrxc+fhbK/xujhFx
         YP7uKNW7N9vEgvva0k+6mM8KSxaUmx1lEnU847HUs+ji8AjQI1lKn67ZLaOMIhOmuJCJ
         MSsR0bfOLLZmP325f/ZhDGfEkpR7qaQesqRAqcSe0s9gWu53h2EC244GwrIsp6dAXpa/
         i7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bPkiWxfn9TxWci7jUlEYMQpJFIgv4BLfsaWuHMIMW38=;
        b=SbpByoOCh4LWoozyAKSQnXlP4OLmOf8u7apkHkLDa8fbHUokqApOyFIUPEwpbIQ+A4
         hEuYqn5VuIUB9J7rFsOo2Lcq5+kOxziPl6U6GaIRco0gMM4m8di0Mwx72bTMmVnJ5JQe
         hsCf2PAGixaWbznIgUyLrtZOrXriAzvDzm4voEuKwmZtaE2WjjdfQnUy7Vx8Wn9aLk66
         ZVf3gIQknn8ikgakNBiiOaQh0GXCbLGxLffiEqyT3iWzAT5UmQ+yJBJwUri9pzHBZ1xG
         ZYO+ZfPRMi4tsLo/58g0JbPDfcZv6rUA1N/lB9Q1Sk44/rOLz8UzaMisjpMqy2jm135u
         gElQ==
X-Gm-Message-State: AOAM531qW9NDVvier8rx5wGS/ZUwkkcJA5XUEH3X5QoawCCsrNwd/N55
	AYuf4iM6rrth8CZLKaGLsCHalapTtsM=
X-Google-Smtp-Source: ABdhPJwy73jUFiBa9zPp9bCMtDNse2DIEKkyvSQXE/Nck56eaqMgVEvaQ4s+ylVd4ZsZu+rieyg+jg==
X-Received: by 2002:a05:6214:766:: with SMTP id f6mr4327467qvz.17.1620309600120;
        Thu, 06 May 2021 07:00:00 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 06/13] vtpmmgr: Flush transient keys on shutdown
Date: Thu,  6 May 2021 09:59:16 -0400
Message-Id: <20210506135923.161427-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove our key so it isn't left in the TPM for someone to come along
after vtpmmgr shutsdown.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 stubdom/vtpmmgr/init.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
index decf8e8b4d..56b4be85b3 100644
--- a/stubdom/vtpmmgr/init.c
+++ b/stubdom/vtpmmgr/init.c
@@ -792,6 +792,14 @@ void vtpmmgr_shutdown(void)
    /* Close tpmback */
    shutdown_tpmback();
 
+    if (hw_is_tpm2()) {
+        /* Blow away all stale handles left in the tpm*/
+        if (flush_tpm2() != TPM_SUCCESS) {
+            vtpmlogerror(VTPM_LOG_TPM,
+                         "TPM2_FlushResources failed, continuing shutdown..\n");
+        }
+    }
+
    /* Close tpmfront/tpm_tis */
    close(vtpm_globals.tpm_fd);
 
-- 
2.30.2


