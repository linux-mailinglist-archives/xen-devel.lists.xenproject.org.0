Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852C58B3A3F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 16:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712865.1113758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Mmv-0003A6-Pc; Fri, 26 Apr 2024 14:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712865.1113758; Fri, 26 Apr 2024 14:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Mmv-00037R-Lq; Fri, 26 Apr 2024 14:42:57 +0000
Received: by outflank-mailman (input) for mailman id 712865;
 Fri, 26 Apr 2024 14:42:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duI6=L7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s0Mmu-0002sK-Ig
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 14:42:56 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 439e7761-03db-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 16:42:54 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-78f02298dc6so186779985a.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 07:42:54 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 wx37-20020a05620a5a6500b0078eebee6a49sm6391956qkn.85.2024.04.26.07.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 07:42:53 -0700 (PDT)
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
X-Inumbo-ID: 439e7761-03db-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714142573; x=1714747373; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXHEfgfyj51oD/ZxnN9kSBhtg86uYskAmnXw5EeUELY=;
        b=XCEPUVQ73Dw67R6o9D6ZRgx0w8oU2XxJYs8891AnKsj4GpB2AUpTkf7+2rs9wBw+yt
         k+g4lxIzW2FIp0xJ/pVaaShI5XoT2hSmF9FnyxfDtagPMbhcN9vgDeZ1JR9Q3ltI2tfI
         tGszY+gizwOQYxAguAekwhEgdH538/K/x9RmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714142573; x=1714747373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXHEfgfyj51oD/ZxnN9kSBhtg86uYskAmnXw5EeUELY=;
        b=Axk9bv0LuvmKBLvWweK6X+lXv+YWW36UOClzvr/np/JfI9ZQZ/TovfC6/aM3/Ww9S/
         Fln0aE8F0IRa9SODfTs4J2K+hY8tppU4HXPRAooWwL7/LRW+OjHBHefaRYJJFF8VncHW
         R4xe2ouDk9SQURF9C07JBwakiqOnLxcLPkLNkgHgM1svIoIyW3NJAbbIMbmlWI39l2X0
         bJVQ2DfUfGotfxrW5DEzR6vwuDFAzssGvpDYWZ1x02KyNusvXYCFicTIOttSbetlC5nF
         lu6vQYoIQ9mp8zjXF/HWCXFJeTBDa50aWD6V57QzdTnFoDhBbO7aOkWiY2mbYm7vfSeY
         aAfA==
X-Gm-Message-State: AOJu0YxvOkC7lxtqdsNHf1t8s4WykG1bbBgMcqlv/2y8MY1dqIbVADi8
	zLdW/Xx59EWvoq8Guls7Rd2t5e0KiOFdXQ2gm1dP9k2mV1b6+7SrkDy2M/qa5u330gIBvhg/5TD
	p
X-Google-Smtp-Source: AGHT+IGFegEd9p8orEaFBK/BLg4FWgVMzNqwi6lArJmYGMQrKA+JBmyec2gtCEXTiJdrwUS4BIdv6g==
X-Received: by 2002:a05:620a:3604:b0:78e:d6bb:8e59 with SMTP id da4-20020a05620a360400b0078ed6bb8e59mr4479515qkb.33.1714142573275;
        Fri, 26 Apr 2024 07:42:53 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Olaf Hering <olaf@aepfle.de>
Subject: [PATCH 2/3] tools/xenalyze: Ignore HVM_EMUL events harder
Date: Fri, 26 Apr 2024 15:32:30 +0100
Message-Id: <20240426143231.4007671-3-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426143231.4007671-1-george.dunlap@cloud.com>
References: <20240426143231.4007671-1-george.dunlap@cloud.com>
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
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Anthony Perard <anthony.perard@cloud.com>
CC: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/xenalyze.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index ceb07229d1..8fb45dec76 100644
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


