Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06461AC5202
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998562.1379317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCd-0001Ud-R7; Tue, 27 May 2025 15:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998562.1379317; Tue, 27 May 2025 15:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCd-0001Pv-MG; Tue, 27 May 2025 15:26:55 +0000
Received: by outflank-mailman (input) for mailman id 998562;
 Tue, 27 May 2025 15:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzHE=YL=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uJwCc-0001GX-9e
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:26:54 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04068e36-3b0f-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 17:26:52 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-602039559d8so6967152a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:26:52 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6049d482cc7sm3442712a12.19.2025.05.27.08.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 08:26:51 -0700 (PDT)
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
X-Inumbo-ID: 04068e36-3b0f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748359612; x=1748964412; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+VEb8t0VEsYQfvMjLE4L2oQ6RvTwDmIbkwe2PQDnDw=;
        b=CH8auMAvQtviTHcGhPc3AN8TeobWt8Bjg8DS3y6Gck5YLMVVsqsaugkpBCp7eSzacA
         MG+Rz+VBYkA/tP6N9GLEEmhxLsfkh8Q4fdGntXo2qP7hKD/ntnKjTHrRe1emT9dwDOur
         GxxVPp8NKJC1s66zcRRV/ZcuM8rJHciFEfT3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359612; x=1748964412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+VEb8t0VEsYQfvMjLE4L2oQ6RvTwDmIbkwe2PQDnDw=;
        b=EoBxk+W1uv62FgD/mcOxDVl5sTANfKsKOGb7JKFCShs209oEQbsyPBZXOFpfn27LqH
         58DVe9EBTY9U5IoA4OjWV+SVMI4VkkNJtk3JwYoelvQZSS6ekyXPq/WF8L3OAHNJ4Qtd
         4G/iwUbMqvNvUE4eZyapLO3WH1/GdJV5elbrlVQ/ayXrwlkyQpdR2K8o5V6MVSs6VXH6
         vKxMEDTM6Eky+RBPOyaFxM80tqrQuqn3nki2yRw7V2DxVzoCPIAo69PV5447nOpOwT4l
         ml2K4z0bPxM8vxHJVErmX7kAZiwuoYQb25vHlR4UE7ZEs28iDJwdRbZKwH8yC2Ui/bk1
         C9zQ==
X-Gm-Message-State: AOJu0YxKBOUS8QiYRUXiR3jUK5liyDCaEuZnnUV0u1ZtLxHNxzosNhec
	tkUJX+Oq4/lDTaN5QrVELw7oorRDG92cwYYtmWrAixzxN5XwSBE1oMDa//urV0v0hgV+WACuRQM
	5wyA=
X-Gm-Gg: ASbGncsRK+zsmQvHH4lZy1SFuwetU5rEjfTYxsU+vzoD8N+d/UZlEs0R6PuE/PNTiTk
	5XeHRSBndd4AIhdIq6kWZKcsGZc3V+g8nGkyEpPJgzLhsg5sCXpPGxUdujnxTFTYBeSk5QNllHc
	LvWuWdECozzDX36qrHw8hXDmcaaljv7Xa6vEhRd7q0BOHEJ8Zik/gdIjV2JGl/zcfq/W39v0e1m
	g2C5k1VlwqdqTOJ25eE++mqxw+D7wcOK3UKxE1Sb/bpcpDVV1j7CJZ+/8J9kqNCdJUVGPLdtDIV
	+IGLndeArFRjUmAr8UeQ7IE3TP/3cWXT+PPPaNqTu6yqaas07uBqU6hs/3Gfb4uYO7R+Ae9fXCU
	=
X-Google-Smtp-Source: AGHT+IHmacdcV8Xv0A2x8fYmDlkSIjjTWVtLBb7+07rSusdS1QTYhHRiXc70jGeNg3TJSWPuYpLYXQ==
X-Received: by 2002:a05:6402:34d6:b0:5fb:455f:ac40 with SMTP id 4fb4d7f45d1cf-602d9061f6amr12010075a12.4.1748359611915;
        Tue, 27 May 2025 08:26:51 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 5/5] libxc/PM: Retry get_pxstat if data is incomplete
Date: Tue, 27 May 2025 16:26:35 +0100
Message-ID: <20250527152635.2451449-6-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
References: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the total returned by Xen is more than the number of elements
allocated, it means that the buffer was too small and so the data is
incomplete. Retry to get all the data.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/misc/xenpm.c | 49 +++++++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index de319329e6b0..d5387f5f0693 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -312,29 +312,42 @@ static int get_pxstat_by_cpuid(xc_interface *xc_handle, int cpuid, struct xc_px_
     int ret = 0;
     int max_px_num = 0;
 
-    ret = xc_pm_get_max_px(xc_handle, cpuid, &max_px_num);
-    if ( ret )
-        return -errno;
-
     if ( !pxstat)
         return -EINVAL;
 
-    pxstat->total = max_px_num;
-    pxstat->trans_pt = malloc(max_px_num * max_px_num *
-                              sizeof(uint64_t));
-    if ( !pxstat->trans_pt )
-        return -ENOMEM;
-    pxstat->pt = malloc(max_px_num * sizeof(struct xc_px_val));
-    if ( !pxstat->pt )
+    for ( ; ; )
     {
-        free(pxstat->trans_pt);
-        return -ENOMEM;
-    }
+        ret = xc_pm_get_max_px(xc_handle, cpuid, &max_px_num);
+        if ( ret )
+            return -errno;
 
-    ret = xc_pm_get_pxstat(xc_handle, cpuid, pxstat);
-    if( ret )
-    {
-        ret = -errno;
+        pxstat->total = max_px_num;
+        pxstat->trans_pt = malloc(max_px_num * max_px_num *
+                                  sizeof(uint64_t));
+        if ( !pxstat->trans_pt )
+            return -ENOMEM;
+        pxstat->pt = malloc(max_px_num * sizeof(struct xc_px_val));
+        if ( !pxstat->pt )
+        {
+            free(pxstat->trans_pt);
+            return -ENOMEM;
+        }
+
+        ret = xc_pm_get_pxstat(xc_handle, cpuid, pxstat);
+        if ( ret )
+        {
+            ret = -errno;
+            free(pxstat->trans_pt);
+            free(pxstat->pt);
+            pxstat->trans_pt = NULL;
+            pxstat->pt = NULL;
+            break;
+        }
+
+        if ( pxstat->total <= max_px_num )
+            break;
+
+        /* get_max_px changed under our feet so the data is incomplete. */
         free(pxstat->trans_pt);
         free(pxstat->pt);
         pxstat->trans_pt = NULL;
-- 
2.49.0


