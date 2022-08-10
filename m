Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA72B58F319
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383898.619197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPa-0001LZ-T7; Wed, 10 Aug 2022 19:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383898.619197; Wed, 10 Aug 2022 19:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPa-0001DW-PV; Wed, 10 Aug 2022 19:30:38 +0000
Received: by outflank-mailman (input) for mailman id 383898;
 Wed, 10 Aug 2022 19:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPY-0005rf-LI
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:36 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8749938-18e2-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 21:30:36 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id e28so3916803qts.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:35 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:34 -0700 (PDT)
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
X-Inumbo-ID: e8749938-18e2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=y+vBMXcv/4DGDDmvZsPT8uzCrAOnCtue/wVF+VShjKg=;
        b=PPGXS1dOZqj42VzObj0IdiHNnLxQmcwh/dsSPcpXr3rOsqcxlHLsH3hHXmBW9TPyvC
         estethndHVfIg1qXWb9+T7HqGO4xe0bD6FkJmweoZXrFmPD7D6BtteubqJikkSnXVPrY
         P4HtAel+xPintYU2didWBR/a0EaaQJOLHAAWHCUZLIWHuI5qPRhFiARFAU4Bb7TzWayB
         /2WXKlhs/fGa8Os71/LCOmhkQWyHJfiSd3iqvvi+v+abqtGgDq9jDZWytvHaFjaoMUao
         rIIaPncGXFJuyEtkfXPklW/Y+z7q2Jrk61g+XhrHk0K1sABhLEcM27zvWt5z9qxjiUR6
         FmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=y+vBMXcv/4DGDDmvZsPT8uzCrAOnCtue/wVF+VShjKg=;
        b=pndWOd0mWhTvIg48dTsWNvtbpIV9Ivtxg4bJq4nBX5KjI90AkBpKVEwTNVo+CeCOxm
         s6H1xawSWXjujlzLo0MUwCQ3d++wPalC/VnFGP+xrltBRxtovaGoZvQglqBw4FM9e5oy
         yIgZ3fXHE5AXy2cjxYUJy1udVheuzZENUDvYJkIp8MrGWFIhungG45o+GEZv85H+45Of
         Kelvda4Ql5Lh416S/QNEIuz4Q99pnS0X/GB88aDzGhasDivDi7dEa7CwzucJpubCdGPg
         0dKv3zPSbFkzp04u4tRTOXf5trEcKtX4bPbiXuGP2B59UsxJOX67bL6KY/kM/BpFmVO/
         hCOg==
X-Gm-Message-State: ACgBeo1SermSt+TSIKfarL6XsjXZ+BEki7bi7anLj8sBGNHeF4aDGKh/
	AbZJ8rzb0JvXUxW+l1PctjkL49rJDDo=
X-Google-Smtp-Source: AA6agR7XoRUtZkLiJlHkCmpGAOHqOTXlBzuTjfVIEO0YRFkRRBuKdvoOHMPunC0xVX3Ku0XJQJxE+A==
X-Received: by 2002:a05:622a:190f:b0:343:5aa8:5538 with SMTP id w15-20020a05622a190f00b003435aa85538mr3286410qtc.445.1660159835258;
        Wed, 10 Aug 2022 12:30:35 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 11/13] xenpm: Factor out a non-fatal cpuid_parse variant
Date: Wed, 10 Aug 2022 15:29:42 -0400
Message-Id: <20220810192944.102135-12-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow cpuid_parse to be re-used without terminating xenpm.  HWP will
re-use it to optionally parse a cpuid.  Unlike other uses of
cpuid_parse, parse_hwp_opts will take a variable number of arguments and
cannot just check argc.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Retained because cpuid_parse handles numeric cpu numbers and "all".
---
 tools/misc/xenpm.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 610a516213..5b28e2f6dd 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -79,17 +79,26 @@ void help_func(int argc, char *argv[])
     show_help();
 }
 
-static void parse_cpuid(const char *arg, int *cpuid)
+static int parse_cpuid_non_fatal(const char *arg, int *cpuid)
 {
     if ( sscanf(arg, "%d", cpuid) != 1 || *cpuid < 0 )
     {
         if ( strcasecmp(arg, "all") )
-        {
-            fprintf(stderr, "Invalid CPU identifier: '%s'\n", arg);
-            exit(EINVAL);
-        }
+            return -1;
+
         *cpuid = -1;
     }
+
+    return 0;
+}
+
+static void parse_cpuid(const char *arg, int *cpuid)
+{
+    if ( parse_cpuid_non_fatal(arg, cpuid) )
+    {
+        fprintf(stderr, "Invalid CPU identifier: '%s'\n", arg);
+        exit(EINVAL);
+    }
 }
 
 static void parse_cpuid_and_int(int argc, char *argv[],
-- 
2.37.1


