Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE08C2CBB
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 00:40:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720095.1123109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YuP-0000B4-DV; Fri, 10 May 2024 22:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720095.1123109; Fri, 10 May 2024 22:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YuP-00008J-AV; Fri, 10 May 2024 22:40:09 +0000
Received: by outflank-mailman (input) for mailman id 720095;
 Fri, 10 May 2024 22:40:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5YuO-000872-BY
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 22:40:08 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fad9b8d-0f1e-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 00:40:06 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-572baf393ddso5879082a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 15:40:06 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf60sm233915866b.14.2024.05.10.15.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 15:40:05 -0700 (PDT)
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
X-Inumbo-ID: 3fad9b8d-0f1e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715380806; x=1715985606; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/L62oz/vhjY7sgRvmqLoVnO9fQ3LM/iOAHiRUewZCg=;
        b=ERuTKkERbxwCLDKkYxFCkSm8wi6CGoMth3NP6SDedM3m8QOLyDGg8Osm8+a2YWwIon
         67FJ/F/kpVlvA2lhJSmpeKPecfsvhFfuu9soISFCUVzWmgTlbRpEG0c0f1Bct94ivBbD
         FbgNyB8WloExS0PvzPN4M/fyQvzpmhG0XK0aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715380806; x=1715985606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/L62oz/vhjY7sgRvmqLoVnO9fQ3LM/iOAHiRUewZCg=;
        b=AIBgRj+GqloqEhR6LdbrjucPTJD15/d7wfMVY6633BmqgaqLsJOEy+89ZTjKsT5Afg
         fuihdT/w01D74r/A+xEBK0FB8f7S4jrfwE2FbqeTnV1OSdkn4uHHJqcdPSUYfIRxxDBy
         bWsBDwwQLEVZs5bT7DrAdZLJbdmTn5+Iw4ULD4xFSyECNI5AnbU9R8itxZ43GSGYqBYw
         rpfZ3B/QjKuCYR0IoakaV2dfDhNsC2YDda0/c/eg1ZcCAkHivnZzGcmfZUC+SlH9/tYO
         6yZcTWicSVvndLOZFLaiO6ZgyC1VuqK+AB4Kgvw2pS30hONKFGt612xUuHvS8v/w4tDA
         07Ag==
X-Gm-Message-State: AOJu0YwxQx3gNODqR3fRjituKynuoJEOBRMdsz0Pc1eG3as4aWXJ8HK+
	I1agSNJC6iDxEHfejf0XlW8HARxiQQFekIoWdRgCcjhBHoUMpYIXqplBi6mG42kT3J8pQKtC5iM
	q
X-Google-Smtp-Source: AGHT+IG8gv5M6eQdPRaW5RagjFQLPIwyOi6pGwQ/53qXmVlAW9nj+CYDAo9G7aWsdcVk84ybzUMJUQ==
X-Received: by 2002:a17:906:2bc4:b0:a59:ac10:9be5 with SMTP id a640c23a62f3a-a5a2d292b1dmr351577666b.27.1715380805809;
        Fri, 10 May 2024 15:40:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH 2/4] tools/xen-cpuid: Rename decodes[] to leaf_info[]
Date: Fri, 10 May 2024 23:40:00 +0100
Message-Id: <20240510224002.2324578-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

Split out of subsequent patch to aid legibility.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * New (split out)
---
 tools/misc/xen-cpuid.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 8893547bebce..6ee835b22949 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -268,8 +268,7 @@ static const struct {
     const char *name;
     const char *abbr;
     const char *const *strs;
-} decodes[] =
-{
+} leaf_info[] = {
     { "CPUID 0x00000001.edx",        "1d", str_1d },
     { "CPUID 0x00000001.ecx",        "1c", str_1c },
     { "CPUID 0x80000001.edx",       "e1d", str_e1d },
@@ -336,11 +335,11 @@ static void decode_featureset(const uint32_t *features,
     if ( !detail )
         return;
 
-    for ( i = 0; i < length && i < ARRAY_SIZE(decodes); ++i )
+    for ( i = 0; i < length && i < ARRAY_SIZE(leaf_info); ++i )
     {
-        printf("  [%02u] %-"COL_ALIGN"s", i, decodes[i].name ?: "<UNKNOWN>");
-        if ( decodes[i].name )
-            dump_leaf(features[i], decodes[i].strs);
+        printf("  [%02u] %-"COL_ALIGN"s", i, leaf_info[i].name ?: "<UNKNOWN>");
+        if ( leaf_info[i].name )
+            dump_leaf(features[i], leaf_info[i].strs);
         printf("\n");
     }
 }
@@ -355,8 +354,8 @@ static void dump_info(xc_interface *xch, bool detail)
     if ( !detail )
     {
         printf("       %"COL_ALIGN"s ", "KEY");
-        for ( i = 0; i < ARRAY_SIZE(decodes); ++i )
-            printf("%-8s ", decodes[i].abbr ?: "???");
+        for ( i = 0; i < ARRAY_SIZE(leaf_info); ++i )
+            printf("%-8s ", leaf_info[i].abbr ?: "???");
         printf("\n");
     }
 
-- 
2.30.2


