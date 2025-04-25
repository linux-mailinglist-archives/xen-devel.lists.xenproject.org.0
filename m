Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8524A9C7AF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967744.1357470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HIN-0005XY-DM; Fri, 25 Apr 2025 11:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967744.1357470; Fri, 25 Apr 2025 11:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HIN-0005Ur-Ak; Fri, 25 Apr 2025 11:32:39 +0000
Received: by outflank-mailman (input) for mailman id 967744;
 Fri, 25 Apr 2025 11:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYju=XL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u8HIM-0005Ul-6G
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:32:38 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc2cac75-21c8-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 13:32:35 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so3314932a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 04:32:36 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f70354635csm1156854a12.49.2025.04.25.04.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:32:35 -0700 (PDT)
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
X-Inumbo-ID: fc2cac75-21c8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745580755; x=1746185555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JzM4/Rj4ycImLA04FgIK9XC5uE2TDbLJM9e4B7nM+SM=;
        b=iRxgMuEWvmUqGoA9cBdu2SJUyVzMWef5ABIrmt9iXRLDrqStDwogEcX+SlhwcdwhaC
         1jQ2nHFXd0ivgvzXXZCqTdyf7m3HC30YH0QdpG+m+DGrf7BY2sDOnOF71cBXwg6D/Raj
         p60SoUYh22pBzH9b0voClH5eMRfSjqPNj5YeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580755; x=1746185555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzM4/Rj4ycImLA04FgIK9XC5uE2TDbLJM9e4B7nM+SM=;
        b=bThnnO+IIj5VInUl2opQr4+MQ1XnA1/aDFIOnOdTI+hMfKGbfsAHJGQMOUSRraMN0G
         q2k8zliaZXm34BaN9QL5eIN1R+WqBO2Csl25aNv3aw2jSsgPCt9tkjuyevV+NoDTMzfs
         JCHRiOKBaFuPHiPRq0wOE342g/qCXsZOyCNe3MX+8ZIzweDli/Cz8k4NCI3kP+iPHpAT
         8EKnce1c9X/UoIYzMVYwhVxnW8Car/FqmAOsUJa/MQmSUj96tMVo9bW9nsxjRQUQ1z9R
         N7hG0dZZK6VPR6E6efEw875DEIRC7EKfK0FQloAdtskW1DR5jfQDH6zBNwXw55NyX7ry
         fzhg==
X-Gm-Message-State: AOJu0YxCwI4aELfHqIjGJ0nekMTNZSKirSE1/IGMLlT9gjX0H9yYGkuX
	h2fzk+EDbMf0R20vbyx7xiRsolqSJOv+GmKeRjBpiDZ9fFy2XM//aAcC3zWCVIbGQD5C5l/hF6B
	c
X-Gm-Gg: ASbGncuEeLYo1L5l36jccTZC2xx8/LyBsOCLnFwW++ulmRfAgCdnmNd9XNlsVpcZZ1l
	SAGDuWd3SY/SCm3n/bwwYC5xf3qTsLkWrKJpqiitYumreFN5uAkXPaH9UaqxkNQdVlrSyMZGpbc
	1BFWVu3Ztl33+ZkD3vB2NxaT0AFZ70jtdOVOCMSuUH3iffq94wCjzGnohFUrOFX8uXOCRyrsLxy
	8wEa1YD0RPCFv9rA3vq9u15PzWg7+mQaKGaDJ8qHH4skSlL3chbqxHnpuhZJgEUPZS7ije/u6FY
	B6/51DLQypbGBGEEQX6ADn4LiVyPNf5VHA9L1D3x8ycWyw==
X-Google-Smtp-Source: AGHT+IHW9mq9KXqdPedQev6ujTwASuo3KZA/UQNi40BMEdX4Y/ad/LGAw9JdpUui1eg/+vcGmFxS8g==
X-Received: by 2002:a05:6402:35d2:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5f7234347aemr1469706a12.23.1745580755472;
        Fri, 25 Apr 2025 04:32:35 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen: fix buffer over-read in bitmap_to_xenctl_bitmap()
Date: Fri, 25 Apr 2025 13:32:27 +0200
Message-ID: <20250425113227.10243-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's an off-by-one when calculating the last byte in the input array to
bitmap_to_xenctl_bitmap(), which leads to bitmaps with sizes multiple of 8
to over-read and incorrectly use a byte past the end of the array.

Fixes: 288c4641c80d ('xen: simplify bitmap_to_xenctl_bitmap for little endian')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Handle length 0.
---
 xen/common/bitmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index bf1a7fd91e36..4f96fda3895c 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -369,6 +369,9 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
     const uint8_t *bytemap;
     uint8_t last, *buf = NULL;
 
+    if ( !nbits )
+        return 0;
+
     if ( !IS_ENABLED(LITTLE_ENDIAN) )
     {
         buf = xmalloc_array(uint8_t, xen_bytes);
@@ -396,7 +399,7 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
      * their loops to 8 bits. Ensure we clear those left over bits so as to
      * prevent surprises.
      */
-    last = bytemap[nbits / 8];
+    last = bytemap[(nbits - 1) / 8];
     if ( nbits % 8 )
         last &= (1U << (nbits % 8)) - 1;
 
-- 
2.48.1


