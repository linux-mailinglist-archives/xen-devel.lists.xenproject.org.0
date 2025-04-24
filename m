Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176FAA9AA93
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 12:39:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966143.1356459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7typ-00014H-D0; Thu, 24 Apr 2025 10:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966143.1356459; Thu, 24 Apr 2025 10:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7typ-00011X-9m; Thu, 24 Apr 2025 10:38:55 +0000
Received: by outflank-mailman (input) for mailman id 966143;
 Thu, 24 Apr 2025 10:38:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnO2=XK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7tyn-00011R-S4
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 10:38:53 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e5b875f-20f8-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 12:38:48 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5f5bef591d6so1589434a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 03:38:48 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ace59c2c282sm85724966b.158.2025.04.24.03.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 03:38:47 -0700 (PDT)
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
X-Inumbo-ID: 4e5b875f-20f8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745491128; x=1746095928; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=95XP89wM/MbT6Su4ZJ1pqdh/1HU7cMyiHzEbAgSBVZs=;
        b=qZywu03AONdiDVH/rhvsUZ+rKDy/DZXpe2MWMeSViVxqAXII47oRlXlj8hg4rCRuWR
         zmxbMbLEkk8alefATeXDsA9RLgcsaLSKvMqRbGgsnPy/kAkYR9EqgXkrqlNF+cS+oaEJ
         SJlY4zyesVmGPxqvzfhdtt6Z74BHAovNctDmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491128; x=1746095928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95XP89wM/MbT6Su4ZJ1pqdh/1HU7cMyiHzEbAgSBVZs=;
        b=Ocrsml/tgQ/TFfwKMG1SzZl5oxWamiFLaBr4PtVdua+kkt74DndgoNlaWkailp+nAa
         7SUCsewEeun4qeHRa4veDrpUMTsnYqLrNnKxApIOHI4wYWPxQYBYfdA4OP+niqu6d+9O
         kJh6PEtLJkvE4zu4PrnV3cD/bfZ5mMFWx7PIVXaieqSXVIYWI2anCgQ7Mn0RpHvWbwtF
         PUjBVEI+sfiH1xX43BsmmZOCvgBzGh9VnWIZ7L2u/GEXSd0iVMxFaU/2o/pyEjFzSvyP
         IZ+Qi6jB3QLMmqiyhw0XIUinTE9Rb3Po2P4UULGeMeAl5l+7Y7zetLkBNd+DNqvE/KNL
         KMXQ==
X-Gm-Message-State: AOJu0Yzc+XkrSzSQjByG7pJqFDN8QiyrNxBwwE1CmX8execoeKaus4K3
	JFNa7C4vCURoFSGgq64jI/3KWlZL5aBPbIABdOwaGvieyHheUsAiUHdDM71epR5XqWM4ijbVfwl
	b
X-Gm-Gg: ASbGncs/RIRG37oqoexyPDCH7iZIsn7U4gFCPwv5xPb5VMNsA4gJ0p719TvTuHxA8Z4
	sqKX/XbVIXCRx5ybQD7jlNXMxAAY3K9qaq7XOpwoHFWBiN10BtS2f73GWNY5nr6nIVDGCnid+Xl
	+QnwdeOTLxPL6qACvpX44FGf+zpj1ao2pvflLfC1p6ytGmiV3/ngyShe7uk3OwfhTzuDUZvdSyy
	0SEEJTj2Hn+AtT0jTZDxGHipkk4ktK7UnygQcG3TOWupsbEZ2RW4Dq9jIRsL3edzhqHLQ65fyTU
	XP/JdLoc+F1X8eG5pdvsjDel3BL9Ei6lUt98nlMPDS4vFw==
X-Google-Smtp-Source: AGHT+IENEOyj41Piz65NS5XLTmA6/2CJwXHsdoF/8jWEnXB5nBS01jufKmPcIdn8WTfOM3WQkUDz6w==
X-Received: by 2002:a17:907:3f92:b0:ace:55d8:227d with SMTP id a640c23a62f3a-ace573ee7d6mr229753866b.54.1745491127970;
        Thu, 24 Apr 2025 03:38:47 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: fix buffer over-read in bitmap_to_xenctl_bitmap()
Date: Thu, 24 Apr 2025 12:38:41 +0200
Message-ID: <20250424103841.94828-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's an off-by-one when calculating the last byte in the input array to
bitmap_to_xenctl_bitmap(), which leads to bitmaps with sizes multiple of 8
to over-read and incorrectly use a byte past the end of the array.

While there also ensure that bitmap_to_xenctl_bitmap() is not called with a
bitmap of 0 length.

Fixes: 288c4641c80d ('xen: simplify bitmap_to_xenctl_bitmap for little endian')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/bitmap.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index bf1a7fd91e36..415d6bc074f6 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -369,6 +369,12 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
     const uint8_t *bytemap;
     uint8_t last, *buf = NULL;
 
+    if ( !nbits )
+    {
+	ASSERT_UNREACHABLE();
+	return -EILSEQ;
+    }
+
     if ( !IS_ENABLED(LITTLE_ENDIAN) )
     {
         buf = xmalloc_array(uint8_t, xen_bytes);
@@ -396,7 +402,7 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
      * their loops to 8 bits. Ensure we clear those left over bits so as to
      * prevent surprises.
      */
-    last = bytemap[nbits / 8];
+    last = bytemap[(nbits - 1) / 8];
     if ( nbits % 8 )
         last &= (1U << (nbits % 8)) - 1;
 
-- 
2.48.1


