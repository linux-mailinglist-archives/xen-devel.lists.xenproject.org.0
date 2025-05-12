Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D335AB3B19
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981611.1368059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUR2-0005uu-2j; Mon, 12 May 2025 14:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981611.1368059; Mon, 12 May 2025 14:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUR1-0005pF-UV; Mon, 12 May 2025 14:47:15 +0000
Received: by outflank-mailman (input) for mailman id 981611;
 Mon, 12 May 2025 14:47:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmCO=X4=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uEUR0-0004eT-G4
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:47:14 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe10d5d7-2f3f-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 16:47:14 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5faaddb09feso9077754a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:47:14 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd219sm634459366b.141.2025.05.12.07.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:47:12 -0700 (PDT)
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
X-Inumbo-ID: fe10d5d7-2f3f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747061233; x=1747666033; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01JaPJq1HUIfLyd6p/KMDQycku6jkHQu8doHAfMrhUM=;
        b=eQKPkY8A1KSahdaUcxpyy3bCEU9rotVhgE2NiT9Vz2KrVby5tcR4ansAIcoMQouhpM
         3+HL48JlduX67HBxdobjijMSCwDOREYQ0e//soEKSjizbsb/Vb1OpGriSUOUrNrSJKqq
         vkcpWkMpMpyiubiomuTyk/zQ+6pT+fG8cTseA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061233; x=1747666033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01JaPJq1HUIfLyd6p/KMDQycku6jkHQu8doHAfMrhUM=;
        b=E7h/ddzfWVb8K4c+tldZalmz3EcKcU9bys/TecYFHYyiXHiwJ0XWxtTVzy4Lvmi/jl
         dnmEp+mDqtlz1HWw/5UaOTvgCmi16KWx01/XHZXx5Pbx9XTmAeYTgfXzdVby0FNWC9Ol
         k70skYd8oQP/IGznExrlpXKlzggDVkp6UFI/iA/8iT6ItbtlNcTmsSsG3XfOtlAjJuO9
         bMSfOKqubn4HkARwPntgxIwCeJI9zr78xsDtmON1NjlVlUiA5oGppNCUwbEVHutj/vDo
         yd9lvdkQHvddw07RlQd6lv4rfLa3kBE8PlsH1k/aIxsXqZeu/DgFMQMJDGjkd/ZwxtGe
         Jvgw==
X-Gm-Message-State: AOJu0Yzm+usMmuRyIxLAoHgNzEWXwLio2VrqEZXQy1jvTuLTFqV5tngW
	rEj5PJPEcCjosN2TANJQH9MjRk1ssfpP2jvF2Pya9TagOg/bt9n/BtT11c7MTt8q9Bm5LhUkz44
	=
X-Gm-Gg: ASbGnct/VpQ5QXVtuT1xtK7yf3/yX5DPWZr/E4T70tXX7gj5OkdSM866HKJlVfyKfhM
	+XQL1Eodz7EPl014hjAwgXL0k4fsl8hIsNauDTe/+Zn++lPeaMMDgtGZ2W/U7THU/Z0QfeLwkr4
	BgPwubMqkWkCKpBdFDQcFk2loFpV6hdflP8y2GNsw2MBiw7Rg1HdZUCBCTLp9NEOxH5M23TtVA3
	jQRMmEvVTHOhQ26Qs8Vo34FUp+gUeX6sZZHsHcwWfwK9JeW+L9Zm9YfYYmNiAbMab8XY1hBNCbh
	8HucQ5b9sdBPl4A817X8TJi1/tu+AfZGUzYzOYVwUAZvFf7LA6rwjrw/vJYxxlF5lrU+sPDLLg4
	=
X-Google-Smtp-Source: AGHT+IEBx/JzvRvtyi20dg41RTK2744kQ4OpYwLZRVXJH0s8BIZ5GL4/1D1aW4SSUruHPIoM8r1NyA==
X-Received: by 2002:a17:906:f80f:b0:ad2:238e:4a1b with SMTP id a640c23a62f3a-ad2238e4b77mr1010070866b.15.1747061233344;
        Mon, 12 May 2025 07:47:13 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 5/5] libxc/PM: Retry get_pxstat if data is incomplete
Date: Mon, 12 May 2025 15:46:56 +0100
Message-ID: <20250512144656.314925-6-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512144656.314925-1-ross.lagerwall@citrix.com>
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the total returned by Xen is more than the number of elements
allocated, it means that the buffer was too small and so the data is
incomplete. Retry to get all the data.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

* New in v2.

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


