Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9517F5DBB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639617.997163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67oG-0001H0-Sl; Thu, 23 Nov 2023 11:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639617.997163; Thu, 23 Nov 2023 11:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67oG-0001EC-Px; Thu, 23 Nov 2023 11:23:52 +0000
Received: by outflank-mailman (input) for mailman id 639617;
 Thu, 23 Nov 2023 11:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r67oF-0000zG-Bx
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:23:51 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6375b7e-89f2-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 12:23:49 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso5546985e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 03:23:49 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c510700b0040b36ad5413sm1517387wms.46.2023.11.23.03.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 03:23:48 -0800 (PST)
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
X-Inumbo-ID: c6375b7e-89f2-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700738629; x=1701343429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wo3ZoyDOsm6vfE7b7gB3JvtmVqfZ9c23rBT3rNX08wQ=;
        b=mDwidpTF5Bu4Qqn5Su56rxY/jjV5aKgqZb6Y0Pxf2rwEH8lww4IJqPQWFNxwnxIEcZ
         tZm+BiR7TUllRurQjB4RxswtcJXVo85TucsfudWxOhWsGtFxFt+45V0mqtMNag3Yry/q
         qwNS4xNqiG8vySrlUgoOgLOg/HyKvnOdhnpFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700738629; x=1701343429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wo3ZoyDOsm6vfE7b7gB3JvtmVqfZ9c23rBT3rNX08wQ=;
        b=swQeVllLt4Yoe4rkXu5lgoF0OhIzqVQ3tym9zby2W6H0ZyZbfe58oy/Lze7gID5AbC
         KLf87HkVKihQuqow9q+4Fgjh5Q0oSFyPNJUBfHQXBgVNaRlo15iYNon/jVGaTrR5fC2g
         tZqZrJvZ//xh72duGZluPXtaCTGeOuDC6cuRxh4CG2QhIxLY6onmrB/NlgZ4xyDPoRoh
         q+eP2quv8H4giUmMJcqkZg9QaXTTLe8L39yEx2A9Fy4gWruTj4SL3iOEJygMKh/AkUOd
         njChRXVQBC8QbKx+TEB6d0RyTCY64KPl0+6n8lTDCW0f0/Qnbn0JXN4HSt4KJkleUskf
         NwPw==
X-Gm-Message-State: AOJu0Yy2/XzAALZ+yUPy503SrtnGmX6Bp1C31ANVfch6KpIQwdRXM0rT
	ZI6uA0bXKrEtm1ctawNAXyH4dglmW8CRLkMfsgg=
X-Google-Smtp-Source: AGHT+IGf5xv8yJqt4BMhVCmerRVLtFKzG4hXzB4fOythjOMK4qB54YinEYQ8zZkHczq1xlv4H0okLA==
X-Received: by 2002:a05:600c:1d03:b0:408:3696:3d51 with SMTP id l3-20020a05600c1d0300b0040836963d51mr4147460wms.4.1700738628892;
        Thu, 23 Nov 2023 03:23:48 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/3] automation/alpine: add elfutils-dev and coreutils for livepatch-build-tools
Date: Thu, 23 Nov 2023 12:23:36 +0100
Message-ID: <20231123112338.14477-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123112338.14477-1-roger.pau@citrix.com>
References: <20231123112338.14477-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for adding some livepatch-build-tools test update the Alpine
container to also install elfutils-dev, coreutils and GNU awk.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I don't very much like to add coreutils and gawk, as it's also good to test
that we can build Xen with Busybox, but I also got tired of adjusting
livepatch-build-tools.
---
 automation/build/alpine/3.18.dockerfile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
index 4ae9cb5e9e30..fa6789347d87 100644
--- a/automation/build/alpine/3.18.dockerfile
+++ b/automation/build/alpine/3.18.dockerfile
@@ -47,3 +47,7 @@ RUN apk --no-cache add \
   libcap-ng-dev \
   ninja \
   pixman-dev \
+  # livepatch-tools deps
+  elfutils-dev \
+  coreutils \
+  gawk \
-- 
2.43.0


