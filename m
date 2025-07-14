Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E9EB04B05
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043181.1413341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyx-0005Vv-1O; Mon, 14 Jul 2025 22:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043181.1413341; Mon, 14 Jul 2025 22:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyw-0005Se-Qk; Mon, 14 Jul 2025 22:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1043181;
 Mon, 14 Jul 2025 22:49:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRyu-00040h-Cz
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:08 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf5edeae-6104-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 00:49:06 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b39c46e1cfso592674f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:49:06 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd18ffsm13288903f8f.9.2025.07.14.15.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:49:05 -0700 (PDT)
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
X-Inumbo-ID: bf5edeae-6104-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533346; x=1753138146; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb/Ky+NjHb2U/AUnw3rA7qjcFJaFaS7qOBSec9pqZjI=;
        b=kJGuT7qgyoMy1AOopjqI4XcDR3d74m0Go0zVGLdrLrft/tDZXzwbcEVMJFOTIg+ul/
         z2vOkElLxOBEHLtoTZLdc0kumcUpWPW7wumLZZ40adNJXr/YNpFcVqBl4SNd06FEZX5X
         ue3gywsVcu6imXagUqYzAiQdTjg23mEfek+6TDGZvUBFby775uCcRaSBGs2fmzoUrXHR
         SOFJcKfSVUwfYDBoi7CRuKgPVcPp7AlAa3EDBj0wLAwBExHDOdMFgI0POCilTSYH1BLg
         0rraMTmJdkGarFWw7wc76RO2xuwm+kJ2fMi8hs2O/bu2j1yQ76QnzaKvjNRREtwyfiFx
         31uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533346; x=1753138146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb/Ky+NjHb2U/AUnw3rA7qjcFJaFaS7qOBSec9pqZjI=;
        b=C+76LROfXEHZdQqAPGmzSutPdK3MM1XNezy4bqwLI255rYjMguxmkJDJ6hYSzcozNy
         LS03HJEVkAeFGh+5wQN2e8WPTlPkbd0qNKk80JqD4jpoP2kBf43AD1MbRqmGG+OBLhJX
         6l+zAmurAK9vw4+A81QCxsbvPmKOhFb/4Yii+LNG5LEcHhEBsaach8v91aKg8z+EtJ8W
         9ylP53DSs5U7Tia7AD9Tm8zOVEbDwUmzif7vN+Vn1kKYhHraF3pkBftLT1JDk6NVvjWX
         bWGo/grt4yEw9uq2a7VxE1fXRCs2eZEUQAyxYPHmMtFR3RBYe5SpUwGC95H2yQpKeyzM
         kS+Q==
X-Gm-Message-State: AOJu0YxUdJ+azpEkqV7qLJHDMzR9OD/43bLmvqojbOHzPN7IfSdMOi5Z
	csDVfU7ZcGnB42dxy7wb6K0Z6e3hs1gJa5OuiaBiqwRX2hRw+Iee6MbUh3E2rA==
X-Gm-Gg: ASbGncuvdWHOTJ1Y83COcKrN/mYDuJiPH1pzOkZhEqjAkf6mnXCoTbaEOvxDgE0gFJt
	pVZHWWCJ0y8z8Tiu+X6curwKM6Yz8MaGB7QqWQGrn8w7+XtZjSz4xm+soaiVpUtUfDc+2FTVAcF
	q15Ih+FNY+6sDotKyepq1BKaAkqn7HUXeYJCPuIom9RCabbbKvJAzi1vbEi5To6TrsYXVpUAXBv
	pbt15t7uc2fDGMTTUT6o/SbcafgNaiJ9Vei0hZ2tiUTixuf4k7oyGjf5s1vhrKmU5nsL6lRkbNo
	kfyZ7qGHckuc1NVqlzFbv9q+crkQYy3ORdeHRPzL+SNjf6uB6777aXeWkmLEjf+B2H5wuGKBwb+
	d3NzWHx1Jsiiey58y/QqRe0C6LXxS08YUmtsYCRvjDD/3FK2hDTP8+8KpQLvPAAmQVry3JeKfqj
	vbD0roidkFDskcp48t7f4bsQ==
X-Google-Smtp-Source: AGHT+IHcWjJofCDdgdceqDEAsqHsvlHF6Q6KyOk3y64vGYnlqzNycPdkuosQ3RvbFFmw+oE+SqF/UQ==
X-Received: by 2002:a05:6000:659:10b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3b5f1893c29mr3304479f8f.13.1752533345934;
        Mon, 14 Jul 2025 15:49:05 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v8 5/7] tools/libxl: Activate the altp2m_count feature
Date: Mon, 14 Jul 2025 22:48:52 +0000
Message-Id: <5e6723a8f1f535e4948356ee24c33966116c84a9.1752531797.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752531797.git.w1benny@gmail.com>
References: <cover.1752531797.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit activates the previously introduced altp2m_count parameter,
establishing the connection between libxl and Xen.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libs/light/libxl_create.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 4301f17f90..a796178050 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -596,6 +596,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
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


