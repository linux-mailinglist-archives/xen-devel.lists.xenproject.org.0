Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A22A751FE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 22:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931217.1333633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyH7a-0007pv-DX; Fri, 28 Mar 2025 21:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931217.1333633; Fri, 28 Mar 2025 21:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyH7a-0007mn-Ad; Fri, 28 Mar 2025 21:20:10 +0000
Received: by outflank-mailman (input) for mailman id 931217;
 Fri, 28 Mar 2025 21:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyH7Z-0007mh-0b
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 21:20:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b2c4ce2-0c1a-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 22:20:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C471B5C53FA;
 Fri, 28 Mar 2025 21:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73075C4CEE4;
 Fri, 28 Mar 2025 21:20:03 +0000 (UTC)
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
X-Inumbo-ID: 6b2c4ce2-0c1a-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743196804;
	bh=wbthIWcULpje8WOjqBYjBATOEhgrD2Cay66N9NTo6xc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BJ6YEm/5ewyBR+ZoY7ufHwN40dvS4lrSYoQqug/M2nvjzV5YlW/yT2jF6bCjm3tiR
	 zFeGE7hr7Qo0tZF0sMR2GSe6+Rx4Y2vNsKQiyE3RXTdU6HjJjb0J68rWfIALv6uwCH
	 WVDdGFhkXDob65z+cr9o9t/kkY9bdaUf0gxTwyiDunRkfoV8x9Belob+q0wMG6CXRo
	 WIhvWZ9Lyu4j0wrNKSjkt1B2Y2axl4RsGy8+RM37+btZImAkTcfVvHW0nf+w3AEcNw
	 aJtIjBlkko1e7E+Hyl2hEWyeYjmjlMEsmOIAZjoK3iaHlimD9Z4Jcag2Xn0W+IW9BE
	 kl6wIzh6VIP1w==
Date: Fri, 28 Mar 2025 14:20:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
In-Reply-To: <1a2cbedf-e4de-4373-9a3b-3ff0c75c4290@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503281339280.563920@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2503182002160.2000798@ubuntu-linux-20-04-desktop> <ad1bd470-1efa-4019-89ac-386bb05dd44d@suse.com> <alpine.DEB.2.22.394.2503191754480.2325679@ubuntu-linux-20-04-desktop> <8297406e-b281-4783-9238-d6326db3fa15@suse.com>
 <alpine.DEB.2.22.394.2503211607200.2325679@ubuntu-linux-20-04-desktop> <59cdc84c-6e5a-4752-b09a-945d05badd91@suse.com> <alpine.DEB.2.22.394.2503271628460.563920@ubuntu-linux-20-04-desktop> <1a2cbedf-e4de-4373-9a3b-3ff0c75c4290@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-730641905-1743196727=:563920"
Content-ID: <alpine.DEB.2.22.394.2503281418510.563920@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-730641905-1743196727=:563920
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2503281418511.563920@ubuntu-linux-20-04-desktop>

On Fri, 28 Mar 2025, Jan Beulich wrote:
> >>> +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> >>> +            err = -EFAULT;
> >>> +
> >>> +        xfree(bytemap);
> >>> +    }
> >>> +    else
> >>> +    {
> >>> +        const uint8_t *bytemap = (const uint8_t *)bitmap;
> >>> +        last = bytemap[nbits/8];
> >>> +
> >>> +        if ( copy_bytes &&
> >>> +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> >>> +            err = -EFAULT;
> >>
> >> The two identical instances would imo better stay common, even if this may
> >> require another function-scope variable (to invoke xfree() on after the
> >> copy-out).
> > 
> > That's not possible because bytemap is defined differently in the two
> > cases so it has to be defined within the if block.
> 
> Hence why I said "even if this may require another function-scope variable".

Sorry Jan, I don't understand in practice how to make your suggestion
work.

Do you mean to do this?

#ifdef __BIG_ENDIAN
	uint8_t *bytemap;
#else
	const uint8_t *bytemap;
#endif

If so, I get this build error:

common/bitmap.c: In function ‘bitmap_to_xenctl_bitmap’:
common/bitmap.c:402:29: error: passing argument 1 of ‘bitmap_long_to_byte’ discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  402 |         bitmap_long_to_byte(bytemap, bitmap, nbits);
      |                             ^~~~~~~

I am trying to guess what you have in mind, but it might be more
effective if you could write it down. For reference, I am including the
patch I was trying to get to work.



diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 3da63a32a6..b213e29ca5 100644
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
@@ -384,21 +382,43 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
     uint8_t zero = 0;
     int err = 0;
     unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
-    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
-
-    if ( !bytemap )
-        return -ENOMEM;
+    uint8_t last;
+#ifdef __BIG_ENDIAN
+	uint8_t *bytemap;
+#else
+	const uint8_t *bytemap;
+#endif
 
     guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
     copy_bytes  = min(guest_bytes, xen_bytes);
 
-    bitmap_long_to_byte(bytemap, bitmap, nbits);
+    if ( IS_ENABLED(__BIG_ENDIAN) )
+    {
+        bytemap = xmalloc_array(uint8_t, xen_bytes);
+
+        if ( !bytemap )
+            return -ENOMEM;
 
-    if ( copy_bytes &&
-         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
+        bitmap_long_to_byte(bytemap, bitmap, nbits);
+        last = bytemap[nbits / 8];
+    }
+    else
+    {
+        bytemap = (const uint8_t *)bitmap;
+        last = bytemap[nbits / 8];
+    }
+
+    if ( copy_bytes > 1 &&
+         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
         err = -EFAULT;
 
-    xfree(bytemap);
+    if ( IS_ENABLED(__BIG_ENDIAN) )
+        xfree(bytemap);
+
+    clamp_last_byte(&last, nbits);
+    if ( copy_bytes > 0 &&
+         copy_to_guest_offset(xenctl_bitmap->bitmap, copy_bytes - 1, &last, 1) )
+        err = -EFAULT;
 
     for ( i = copy_bytes; !err && i < guest_bytes; i++ )
         if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
--8323329-730641905-1743196727=:563920--

