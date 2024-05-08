Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E3C8C01CD
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 18:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718874.1121425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4k0F-00040Y-Sw; Wed, 08 May 2024 16:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718874.1121425; Wed, 08 May 2024 16:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4k0F-0003xv-Oh; Wed, 08 May 2024 16:18:47 +0000
Received: by outflank-mailman (input) for mailman id 718874;
 Wed, 08 May 2024 16:18:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6EkY=ML=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s4k0E-0003gp-9b
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 16:18:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a437eb9c-0d56-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 18:18:44 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59ae3efbb3so484935266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 09:18:44 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ds9-20020a0564021cc900b005705bfeeb27sm7730212edb.66.2024.05.08.09.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 09:18:43 -0700 (PDT)
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
X-Inumbo-ID: a437eb9c-0d56-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715185124; x=1715789924; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPXNK6VDI3eN9sDJaElz56WvTPg3GXhNKZT2KE+6/YI=;
        b=mLGZ4GQcbnY47pNL0Qqf4E5FyhWFtMNiIOP6tf9d7Prk+71lLXWLNHdZN7ERsXj463
         7vzUJF42JZR0NoKJ+3I1DcDmgYHSc8miiIp5VAiAbf5qwiy7WX3u/IPSkb180ELqv/Z1
         AeCJRXQ2o2KsOKc4z0pQLBV7olZhaGR7IYU4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715185124; x=1715789924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPXNK6VDI3eN9sDJaElz56WvTPg3GXhNKZT2KE+6/YI=;
        b=A/fh8XBM9lw6gG2UzyoaVW/GK+OJspIcTrcOJ3jazxmRGLUP3jkpO2M1eeMeRlGI45
         x9MFMqAg9ej2+a6PxS7+jFzALHo+y44DCKOEEmCpKRTT/xXabMdc7TdrKfae7n9of6or
         DU3/KKfJB1TbgSNfLtkmg/X2b7ltFI5Ldy4AzfUCj4rW9ZFBFTHWmhWmW7nYOZRg8sCh
         8puDK/iAs/NwIYc4EBB8csd1k8ov0/8veY+n1W4SpF4ZHzAOBYQTN2u4i0xHce2/QF6n
         dw6hFmdG1koblMhcpBRL6t/CERfSLbONNUTrr8LyVRbg5eTEQY9DHWr20sd+Ckrns/B2
         SUHA==
X-Gm-Message-State: AOJu0YxxBKO7+5to/HbTrZ1g7TNqi3sc3Ek+jtLEzh5lOp5x05yPdtoL
	Nyg8xwKDyewjsr0IhUy68XN7kR1Iia3Py17txDc+DbpyMYGZ4zYVv+Q/5E/js8m5J7ItoqFYism
	d
X-Google-Smtp-Source: AGHT+IGLiUU+B2eT1NQivHN6bxUbo6EQVV8P+/oMCjRqOBPAXYL6QXvDCgvSqd1TWCeGNkLlfbKC8w==
X-Received: by 2002:a50:d60c:0:b0:572:9dc3:ce38 with SMTP id 4fb4d7f45d1cf-5731d9d1364mr2186063a12.19.1715185123741;
        Wed, 08 May 2024 09:18:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/ucode: Distinguish "ucode already up to date"
Date: Wed,  8 May 2024 17:18:42 +0100
Message-Id: <20240508161842.1785414-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, Xen returns -ENOENT for both "the provided blob isn't correct for
this CPU", and "the blob isn't newer than what's loaded".

This in turn causes xen-ucode to exit with an error, when "nothing to do" is
more commonly a success condition.

Handle EEXIST specially and exit cleanly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/misc/xen-ucode.c            | 5 ++++-
 xen/arch/x86/cpu/microcode/core.c | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index c6ae6498d659..390969db3d1c 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -125,8 +125,11 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
+    errno = 0;
     ret = xc_microcode_update(xch, buf, len);
-    if ( ret )
+    if ( ret == -1 && errno == EEXIST )
+        printf("Microcode already up to date\n");
+    else if ( ret )
     {
         fprintf(stderr, "Failed to update microcode. (err: %s)\n",
                 strerror(errno));
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index e738a88f5cd1..762111838f5f 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -640,7 +640,7 @@ static long cf_check microcode_update_helper(void *data)
                    "microcode: couldn't find any newer%s revision in the provided blob!\n",
                    opt_ucode_allow_same ? " (or the same)" : "");
             microcode_free_patch(patch);
-            ret = -ENOENT;
+            ret = -EEXIST;
 
             goto put;
         }

base-commit: a2330b51df267e20e66bbba6c5bf08f0570ed58b
-- 
2.30.2


