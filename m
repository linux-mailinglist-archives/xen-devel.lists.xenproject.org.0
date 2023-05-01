Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94146F3845
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528145.821020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMl-0000mO-MA; Mon, 01 May 2023 19:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528145.821020; Mon, 01 May 2023 19:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMl-0000iY-G5; Mon, 01 May 2023 19:39:19 +0000
Received: by outflank-mailman (input) for mailman id 528145;
 Mon, 01 May 2023 19:39:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZF1-0000m4-81
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:31:19 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be9f0d3b-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:31:18 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-75131c2997bso1451854885a.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:31:18 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:31:16 -0700 (PDT)
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
X-Inumbo-ID: be9f0d3b-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969477; x=1685561477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bnmwx4JL4zzfpoAgNv41/x6mI5Sl5Tvy0no2deSD0O4=;
        b=CbOoWqTSk3uKbjzelG8yqnld5byWglvqESK7A5ayA7t7shLwdOeyy9pYr2h0dHZ4sw
         Ioebaoj5c+mUhs5R428HbAlgESy36wct7HvPU+oF2sighIIgNW2S/bMhrwz2G2bU7eAR
         PzmvfvNi5zQlFQbN2MU0tjZW9ZGQ2YrqYPpfUK353KT9AyIsPVIIWXUt0bf5KdeuKy4r
         7ttyjdCx983mA5YglTw1av0sK693taU4SPfn7jm3Xk/tPYsgPA/bWeAXUDACZE5DCRsI
         HPGPu/bDWsw9EvYxBiodD1s8ObxO8fmcp+DI9gRq0PdosiMcfYJh0fkyFQCSwdkoHQTx
         BOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969477; x=1685561477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bnmwx4JL4zzfpoAgNv41/x6mI5Sl5Tvy0no2deSD0O4=;
        b=OQI8i/AibKzefLly3forRo3Vn51hGG72o0vOyamOejU3/TDG5XhHc/VckUYbFj6Bxv
         v8uxi9H0XekL3O/e6pp31yt9jUCNMTUfHrFrFSr0HjLtCJTMkphOD3KYegnLjsd/XkOL
         Cjz5nBe+yZb7BFLKEYugoUkhXIKNqpuMJR2qgrIPUdWBhbIVZV0sjN1X6zadsi21a8p0
         ffbfONklGA45eTuerewA3aylN8sENt2PdwN/vsvdOCjsrTFcU+rU0ID4Q2l/zIGy4RkI
         rj8z37aEQXLYAiVr1Ljg5aoZ61XxrH/mpf3z0a5PSyexZ78aepW28FmtqeOFAFUwIubi
         t2ig==
X-Gm-Message-State: AC+VfDwQjYN7BdUfKRbPznmeI2FGNy7z7uN618QopAZwL/Rwe7Qiy5Bc
	5RK/Xg1qig/bZkFkPFO3DlAosfsSEks=
X-Google-Smtp-Source: ACHHUZ7BLXGnIebUIbZnncmPO+ryFBqQfenJ7JOTBDj0u5O37zFK/qjVSkLkOTcSG87sWV42QOYX7Q==
X-Received: by 2002:ac8:4e4c:0:b0:3d4:17dc:3fcf with SMTP id e12-20020ac84e4c000000b003d417dc3fcfmr27298811qtw.5.1682969477226;
        Mon, 01 May 2023 12:31:17 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 12/14 RESEND] xenpm: Factor out a non-fatal cpuid_parse variant
Date: Mon,  1 May 2023 15:30:32 -0400
Message-Id: <20230501193034.88575-13-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
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
index b2defde0d4..6e74606970 100644
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
2.40.0


