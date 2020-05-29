Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1286B1E8322
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 18:06:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehWh-0003rg-9x; Fri, 29 May 2020 16:06:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U2UY=7L=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jehWf-0003rb-Ea
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 16:06:29 +0000
X-Inumbo-ID: 5ae221ac-a1c6-11ea-8993-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ae221ac-a1c6-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 16:06:29 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id q18so3006535ilm.5
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bNwL/Y4/GmosR1INEWPqs8uou9ZF6KIaP09v37iMA8o=;
 b=ZpMqUyKC9muT2SHHfkxzqXvn1mtPRX28OHUNm4r78cw5QFkoJCbg/w4Djk/HIUA0qW
 HS0ihojMTcnuDy9dyHzsihd8JcyRmKNVMlmngTfQTSyWNimS4a2HdGXDM6AHhEqsLmnX
 eJHdq8Q7MhlmkjoHGwl6gZ+G2qZshkZC6ACTQ7UPgrK40Djb1UMdOk5yzhYwFVEeZc4K
 FtJvbbgVFhJ9bdeArzZmxSd8A5rXUQ0l9JG6z1wEUmbptphznwxm3HiALVR7cRjyDv49
 5hXCrdno/uxwx2lEX8M5CcEbCQuEHRDkjrL0Ic9i3D77lOz2Y+kC9MR0meNUbl6+wsJ9
 rYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bNwL/Y4/GmosR1INEWPqs8uou9ZF6KIaP09v37iMA8o=;
 b=pbTLCkU1j4ejgkUgSL0mHLPrTKxXx+HgTSwGmibDKqNjWsfT9fD/hk0Fnhxa5y0Tu7
 tgEVvsGJ9S7+oG7iTdRjt8G3S63izw+CoXEOpbNi88mHOKLLN2QMaSPWTJq75Yrpr4EY
 PcS/srMhb5Y9i0e9PMRM9SLS35/bT16komxV0NHbEzkuskDk9hQRAq6svVWoBUT3teVa
 e8Ay8qWTNKFUoy2bZfsbHLF2xZsU9sc6PPNKxP3eFspqucRgt21vGAgUq4rSxdCGyx+3
 oRphfyt/PmDcNd/hw7XKxUUme0FELA4mQsDIW3ern7iFibI6x3zG2onXhK046aN8Yq/W
 mlfg==
X-Gm-Message-State: AOAM5301tKyM1+u6y2jswb+tJ3G40KNi6uxcGLcSDR1Q96UYB7BeOmSB
 yQkDYk2qMF4e/V1xUN7t6az0EoZSpIk=
X-Google-Smtp-Source: ABdhPJy/Pnd8jRPCx2DpkyXutbBVS53wYLfNc7JUlASsX6AwkfiqM3i6v464vVbtfZ9DMt31xrI22A==
X-Received: by 2002:a05:6e02:11a5:: with SMTP id
 5mr8317098ilj.108.1590768388219; 
 Fri, 29 May 2020 09:06:28 -0700 (PDT)
Received: from localhost (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id y19sm3940972iod.41.2020.05.29.09.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 09:06:27 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14] tools/libxl: fix setting altp2m param broken by
 1e9bc407cf0
Date: Fri, 29 May 2020 10:06:21 -0600
Message-Id: <20200529160621.3123-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The patch 1e9bc407cf0 mistakenly converted the altp2m config option to a
boolean. This is incorrect and breaks external-only usecases of altp2m that
is set with a value of 2.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 tools/libxl/libxl_x86.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index f8bc828e62..272736850b 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -391,7 +391,6 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
     libxl_ctx *ctx = libxl__gc_owner(gc);
     xc_interface *xch = ctx->xch;
     int ret = ERROR_FAIL;
-    bool altp2m = info->altp2m;
 
     switch(info->type) {
     case LIBXL_DOMAIN_TYPE_HVM:
@@ -433,7 +432,7 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
             LOG(ERROR, "Couldn't set HVM_PARAM_NESTEDHVM");
             goto out;
         }
-        if (xc_hvm_param_set(xch, domid, HVM_PARAM_ALTP2M, altp2m)) {
+        if (xc_hvm_param_set(xch, domid, HVM_PARAM_ALTP2M, info->altp2m)) {
             LOG(ERROR, "Couldn't set HVM_PARAM_ALTP2M");
             goto out;
         }
-- 
2.26.2


