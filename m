Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D2A6C644
	for <lists+xen-devel@lfdr.de>; Sat, 22 Mar 2025 00:10:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924643.1327755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvlUk-0003Tz-QR; Fri, 21 Mar 2025 23:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924643.1327755; Fri, 21 Mar 2025 23:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvlUk-0003Rr-Ni; Fri, 21 Mar 2025 23:09:42 +0000
Received: by outflank-mailman (input) for mailman id 924643;
 Fri, 21 Mar 2025 23:09:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tvlUj-0003Qy-B1
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 23:09:41 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8707150f-06a9-11f0-9ffa-bf95429c2676;
 Sat, 22 Mar 2025 00:09:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3296360008;
 Fri, 21 Mar 2025 23:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3348C4CEE3;
 Fri, 21 Mar 2025 23:09:20 +0000 (UTC)
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
X-Inumbo-ID: 8707150f-06a9-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742598562;
	bh=tOk3JdmqnS+4cgf2DjM3JEYyKK6c0sGOfN6pcwpKGLI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TYzPIgVdM/UBpyEHaLbesLZZz5jOGFa4cZxqQiiuqf0bNzRV5rRXqA+z49b4x0Lta
	 JDTi4/+7KYSgWbsk6QmOr1w0P2ZLfJsCmHsIORS5sxrM1ZIzylzGoS08R51adcqZIL
	 Xkt1UXVEXaK1clD74rnn0UUjZrVaii/ZtYNIaj5D0JRR+udabfz/6OlsQzgjvm3hFJ
	 SOjIWdw9tAfipo6TkaqwF7PhN6iTqGS/PwQq9NJI2yt+5Tl65lxFf537mbM3SNVJrX
	 uiMA+nD6PXzFw0oeGC/So0Ci002TEs+JwtyNFos9hNv2IcsV9mxlT28JT+M9Jjx7SI
	 HpKYAIZW+MJHg==
Date: Fri, 21 Mar 2025 16:09:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
In-Reply-To: <8297406e-b281-4783-9238-d6326db3fa15@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503211607200.2325679@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2503182002160.2000798@ubuntu-linux-20-04-desktop> <ad1bd470-1efa-4019-89ac-386bb05dd44d@suse.com> <alpine.DEB.2.22.394.2503191754480.2325679@ubuntu-linux-20-04-desktop> <8297406e-b281-4783-9238-d6326db3fa15@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Mar 2025, Jan Beulich wrote:
> On 20.03.2025 01:57, Stefano Stabellini wrote:
> > On Wed, 19 Mar 2025, Jan Beulich wrote:
> >> What about xenctl_bitmap_to_bitmap()?
> >  
> > Let me see first if I managed to handle bitmap_to_xenctl_bitmap well.
> 
> Well, the code looks correct to me, but the description now has gone
> stale. I also wonder whether with that extra restriction the optimization
> is then actually worth it. Just one further nit:

Hi Jan, you make a good point. I tried to come up with a better
approach. What do you think of this?


diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 3da63a32a6..2f448693c3 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -52,7 +52,7 @@ static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
 	unsigned int remainder = nbits % 8;
 
 	if (remainder)
-		bp[nbits/8] &= (1U << remainder) - 1;
+		*bp &= (1U << remainder) - 1;
 }
 
 int __bitmap_empty(const unsigned long *bitmap, unsigned int bits)
@@ -338,7 +338,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
 			nbits -= 8;
 		}
 	}
-	clamp_last_byte(bp, nbits);
 }
 
 static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
@@ -363,7 +362,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
 				unsigned int nbits)
 {
 	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
-	clamp_last_byte(bp, nbits);
 }
 
 static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
@@ -384,21 +382,40 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
     uint8_t zero = 0;
     int err = 0;
     unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
-    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
-
-    if ( !bytemap )
-        return -ENOMEM;
+    uint8_t last;
 
     guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
     copy_bytes  = min(guest_bytes, xen_bytes);
 
-    bitmap_long_to_byte(bytemap, bitmap, nbits);
+    if ( IS_ENABLED(__BIG_ENDIAN) )
+    {
+        uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
 
-    if ( copy_bytes &&
-         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
-        err = -EFAULT;
+        if ( !bytemap )
+            return -ENOMEM;
 
-    xfree(bytemap);
+        bitmap_long_to_byte(bytemap, bitmap, nbits);
+        last = bytemap[nbits/8];
+
+        if ( copy_bytes &&
+             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
+            err = -EFAULT;
+
+        xfree(bytemap);
+    }
+    else
+    {
+        const uint8_t *bytemap = (const uint8_t *)bitmap;
+        last = bytemap[nbits/8];
+
+        if ( copy_bytes &&
+             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
+            err = -EFAULT;
+    }
+
+    clamp_last_byte(&last, nbits);
+    if ( copy_to_guest_offset(xenctl_bitmap->bitmap, copy_bytes - 1, &last, 1) )
+        err = -EFAULT;
 
     for ( i = copy_bytes; !err && i < guest_bytes; i++ )
         if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )

