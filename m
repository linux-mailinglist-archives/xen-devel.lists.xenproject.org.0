Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD118B5C33
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714125.1115152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUj-0006Ak-3s; Mon, 29 Apr 2024 15:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714125.1115152; Mon, 29 Apr 2024 15:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUi-00063k-Vr; Mon, 29 Apr 2024 15:00:40 +0000
Received: by outflank-mailman (input) for mailman id 714125;
 Mon, 29 Apr 2024 15:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SUh-00061u-Du
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:00:39 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d391801-0639-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:00:38 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-790f4650f93so114417085a.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:00:38 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 oo14-20020a05620a530e00b00790f6f8b03csm807879qkn.55.2024.04.29.08.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:00:36 -0700 (PDT)
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
X-Inumbo-ID: 3d391801-0639-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402837; x=1715007637; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiR1avLNZwB2iaSZsLj5E6HA1txC8l+NaDpKGNZUIvI=;
        b=QqgEUupfH79KQGHsJaIJcWPjJCo+uJ04B+Pe+Ai/U1rJ1G4SBWpubL5jee4MGm/w7L
         i+7vYvCL5OsI2PwxZeIGYZU0E5lkAoLR12sTFAEsfX0A1pmRooHejk5QJskWF1gTfORL
         9bMMiUepGimMcVUUwwLorhEpSRxg1XSyepMds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402837; x=1715007637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiR1avLNZwB2iaSZsLj5E6HA1txC8l+NaDpKGNZUIvI=;
        b=AQZ4oEAG/LlJr7tFo7UbiQjvdt3m/H7JoPGHt0WrryjxyICGRTB5Ehy2rT+D1UrCEs
         jD26MEYEOgbco8LhknRUmfsVIGXRlRHvFZ9iSSryfhviANCZfjIxeAsri1hX7MOvKtTy
         7BjaTKnM0zN8Vf3PBd0ZUsGK/D7Y7LYmVUemSLyr/u/WBV/u4wRykRCS9MiKLvNSMFzf
         QXTLwP2TYL5SBV+Zcbe8hXMA5AtOs9TIePCC5E8lgcxInmr3Z7UEdpG6buujc8AMIh58
         WpxfhR04E+vwOJdShbIvSEC/dEA29nm4CE5fs2/R0YE8pj1Lypx9lA9CVUwiEbDLun31
         RPhQ==
X-Gm-Message-State: AOJu0YxcQwYNXu6CGYVI7jNp8o57O/gGf+oYqq63Fs192usAp3Clrq3I
	hj6ndO3A0QpESUpsNUeREwnjLdPXRXJi/s6LyTpxI+78JRey9R2fU9Rcsxmfv0Ogefv/MCweSq3
	S
X-Google-Smtp-Source: AGHT+IHE66QaziwrLZLcC+gNcKROz5NfYV0txx1zAAT6J8hMJhKzbk7ohPvn/82BVbBB1YE+GHAibA==
X-Received: by 2002:a05:620a:a92:b0:790:96d4:7a5e with SMTP id v18-20020a05620a0a9200b0079096d47a5emr10944592qkg.12.1714402837340;
        Mon, 29 Apr 2024 08:00:37 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/9] livepatch-build-tools: allow patch file name sizes up to 127 characters
Date: Mon, 29 Apr 2024 16:56:46 +0200
Message-ID: <20240429145654.71669-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429145654.71669-1-roger.pau@citrix.com>
References: <20240429145654.71669-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XenServer uses quite long Xen version names, and encode such in the livepatch
filename, and it's currently running out of space in the file name.

Bump max filename size to 127, so it also matches the patch name length in the
hypervisor interface.  Note the size of the buffer is 128 character, and the
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
2.44.0


