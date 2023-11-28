Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7847FC010
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643349.1003461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81cs-0007Mq-NN; Tue, 28 Nov 2023 17:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643349.1003461; Tue, 28 Nov 2023 17:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81cs-0007KG-Kl; Tue, 28 Nov 2023 17:11:58 +0000
Received: by outflank-mailman (input) for mailman id 643349;
 Tue, 28 Nov 2023 17:11:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r81cr-0007K4-5g
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:11:57 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bb2e2ce-8e11-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 18:11:56 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b4734b975so17930715e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 09:11:56 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 r5-20020a5d6c65000000b00332f6202b82sm10002882wrz.9.2023.11.28.09.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 09:11:54 -0800 (PST)
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
X-Inumbo-ID: 3bb2e2ce-8e11-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701191515; x=1701796315; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5iAyvr7lv5tCja+FxXRBpPoGJsp5N/y9Ki2C73Kx1k=;
        b=P1+m2qc2eUffODqWVFK6dTEZz0yFRPTWcH1TaTdF+J7N4r8nOhlyvjYVD/6IAO/eTS
         bFJ0RGKSLtzpzxRZ8a9xUJehsdK7ygIzQIr4DhtnPFAYxNShvsJN7caXrbYuqJy+Iyra
         ZAigZA2fUJ8s7ntbx3DotOXPkAFnK8Tng4Xa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191515; x=1701796315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5iAyvr7lv5tCja+FxXRBpPoGJsp5N/y9Ki2C73Kx1k=;
        b=dj5G19MZ5uoK0UIB8VPxO8i6ab4kZWYipGEJtsKjOD2z+DVR9YFKKAyA4CV1HYORfs
         firVY8++aJ6ZoGHEBEL+zU55VbWUMk610qNXR+n8ytSdlLJ2AWZnaL7hw98V0+4Ft+yJ
         iVxToaDKAOhjBPCgH33Fnx/Jn7kmda/D+QVeLgOjoBUL4fMd5RcjwT/X9XZ0lhuaiOa3
         eez/zsYZ3l/q3lf9PARAPUINQHEZp6FTfV3ul2d4J+w7xZKbtRg2KebeD0WaVqDbBAX2
         PpgYIl8chA0wdEs/oq/bj0cubvMV5/QxqMDQvrOAh/cn9l0OKJxXV5WdmlVRTL9XCFh/
         Yy3g==
X-Gm-Message-State: AOJu0Yx9gH+xW0C6qdv37WcK5m6sFz6KyyVNnFXAKoR5OwoAVLcxa1Ut
	M2hiO3qR9ud/N0FU+2lJpunBhyZd+B2GtT4a49o=
X-Google-Smtp-Source: AGHT+IGdxRmyPK/j508qoxgXb++z2NPcs5vZvKVzqY4Mp67vTwGF3ULVJCdMRSm7V4aSUTCsV/x23g==
X-Received: by 2002:a05:600c:470c:b0:40a:42dd:c82c with SMTP id v12-20020a05600c470c00b0040a42ddc82cmr8068431wmo.27.1701191515456;
        Tue, 28 Nov 2023 09:11:55 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] cirrus-ci: update FreeBSD versions
Date: Tue, 28 Nov 2023 18:11:50 +0100
Message-ID: <20231128171150.38290-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FreeBSD 14.0 has already been released, so switch to the release version image,
and introduce a FreeBSD 15.0 version to track current FreeBSD unstable
(development) branch.

Sample output at:

https://github.com/royger/xen/runs/19105278189

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 7e0beb200d7b..385618c394ea 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -29,5 +29,11 @@ task:
 task:
   name: 'FreeBSD 14'
   freebsd_instance:
-    image_family: freebsd-14-0-snap
+    image_family: freebsd-14-0
+  << : *FREEBSD_TEMPLATE
+
+task:
+  name: 'FreeBSD 15'
+  freebsd_instance:
+    image_family: freebsd-15-0-snap
   << : *FREEBSD_TEMPLATE
-- 
2.43.0


