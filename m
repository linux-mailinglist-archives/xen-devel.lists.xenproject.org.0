Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B123372087
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121849.229866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeLi-0007jo-G6; Mon, 03 May 2021 19:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121849.229866; Mon, 03 May 2021 19:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeLi-0007jD-BY; Mon, 03 May 2021 19:35:22 +0000
Received: by outflank-mailman (input) for mailman id 121849;
 Mon, 03 May 2021 19:35:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeFz-0005i5-KQ
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:29:27 +0000
Received: from mail-qk1-x72a.google.com (unknown [2607:f8b0:4864:20::72a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d36e909b-5832-42f6-8902-22621205925b;
 Mon, 03 May 2021 19:28:57 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id o27so6263552qkj.9
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:57 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:56 -0700 (PDT)
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
X-Inumbo-ID: d36e909b-5832-42f6-8902-22621205925b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q7njXXxu6B3Y8DrhUPNrHywzinnQvdu6zM4xzDyyuko=;
        b=nqheekHalLG6tkckUcUjkQBwapbD9B61k9PGZDqmegukYvyYBQGZTl71KVWEqyJePK
         3dl4xE2E2qC+DEFfu+QxxTpPflf+l9Avm16huLJLACvu4i+x9mMpVhFqDIV3WUqONFnz
         xQI6t3BqYhtc6DVOB0u6/vgODsRBEGBjctfvAn3BtNQ4uzUQXrvEOBjyJr9MiVSGCGXc
         eHnsfIxSr9RShifWy3LXVHblEJ2zGvjJ3LCyWaU89jRUnRjda4W2LUJKQ2abbhuRDOWk
         G7liIE5f0+Lm4IbMTsgNExRr5Radb2M4LeF2XxnsfF7cisodMEJO+Mb4RjQ6UwA0QRT8
         hc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q7njXXxu6B3Y8DrhUPNrHywzinnQvdu6zM4xzDyyuko=;
        b=g8g5iB+/xCCQO8HLNxli6Bk3+c0HwAfZ+dOLFxKXoe5AJSJT4R6conY3z2K8NuGO0P
         9IVomnZKRZtkBkkCxG6g5rwcp4ajehpI7reWZQTYkRvW7rMZvcBOuhp/P2NRlJXcBogg
         Mw3CNwc8BrHO9kb9lEXBOL68ttKD0OWZ7NWu7N5rniKmwlgFRu73S/6lELIEeth+MUDY
         JUcf1bdbUxTA354/hrrBiAzilx2vEGqPyN3yW8w2Oe9yTiA17A1dUoMEq12HmVM5URX3
         JKjVfWggllKh9eWI5bJKLTb+x/S0AcjWV+gLN5X0YcKgHjghYqt//PzMyUW8nqjZh9Aj
         DZtQ==
X-Gm-Message-State: AOAM532jnqk7C4t+uMPFjdLsPjRtxihGgmY6X91qmLy1QN3T+xtM5t2R
	ZrfWxsKfYgjQ8h+vzYgpB5eYY2XErv4=
X-Google-Smtp-Source: ABdhPJzYLBRfeN46ykpr3WELiAXepylc6nrMXcD8iVLEyQ3AOfKghnhhLA1pHjHVDIRAhiqWl+Hkyw==
X-Received: by 2002:a05:620a:1036:: with SMTP id a22mr8961172qkk.186.1620070136565;
        Mon, 03 May 2021 12:28:56 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 11/13] xenpm: Factor out a non-fatal cpuid_parse variant
Date: Mon,  3 May 2021 15:28:08 -0400
Message-Id: <20210503192810.36084-12-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow cpuid_prase to be re-used without terminating xenpm.  HWP
will re-use it to optionally parse a cpuid.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/misc/xenpm.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 9588dac991..a686f8f46e 100644
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
2.30.2


