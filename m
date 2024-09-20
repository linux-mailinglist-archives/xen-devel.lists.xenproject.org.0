Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D22597D3BC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 11:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801080.1211133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sra4b-00018D-M4; Fri, 20 Sep 2024 09:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801080.1211133; Fri, 20 Sep 2024 09:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sra4b-000161-Hw; Fri, 20 Sep 2024 09:37:09 +0000
Received: by outflank-mailman (input) for mailman id 801080;
 Fri, 20 Sep 2024 09:37:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1w=QS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sra4Z-0000OC-LW
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 09:37:07 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6d5e6e2-7733-11ef-a0b8-8be0dac302b0;
 Fri, 20 Sep 2024 11:37:07 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso2249042e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2024 02:37:07 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b38c8sm818163366b.103.2024.09.20.02.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 02:37:05 -0700 (PDT)
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
X-Inumbo-ID: e6d5e6e2-7733-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726825026; x=1727429826; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1N4dCytGEzetjbXwIG17gkrBm9HHnJ0smkpdbjRf43Q=;
        b=apagAd7c7Wg+RAKFdXbBLHh4Zb2iNPASR2DAs/sfvFUQZYzi2K96LJygLj4KGvbON1
         /3kj9vHnZtr8auqUQN4DEMiWxv7bw/S7kljT45kfb/gAjZUw3jY7DSIPrLdiCZAltwMz
         MvAf3+eiR/8/hcGEn6nfViPnas0m7hDKfbBx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726825026; x=1727429826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1N4dCytGEzetjbXwIG17gkrBm9HHnJ0smkpdbjRf43Q=;
        b=ma9IV+AvXHLy9rel65YIarkx+tsk85IjHJw8CCppIFV9l3fOCPxdsKTRD1lSqWY0B1
         1ym8RX/XADj+qmK5shCc7WDJmxjNYiizUPkAHWpeo2cxp6jxEsH1IxI9XhBifmH1EKql
         mI1xqxcGwCBlEmA1cJsZYzvTV6DkNfAsk9Fvf3+7e+XuFDrLOjF1eE3Gl/49dy0wKeZL
         1blDlGK1WDp3q4NLnb431qLOvmSHmTQw+39gD6OVaGFk5C59eOqtDqJdZUcuvQ+AEBkW
         couOzR56AdwZ2pLk2Q+pCBD2WLnnJjhsaDnzn060NCzJXXKaKHR0YjuSHpJSPKDbfjoT
         6d7w==
X-Gm-Message-State: AOJu0YxeYtYXRK3LXm5sn6WpsNzB0bTTVwu1J/32pAS5F9kFcJKiyfwV
	BWiwIqTWsz4/8fVGKpTaZ9MZxxanmLFvoChoBiAkAYC81VGuNewF+cSzjQYBVOzVeQs8C91zjA+
	E
X-Google-Smtp-Source: AGHT+IHhvvIt+KgvTO9l5R4mcB4EbpcBhhw6Mx5U5GtLiA1CWcOQ0GlWTILJbgfX9YNYLOncwU8dNQ==
X-Received: by 2002:a05:6512:39c4:b0:536:a4f1:d214 with SMTP id 2adb3069b0e04-536ac2e705bmr1758118e87.19.1726825025701;
        Fri, 20 Sep 2024 02:37:05 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/3] xen/livepatch: do build-id check earlier
Date: Fri, 20 Sep 2024 11:36:55 +0200
Message-ID: <20240920093656.48879-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920093656.48879-1-roger.pau@citrix.com>
References: <20240920093656.48879-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The check against the expected Xen build ID should be done ahead of attempting
to apply the alternatives contained in the livepatch.

If the CPUID in the alternatives patching data is out of the scope of the
running Xen featureset the BUG() in _apply_alternatives() will trigger thus
bringing the system down.  Note the layout of struct alt_instr could also
change between versions.  It's also possible for struct exception_table_entry
to have changed format, hence possibly leading to other errors.

Move the Xen build ID check to be done ahead of any processing of the livepatch
payload sections.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/livepatch.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 8043954ad0fc..a20f9fb2294d 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -765,6 +765,11 @@ static int prepare_payload(struct payload *payload,
     if ( rc )
         return rc;
 
+    /* Perform the Xen build-id check ahead of doing any more processing. */
+    rc = xen_build_id_dep(payload);
+    if ( rc )
+        return rc;
+
     /* Setup the virtual region with proper data. */
     region = &payload->region;
 
@@ -1097,10 +1102,6 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
         goto out;
 
-    rc = xen_build_id_dep(payload);
-    if ( rc )
-        goto out;
-
     rc = build_symbol_table(payload, &elf);
     if ( rc )
         goto out;
-- 
2.46.0


