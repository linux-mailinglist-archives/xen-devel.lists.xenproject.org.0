Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42428A66DB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 11:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706799.1104217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwevD-0001kW-Km; Tue, 16 Apr 2024 09:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706799.1104217; Tue, 16 Apr 2024 09:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwevD-0001h0-HQ; Tue, 16 Apr 2024 09:16:11 +0000
Received: by outflank-mailman (input) for mailman id 706799;
 Tue, 16 Apr 2024 09:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw+g=LV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rwevB-0000mP-HQ
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 09:16:09 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f560a58d-fbd1-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 11:16:08 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-570097653faso2633925a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 02:16:08 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u2-20020a17090657c200b00a524476aac9sm4654723ejr.108.2024.04.16.02.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 02:16:07 -0700 (PDT)
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
X-Inumbo-ID: f560a58d-fbd1-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713258967; x=1713863767; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqMqjbPKATTcFkSZJE0LrlnS9bwDIdnbbvMhDvcYVI0=;
        b=VD4zMLkKJwilqmWZlfTGn1w949+B5OUX+RIw4cWqBbSjNcY21YbJPv30FhVrPmtXuY
         9aH19xWrPj7JC9DCRge8f+iz98s9Dt3GWVLbydEd72H204chs4PzqYb4dxKMSz41K1sK
         MwgywaYiv9AeYXPDoGFoA1ajGZWIaesCYxk2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713258967; x=1713863767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqMqjbPKATTcFkSZJE0LrlnS9bwDIdnbbvMhDvcYVI0=;
        b=eDu7yhf8ftMqfsmH9tSSN0sS/AeoUVE692+1rZKXDWXv7MJPVjLAk6w/fZvlBGSHtd
         kXblyNC8ENE0lgVV/Sr2umUTTiVTjjzK64VMoNbWaWq5rzYE6SH4pmJV3tRX2AKpAvc7
         59OlDuXp0ia26GvckPh6ZcKfxX3eS3+ee1gxa/3JoArv8Gzhc0o1Qx03SNu/dUpbPw5U
         1BvrPGrqbO+4JcT+oHDve8ZpcWu1RUBBuE7P508KVd94KhKFtwuQPqBKVIuIxZyWccrF
         Z5GqNySqBt3eGxOylspyOg181XJ6qeFeI4TA1B3fPXQ76asbMYJKf4pPThT81GZ1qto7
         Ye7A==
X-Gm-Message-State: AOJu0Ywyp/crmbzYrJwYorogv+n5nxEaOt7UT2vGx+jKWKw3pSTzmRYw
	JqJSs0LfZH3Q/EX2jhuP6+RIU3z/oQBlI9QgIqGLyXrZEOPY6/kko2FxdUEcA4wQZEJB+9a288V
	f
X-Google-Smtp-Source: AGHT+IGZFc5vZSLMqmSJtZ9LG3B1/EYB+WqDlokgwcpiJVA1CYkpP42KgKueD+A6VdIm2whqItACUA==
X-Received: by 2002:a17:907:9443:b0:a52:3f00:616d with SMTP id dl3-20020a170907944300b00a523f00616dmr10232289ejc.30.1713258967372;
        Tue, 16 Apr 2024 02:16:07 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 4/5] x86: Use getopt to handle command line args
Date: Tue, 16 Apr 2024 10:15:45 +0100
Message-ID: <20240416091546.11622-5-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240416091546.11622-1-fouad.hilly@cloud.com>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use getopt_long() to handle command line arguments.
Introduce ext_err for common exit with errors.

[v2]
1- Removed unnecessary NULL initialization.
2- Used static at the beginning of type struct declaration.
3- Corrected switch\case indentations.
4- Removed redundant checks.
5- Corrected label indentation.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
 tools/misc/xen-ucode.c | 43 ++++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index 0c0b2337b4ea..e3c1943e3633 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -11,6 +11,7 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <xenctrl.h>
+#include <getopt.h>
 
 static xc_interface *xch;
 
@@ -22,7 +23,8 @@ static void usage(const char *name)
     printf("%s: Xen microcode updating tool\n"
            "Usage: %s [microcode file] [options]\n"
            "Options:\n"
-           "show-cou-info   show CPU information and exit\n",
+           "  -h, --help            display this help and exit\n"
+           "  -s, --show-cpu-info   show CPU information and exit\n",
            name, name);
 }
 
@@ -86,6 +88,13 @@ int main(int argc, char *argv[])
     char *filename, *buf;
     size_t len;
     struct stat st;
+    int opt;
+
+    static const struct option options[] = {
+        {"help", no_argument, NULL, 'h'},
+        {"show-cpu-info", no_argument, NULL, 's'},
+        {NULL, no_argument, NULL, 0}
+    };
 
     xch = xc_interface_open(NULL, NULL, 0);
     if ( xch == NULL )
@@ -95,19 +104,22 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    if ( argc < 2 )
-    {
-        fprintf(stderr,
-                "xen-ucode: Xen microcode updating tool\n"
-                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
-        show_curr_cpu(stderr);
-        exit(2);
-    }
+    if ( argc != 2 )
+        goto ext_err;
 
-    if ( !strcmp(argv[1], "show-cpu-info") )
+    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
     {
-        show_curr_cpu(stdout);
-        return 0;
+        switch (opt)
+        {
+        case 'h':
+            usage(argv[0]);
+            exit(EXIT_SUCCESS);
+        case 's':
+            show_curr_cpu(stdout);
+            exit(EXIT_SUCCESS);
+        default:
+            goto ext_err;
+        }
     }
 
     filename = argv[1];
@@ -152,4 +164,11 @@ int main(int argc, char *argv[])
     close(fd);
 
     return 0;
+
+ ext_err:
+    fprintf(stderr,
+            "xen-ucode: Xen microcode updating tool\n"
+            "Usage: %s [microcode file] [options]\n", argv[0]);
+    show_curr_cpu(stderr);
+    exit(STDERR_FILENO);
 }
-- 
2.42.0


