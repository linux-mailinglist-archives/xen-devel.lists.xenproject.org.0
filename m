Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40E8B15E58
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063730.1429483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4DC-0000LA-G0; Wed, 30 Jul 2025 10:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063730.1429483; Wed, 30 Jul 2025 10:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4DC-0000DH-8W; Wed, 30 Jul 2025 10:39:06 +0000
Received: by outflank-mailman (input) for mailman id 1063730;
 Wed, 30 Jul 2025 10:39:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06yH=2L=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uh4DA-0007vS-KE
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:39:04 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68f5717e-6d31-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 12:39:03 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-615547ee514so537544a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 03:39:03 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af8f1b17364sm183230166b.66.2025.07.30.03.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 03:39:01 -0700 (PDT)
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
X-Inumbo-ID: 68f5717e-6d31-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753871942; x=1754476742; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPrV+rmqSI9Pn16lUWVeeXFpruWORSVEh0IsEq9O8/U=;
        b=NFJZc5avR51LjVp91DcHPesOUYVrH+v90F5ILuxoNVfZG5NTuPbyfFbSeKUL1VB+0V
         2ABMd0li4vZ4CDYWakiwuqzjJSMXxlwBlw1tp7apxevzsuqvjj6iWzU4aMrBDLU5wwq5
         BP4rtea94Lf+inw4ihktynnOTD8uFTuC94PMsboH4l7oOuYySga5MgSWARKoOjOan5NH
         yq3bIzmx0QFSxYIFoVLqrJ3owmoECPl5tlB/sxsZ44j6PopjDGz8ZyDbkAK6YhGR5X0C
         lI0Qx2DbmQLfnqwsWj0/Ahz1ypYlBLpMo05l0FdouMXqWJpXjUUaMaOzwN6d9oPx3Dqp
         NSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753871942; x=1754476742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPrV+rmqSI9Pn16lUWVeeXFpruWORSVEh0IsEq9O8/U=;
        b=Y+6hTc4HuKholIWjSqxqKNxNGbJuq66im8yJrMyHc7nZtXSDpFuD7p0oaDAFMDcqdw
         KYKZCa0LTRA03T8sYyq6HzCQa+epfl62iNA5j8r7tLHkHOue5FypG6PVDPWc3qD38lw+
         kzMjL3ltdxagBMhKcraVvcWTIXyGsv73wET6eX5kKuXQzoPE62QdwY8Z/unFK0ELzbdP
         hEMl61N1364OpyvNT5yAPEm1iwjiRjYlqWaVfPpM8QK/XgQU4YCu4O2Xft5zMyZAkxQC
         1P1DQbHUP1z9bOFxbxRT8A6BS/C0eLd+kob+VCh6IXn89tPpkJP9UDfj46kviw4hMJS+
         IVhw==
X-Gm-Message-State: AOJu0YzZg4XzFwGZGSu3VNHEdY6cVh8uHmJvUS180xSStQtsNDLz3IFL
	wZS8RDCkMUPS0CU9E9GqcLal0bHMdTC8MBu5qUWlcWua1tLSu0eSJ58xYQRF/HxMnJc=
X-Gm-Gg: ASbGncscSMmCG4PNFqPoylggc+0ZnS8rQfBcBkJd50uxwXTOiU1AjQ0d0AC7MRMfqzd
	c5J7kYl6YtJPw7gvzQwZSdhPyTpA2O1tHZvdUwvPhl6l5OVKLWADt4yPTJXP9ZmKfZJCVpIcEpr
	l4XtTxW1fPIeKQVT4wVIvFSHZMROoCEq6Lj/au8w091s0H4XWWvOI916Md6wRZ8fC6X/yfCMWW+
	A62T+b+NSdfPsaqJSdSV/Iprz943bppimGvhwnv1GK1NJtH0WOpyUIbw/i7HnXhhidXUQJDG16K
	VsZhx9S/6cfxz1fb1KueYYucBks5RijmnsxV/iBrKKJeFy6kYQ0KZKyjeLeK7Os89ZnSSI3QHNp
	ZiFhJ+QuTOxlCeCNlM4cgjiNMai8oW61fDUzv0KUPcS17HZvq6s0Ue32BXowzp2f8k5iHY0OXlB
	Rx8UTCN02ZjuQHwcKkMWvTK+MwNItFgNFjVJFEOze652U=
X-Google-Smtp-Source: AGHT+IFRbAN9NZXJMqdHNF5l+YypqX3z8cWQY3Mr4tkrtcRK9CmUzw9fD04N7NXaiUMXPgoRV7OnXw==
X-Received: by 2002:a17:907:96a3:b0:ae3:5118:96b3 with SMTP id a640c23a62f3a-af8fd6a393bmr107372166b.3.1753871942158;
        Wed, 30 Jul 2025 03:39:02 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v11 4/6] tools/libxl: Activate the altp2m_count feature
Date: Wed, 30 Jul 2025 10:38:48 +0000
Message-Id: <02436b30cfa649ec843cee384ea26c58f1b8caf5.1753871755.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753871755.git.w1benny@gmail.com>
References: <cover.1753871755.git.w1benny@gmail.com>
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
index 4042ae1a89..36772637e0 100644
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


