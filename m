Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AF8331901
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:03:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95095.179463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1x-00074M-Bw; Mon, 08 Mar 2021 21:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95095.179463; Mon, 08 Mar 2021 21:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1x-00073W-6B; Mon, 08 Mar 2021 21:03:09 +0000
Received: by outflank-mailman (input) for mailman id 95095;
 Mon, 08 Mar 2021 21:03:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN1v-0006P0-Ja
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:03:07 +0000
Received: from mail-qk1-x734.google.com (unknown [2607:f8b0:4864:20::734])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29c4ded8-0d52-4eb0-bfdd-c476ea12c676;
 Mon, 08 Mar 2021 21:02:41 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id n79so10866761qke.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:41 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:40 -0800 (PST)
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
X-Inumbo-ID: 29c4ded8-0d52-4eb0-bfdd-c476ea12c676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oqpttayW0aZRbW0lV0dPSojE1v4QDHZLq85y9vWsmqg=;
        b=UGXM5D94i40l2yF+567mUWT4APPSKuPbrSXJMkZg5BuwjlTOivLZV1fz9bTrNSSvgG
         Y8V2o1+yEKAer5QYuFyKFlNTGr6vF0XNtjWCpUvFED2sKYG8aeGFnd3sM7HVzlsHeLFe
         oJ8ianhNT27nrsSspcoW72aLFh8qeMG9LRK0szHmMUFoX3+Lq/GmY2yXQabpXvitgLzd
         LE0qBvkIcivh+TrHpbIXFCkNYViEraua5Z8FFMUBuBkC/CT08KmY3rq9AQwBHsCfSoAv
         23IoIAimOcZBvsS7CGM86b6Y1A3tJmcQwA44/b9KkQLXSBYonkp3glBlzJx0V+ni6TZw
         Q5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oqpttayW0aZRbW0lV0dPSojE1v4QDHZLq85y9vWsmqg=;
        b=EmDn2PmUx9+2q0ssbdSrpQb5SxkaEdnZriJWF97yXKz6Gi1biHXdMmZJYzLTjdafgz
         V0csgLAeQ5+eVOHzN4zTz4P3GErMkmC4kvXIrIdUHYC0WBsMJ8R1wCrThipEXD4dF1zt
         IzjNiNt102/NOh2AL/fqeU9Gc6GMHXgpi3JAOCLRls6fZxY7qowblMRretyEQmqL0atF
         wMpp3Qi5wtQo5XfxLyUMgVHavpt71vupuGIDriMcK+gWQSbAcLjFMQxlLXCz/xrxmeJ6
         /7fXRB3s34apV//ZX/WIMEJBMs1cFmF9XUdJHamzvfElTTxnM3MlC6wCFXheE5vgdk6u
         ELPQ==
X-Gm-Message-State: AOAM530SL2IdIjD4x/h/z+26AhcEwTt7g0/hw1Left7cn3DFRohrBInt
	yPNdn6t83HA8QKjpHhPew11iT2hFDhE=
X-Google-Smtp-Source: ABdhPJyqwDLmfPxTONGiGVA9Gikx8JwFOaXo2DpQOeXb59DhjVX/AiDXt98uOkdo6jfnCJ6vkD0SzA==
X-Received: by 2002:a37:a8cd:: with SMTP id r196mr21870295qke.451.1615237361005;
        Mon, 08 Mar 2021 13:02:41 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 09/12] xenpm: Factor out a non-fatal cpuid_parse variant
Date: Mon,  8 Mar 2021 16:02:07 -0500
Message-Id: <20210308210210.116278-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
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
2.29.2


