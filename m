Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA097F4C53
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 17:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638895.995843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5q3u-0006Xd-IX; Wed, 22 Nov 2023 16:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638895.995843; Wed, 22 Nov 2023 16:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5q3u-0006Uj-Fn; Wed, 22 Nov 2023 16:26:50 +0000
Received: by outflank-mailman (input) for mailman id 638895;
 Wed, 22 Nov 2023 16:26:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y6Xs=HD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1r5q3t-0006Ud-7i
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 16:26:49 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef1d8571-8953-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 17:26:48 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32f7abbb8b4so4693519f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 08:26:48 -0800 (PST)
Received: from localhost.localdomain ([185.25.65.68])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a5d6d8f000000b00332cb23ccbdsm7700520wrs.81.2023.11.22.08.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 08:26:47 -0800 (PST)
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
X-Inumbo-ID: ef1d8571-8953-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700670407; x=1701275207; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFeIE8kGuQCYuzDUsYE523mlGLItNa6RGc94ggrfe9A=;
        b=eyXQe98Py3UcJ8tGUSvuK6DM2BZqFXOb/rZv02mHfA9Pr+Z/2X/Y+uZOyE+nL6GHx6
         sjGhM8uCRwRlZbGgjb5NRTwx+thCI4W6wnltJsOkDd1Ync7b1bo3PNIwdW38aLlHjK1K
         BUW0u7fMzt5wtcNNExD2CiS26zdjdnKCul6jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670407; x=1701275207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFeIE8kGuQCYuzDUsYE523mlGLItNa6RGc94ggrfe9A=;
        b=q6stMd+eiZ3gQ9he3UmXXbUGqtbT2iMjGXunvrZUliJ8byCpXOG7Gotq2ZowElLuRH
         svsYHCc7RqAhB5DcQZ/OsBCLj4Yp1kGIJM/8zcJLclmR4qmQeIDRYUhEI8CvKxrYoaZO
         AourveuOl6hiyU5lvRI1G7T4wiibtQkB9mIsHknA+tlTKZJHYXGbaZ+6RIdNWTxsa5bg
         GQWyYX1RRLfC0QZMWC68Rrjc5ObMo/f/s8vgS3EvZDE8Hps3kJlGy1e0O3oevKQQy1hP
         0PkSkDbSXr22ILB5nIBIm0hx2ojlAK7z+oAInYzWwTymgq7L0RadXtLmkez6YCzBZL/f
         7uJA==
X-Gm-Message-State: AOJu0YwCi+mK6QDYI9+e0qBlRcL6ZOCIBUnzAjVIcy037AZU22JUuidg
	kuZNAwmQvQzfHnwBqKA0pl9i4bSiFUBBLBGNUOYQ2g==
X-Google-Smtp-Source: AGHT+IEWYcQQXqcy3HU5n0lbo4Sp1tN4ZK4JTiJgmtid1PU0xV7GqvCgjpnOX4tr5IEKAY6Y+EXQuA==
X-Received: by 2002:a5d:47ab:0:b0:332:c648:c657 with SMTP id 11-20020a5d47ab000000b00332c648c657mr1815771wrb.4.1700670407555;
        Wed, 22 Nov 2023 08:26:47 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mem_sharing: Fix typo in comment
Date: Wed, 22 Nov 2023 16:26:20 +0000
Message-Id: <20231122162620.4354-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ambigious -> ambiguous

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/mm/mem_sharing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 142258f16a..9647e651f9 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1123,7 +1123,7 @@ err_out:
 /*
  * This function is intended to be used for plugging a "hole" in the client's
  * physmap with a shared memory entry. Unfortunately the definition of a "hole"
- * is currently ambigious. There are two cases one can run into a "hole":
+ * is currently ambiguous. There are two cases one can run into a "hole":
  *  1) there is no pagetable entry at all
  *  2) there is a pagetable entry with a type that passes p2m_is_hole
  *
-- 
2.34.1


