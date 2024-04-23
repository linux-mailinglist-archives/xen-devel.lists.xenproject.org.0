Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8F8AE7A9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710598.1109891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFxa-0001he-BG; Tue, 23 Apr 2024 13:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710598.1109891; Tue, 23 Apr 2024 13:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFxa-0001fC-8Z; Tue, 23 Apr 2024 13:13:22 +0000
Received: by outflank-mailman (input) for mailman id 710598;
 Tue, 23 Apr 2024 13:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzFxY-0001Ql-Cg
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:13:20 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40d951de-0173-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 15:13:19 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-434b7ab085fso50736251cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 06:13:19 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 k9-20020ae9f109000000b0078ede0c25b5sm5234661qkg.23.2024.04.23.06.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 06:13:17 -0700 (PDT)
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
X-Inumbo-ID: 40d951de-0173-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713877998; x=1714482798; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWzQEAY3+mRxGCxTU/L7ZP7N4fVla4pSUQMtUwXNBIc=;
        b=GB51zKb55YPQuBb9qfcLP3xYfJElaUEglftDEjQsm+KEqwhLbX0Q9THXHF8VOKin0b
         6rogT6Kf1kJ7CjQmRZgKWlotTCmEhWoKl2kZzAPG+Qy7PRLMPAbtHO92KMEh1s15tp1N
         7Q4uaUdKK8MpA1+zweTf0jK4OK17TSAdbP5Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713877998; x=1714482798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWzQEAY3+mRxGCxTU/L7ZP7N4fVla4pSUQMtUwXNBIc=;
        b=WXkeDnCPYzgj07/MczYV0e2U3P4Ocmd+o1YRdPWoROCPC1oS8uH/savvXCjXZiMqtg
         ajgyjETfhq3HgZ/0Di3hN2/YggIh4/HDNoqakIDmq+2JE/m/SNEqzvUvzH7lDxiUj+9A
         CeimAtHjdKCLz5a150RFFx6c2EyDhd+OseOsyigiZeaaGDLAS4T6VSKguHsYOoj+dpuN
         i2lCK6HnicMx1ZOI1/6utDj+tpFqCYIwYIY5oKjIsMnEm4yL1lwmiBuziNg5Qg2iIIGF
         XiYZyQR8W2/zivHDT65CttyRwX06zYs95O8/03c321aq0AUCOgD34NDA/YoErmr9MFg2
         /gxg==
X-Gm-Message-State: AOJu0YwUnnQ9xDTf0JYGjKQVK+mLs+T3W/yzZ/0CJWrNxzJLGZH29ok5
	th0GOh4rTb35ZemlGowWZecgnYqwVa6BvmwPNimAnSa37UVou9aIyBBAKfrOLW4uNQagLQDrs1j
	X
X-Google-Smtp-Source: AGHT+IH8/0GmzJT9k5cmoveTat6xn7RbsFozxi2zmE+Id+1FEtfN9/wbYP9a1twjJcLlNGFBULEoJQ==
X-Received: by 2002:a05:622a:11c1:b0:439:e95e:5dd0 with SMTP id n1-20020a05622a11c100b00439e95e5dd0mr4185303qtk.1.1713877997922;
        Tue, 23 Apr 2024 06:13:17 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 1/4] xen-livepatch: fix parameter name parsing
Date: Tue, 23 Apr 2024 15:12:46 +0200
Message-ID: <20240423131249.29825-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423131249.29825-1-roger.pau@citrix.com>
References: <20240423131249.29825-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's incorrect to restrict strncmp to the length of the command line input
parameter, as then a user passing a rune like:

% xen-livepatch up foo.livepatch

Would match against the "upload" command, because the string comparison has
been truncated to the length of the input argument.  Instead the truncation
should be done based on the length of the command name stored in the internal
array of actions.

Fixes: 05bb8afedede ('xen-xsplice: Tool to manipulate xsplice payloads')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 tools/misc/xen-livepatch.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/misc/xen-livepatch.c b/tools/misc/xen-livepatch.c
index 5bf9d9a32b65..a246e5dfd38e 100644
--- a/tools/misc/xen-livepatch.c
+++ b/tools/misc/xen-livepatch.c
@@ -572,13 +572,15 @@ int main(int argc, char *argv[])
         return 0;
     }
     for ( i = 0; i < ARRAY_SIZE(main_options); i++ )
-        if (!strncmp(main_options[i].name, argv[1], strlen(argv[1])))
+        if (!strncmp(main_options[i].name, argv[1],
+                     strlen(main_options[i].name)))
             break;
 
     if ( i == ARRAY_SIZE(main_options) )
     {
         for ( j = 0; j < ARRAY_SIZE(action_options); j++ )
-            if (!strncmp(action_options[j].name, argv[1], strlen(argv[1])))
+            if (!strncmp(action_options[j].name, argv[1],
+                         strlen(action_options[j].name)))
                 break;
 
         if ( j == ARRAY_SIZE(action_options) )
-- 
2.44.0


