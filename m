Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C17FB592
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 10:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642825.1002582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uIW-0005e0-QK; Tue, 28 Nov 2023 09:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642825.1002582; Tue, 28 Nov 2023 09:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uIW-0005cI-ND; Tue, 28 Nov 2023 09:22:28 +0000
Received: by outflank-mailman (input) for mailman id 642825;
 Tue, 28 Nov 2023 09:22:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7uIU-0004tr-Kw
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 09:22:26 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3ccb24d-8dcf-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 10:22:24 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3316bb1303bso3233170f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 01:22:25 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 b7-20020adfe307000000b00332fbf7ab21sm6834899wrj.60.2023.11.28.01.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 01:22:23 -0800 (PST)
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
X-Inumbo-ID: a3ccb24d-8dcf-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701163344; x=1701768144; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5HPry0cHVXYa7E65UlZUEhBkm420RlLl9/gqlG+ArQ=;
        b=BKFwDsMvtefl2dhVlXZFUuughPuwhabDvJjl8vY5hQCWU3R+dHFu/GgCQ3iqn20iHz
         xHYT9WQ617iOMTkRXDZp6cTauItHg7A33DRHiTnwAlF51qh+XKDYyH/4MrsK1j5pw07n
         u2ikulgVxRh4P0D1IpNHlq0kG35r8Ht5H/dK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163344; x=1701768144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5HPry0cHVXYa7E65UlZUEhBkm420RlLl9/gqlG+ArQ=;
        b=gdIE698slba8G89/W7bDN1d2ykemlqLjeKlPLoz4d2NDWKpE7L8c9mGJCrohxbB6jD
         sSvNv4qeYm4M/2RKR9DB2Hw4eZ7nc8GxlIckWeJFdLusgmJbbvNvcM+FU7oh3TYUC0XL
         rLqc7tTqYxOEXKmEK5GAj9ImzXLIZxWSqAIq3lPtYXv4MN3Yts02FVKdwMBfiN7Pv8+H
         UbYTDXNpUUeBVwgcX8vxKwpKyH1M0cZZnH6yl+2PYDqzrXDXzPim6J+asZMQsM8DIbJT
         6L0PXO5xPEM5iKkZ11boC3mYqSgv8r7UlmJEbC3E5MMhrp4CWJwXzEi/WSPaKhY20ONm
         dtiQ==
X-Gm-Message-State: AOJu0YwEcNK+ChUOrn9wNc/40pwSTWDgZ1BUxw0HmVC9JOLc+42U7McD
	9eFGn8DWTgtOktf+KHUJR5wIxmRzZ395XiUQXUk=
X-Google-Smtp-Source: AGHT+IEQiMZYddsFFj7Vr/s1dpjiADp3UuvyPpdn8nKI0utkQ7+Yp9K9ye8K+CxyXt8skoTiuCjdFg==
X-Received: by 2002:adf:f349:0:b0:333:ed:82ed with SMTP id e9-20020adff349000000b0033300ed82edmr4459304wrp.66.1701163343894;
        Tue, 28 Nov 2023 01:22:23 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 2/3] livepatch-build-tools: remove usage of gawk
Date: Tue, 28 Nov 2023 10:21:51 +0100
Message-ID: <20231128092152.35039-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128092152.35039-1-roger.pau@citrix.com>
References: <20231128092152.35039-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

And instead use plain awk.

Since plain awk cannot do the conversion from hex to decimal, use the shell
(bash) printf to convert the (maybe) hexadecimal output of readelf.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use shell printf to convert.
---
 livepatch-build | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/livepatch-build b/livepatch-build
index 305644037ee7..e2ccce4f7fd7 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -423,14 +423,15 @@ if [ "${SKIP}" != "build" ]; then
     echo "Reading special section data"
     # Using xen-syms built in the previous step by build_full().
     SPECIAL_VARS=$(readelf -wi "$OUTPUT/xen-syms" |
-               gawk --non-decimal-data '
+               awk '
                BEGIN { a = b = e = 0 }
                a == 0 && /DW_AT_name.* alt_instr/ {a = 1; next}
                b == 0 && /DW_AT_name.* bug_frame/ {b = 1; next}
                e == 0 && /DW_AT_name.* exception_table_entry/ {e = 1; next}
-               a == 1 {printf("export ALT_STRUCT_SIZE=%d\n", $4); a = 2}
-               b == 1 {printf("export BUG_STRUCT_SIZE=%d\n", $4); b = 2}
-               e == 1 {printf("export EX_STRUCT_SIZE=%d\n", $4); e = 2}
+               # Use shell printf to (possibly) convert from hex to decimal
+               a == 1 {printf("export ALT_STRUCT_SIZE=`printf \"%%d\" \"%s\"`\n", $4); a = 2}
+               b == 1 {printf("export BUG_STRUCT_SIZE=`printf \"%%d\" \"%s\"`\n", $4); b = 2}
+               e == 1 {printf("export EX_STRUCT_SIZE=`printf \"%%d\" \"%s\"`\n", $4); e = 2}
                a == 2 && b == 2 && e == 2 {exit}')
     [[ -n $SPECIAL_VARS ]] && eval "$SPECIAL_VARS"
     if [[ -z $ALT_STRUCT_SIZE ]] || [[ -z $BUG_STRUCT_SIZE ]] || [[ -z $EX_STRUCT_SIZE ]]; then
-- 
2.43.0


