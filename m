Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134CBA7DBEC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 13:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939694.1339693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1kMf-0006u0-Oh; Mon, 07 Apr 2025 11:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939694.1339693; Mon, 07 Apr 2025 11:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1kMf-0006rM-LS; Mon, 07 Apr 2025 11:10:05 +0000
Received: by outflank-mailman (input) for mailman id 939694;
 Mon, 07 Apr 2025 11:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cV/f=WZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u1kMe-0006ZB-7q
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 11:10:04 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da35381f-13a0-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 13:10:03 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso5509147b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 04:10:03 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-739da0b3f5asm8450120b3a.131.2025.04.07.04.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 04:10:00 -0700 (PDT)
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
X-Inumbo-ID: da35381f-13a0-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744024201; x=1744629001; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFrQY986NOsGU6YeNLwp/csZ1n0jIs/v/kQS5efBgTI=;
        b=buv0lwqGo12tHufDUhDKcsEMLQy+DqzM+1AgV1c7uvTZ7DpD/he90A/CLZN5OJUqWO
         NroU9yMUQZ8MrE5jBQ3eH0sXXYzDBAIx7Dl3PPOZsjh34BGEoc/9JT0oV09W73KAtMBb
         xGFRwYwQpFXJHXSiNIy4A9IsShC3g102/+IGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744024201; x=1744629001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFrQY986NOsGU6YeNLwp/csZ1n0jIs/v/kQS5efBgTI=;
        b=M+VS/F6W4PHOAephdeAlKoQGgX9GJI6c8VlRI2zFpRXQe77UY8ihtr8S2CRYcdBp9I
         GS24m/JO/G/N9vyBkPik83RJ7nTk9tWNL+0e1HNoG9mTBYhERh/PGFOewtz8bLyMJdKY
         tu2WM7sS1GGIZA/ZmnLLfuB02plrnTtQlVqK+PSrgAjVBCFuRcR6o0chPLOMA2Ytxy0D
         n7ni2yixufwXlF2yQ6NOC2YIZBWC6beCeRkPYGPdY2IhamYNrcXVymksVdxfpCCQ1EmC
         6RyvgDZBwtVTxmOlPLe1hP/JqaKOrtsBm3I8Ux371CkkeCKRjy0do+ic5Uw4WTG/KKyb
         pWOw==
X-Gm-Message-State: AOJu0YyRJWta+C8WHL05D9BhnWEb3hCPRdMAqRMsR/N0GAmYLMn2NlVA
	K0v+6XFWNRJrXRrIJ/OcOrVnn2mdTWG8Mfpxu3v37/6IQEfhOeKJYVD5oG+j08eDXHJOw9li+UQ
	V
X-Gm-Gg: ASbGncv1+OmRKLEyxPY4G3PZ5XO9t8awSQC81PUeM/t+zjg/27mWLxdOczJUp0+UqQJ
	XEYXJTz0/adG8D+ezOplb4yzOu1IemXwmcB2N7R2K4urBhIXWlHbgsEAmodvT+2ls03WcC5Es4b
	r0Yyrmz3zQSNRtENguKisK9Ax5fJ0U9S1cPLtdgt0KC9Cb7AULJBvFCdNhGRcqNJ8FGqbH7Nb4p
	UIXyeiYT9d9aokUvzmp4HEh30HPyz1jz3mpg94tckV8v1XWMo1ak0wjnc8gcWxL1JxgxOL4dKP0
	ZJo354hDZo1e/3K3mpOK7LgYHyRx0ZzWHNMB9fay6MHmTkDRiw==
X-Google-Smtp-Source: AGHT+IE87WhlO/UaXX98vtz5MsjJV4g6M2/37hoBw+nIi2msFbUU5v0Zqijcw4R9suFZgUuIKUAyYQ==
X-Received: by 2002:a05:6a00:a03:b0:736:34ff:be8 with SMTP id d2e1a72fcca58-739e4f393cfmr16102678b3a.19.1744024201318;
        Mon, 07 Apr 2025 04:10:01 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/libxl: do not use `-c -E` compiler options together
Date: Mon,  7 Apr 2025 13:09:38 +0200
Message-ID: <20250407110938.68174-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It makes no sense to request for preprocessor only output and also request
object file generation.  Fix the _libxl.api-for-check target to only use
-E (preprocessor output).

Also Clang 20.0 reports an error if both options are used.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 2862bf5b6c81 ('libxl: enforce prohibitions of internal callers')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 37e4d1670986..b690d921593d 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -195,7 +195,7 @@ libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
 	touch $@
 
 _libxl.api-for-check: $(XEN_INCLUDE)/libxl.h
-	$(CC) $(CPPFLAGS) $(CFLAGS) -c -E $< $(APPEND_CFLAGS) \
+	$(CC) $(CPPFLAGS) $(CFLAGS) -E $< $(APPEND_CFLAGS) \
 		-DLIBXL_EXTERNAL_CALLERS_ONLY=LIBXL_EXTERNAL_CALLERS_ONLY \
 		>$@.new
 	mv -f $@.new $@
-- 
2.48.1


