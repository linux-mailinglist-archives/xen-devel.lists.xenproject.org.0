Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3C56CAA14
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 18:13:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515373.798176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgpTP-0005BG-UP; Mon, 27 Mar 2023 16:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515373.798176; Mon, 27 Mar 2023 16:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgpTP-00059H-RC; Mon, 27 Mar 2023 16:13:31 +0000
Received: by outflank-mailman (input) for mailman id 515373;
 Mon, 27 Mar 2023 16:13:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dqr1=7T=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pgpTO-0004tz-I6
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 16:13:30 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f1298f1-ccba-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 18:13:28 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 q7-20020a05600c46c700b003ef6e809574so2402810wmo.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 09:13:28 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a05600c365800b003ef71d541cbsm2279124wmq.1.2023.03.27.09.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 09:13:27 -0700 (PDT)
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
X-Inumbo-ID: 4f1298f1-ccba-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1679933607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwKM0mUDm0yiSQL3cWLoPSUZyNXRWXB6fhqvfZgVZT8=;
        b=ZtCaJBQDi2yCvEbh7MsCJkCRdej0Bwh6qqjCzJwlZq9mxQRR7fsyFK7rZa/b7bo9Vu
         lVMIctm7jjfSkLT5FLTGRcv5yA5vK+jrvUVfXZorDs1cYGIKE4iRcSGDh/OK4OBja6g1
         By33+U9gXgFYUAhzZCzV3QSlFL1UaJulCmfz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679933607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwKM0mUDm0yiSQL3cWLoPSUZyNXRWXB6fhqvfZgVZT8=;
        b=wX1CL+9mQA0SiSUI2lwQnXKChGQ84k+ZlCvJRoRoWx2/5GTI2UL3KMX3NklRPBJQlw
         Za9yrS5GcHTeIA0TuTD/BQM7MGi30EVUT0KjxSRedlJ/s9z1XWfGY9YKwBdXifdgy4kU
         61+HckMazT3hUNqHRLcu9g/mjlGm6bu1K7OVppqJwIKMVlfFCxhjMdOToSoKu3g3spIi
         9OH73382ChSpFqnetQzqUBlWh+Oy3/GhvCAWy4wFU9ughQMNlaglIOJ7TrAvoWl5Ryig
         sAqJcEhHPlcF63he2BfETlLeP88Idv1Vo/sQJoErfGwD3sPLGEfYJR5DTI1z5PFrHMBT
         OsiA==
X-Gm-Message-State: AO0yUKWoNeTv7sJshlA4R5Uve0otwN4KYdi738wmTA8iNI/iItf9BaBt
	GZ4aTITUSlQ29n9Je/SjzHOJFV0wo8OWZQ7wyBeh8w==
X-Google-Smtp-Source: AK7set+094p4e6b50ti5TAycS0gYA2EfNG+pCO9Z4Mjec8HxDHV3VQaKB+RIw4S6rVfehxR8NZVoRg==
X-Received: by 2002:a1c:7516:0:b0:3ef:3ce6:7c69 with SMTP id o22-20020a1c7516000000b003ef3ce67c69mr9600592wmc.8.1679933607525;
        Mon, 27 Mar 2023 09:13:27 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@cloud.com>
Subject: [PATCH 2/2] xenalyze: Basic TRC_HVM_EMUL handling
Date: Mon, 27 Mar 2023 17:13:26 +0100
Message-Id: <20230327161326.48851-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327161326.48851-1-george.dunlap@cloud.com>
References: <20230327161326.48851-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For now, mainly just do volume analysis and get rid of the warnings.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@cloud.com>
---
 tools/xentrace/xenalyze.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 9f6d9763ac..83b835d793 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -987,6 +987,7 @@ enum {
     HVM_VOL_VMENTRY,
     HVM_VOL_VMEXIT,
     HVM_VOL_HANDLER,
+    HVM_VOL_EMUL,
     HVM_VOL_MAX
 };
 
@@ -1013,6 +1014,7 @@ const char *hvm_vol_name[HVM_VOL_MAX] = {
     [HVM_VOL_VMENTRY]="vmentry",
     [HVM_VOL_VMEXIT] ="vmexit",
     [HVM_VOL_HANDLER]="handler",
+    [HVM_VOL_EMUL]="emul",
 };
 
 enum {
@@ -5275,15 +5277,18 @@ void hvm_process(struct pcpu_info *p)
     if(vcpu_set_data_type(p->current, VCPU_DATA_HVM))
         return;
 
-    if(ri->evt.sub == 2)
-    {
+    switch ( ri->evt.sub ) {
+    case 2: /* HVM_HANDLER */
         UPDATE_VOLUME(p, hvm[HVM_VOL_HANDLER], ri->size);
         hvm_handler_process(ri, h);
-    }
-    else
-    {
+        break;
+    case 4: /* HVM_EMUL */
+        UPDATE_VOLUME(p, hvm[HVM_VOL_EMUL], ri->size);
+        warn_once("WARNING: We don't yet analyze HVM_EMUL events.\n");
+        /* FIXME: Collect analysis on this */
+        break;
+    default:
         switch(ri->event) {
-            /* HVM */
         case TRC_HVM_VMEXIT:
         case TRC_HVM_VMEXIT64:
             UPDATE_VOLUME(p, hvm[HVM_VOL_VMEXIT], ri->size);
-- 
2.25.1


