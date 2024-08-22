Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D534395B635
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 15:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781867.1191378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh7dv-0008LU-1T; Thu, 22 Aug 2024 13:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781867.1191378; Thu, 22 Aug 2024 13:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh7du-0008Iy-VE; Thu, 22 Aug 2024 13:14:22 +0000
Received: by outflank-mailman (input) for mailman id 781867;
 Thu, 22 Aug 2024 13:14:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raXk=PV=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1sh7dt-0008Gq-IC
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 13:14:21 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 719cf292-6088-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 15:14:21 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff443so1108415a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 06:14:21 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3ead3esm950811a12.46.2024.08.22.06.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:14:19 -0700 (PDT)
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
X-Inumbo-ID: 719cf292-6088-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724332460; x=1724937260; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDfdXttzgzA9qs3QMat1Ti7nIirPW4B0aWCQarpVbak=;
        b=EmW5R+9m0MG2K99H8pYtugvUdX4s4AzFrz9de06ZZsMeQ67yho5EKsiUprkfp/jTZe
         tzbdzEDIx0yypDMTsufTDDoGP/herGRR+mjxBlgSJ8UuTeektok+XTD0iZo8DlzvnbEf
         IhZEzyLZTYnWI2Q/HJLW2C18ZGCMgZNV8dgdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724332460; x=1724937260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDfdXttzgzA9qs3QMat1Ti7nIirPW4B0aWCQarpVbak=;
        b=O/iQvGN25byzNW8OYREf3fmrVn7unWDWF/YB1B8GgamPmKP3kDMWNSpduB/O2hMrxb
         JLgWmKFmMrlbksOZzXxPacvAzJArKw2wNdsFN640GjICAMoD/jolBnaSiM6OW5ahmWxg
         1KB0SXsBHZU3wrIcJpFN0ag0xzxGrqBq+wjES2E8RZxl83331t7a4VJ0/er/4lfFdOVP
         Rg0ovn3vGT4R6FQejhi0rYwKOiylHwDwTGFs4VjWn63Dku5i+t+B2yzBuu1FG8dY1JZw
         +x5Kb4uvNKNeAC6ywtZSD2/7QRZyxdRjTepK1xi0JlDR89i7+brPoBert+LjWP+6iXZM
         GEPw==
X-Gm-Message-State: AOJu0YwmnnzjLRoSVb/Y0aYpGn1T/VX8oiUpMB18Mr4vwPU2CllP1Ccn
	VQJPqTm9uL6z2/HvZGCl0l66yoTFauy0ZXJvBSfeBTNI1eOaYjiyjzTMdv+l7rd7+RfDpLTUmoI
	5
X-Google-Smtp-Source: AGHT+IE6rgy3HAFkXx9Q9ydfiEQ6UrI0uGgXBjAps/Q8KaGfQRtEIBylcGxpMRCo0MFMQfJuDEqI5g==
X-Received: by 2002:a05:6402:3547:b0:5a1:2735:2378 with SMTP id 4fb4d7f45d1cf-5c079291eacmr1131111a12.30.1724332460185;
        Thu, 22 Aug 2024 06:14:20 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: [XEN PATCH v1] libxl: Fix nul-termination of the return value of libxl_xen_console_read_line()
Date: Thu, 22 Aug 2024 14:13:57 +0100
Message-ID: <ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When built with ASAN, "xl dmesg" crashes in the "printf("%s", line)"
call in main_dmesg().  ASAN reports a heap buffer overflow: an
off-by-one access to cr->buffer.

The readconsole sysctl copies up to count characters into the buffer,
but it does not add a null character at the end.  Despite the
documentation of libxl_xen_console_read_line(), line_r is not
nul-terminated if 16384 characters were copied to the buffer.

Fix this by making count one less that the size of the allocated
buffer so that the last byte is always null.

Reported-by: Edwin Török <edwin.torok@cloud.com>
Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 tools/libs/light/libxl_console.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index a563c9d3c7f9..fa28e2139453 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -779,7 +779,7 @@ libxl_xen_console_reader *
     cr = libxl__zalloc(NOGC, sizeof(libxl_xen_console_reader));
     cr->buffer = libxl__zalloc(NOGC, size);
     cr->size = size;
-    cr->count = size;
+    cr->count = size - 1;
     cr->clear = clear;
     cr->incremental = 1;
 
-- 
2.44.0


