Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A4E8CD5A7
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728546.1133503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9ND-0004vJ-UM; Thu, 23 May 2024 14:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728546.1133503; Thu, 23 May 2024 14:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9ND-0004nP-Pt; Thu, 23 May 2024 14:24:51 +0000
Received: by outflank-mailman (input) for mailman id 728546;
 Thu, 23 May 2024 14:24:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqR6=M2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sA9NB-0004l4-Lv
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:24:49 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3594abba-1910-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 16:24:48 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-794977cbcc3so110760485a.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:24:48 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf34060csm1484523485a.134.2024.05.23.07.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 07:24:46 -0700 (PDT)
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
X-Inumbo-ID: 3594abba-1910-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716474287; x=1717079087; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8Ew7kXbX6WgodqVo4gVB/w3zPAvA0jSuuYBh0aRvRU=;
        b=Urc6KGvqgtJk+ULitDI60Z/ycC6fg9TYwsZWpuEysvbIZ8UPOH6DAldMdi8IaPJjSw
         rC5hI4Uz9xWfI75p/Y+pCkDIeGc+i5/Y9VSA0Lfuc9WESps9X46NXZsSEAf9QtjorNFh
         cagPyfJ4I6JAMP3LfRd8ndJrYcVWpA3r+YeZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716474287; x=1717079087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8Ew7kXbX6WgodqVo4gVB/w3zPAvA0jSuuYBh0aRvRU=;
        b=KeD9EgXTrxVBICmetsPkNKw7MOtRdoUrMkNBhZ0D98598oxBq1uE6P/rgi9eHcQgRZ
         iA2DqOHdpbxMz28pFW3giCu+jrbDe/97EIjrkVbf62pfiKY6lVRHouwiWbt8UZn1DmD4
         xifQF+7TQ2Svp9c6Glr2063aOhUpNrQlN92xXu9s3a4E1mJi2JJF6TDTTwIMHLr4miRR
         TyTlNSkPqVFuNUDoff09lBmxcTycp0+bPcQzwmlwZqF3i94q5IhEIhWsNHlGC8mPqjh5
         9p5siVfjrL7po2A8bJpV1y8qVsGpDwbUbgEZahn8KFVgN9e4xKY/rsfUFBwvEpgz7YWO
         xr0w==
X-Gm-Message-State: AOJu0Yxo+a6VrafWvFRllOBADYl7HdIaF9dzV+jggcje8kwEmWynQ2+K
	OXTt4pjJtyoHTmuTMyFixmdm6hgQkAgBpGJUnq53/9nxTc1RdOzy5lworeER7KAGxxkpzFx7cS1
	IcYY=
X-Google-Smtp-Source: AGHT+IG5VmIs5hbF9sW/q/KrZDjCyvAZCTD8j7mB5ZNItW8pz1J6+O7F4zgT+uRykhLHaoVN5DmJtA==
X-Received: by 2002:ae9:e916:0:b0:792:5b7a:ad58 with SMTP id af79cd13be357-7949941a69fmr549719485a.8.1716474287318;
        Thu, 23 May 2024 07:24:47 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v2 2/2] tools/xenalyze: Ignore HVM_EMUL events harder
Date: Thu, 23 May 2024 15:10:20 +0100
Message-Id: <20240523141020.2256177-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523141020.2256177-1-george.dunlap@cloud.com>
References: <20240523141020.2256177-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To unify certain common sanity checks, checks are done very early in
processing based only on the top-level type.

Unfortunately, when TRC_HVM_EMUL was introduced, it broke some of the
assumptions about how the top-level types worked.  Namely, traces of
this type will show up outside of HVM contexts: in idle domains and in
PV domains.

Make an explicit exception for TRC_HVM_EMUL types in a number of places:

 - Pass the record info pointer to toplevel_assert_check, so that it
   can exclude TRC_HVM_EMUL records from idle and vcpu data_mode
   checks

 - Don't attempt to set the vcpu data_type in hvm_process for
   TRC_HVM_EMUL records.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Anthony Perard <anthony.perard@cloud.com>
CC: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/xenalyze.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 9c4463b0e8..d95e52695f 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -21,6 +21,7 @@
 #define _XOPEN_SOURCE 600
 #include <stdio.h>
 #include <stdlib.h>
+#include <stdbool.h>
 #include <argp.h>
 #include <inttypes.h>
 #include <limits.h>
@@ -5305,8 +5306,11 @@ void hvm_process(struct pcpu_info *p)
 
     assert(p->current);
 
-    if(vcpu_set_data_type(p->current, VCPU_DATA_HVM))
-        return;
+    /* HVM_EMUL types show up in all contexts */
+    if(ri->evt.sub != 0x4) {
+        if(vcpu_set_data_type(p->current, VCPU_DATA_HVM))
+            return;
+    }
 
     switch ( ri->evt.sub ) {
     case 2: /* HVM_HANDLER */
@@ -9447,9 +9451,10 @@ static struct tl_assert_mask tl_assert_checks[TOPLEVEL_MAX] = {
 /* There are a lot of common assumptions for the various processing
  * routines.  Check them all in one place, doing something else if
  * they don't pass. */
-int toplevel_assert_check(int toplevel, struct pcpu_info *p)
+int toplevel_assert_check(int toplevel, struct record_info *ri, struct pcpu_info *p)
 {
     struct tl_assert_mask mask;
+    bool is_hvm_emul = (toplevel == TOPLEVEL_HVM) && (ri->evt.sub == 0x4);
 
     mask = tl_assert_checks[toplevel];
 
@@ -9459,7 +9464,7 @@ int toplevel_assert_check(int toplevel, struct pcpu_info *p)
         goto fail;
     }
 
-    if( mask.not_idle_domain )
+    if( mask.not_idle_domain && !is_hvm_emul)
     {
         /* Can't do this check w/o first doing above check */
         assert(mask.p_current);
@@ -9478,7 +9483,8 @@ int toplevel_assert_check(int toplevel, struct pcpu_info *p)
         v = p->current;
 
         if ( ! (v->data_type == VCPU_DATA_NONE
-                || v->data_type == mask.vcpu_data_mode) )
+                || v->data_type == mask.vcpu_data_mode
+                || is_hvm_emul) )
         {
             /* This may happen for track_dirty_vram, which causes a SHADOW_WRMAP_BF trace f/ dom0 */
             fprintf(warn, "WARNING: Unexpected vcpu data type for d%dv%d on proc %d! Expected %d got %d. Not processing\n",
@@ -9525,7 +9531,7 @@ void process_record(struct pcpu_info *p) {
         return;
 
     /* Unify toplevel assertions */
-    if ( toplevel_assert_check(toplevel, p) )
+    if ( toplevel_assert_check(toplevel, ri, p) )
     {
         switch(toplevel) {
         case TRC_GEN_MAIN:
-- 
2.25.1


