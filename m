Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C9EB07EAC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045629.1415828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xq-0005MT-QI; Wed, 16 Jul 2025 20:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045629.1415828; Wed, 16 Jul 2025 20:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xq-0005KQ-Ll; Wed, 16 Jul 2025 20:16:02 +0000
Received: by outflank-mailman (input) for mailman id 1045629;
 Wed, 16 Jul 2025 20:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WS3=Z5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uc8Xo-0003uY-C1
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:16:00 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afaf6f95-6281-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:15:58 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-456133b8d47so293335e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 13:15:58 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e8csm30504145e9.5.2025.07.16.13.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 13:15:57 -0700 (PDT)
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
X-Inumbo-ID: afaf6f95-6281-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696958; x=1753301758; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb/Ky+NjHb2U/AUnw3rA7qjcFJaFaS7qOBSec9pqZjI=;
        b=a1EMwdoHAatuFBiKj4D5g+KXzKZqwlrUKjtwKlOcAc0Y4pqRcCaZS5yRGe2+cxn3oW
         qdL10KMbPAbvCrB5q+BRYjO4FZR7vEbxpHuj4D/GpApgLqKCBLdb2BsddM9hdj+VsHDR
         1Zzy8t+EOKd+g5e1I9PCiHdmZI4SejwCoSLm0K1SwPScFO+j+gF2905+L2knRFDbBXNU
         /AKeLFMK3k/JOE3bosyyv9tFQhUsrpofI+yRaf5lqIlQzWt9GLv2pCQSuHVyF0Nsx3BN
         XcuMoQryVSAmiTEzJuimpCYYcKHEli4mi+JRMVHkURbEuKhUqhSUehh8ps0k5bX1E3t2
         h65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696958; x=1753301758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb/Ky+NjHb2U/AUnw3rA7qjcFJaFaS7qOBSec9pqZjI=;
        b=rWWo2+amWO+JB1erQcIKQnRmbszzdcs9/AswASaDWCoIZWfA9g95RV4zC4MZ0pZmqd
         FbjUG7n4ZVSS+ko9lBS87Eq/lfHKMLqRdg8LxXLSECVvhskyIVC7N8O2rSoDHDbWMpNd
         onJCVUaKkYEiRhiG0lBk2+r9xYMwjz1B8FKMYX8HwyQsLOcZiom8aH4nBF6ZZi4MoG6L
         +el7XxoAejDglB1anrO1NoAUxjIhrZ7X/TauC9pGx2MoK21CQI5nlhNRqp4584qWjAgz
         PhxWhxb/zyzypR2IxJ/+5wPiNTCc6cKg+A+tDmHeuFHf9GKqQBDgeX92UeH88SIzj4Uq
         S38w==
X-Gm-Message-State: AOJu0Yw42lMkoRQIQaOOjz2x5iWU0y6TKlSlgJlpmLvD0DSeCf7sVi3z
	HvXysE2pStSXdVmAAOkh7MZzPvuf6V4f52NRJaao1Z6KXyvsW8P3v6/lCGtLcA==
X-Gm-Gg: ASbGncthlaTQiUmK+Ec7GfHfHQyyVu6mXIUeZrv+4Y7qWs+1r378V4+oMHIRH4HGcz3
	ISts+4FBPI7huURbYocxxTLzFsu5udVgzsvmXhtztxqeJk5IOSJWM0Zav99BDLQ/3CiB5g9AFMj
	Kjee+XOcVeB/YvzbZ92J8e/CLPMOxrVcAX59IQLGa0tSBnPo4JUsbcHCOAiXp2fXIUB0uF1NPMp
	Bfxn5Vus6+Xu8sr4XVXz7SR+k1Y5BWewhYHxPWswRkKxBErxXr3MPDZbowbcLkPf45q4MO0YVZ/
	BfxDUDXCtQQvReCsd5Bk6KCpqbLvTcpz2usGLrrWqZNwJvS6kmW4aKTbLpn8cfGl3ID0MZYyioY
	OD8HOljYcEnTCnP3R4dSDk9xyJ6z8y5zNIGNTnVDaagJ6fL7hZh8ESeoB3441dPEb4ydVaeULuC
	BG+1wg1FiC/bRf8HVtI524kA==
X-Google-Smtp-Source: AGHT+IEfxkXPaUlJQ1FGYw3ZFlPlmW8mFDKhMmmFN93dQupLAdmdCphaPymKJ4IVQZgU4shr5ysPug==
X-Received: by 2002:a05:6000:2a02:b0:3a4:e193:e6e7 with SMTP id ffacd0b85a97d-3b60dd60e9dmr1267286f8f.5.1752696957817;
        Wed, 16 Jul 2025 13:15:57 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v10 7/9] tools/libxl: Activate the altp2m_count feature
Date: Wed, 16 Jul 2025 20:15:37 +0000
Message-Id: <1fcbc199c3e60d6d62271b6807c395e82724ba56.1752691429.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752691429.git.w1benny@gmail.com>
References: <cover.1752691429.git.w1benny@gmail.com>
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


