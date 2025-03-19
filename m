Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39871A68368
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 04:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920032.1324328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuji1-0006TA-JT; Wed, 19 Mar 2025 03:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920032.1324328; Wed, 19 Mar 2025 03:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuji1-0006RR-Dm; Wed, 19 Mar 2025 03:03:09 +0000
Received: by outflank-mailman (input) for mailman id 920032;
 Wed, 19 Mar 2025 03:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xikK=WG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tujhz-0006RL-KQ
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 03:03:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad1ab199-046e-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 04:03:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB8455C59DF;
 Wed, 19 Mar 2025 03:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2280DC4CEDD;
 Wed, 19 Mar 2025 03:03:01 +0000 (UTC)
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
X-Inumbo-ID: ad1ab199-046e-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742353383;
	bh=yDB6nuHNy9qBbv0m+m/Z+LEHLUc/+2/863la7Ks+h6g=;
	h=Date:From:To:cc:Subject:From;
	b=sEoZnpahNOQBHxa9HZV2W4G/1lO9niWC3SvfB3o0S+kGImUAnw+qvOK/ti37F1pGn
	 sSxHQ/GHGuZzrKm7kxcXvWkdyeATmKXCgXhx1mo8Od7bjegB8HvdoHE+z+J9EZ55xq
	 +ZbtLkI5T6HxvcUaGX5nZdXVVnIdRzQVnd7hp6ALLEEP8MgZf4ejxXiW4/cShNNSYZ
	 f8fXTC9EQeMA4uxGdEyfEPfv1OQXSAGId4MHxZVGoowQfuMDpKGCvGpSSVo3DiFSAz
	 cN9Kbu16GKGeTvMqBn3Ht8PxI4rzae/YnkIVKvCcYTpMla7qcB/p/T1F23N71QmtR2
	 L/Jr+5VFBf0Dw==
Date: Tue, 18 Mar 2025 20:03:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, michal.orzel@amd.com, 
    jbeulich@suse.com, julien@xen.org, roger.pau@citrix.com, 
    bertrand.marquis@arm.com
Subject: [PATCH] xen: simplify bitmap_to_xenctl_bitmap for little endian
Message-ID: <alpine.DEB.2.22.394.2503182002160.2000798@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The little endian implementation of bitmap_to_xenctl_bitmap leads to
unnecessary xmallocs and xfrees. Given that Xen only supports little
endian architectures, it is worth optimizing.

This patch removes the need for the xmalloc on little endian
architectures.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 3da63a32a6..38d77fc876 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -384,21 +384,26 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
     uint8_t zero = 0;
     int err = 0;
     unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
-    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
-
-    if ( !bytemap )
-        return -ENOMEM;
+    uint8_t *bytemap = (uint8_t *)bitmap;
 
     guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
     copy_bytes  = min(guest_bytes, xen_bytes);
 
-    bitmap_long_to_byte(bytemap, bitmap, nbits);
+    if ( IS_ENABLED(__BIG_ENDIAN) )
+    {
+        bytemap = xmalloc_array(uint8_t, xen_bytes);
+        if ( !bytemap )
+            return -ENOMEM;
+
+        bitmap_long_to_byte(bytemap, bitmap, nbits);
+    }
 
     if ( copy_bytes &&
          copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
         err = -EFAULT;
 
-    xfree(bytemap);
+    if ( IS_ENABLED(__BIG_ENDIAN) )
+        xfree(bytemap);
 
     for ( i = copy_bytes; !err && i < guest_bytes; i++ )
         if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )

