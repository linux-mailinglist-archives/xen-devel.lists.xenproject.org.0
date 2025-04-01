Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C742BA7787C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 12:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933836.1335669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzYYT-0008NM-2W; Tue, 01 Apr 2025 10:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933836.1335669; Tue, 01 Apr 2025 10:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzYYS-0008KL-Vi; Tue, 01 Apr 2025 10:09:12 +0000
Received: by outflank-mailman (input) for mailman id 933836;
 Tue, 01 Apr 2025 10:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzYYR-0008KF-N2
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 10:09:11 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ac6e222-0ee1-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 12:09:10 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so35417955e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 03:09:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fbc10e1sm150399105e9.12.2025.04.01.03.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 03:09:09 -0700 (PDT)
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
X-Inumbo-ID: 5ac6e222-0ee1-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743502150; x=1744106950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FYlBIF7QsuFYGoWoS1MtcTc4f885ritXKmGZRwOaB+0=;
        b=CBAf9iYI1dvTaISKmtU9+w57VrERr/DsTYjhJCvWAqm9gmYT8vZTbZjAWMj/1MQJfe
         tVO3svVGVh4pnonnDnR+NZZ6fVRC/GPQgW3BwuW9WS2nrF04fmGOccopGKeSEb1aYbDq
         dqiaUe9otwVETRrJGrvH/S9NbIngvCcHG2vJ5rGPnuHA1+BuqQqeccjsBxUAemgKu6aW
         7SjxtYxxVliI1iHfbViytxyRy9ULaF4iPHNOkpT61xM384Zx1Efuz08QD4dv4SKWYARS
         baTdDye078RmQwWAbSdrcLz1duK/NaiwyaB85xmuGyYbrzx6iUl+E3ppsaX05uVEcl8z
         Jm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502150; x=1744106950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYlBIF7QsuFYGoWoS1MtcTc4f885ritXKmGZRwOaB+0=;
        b=NJYP5iITRO20iqJZwLOqkUJI6r/3KmzvGR6FAH3bs/3k9ezsbj+874yfmuVwQ0013R
         H0nU08aF3GUffOBLsrpNPv31/lckxUYVzQd9U3LeLQdPqLTSzimLo/pI2lNC7lt1gCBA
         4kfTl79+84sI+KtySVIW+asDlkPmOp+ObZLB7JuUKyqgnvd8I2IPAB6BL6XCT3+MNx7n
         D0JKbAjWaHp+br64q4efAc80wxwgrEsqbxEDA+FmNKibUOy8yaNW4VizGOCWvmlz+rZs
         e4YbvcpfxSLE5MDrcG8sB/Tn5X+rlwJKD/AIeoVme+OG2uW5axdI3rgbuX/mg2gb7lLe
         FYzA==
X-Forwarded-Encrypted: i=1; AJvYcCWfA63j4nCDlDEWG2FPCSEyGCwlZ3K2TLx4Y3/duj3BeiDWHmG2N86eYXauuZgFSK8umG1Lg35B86I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfzOzkh2uf0u+bm5OeCfoatH7Q71ywHr5B37gNToOvTCcvVh9K
	gksbsTJBX9/6w/4NUO1aisVF4mpPDCasMweVdiI9QEJjm8wZHe+Ppr+T7ocGzQ==
X-Gm-Gg: ASbGncsnmGji/32FJnvbB45UEfv+BLgrJ5ahWlcsKDGYDhftGxV27sjKamvubsSACPx
	fr6cUY/SYVEKQeOXXw0Oy4XnUNsWGLD8zavBFket6QaGta3jXXCJiw2w94tcVHEvHraa4ViFWwO
	KsnxgFsTscYa7DKfti+bPzvcXPXxQd33tnPzWjAdeI7GQgpjb8mr8kQgdjfPSvfOudseyD6f5lK
	fvBDSkpmOJwCP4SykP8Xvhlu3e/Z8y7zmZieSocnAUQLekrzyhD9SjUsWYQvBQNURNIcSZdIGVA
	Ch0gYHK2cg1fGxETVj9DGk95mluDF5NV15jVZiObFE7H9bFA7ft5/9Zyy8+Ud09OYBbKb/Nfkm2
	x4KkAqs2RyOU0WxTEbNHGtYr8jrQNg41yf42ZWkx+
X-Google-Smtp-Source: AGHT+IEmlSoRO6rxeuxLq4/6jdq+fl9WlLmXMcOq31xWCW1BakWwPulwpIYHj/QdNCIoS74jYG47Bg==
X-Received: by 2002:a05:600c:4747:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-43db62b726amr96829355e9.23.1743502149725;
        Tue, 01 Apr 2025 03:09:09 -0700 (PDT)
Message-ID: <694eac75-e872-4ba0-80ed-95c14cd11f5e@suse.com>
Date: Tue, 1 Apr 2025 12:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5] xen: simplify bitmap_to_xenctl_bitmap for little endian
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250401005008.2787764-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250401005008.2787764-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

The little endian implementation of bitmap_to_xenctl_bitmap leads to
unnecessary xmallocs and xfrees. Given that Xen only supports little
endian architectures, it is worth optimizing.

This patch removes the need for the xmalloc on little endian
architectures.

Remove clamp_last_byte as it is only called once and only needs to
modify one byte. Inline it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Fix IS_ENABLED() use. Keep more code common. Move comment.
    Convert LE bitmap_long_to_byte() to just a declaration.

--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -40,21 +40,6 @@
  * for the best explanations of this ordering.
  */
 
-/*
- * If a bitmap has a number of bits which is not a multiple of 8 then
- * the last few bits of the last byte of the bitmap can be
- * unexpectedly set which can confuse consumers (e.g. in the tools)
- * who also round up their loops to 8 bits. Ensure we clear those left
- * over bits so as to prevent surprises.
- */
-static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
-{
-	unsigned int remainder = nbits % 8;
-
-	if (remainder)
-		bp[nbits/8] &= (1U << remainder) - 1;
-}
-
 int __bitmap_empty(const unsigned long *bitmap, unsigned int bits)
 {
 	int k, lim = bits/BITS_PER_LONG;
@@ -338,7 +323,6 @@ static void bitmap_long_to_byte(uint8_t
 			nbits -= 8;
 		}
 	}
-	clamp_last_byte(bp, nbits);
 }
 
 static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
@@ -359,12 +343,11 @@ static void bitmap_byte_to_long(unsigned
 
 #elif defined(__LITTLE_ENDIAN)
 
-static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
-				unsigned int nbits)
-{
-	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
-	clamp_last_byte(bp, nbits);
-}
+#define LITTLE_ENDIAN 1 /* For IS_ENABLED(). */
+
+/* Unused function, but a declaration is needed. */
+void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
+			 unsigned int nbits);
 
 static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
 				unsigned int nbits)
@@ -384,22 +367,46 @@ int bitmap_to_xenctl_bitmap(struct xenct
     uint8_t zero = 0;
     int err = 0;
     unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
-    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
+    const uint8_t *bytemap;
+    uint8_t last, *buf = NULL;
 
-    if ( !bytemap )
-        return -ENOMEM;
+    if ( !IS_ENABLED(LITTLE_ENDIAN) )
+    {
+        buf = xmalloc_array(uint8_t, xen_bytes);
+        if ( !buf )
+            return -ENOMEM;
+
+        bitmap_long_to_byte(buf, bitmap, nbits);
+
+        bytemap = buf;
+    }
+    else
+        bytemap = (const uint8_t *)bitmap;
 
     guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
     copy_bytes  = min(guest_bytes, xen_bytes);
 
-    bitmap_long_to_byte(bytemap, bitmap, nbits);
+    if ( copy_bytes > 1 &&
+         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
+        err = -EFAULT;
+
+    /*
+     * If a bitmap has a number of bits which is not a multiple of 8 then the
+     * last few bits of the last byte of the bitmap can be unexpectedly set,
+     * which can confuse consumers (e.g. in the tools), who also may round up
+     * their loops to 8 bits. Ensure we clear those left over bits so as to
+     * prevent surprises.
+     */
+    last = bytemap[nbits / 8];
+    if ( nbits % 8 )
+        last &= (1U << (nbits % 8)) - 1;
+
+    xfree(buf);
 
     if ( copy_bytes &&
-         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
+         copy_to_guest_offset(xenctl_bitmap->bitmap, copy_bytes - 1, &last, 1) )
         err = -EFAULT;
 
-    xfree(bytemap);
-
     for ( i = copy_bytes; !err && i < guest_bytes; i++ )
         if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
             err = -EFAULT;


