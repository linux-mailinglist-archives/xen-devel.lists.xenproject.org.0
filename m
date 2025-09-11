Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D8B52B8D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119697.1464971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcbh-0007LE-QS; Thu, 11 Sep 2025 08:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119697.1464971; Thu, 11 Sep 2025 08:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcbh-0007Ij-NP; Thu, 11 Sep 2025 08:24:41 +0000
Received: by outflank-mailman (input) for mailman id 1119697;
 Thu, 11 Sep 2025 08:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUFa=3W=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uwcbg-0007FO-UX
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:24:40 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c30c039a-8ee8-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 10:24:40 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61cd6089262so623681a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 01:24:40 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33b4d63sm699314a12.23.2025.09.11.01.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 01:24:39 -0700 (PDT)
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
X-Inumbo-ID: c30c039a-8ee8-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757579080; x=1758183880; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9lB+5/QMJwJ7zbazXB6aIwcP7l9eUd98XmJoHTDbJs=;
        b=UIHSARv08ikvpv4T8rE6zAmMpAarg+fSKDSpIWbN5YfWIrh+BI2vIrp8lfrTRWKXYW
         xTPaeCP5EIbFNdiPQ2ecwaEPzzcyvcqry4MJW/jgfnpFiVrKfm7LyAZfNTsqLycIz0Iv
         95iRU6kAAbxkvZJtwTF+0hmD7Sp+DzsWS/mbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579080; x=1758183880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9lB+5/QMJwJ7zbazXB6aIwcP7l9eUd98XmJoHTDbJs=;
        b=NEvleZNVx+cg6N0/rwhdkxCOJGIsO8Mh4xDJZ1G1YAjRWFcEsFYXJTy7NllhOaAand
         v3KARnCz7LkjRa0FZhnwFx1cotCNqqWG8tCOHA+YibWi3tRO8zw0wSRITgpKJ7w3j3ly
         r8J00KTakbd46QsEDsQ9GTwBq94a89hw1g4FhBlS8/9iOi8DUJ7LUcROEmkEAtcokEeD
         7N5OszenKAkAz7gMIUDjd0LJwHJ7HAB0t8XQ2w/wGcYNUkCjs3yGvflV0ooJamfbQBj7
         FZn9mzumtIGfgwQqtCc200FM5S+8at7V48+6rb+x+t2uW8poZp6dfiS6lD/yajsrk2uA
         nTwA==
X-Gm-Message-State: AOJu0Yyuh1CZJbS/EtRKl0iyviO2FpOaT8Tafwgm6UueilpV8BRCke+Z
	FXhoYa8h98/+3Zvy6BC5AB1gHePV4Xkteg70Q0W+NP2dLtizzl6kYXwsJMzKh9Rv2kbOGlUGiP/
	PGGmx
X-Gm-Gg: ASbGncsKLTtCuM0jS/dQbJXon6sI/YMgJ1eFN+M8JaDZSyWkisINW2+3heJPqupoODb
	tnu9Q55idQz5Yb31Mg612zOQehIWyO/gve2Y13uA9ru9BCU8fLOxqbd/JRpq5xuPT3dgU+MCD1S
	agEiJoyTM8GJHIT4o0qmQNCM3DhVpG/yTkEcinixVHcHWl3xrCxVCVVbu1UVz2UpwV+4gAD6GoA
	5hbNnhjnUL/Ifi8uN/P1pFb1nOSqLXiv6CueLniH2UWRr/uX9wLWZziUyf9SdyZ4AS9apOb29Bu
	dT0iXgKN03EKG/EutkdnFnVQy5CYmI9xSYD0rXQxIgw7lITh3KP06ssvS5IU9+5/rLFeKF2Es2B
	BQ0lHGwx+xUFoxvXFAPaexaGA7YrJRBy9NgfU7ZnUTZ3OV8s2Y5rBylXV
X-Google-Smtp-Source: AGHT+IH9SIXzCcsHIgtZJiF8z9cGC3nRFa8aW436bg/A+OEbsBn9eW6N1Eq2im/QA1rrEXK1AOEBAQ==
X-Received: by 2002:a05:6402:2685:b0:61d:dd9:20db with SMTP id 4fb4d7f45d1cf-6237c048793mr15809936a12.31.1757579079733;
        Thu, 11 Sep 2025 01:24:39 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/3] efi: Protect against unnecessary image unloading
Date: Thu, 11 Sep 2025 08:24:28 +0000
Message-ID: <1f7b5737d4b36623af2734d525c895b77fef08fc.1757519202.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757519202.git.gerald.elder-vass@cloud.com>
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 59a1d6d3ea1e introduced Shim's LoadImage protocol and unloads the
image after loading it (for verification purposes) regardless of the
returned status. The protocol API implies this is the correct behaviour
but we should add a check to protect against the unlikely case this
frees any memory in use.

Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/efi/boot.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 69fc022c18ab..ca162db0d8d3 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1062,7 +1062,7 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
     static EFI_GUID __initdata shim_image_guid = SHIM_IMAGE_LOADER_GUID;
     static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     SHIM_IMAGE_LOADER *shim_loader;
-    EFI_HANDLE loaded_kernel;
+    EFI_HANDLE loaded_kernel = NULL;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_STATUS status;
     bool verified = false;
@@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
             verified = true;
 
         /*
-         * Always unload the image.  We only needed LoadImage() to perform
-         * verification anyway, and in the case of a failure there may still
-         * be cleanup needing to be performed.
+         * If the kernel was loaded, unload it. We only needed LoadImage() to
+         * perform verification anyway, and in the case of a failure there may
+         * still be cleanup needing to be performed.
          */
-        shim_loader->UnloadImage(loaded_kernel);
+        if ( loaded_kernel )
+            shim_loader->UnloadImage(loaded_kernel);
     }
 
     /* Otherwise, fall back to SHIM_LOCK. */
-- 
2.47.3


