Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A6940AB4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 10:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767345.1177952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYhqI-00015M-Fd; Tue, 30 Jul 2024 08:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767345.1177952; Tue, 30 Jul 2024 08:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYhqI-00013e-Cz; Tue, 30 Jul 2024 08:04:22 +0000
Received: by outflank-mailman (input) for mailman id 767345;
 Tue, 30 Jul 2024 08:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZYes=O6=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1sYhqH-0000d6-9E
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 08:04:21 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 528a467d-4e4a-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 10:04:19 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7a1da036d35so265442085a.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 01:04:19 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1f0153705sm259963885a.108.2024.07.30.01.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 01:04:17 -0700 (PDT)
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
X-Inumbo-ID: 528a467d-4e4a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722326658; x=1722931458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2h7HiiJXVeJ+i1ScVuKzptcWqQHcv9MhlmldDZ9sR80=;
        b=etYe70o3jRmlzxfj4NIQIq7diIfMJV6mwgYeRbrM3Ka1NzWQl7QgwSiInQdg5CZnzy
         +40p78dqUbabOjs43r3WgUmAmNebPmsWHac6tnPOtttGKrQyUIbYpSEkdu2iuL3Oj8v7
         FJUNiWYZ9X8h5zPLhI7/GJl1DKTPmZnmVSSkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722326658; x=1722931458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h7HiiJXVeJ+i1ScVuKzptcWqQHcv9MhlmldDZ9sR80=;
        b=Wa43UNrkIYhb8VyzGzPFaquFkbNTpt5TLgZiafC6rnh+du5oPJqPC4Tcy599OzwJIQ
         2yF00NZv1nBZyb+O+KDKbwB5JDmEu/uj+GhGx4bbRGQUp4E2Cl/M53C/1v+fupz3UzY3
         qA1xyRN40zJprmZa4gO1bo1jelqdL3xtXplCSNxn/P2TBQViZarsygkFPL53O5utVytT
         ZawC5mggTqUcanq3kg5HI7wXCTRBhDwHnm/m1EZZFnd3sDosPOshw+POScTXTXQX5oFF
         azm7H0azcaZECD51LakVBHFBXdq5MYyOQxytKOr6dNb42rSwkVgdjEAJe9qN15Cc72PC
         OCIw==
X-Gm-Message-State: AOJu0YznvhCN2DxvJ+/pPZDwZ32OQTz8FySopg4amzcgMamfwSQVRIj8
	UqAPvHRPxGu7m/1YPEmotEyh9kgkh0k4/iaLX8Iq4BRLf2+XkF9K5HEvFm4FatZvSY01hH8SEF0
	=
X-Google-Smtp-Source: AGHT+IFYzGTp4JN85y+xJB+bbDfT4w3vLxnCxFqldQRouVMaOxpVS0cEvsHMjaXmyq09TV+z7VmugA==
X-Received: by 2002:a05:620a:45aa:b0:79f:38e:c015 with SMTP id af79cd13be357-7a1e52fc11emr1242934385a.62.1722326658280;
        Tue, 30 Jul 2024 01:04:18 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] bunzip2: fix rare decompression failure
Date: Tue, 30 Jul 2024 09:03:42 +0100
Message-ID: <20240730080342.1814470-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decompression code parses a huffman tree and counts the number of
symbols for a given bit length.  In rare cases, there may be >= 256
symbols with a given bit length, causing the unsigned char to overflow.
This causes a decompression failure later when the code tries and fails to
find the bit length for a given symbol.

Since the maximum number of symbols is 258, use unsigned short instead.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

This issue was noticed in Linux decompressing initrds but since Xen has
the same decompression code, it is possible the issue occurs here too.

 xen/common/bunzip2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/bunzip2.c b/xen/common/bunzip2.c
index 4466426941e0..79f17162b138 100644
--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -221,7 +221,8 @@ static int __init get_next_block(struct bunzip_data *bd)
 	   RUNB) */
 	symCount = symTotal+2;
 	for (j = 0; j < groupCount; j++) {
-		unsigned char length[MAX_SYMBOLS], temp[MAX_HUFCODE_BITS+1];
+		unsigned char length[MAX_SYMBOLS];
+		unsigned short temp[MAX_HUFCODE_BITS+1];
 		int	minLen,	maxLen, pp;
 		/* Read Huffman code lengths for each symbol.  They're
 		   stored in a way similar to mtf; record a starting
-- 
2.45.2


