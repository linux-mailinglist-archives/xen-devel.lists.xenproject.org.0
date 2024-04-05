Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA0899C79
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701228.1095524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiPz-0007wJ-1a; Fri, 05 Apr 2024 12:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701228.1095524; Fri, 05 Apr 2024 12:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiPy-0007uS-Tx; Fri, 05 Apr 2024 12:11:38 +0000
Received: by outflank-mailman (input) for mailman id 701228;
 Fri, 05 Apr 2024 12:11:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Im47=LK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rsiPx-0007Qe-KF
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:11:37 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a60b5cbd-f345-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 14:11:36 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56c1922096cso2486022a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 05:11:35 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j13-20020a50ed0d000000b0056c4372c161sm729425eds.55.2024.04.05.05.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 05:11:33 -0700 (PDT)
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
X-Inumbo-ID: a60b5cbd-f345-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712319095; x=1712923895; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1f0zJeyhworpxxnt42vDWBIMfthsTx6bjHKg+Ate9M=;
        b=GXHhu3UDpV52cgwOMkmXoF/d5EEH1Orz/QKVdCW6ld6N4nn0p6/z7o92/lZYhyDFNZ
         JFprhkKff/y7i397LWKzb+nHu65YuHNs2cCklvCi8l5ge0h9w6/wjxuL97YKJUNKGDmb
         7eMNiHgqdtNNPqiT2EF4K73PC2hE+1z2y1NGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319095; x=1712923895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1f0zJeyhworpxxnt42vDWBIMfthsTx6bjHKg+Ate9M=;
        b=Kp5SbWHTLstEpcMIPAgoC+5BqKS5jSYPNeZsRJhsxiMbbaLTCKzRkptt4kRCxYJ0Nv
         GR1YYczb5+oKGtkdFs9n1CEeygv+OCoNWX1lauGWl0sJoshHCM/J6VPHfDKuAZRphEI4
         isML76o2kD2gN1+fqD+66TgOn5tA9NrsJrpCChnz6UzVx4NkNnLQDPh1TaAxMfD+uW9I
         m1HDVkYtnQuiG80Eaj6kwCogYnzcqsZBUJxjfu9kyRBpDwLr1/PYAnK6HpRqnsHMGgLV
         YMlYof/LbWZxdwtj/B2R5XeWPg7FOHHI/3x80SlWaYjrBlL5Vmpx5DXFmSxe7n+R+r19
         y+bw==
X-Gm-Message-State: AOJu0Yzm7laDbZlvffB7TNWAF3H2Nn7edITe6Qx6Tqwg72a6rd70YNPm
	CMA1MUTDn6Z4ff1Z0XZZIOZYoN2h55OG/pJ5pGhyr1ZNuiasjO3d1F7pmNV0I5C0g14Ghs++gye
	x
X-Google-Smtp-Source: AGHT+IG/Pj2OHYse7b+KkYlIJm4/U0oKQUYoQQnaROh8Dw4+ANKLeCwUJjNm4mahij8Y7DKo/Uw5SQ==
X-Received: by 2002:a50:d741:0:b0:56e:2ff3:bb89 with SMTP id i1-20020a50d741000000b0056e2ff3bb89mr936055edj.28.1712319094854;
        Fri, 05 Apr 2024 05:11:34 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/5] x86: Add usage() to print out usage message
Date: Fri,  5 Apr 2024 13:11:26 +0100
Message-ID: <20240405121128.260493-4-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240405121128.260493-1-fouad.hilly@cloud.com>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor xen-ucode tool by adding usage() to handle usage\help messages

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
 tools/misc/xen-ucode.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index c6ae6498d659..1edcebfb9f9c 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -17,6 +17,14 @@ static xc_interface *xch;
 static const char intel_id[] = "GenuineIntel";
 static const char   amd_id[] = "AuthenticAMD";
 
+static void usage(const char *name)
+{
+    printf("%s: Xen microcode updating tool\n"
+            "Usage: %s [<microcode file> | show-cpu-info]\n"
+            "\n"
+            , name, name);
+}
+
 static void show_curr_cpu(FILE *f)
 {
     int ret;
@@ -88,9 +96,7 @@ int main(int argc, char *argv[])
 
     if ( argc < 2 )
     {
-        fprintf(stderr,
-                "xen-ucode: Xen microcode updating tool\n"
-                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
+        usage(argv[0]);
         show_curr_cpu(stderr);
         exit(2);
     }
-- 
2.42.0


