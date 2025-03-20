Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC1AA69D61
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 01:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921229.1325158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tv4Du-0001JJ-9R; Thu, 20 Mar 2025 00:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921229.1325158; Thu, 20 Mar 2025 00:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tv4Du-0001Hi-6O; Thu, 20 Mar 2025 00:57:26 +0000
Received: by outflank-mailman (input) for mailman id 921229;
 Thu, 20 Mar 2025 00:57:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkqV=WH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tv4Ds-0001Hc-2m
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 00:57:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47738642-0526-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 01:57:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A6145C576D;
 Thu, 20 Mar 2025 00:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEB2C4CEE4;
 Thu, 20 Mar 2025 00:57:18 +0000 (UTC)
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
X-Inumbo-ID: 47738642-0526-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742432239;
	bh=/Svz/qpGL9V5+EBjj+5V0CrMNwmeoVFznwIAvQ9cJMc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nDLAhLtCtnDSI7lFU5iDxDq7zesyyCN3H4wXgbrwkjfW31cwdshL2YYcBSZ7/O2mr
	 KJyRTqQdQ4pxC7Ss9QqNjaNa3vC4iv7FYQReNt76UoY5LumMbYbESsQsuBhwcg4a5q
	 9KjxIEQ42eOtg7+foR9Eq+WNDsqsQMexZoiU59xGUv+OswzaAU+pPMCamm6cstfK7g
	 hM6eeKVEQHBrSzROF6WeYQsWojW3EZ0j+oHKKkS8eltIgi5z+JU2cYIW2OT/YxHhiZ
	 51UZaiTH3MJniVTOtZ+YVkMuOi7st5bivggICn4m4c+r7UeQ+Xs2Nv42c3imV2lXHh
	 Uy/RN/70HUzjQ==
Date: Wed, 19 Mar 2025 17:57:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
In-Reply-To: <ad1bd470-1efa-4019-89ac-386bb05dd44d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503191754480.2325679@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2503182002160.2000798@ubuntu-linux-20-04-desktop> <ad1bd470-1efa-4019-89ac-386bb05dd44d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Mar 2025, Jan Beulich wrote:
> What about xenctl_bitmap_to_bitmap()?
 
Let me see first if I managed to handle bitmap_to_xenctl_bitmap well.

---

[PATCH v2] xen: simplify bitmap_to_xenctl_bitmap for little endian

The little endian implementation of bitmap_to_xenctl_bitmap leads to
unnecessary xmallocs and xfrees. Given that Xen only supports little
endian architectures, it is worth optimizing.

This patch removes the need for the xmalloc on little endian
architectures.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- don't remove const
- handle clamp_last_byte for little endian

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 3da63a32a6..e9876ee5a6 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -384,21 +384,33 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
     uint8_t zero = 0;
     int err = 0;
     unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
-    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
-
-    if ( !bytemap )
-        return -ENOMEM;
+    bool alloc = (bitmap[nbits/8] & ((1U << (nbits % 8)) - 1)) ||
+                 IS_ENABLED(__BIG_ENDIAN);
 
     guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
     copy_bytes  = min(guest_bytes, xen_bytes);
 
-    bitmap_long_to_byte(bytemap, bitmap, nbits);
+    if ( alloc )
+    {
+        uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
+        if ( !bytemap )
+            return -ENOMEM;
 
-    if ( copy_bytes &&
-         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
-        err = -EFAULT;
+        bitmap_long_to_byte(bytemap, bitmap, nbits);
 
-    xfree(bytemap);
+        if ( copy_bytes &&
+             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
+            err = -EFAULT;
+
+        xfree(bytemap);
+    }
+    else
+    {
+        const uint8_t *bytemap = (const uint8_t *)bitmap;
+        if ( copy_bytes &&
+             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
+            err = -EFAULT;
+    }
 
     for ( i = copy_bytes; !err && i < guest_bytes; i++ )
         if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )

