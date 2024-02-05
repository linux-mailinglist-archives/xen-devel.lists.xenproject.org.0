Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6594D849DC9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676180.1052135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0gV-0002Jw-CL; Mon, 05 Feb 2024 15:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676180.1052135; Mon, 05 Feb 2024 15:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0gV-0002Gs-9Y; Mon, 05 Feb 2024 15:14:59 +0000
Received: by outflank-mailman (input) for mailman id 676180;
 Mon, 05 Feb 2024 15:14:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Sh=JO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rX0gU-0002Ch-3v
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:14:58 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52b1d90b-c439-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 16:14:57 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5112a04c7acso7255996e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:14:57 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h13-20020a17090634cd00b00a36ed37683fsm4354132ejb.215.2024.02.05.07.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:14:56 -0800 (PST)
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
X-Inumbo-ID: 52b1d90b-c439-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707146097; x=1707750897; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4DhM0qNlcS2wh71SjY+jNcszwrNeSrXjoBdpVlOY/lM=;
        b=adfFfhqKKh9IcUxlztugRAQeiH3dp3yvJKu01WV4b2oSmGfYNheqsE67M3eGOpXnNG
         wQB0Q1unjeTv7NREuf7JuMQaPTvbYczoJdIyTvETu4RPm9owYkiepP67BbP2u8XRjl3W
         Isw5Q6P8SrLk/1NSIru3RTsNHp68eIb6HTu8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707146097; x=1707750897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DhM0qNlcS2wh71SjY+jNcszwrNeSrXjoBdpVlOY/lM=;
        b=IZhC7uDrOgJLRgVEqoTiOkPPHKuygkjRHcdQifW+gQ/QFvV+4xy/m8DXXfAF9xQBm7
         3bYfJWcG5X2UQmepwzNQDumfo5PFl17bVc2z7XZ5teyRIrVxoRcFe4IQbEAKzrUm47dT
         97EGrvjbrARago0wPm94KW0pwDrrPlIcFo2bxxJ6Pd1NdIaQ4Qejfli6dyYuVUAEgl2w
         /ZCU9HjNwaHAS2O14bfvpHofZ9Z7gZC6mHck5Ndh/LHuUQItfyuYZJ6rtahbnmIl9/QV
         KGa4HemAiVQzZnw5U5PlJBNA9SN2m1mpq4IpUDoUiPVt3CYIM9SIVht/iQ9daKmoz+QP
         OdXg==
X-Gm-Message-State: AOJu0YxYFQ3TTdDU+ZHCp6JYdhwCX5MvWDIN69gz2LAs1LDtS72QuXBm
	A6ObEZ+iKJHg2fNOqCEM1TLPF539geSvq0ULYCxjEU14/YYFaFrEslF3VMs1eGvEW85y/VE06Eq
	Q
X-Google-Smtp-Source: AGHT+IE7rhcgFNDX8G2SpT8u8ssM8srOraMr1JiDs90deVAqXRAdHt80NUPYF9oQUx64GSa8eDifBg==
X-Received: by 2002:a05:6512:3c8c:b0:511:558f:f398 with SMTP id h12-20020a0565123c8c00b00511558ff398mr884770lfv.27.1707146096628;
        Mon, 05 Feb 2024 07:14:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUZ1jxG58mYd+swy1KdY+em1qGc1rN4hdHLkhRo74BeSRzoUzx5U+ekCEQYRyy3RBpmJma1Bhpp0GCatrEqgYe1amomCkaB7pDselenOAXOYE4RMVLyGCBbLT+tIU4gwWJDsJ7oIO8RPfBoX5QxJdgP0r/XmmXSZQDypNTwOjjx6NV7QoKQrd3c0y3bS4VYyw==
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] x86/bitmap: Compile with -Wsign-conversion
Date: Mon,  5 Feb 2024 15:14:54 +0000
Message-Id: <20240205151454.1920291-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pragmas to able the warning in this file only.  All supported versions of
Clang understand this, while older GCCs simply ignore it.

bitmap_find_free_region() is the only function which isn't sign-convert
clean.  This highlights a latent bug in that it can't return successfully for
a bitmap larger than 2G.

Add an extra check, and explicit cast to silence the warning.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

Slightly RFC.  This is our first use of pragmas like this.
---
 xen/common/bitmap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 18e23e2f0e18..b14f8a3b3030 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -14,6 +14,9 @@
 #include <xen/lib.h>
 #include <asm/byteorder.h>
 
+#pragma GCC diagnostic warning "-Wsign-conversion"
+#pragma clang diagnostic warning "-Wsign-conversion"
+
 /*
  * bitmaps provide an array of bits, implemented using an an
  * array of unsigned longs.  The number of valid bits in a
@@ -263,7 +266,7 @@ int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, unsigned i
 	unsigned int pages = 1 << order;
 	unsigned int i;
 
-	if(pages > BITS_PER_LONG)
+	if (pages > BITS_PER_LONG || bits >= INT_MAX)
 		return -EINVAL;
 
 	/* make a mask of the order */
@@ -278,7 +281,7 @@ int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, unsigned i
 		if((bitmap[index] & (mask << offset)) == 0) {
 			/* set region in bimap */
 			bitmap[index] |= (mask << offset);
-			return i;
+			return (int)i;
 		}
 	}
 	return -ENOMEM;
-- 
2.30.2


