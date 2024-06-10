Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CB090277E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 19:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737474.1143859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXu-0002GZ-5N; Mon, 10 Jun 2024 17:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737474.1143859; Mon, 10 Jun 2024 17:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXt-00027t-Sx; Mon, 10 Jun 2024 17:11:01 +0000
Received: by outflank-mailman (input) for mailman id 737474;
 Mon, 10 Jun 2024 17:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGiXs-0000kp-9o
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 17:11:00 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 688b69e0-274c-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 19:10:59 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so1199121fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 10:10:59 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c76740d6asm3233169a12.7.2024.06.10.10.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:10:58 -0700 (PDT)
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
X-Inumbo-ID: 688b69e0-274c-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718039459; x=1718644259; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyVxB8SzIq3ix8NG+232jLUPvfNmU9Jk5I/4qPsfmIc=;
        b=Ov2fxg+Ymyf5y2iXTV5LWDz1HqViFD2ZGZjlyTXZpAR/yxthFRVEdo1CWGeLWrkVdg
         +Y1ctiiKm/XckOGdRmF3H6SNvRG6AmQfloyXGBu6sqqLMFKi2sTsxsiHbvRzeqCk7O3G
         E8OX9aeB4DLwdjBT8dnFTEC1OM3g1jmMpnKJlaiOfKtrNv3T27b+zLW3+BLezDWfXEKw
         GETB8CsEed47hCIeRAz3RQk+XIC06h0raDpjdHYtUJBZNvuit6/nmUvU0YvkC+X8CvHD
         6BpY4rITVohMDek5cJcrWshtE5PhbNjQm7nN/TdCSosODn2mgdAIWDCnHdG/hEriLAUD
         7waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718039459; x=1718644259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyVxB8SzIq3ix8NG+232jLUPvfNmU9Jk5I/4qPsfmIc=;
        b=KiVDexNOhWnhl38kfCaBFb2Oinx9b2/+7d8sTrDPuvGUC2wXPpL1+w/grNm7FS34XT
         DnZRB4jRtpMefhY7Z8TjW3hI4fz+ON7fgjOTKNWbii5jVmPp/u4ADF29paBTmeM5LyGf
         hai7vFs8W3Z/wbYu0+AHT2y7V5ytrEDxeriRzdbw6uJajmJwoyIOM1MRmU2dWZla/fzi
         8EBUsu+y67OcnxqrdETUPUbCirdI5wyNFafXQNKIhrfdsBdEwS9Iyi1ShMqrE3uMVu9b
         1ZdzoH+mgppn+fiipt8q3NgjqCI2R8y3JcC9HAkxbKJdQ2BPr8yOuEweEHe4bR4dEByV
         VXAQ==
X-Gm-Message-State: AOJu0YyyRPvnoKM+uEo7Fe4hM9SsNodh86mT8fGl9U3+rm9+Ao7jZ/MV
	Fg6t69jVdoamWDU6T2wMNkhOaqMErFxdSZouapEFEO7Ty7WzAbB87R8u6g==
X-Google-Smtp-Source: AGHT+IFZPpkHHTt0mbGPE0Nuo9jxfgNOdR2DGrtSnHr5o7+pGeI/4cHtN8q9sZV2e7Yu65V3+DJvow==
X-Received: by 2002:a2e:be0d:0:b0:2eb:f0be:442a with SMTP id 38308e7fff4ca-2ebf0be46b9mr2773011fa.39.1718039458759;
        Mon, 10 Jun 2024 10:10:58 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.19? v6 7/9] tools/libxl: Activate the altp2m_count feature
Date: Mon, 10 Jun 2024 17:10:45 +0000
Message-Id: <ad7aa98a3b0a0493130f1d9a84724e98be766897.1718038855.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718038855.git.w1benny@gmail.com>
References: <cover.1718038855.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit activates the previously introduced altp2m_count parameter,
establishing the connection between libxl and Xen.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/libs/light/libxl_create.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 11d2f282f5..5ad552c4ec 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -656,6 +656,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
             .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
+            .altp2m = {
+                .opts = 0, /* .opts will be set below */
+                .nr = b_info->altp2m_count,
+            },
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
             .cpupool_id = info->poolid,
         };
--
2.34.1


