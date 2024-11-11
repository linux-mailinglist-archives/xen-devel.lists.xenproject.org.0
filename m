Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAC89C40FA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 15:31:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833911.1249151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAVRk-0001lJ-AI; Mon, 11 Nov 2024 14:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833911.1249151; Mon, 11 Nov 2024 14:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAVRk-0001in-7M; Mon, 11 Nov 2024 14:31:16 +0000
Received: by outflank-mailman (input) for mailman id 833911;
 Mon, 11 Nov 2024 14:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mW2F=SG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAVRj-0001ie-5I
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 14:31:15 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955f9c6b-a039-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 15:31:05 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9ed7d8c86cso821995966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 06:31:05 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0deebabsm595311266b.153.2024.11.11.06.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 06:31:03 -0800 (PST)
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
X-Inumbo-ID: 955f9c6b-a039-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk1NWY5YzZiLWEwMzktMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzM1NDY1LjI4ODA1OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731335464; x=1731940264; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PSMcaBDV1dD7xHWLdr1RBsu12mcxhSTEQJHJQ1FYmY=;
        b=Jk/eqQu7KZjVdf3Omio80/uoy0IRexBE24SUMU65JA9AXMj1EkMhBcE0gd9SFzOdab
         Hkzb/BcgX9dl5VV818Aods5poa+w5HnU/k4R53Zxbn/sMynLh+Vd+zvooL5aMYD6xT/4
         gt9f1GidnRTpK+s5khAqpy+pJPVtCWV1ny3VA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731335464; x=1731940264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PSMcaBDV1dD7xHWLdr1RBsu12mcxhSTEQJHJQ1FYmY=;
        b=mHsC5AyiV433h3BIy2bWg9ogPc8P1Go/jmkdKLQhIQWfSFgjYWzIwt6ZwUO7SSO/8V
         f0FTR69Bs2TD1fHRZT4mrtj0cW+1u9vYOIMsxZO/1zECkJSo+/AaNdFrDMOx+p3nEoST
         jIFPqzEXFkKDEZg/Ku6hjy08sFmsbCFnvUxPGmbBFulMJu+idyXszkSn1FG93kzg5rhu
         4cbJFVEvXI18AzdO/6yrfjDG2rre2fpsGR5KZ7yyJJ+KOkYUacOX279nc32mQYD+TxNd
         Vs+HuT7c1hGMTsyTa9QbdAuXdZxa9/cDm+s26H5OiUZO+Roc0tadmoejD7Xrplxk2NnZ
         OlLg==
X-Gm-Message-State: AOJu0YwNp3Z7StOEv0f1RlTiID67EvDKDPjtffwJP8mm80akpgTXtbej
	hjFODDyavpuTaw7mhjtp+TQLbJe7F3mautvShZI1ztdE4QLqMTwqKcc4Eop3oJM2MtLWt/+R84M
	b
X-Google-Smtp-Source: AGHT+IHARdtWyLAttkk1YdFWiG60zvD/17Hohca9dsj1wbUtDZ3pR2uOkrvQcYxe3f5ZfEY5fhtNfg==
X-Received: by 2002:a17:907:7dab:b0:a9a:3cf:cdb8 with SMTP id a640c23a62f3a-a9eeff3adaamr1208661066b.36.1731335464024;
        Mon, 11 Nov 2024 06:31:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.18] tools/libs/evtchn: Drop assert()s referencing MiniOS's main_thread
Date: Mon, 11 Nov 2024 14:31:01 +0000
Message-Id: <20241111143101.996733-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This breaks the build with debug active, as main_thread is not an exposed
symbol.

This is a minimal version of commit bc4fe94a69d4 ("tools/libs/evtchn: replace
assert()s in stubdom with proper locking").  It leaves MiniOS no worse off
with respect to thread safety.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>

Speculative fix.  Gitlab is a little busy right now:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1536597753
---
 tools/libs/evtchn/minios.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 28743cb05575..e33ddec7e7f0 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -195,7 +195,6 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
     int ret;
     evtchn_port_t port;
 
-    assert(get_current() == main_thread);
     port_info = port_alloc(xce);
     if ( port_info == NULL )
         return -1;
@@ -226,7 +225,6 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
     evtchn_port_t local_port;
     int ret;
 
-    assert(get_current() == main_thread);
     port_info = port_alloc(xce);
     if ( port_info == NULL )
         return -1;
@@ -279,7 +277,6 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
     struct port_info *port_info;
     evtchn_port_t port;
 
-    assert(get_current() == main_thread);
     port_info = port_alloc(xce);
     if ( port_info == NULL )
         return -1;

base-commit: 2b18f341cb5c66bbc3260a8e0dd9f42b2f58d78c
prerequisite-patch-id: 39749d67636f2c0377cd95d938cf0ae5da72403b
prerequisite-patch-id: 75378607486a1a3909481c243f3dfd163ae433dc
-- 
2.39.5


