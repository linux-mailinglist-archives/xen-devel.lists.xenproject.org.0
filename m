Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAB06F12FC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 10:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527185.819488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJ9h-00039j-Hg; Fri, 28 Apr 2023 08:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527185.819488; Fri, 28 Apr 2023 08:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJ9h-000379-EK; Fri, 28 Apr 2023 08:08:37 +0000
Received: by outflank-mailman (input) for mailman id 527185;
 Fri, 28 Apr 2023 08:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmhV=AT=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1psJ9g-00036x-G7
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 08:08:36 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df9af7b3-e59b-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 10:08:35 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso64382075e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 01:08:35 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c230d00b003f31da39b62sm2569464wmo.18.2023.04.28.01.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 01:08:34 -0700 (PDT)
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
X-Inumbo-ID: df9af7b3-e59b-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682669314; x=1685261314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruSDN7fkH/OcFoZofz/uE6f8wHRubeKwBT3psKG1zkY=;
        b=Bbk8MHYhSTUiQuilXeTQUUn2+xE9TuMCk0qc3kF6rZaqQAM8riYJ0NuiVz5s8GR3UJ
         1/DzStwJdpKKBPUMDubq4p/j6PdT90q4ac4ZeFbI7o3mdZYlV3igYQf/5PDMIQQPHVrO
         TLw+NXBZ9z6ysOr9wHa0ndsrIeb7ACZl2qjaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682669314; x=1685261314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruSDN7fkH/OcFoZofz/uE6f8wHRubeKwBT3psKG1zkY=;
        b=krgU1RyyxB0FiGhRXpc06/0ghNhfqeHBG7eK2HHMmWo8iHcipuzJwHyuwXKW6ZliN3
         WpLQQ6DZ54nh44QvuLW+nvQczWUq6hQoQIiTe47TPuA+jA0eKeBSsFGMTgYgxkgN5ig5
         uK/D+6pfpdQ/aoST4VXTkQXhC4SRbEh8ceRcwtcZoE4808/x10GTyu4WY4HT+MQC/KuU
         iB0A8HNOKwTNuAd3uqJNHwob0JjL8z0FJ+ZmINrxikJStgNeW0dqPYx+hp4QYvWJ6gBg
         Xsio1SrE4fixiHZYcSrNTzO7GvW0bkJ5EHKz57hn1bJPnPNyNxiIwmOH9gciNqH05IcQ
         RHiw==
X-Gm-Message-State: AC+VfDz1pWFn+t/7B0TRoy3TQSrG/NaMDjrViUeOmHu6F+6OW+mWrqCx
	BJ8v1e1la0lVzddjHJ0u3L0nYwtvmxpesL+0Y/U=
X-Google-Smtp-Source: ACHHUZ662rNa/wbV8EG5ieb17gNhTuOnlw4IBT7Q1xgrvUjLcH2hUUYaFfSxqNOVQlypCm8sE4yC+w==
X-Received: by 2002:a7b:cb94:0:b0:3f1:7ba6:d5ab with SMTP id m20-20020a7bcb94000000b003f17ba6d5abmr3392478wmi.36.1682669314569;
        Fri, 28 Apr 2023 01:08:34 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@cloud.com>
Subject: [PATCH 2/5] xenalyze: Basic TRC_HVM_EMUL handling
Date: Fri, 28 Apr 2023 09:08:29 +0100
Message-Id: <20230428080832.2461044-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428080832.2461044-1-george.dunlap@cloud.com>
References: <20230428080832.2461044-1-george.dunlap@cloud.com>
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
index ff9716cd12..f7f8943079 100644
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


