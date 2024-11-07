Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0409C09D4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831983.1247364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94EZ-0003re-9B; Thu, 07 Nov 2024 15:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831983.1247364; Thu, 07 Nov 2024 15:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94EZ-0003pX-5p; Thu, 07 Nov 2024 15:15:43 +0000
Received: by outflank-mailman (input) for mailman id 831983;
 Thu, 07 Nov 2024 15:15:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t94EW-0002r4-Up
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:15:40 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 244944b6-9d1b-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 16:15:37 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fb587d0436so11680141fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:15:37 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b7f2b8sm897146a12.32.2024.11.07.07.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 07:15:35 -0800 (PST)
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
X-Inumbo-ID: 244944b6-9d1b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzUiLCJoZWxvIjoibWFpbC1sajEteDIzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI0NDk0NGI2LTlkMWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTkyNTM3LjE2NTA2NSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730992536; x=1731597336; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wQGyOib1tQTUTkaoHf6X8ibGsUQOPP4unQmWIurJ8s=;
        b=RegTc60iWuBCbA054XGBNIj4WHyY0UaVvVSaeyzg6pcst/zDasNeeZ7zkNjSNDd87u
         nfYExE2YgksgIzUo4NyYJhKSDo5+1/1yzXPe1uo9ZcmfQzTDiKXY+MMkej8st12GVc/l
         kxR1S4Ep1MwE+naUM8EiavI5ztq7hVWexs3q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730992536; x=1731597336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wQGyOib1tQTUTkaoHf6X8ibGsUQOPP4unQmWIurJ8s=;
        b=Qk2/XJHtOY6aY5Z6xPH8l/B/RdD6VTN7FMXevETE6De8Y+0UxXCdPhRXiMIptz4Ytw
         gBCS8jdd2CPAAWRIMad1QPcSE7eaJMutRUsg4H62lXXGBnIL8hxSY+ehJ1C5VRHTWhXW
         O9YOIu2Fk4y7asTeKdfU0S+oMhsyXy5sX2G7Aoe48Cg1RAyBEFIb2zkYOvKBIRE4diBh
         9cTRvEmY/HIg/oJbOwepNc8PrsaCPNGKXzuJLynRMX2Dtf7Lg8TPSKRRXBFy+hXH2Qxn
         nw885Y6eGpbpE4iUrqZSW6IOX4mHhMvczImwwfkhrW5eUWR35t03M/2VVLXWOKT4s0OU
         LefA==
X-Gm-Message-State: AOJu0Yxzt5vjm56AXXlgKCDaspjUUk9pZwwhcDVNDRkBRlALyskskTPu
	Wwl9xJWyHDNzWS0c8ZaqiPQq2YSuhDWgQioK8zP90C0DDs9Wc24JBa37VnCa+ns9tECMFvA6ZuE
	Q
X-Google-Smtp-Source: AGHT+IFDvWRuY+wFU1pUnNG9Wy15ukLVuf8w4hxEiiOJfzS7M7ZxSt6woPtnTQFsyngilw7x3Q9Bqw==
X-Received: by 2002:a05:651c:247:b0:2fa:ccae:d1d3 with SMTP id 38308e7fff4ca-2fedb7a218amr135454981fa.11.1730992536245;
        Thu, 07 Nov 2024 07:15:36 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/4] livepatch-build: allow patch file name sizes up to 127 characters
Date: Thu,  7 Nov 2024 16:15:06 +0100
Message-ID: <20241107151509.73621-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241107151509.73621-1-roger.pau@citrix.com>
References: <20241107151509.73621-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XenServer uses quite long Xen version names, and encode such in the livepatch
filename, and it's currently running out of space in the file name.

Bump max filename size to 127, so it also matches the patch name length in the
hypervisor interface.  Note the size of the buffer is 128 characters, and the
last one is reserved for the null terminator.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Take into account the null terminator.
---
 livepatch-build | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/livepatch-build b/livepatch-build
index 948b2acfc2f6..f3ca9399d149 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -72,8 +72,9 @@ function make_patch_name()
     fi
 
     # Only allow alphanumerics and '_' and '-' in the patch name.  Everything
-    # else is replaced with '-'.  Truncate to 48 chars.
-    echo ${PATCHNAME//[^a-zA-Z0-9_-]/-} |cut -c 1-48
+    # else is replaced with '-'.  Truncate to 127 chars
+    # (XEN_LIVEPATCH_NAME_SIZE - 1).
+    echo ${PATCHNAME//[^a-zA-Z0-9_-]/-} |cut -c -127
 }
 
 # Do a full normal build
-- 
2.46.0


