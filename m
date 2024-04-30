Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A788B7613
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714810.1116167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtR-00061J-1O; Tue, 30 Apr 2024 12:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714810.1116167; Tue, 30 Apr 2024 12:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtQ-0005wM-Qf; Tue, 30 Apr 2024 12:47:32 +0000
Received: by outflank-mailman (input) for mailman id 714810;
 Tue, 30 Apr 2024 12:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGtk=MD=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1s1mtO-0005Ay-N9
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:47:30 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdd7ce2c-06ef-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 14:47:29 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-518a56cdbcfso8997161e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:47:29 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e14-20020a170906504e00b00a558014ab2csm14165324ejk.145.2024.04.30.05.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 05:47:27 -0700 (PDT)
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
X-Inumbo-ID: cdd7ce2c-06ef-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714481248; x=1715086048; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMReDGOEMqkK5y2P+7Ej6yo+s3bsc3gfBuc2Q1pLAao=;
        b=glHZUERr4k4RGeJoGKRdMLcuJBVoOQiDaLvwf27snXrzz3LRdtadckUA8M6Q38rRIU
         mbo36gX0r+jXUi5edDTwEV1PYik4z9QfYPNxdvL++l3jqLm33aH6df6Q1z6H2mt/+yID
         4tasSTcITdZJv0pSfyu81qc7KGtn4qMk78yK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481248; x=1715086048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMReDGOEMqkK5y2P+7Ej6yo+s3bsc3gfBuc2Q1pLAao=;
        b=NzrC+pPV+DW2z/eCmKAJIqZYvIG++DzTCLZObH8ABvsCSKlKuehDW1lNWrqGGrt9cZ
         xumfVkUx+8xDrYES3HqTj7gVo327icjuKXVI6L2D3YCe8ZiE6NWvSsD9VNeDcTAQ6QDW
         yRrq6Zd1pTI0VyoUbGRDa62CqtjESpQtqX/KcdPQp5ncDr/3KWRkIQ98YLEg+fWHMIFw
         No9Pbmt7LwNKasuvBrPMV7ol8u/mWsKP7nYYZ0982f6OQJ4tkaXlQq+r3Io2j+p8t0Rb
         XeS2Nrvuza4rUM/kmM09RpdmvkpYIGYuB9BssITGsNdHWhotA1/CSLwEPeQ17ZEQG+SA
         AgUQ==
X-Gm-Message-State: AOJu0YwPlmEmze6fut/fb0XcyS/tE5iLE+tEX1irrmZwnFpDS7UZ5ucy
	eLwWUMV2TegVZREfBFozzOXy0YblBj5SuWJ9YXO10XyifWf+8X7pdkvvaMPyfE9ZcV9Faq8YGVO
	G
X-Google-Smtp-Source: AGHT+IHUwWP4GYjp6G7GfRPpu9qFMwfVdEn0Y2viDmq5lbzPCwk6pgFIaP4qGODGMHtj+4BgPfs15w==
X-Received: by 2002:a05:6512:33c1:b0:51d:aeae:27f6 with SMTP id d1-20020a05651233c100b0051daeae27f6mr6610139lfg.16.1714481248344;
        Tue, 30 Apr 2024 05:47:28 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v3 3/5] x86: Add usage() to print out usage message
Date: Tue, 30 Apr 2024 13:47:07 +0100
Message-ID: <20240430124709.865183-4-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240430124709.865183-1-fouad.hilly@cloud.com>
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor xen-ucode tool by adding usage() to handle usage\help messages.
As we add more command options this will keep help\usage messages in a common block.
Only generic error message is printed to stderr. usage and show_curr_cpu are printed to stdout.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
[v3]
1- Reverted usage message.
2- Utilized usage().

[v2]
1- Improved message description.
2- Fixed formatting and indentation.
3- Error message to print to stderr.
 tools/misc/xen-ucode.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index c6ae6498d659..005bf85b6551 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -17,6 +17,13 @@ static xc_interface *xch;
 static const char intel_id[] = "GenuineIntel";
 static const char   amd_id[] = "AuthenticAMD";
 
+static void usage(const char *name)
+{
+    printf("%s: Xen microcode updating tool\n"
+           "Usage: %s [<microcode file> | show-cpu-info]\n",
+           name, name);
+}
+
 static void show_curr_cpu(FILE *f)
 {
     int ret;
@@ -89,9 +96,8 @@ int main(int argc, char *argv[])
     if ( argc < 2 )
     {
         fprintf(stderr,
-                "xen-ucode: Xen microcode updating tool\n"
-                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
-        show_curr_cpu(stderr);
+                "%s: unable to process command line arguments\n", argv[0]);
+        usage(argv[0]);
         exit(2);
     }
 
-- 
2.42.0


