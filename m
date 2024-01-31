Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4632844564
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 17:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674115.1048841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVDuy-00023D-Ex; Wed, 31 Jan 2024 16:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674115.1048841; Wed, 31 Jan 2024 16:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVDuy-00021H-CH; Wed, 31 Jan 2024 16:58:32 +0000
Received: by outflank-mailman (input) for mailman id 674115;
 Wed, 31 Jan 2024 16:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CJWf=JJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rVDux-000216-2W
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 16:58:31 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f57b8f5b-c059-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 17:58:30 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40f02b8d176so314895e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 08:58:30 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 iv18-20020a05600c549200b0040e76b60235sm2104561wmb.8.2024.01.31.08.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 08:58:28 -0800 (PST)
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
X-Inumbo-ID: f57b8f5b-c059-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706720309; x=1707325109; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h59ApctZWLjlHgNeWfCSIG9Kk1HlpU6022xu/02Cxk4=;
        b=H+WuLflp/1z962xnHU7znkTwAhQH5QgEfO9xDL5QKcWMsayYvcv/+gBA+YUOROHctH
         6NvMk2v1CgSwiL1GbrvsfgRNZ3iiI+hDu5UWcvIXU6tmsTrQS0uQkLZQuUMeRT2P0iAF
         ekEYaV069lmQPYctpotaDmZTT3ZkX3cDAX5aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706720309; x=1707325109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h59ApctZWLjlHgNeWfCSIG9Kk1HlpU6022xu/02Cxk4=;
        b=pSryypvspTKdPE2bhzJJT8T+uFFqPQOKGzsHTy17VXN/yQoh7c1dzumKGNYhPLRThm
         6mmVWf5tReVyxizFmqie0IewQ6XvkS1xc2+KHuS9yFw/ApnflY8Or9OBnMiualcLFY9Z
         Bb5rH1ResyuXe9+JekcrbUo4itVxXckZYedvjLPSopQMfiHNmuMrho2QejqbJjvp9nvj
         Szbi8RMapiWiZvoI9/iRFKA9/gvy6bEmBlGAm9JFm8rOVS/Z5iJ5GGD7BFgweXIwKTw5
         cI1ElD/WpF+a3Q+brsHICTJDLGj0MOxDugSZpE0i128wsQAXnvqlxZCfN6Nnmck57Qj2
         eI/Q==
X-Gm-Message-State: AOJu0YzMsgT+r3vfz4G98hVLBtit+YI+tK034VUKsVkvJYVoW4LBvPrE
	V/jz0GKd5gV9Q3YyLkk6zyRYLWmlJmadaBL1e1jWEUb2NZ+Z1CGdU25xBoyRlJwq+SokhOjD32w
	q
X-Google-Smtp-Source: AGHT+IE480PcOCdh1BzJbJghbkYESbUbt1zKksyuLQUoJlgJ5YlAjDKuYOp9yrv6pS2+wbxZujfOUw==
X-Received: by 2002:a05:600c:3b0d:b0:40e:f6f5:9398 with SMTP id m13-20020a05600c3b0d00b0040ef6f59398mr1751840wms.24.1706720309120;
        Wed, 31 Jan 2024 08:58:29 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] livepatch-build-tools: allow patch file name sizes up to 128 characters
Date: Wed, 31 Jan 2024 17:58:16 +0100
Message-ID: <20240131165816.58762-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XenServer uses quite long Xen version names, and encode such in the livepatch
filename, and it's currently running out of space in the file name.

Bump max filename size to 128, so it also matches the patch name length in the
hypervisor interface.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 livepatch-build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/livepatch-build b/livepatch-build
index cdb852cc7fea..78dd2d801048 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -72,8 +72,8 @@ function make_patch_name()
     fi
 
     # Only allow alphanumerics and '_' and '-' in the patch name.  Everything
-    # else is replaced with '-'.  Truncate to 48 chars.
-    echo ${PATCHNAME//[^a-zA-Z0-9_-]/-} |cut -c 1-48
+    # else is replaced with '-'.  Truncate to 128 chars.
+    echo ${PATCHNAME//[^a-zA-Z0-9_-]/-} |cut -c -128
 }
 
 # Do a full normal build
-- 
2.43.0


