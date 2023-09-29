Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7873C7B3BDA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 23:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610738.950268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKoI-0007D7-Br; Fri, 29 Sep 2023 21:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610738.950268; Fri, 29 Sep 2023 21:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKoI-0007AQ-8k; Fri, 29 Sep 2023 21:14:06 +0000
Received: by outflank-mailman (input) for mailman id 610738;
 Fri, 29 Sep 2023 21:14:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmKoG-0007AK-Q2
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 21:14:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d978032-5f0d-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 23:14:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A1A87B82082;
 Fri, 29 Sep 2023 21:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C4CC433C9;
 Fri, 29 Sep 2023 21:14:00 +0000 (UTC)
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
X-Inumbo-ID: 1d978032-5f0d-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696022042;
	bh=6YfKG9FnLyhaWAFNJ+a9HVMWHWnyC0gh++r5NmRuxnY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IXap6kV+hjxtZMpZxwY8ugSV6fFeG7FQvZeDoHWfS1XCFyhq50Z35rzhMC8zZSZEa
	 mfvGyVoAENclAhwm2UAge/jQKqaygOToWxFwKF3mZHhKUiFj6w+MzOmU5LHlON2oma
	 V2uZkS+AP1welUErwynorIQ+43MSAvCNf8hkyXErwPrSHJJNwSc9jd62aObYiJKa+6
	 K+6VzevdNP5svwrwwrf+WZXer1LlhiPxB6//Wl2wuvVWmF4J9+D65KQe33R0JCRvi/
	 oA3ZhNwk50ctr1gpYd1OfDM7JjzRKvu8URv8R0oUnDjd6x/rPM/fsxOEvfq++r4YjO
	 PXUueH7lg9sWg==
Date: Fri, 29 Sep 2023 14:13:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    george.dunlap@citrix.com, wl@xen.org
Subject: Re: [PATCH] bitmap: fix n__ signess
In-Reply-To: <592517ec-f093-4789-8cd6-320f886e45ae@xen.org>
Message-ID: <alpine.DEB.2.22.394.2309291401010.2348112@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2309281616200.1996340@ubuntu-linux-20-04-desktop> <592517ec-f093-4789-8cd6-320f886e45ae@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Sep 2023, Julien Grall wrote:
> On 29/09/2023 00:19, Stefano Stabellini wrote:
> > All callers of the bitmap_switch macro (which are all within bitmap.h)
> > pass an int as first parameter. Do not assign it to an unsigned int
> > potentially introducing errors.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > 
> > We could also have gone the other way and change all the callers and the
> > callers' callers to use an unsigned int instead, but I went for the path
> > of least resistance.
> 
> I understand this will solve the issue right now because the callers are all
> passing 'int'. However, all the callers will need to switch to 'unsigned int'
> in order to solve violations in their callers.
> 
> That unless we decide to use 'int' everywhere, but I think this is a bad idea
> because 'n__' is not supposed to be negative.
> 
> Overall, this may be an easy win right now, but this will need to be reverted.
> So, I am not happy to ack it and would in fact be leaning towards Nacking it.

I understand this point and I was undecided myself about the approach.
The issue for me is the overwhelming amount of gcc warnings (thankfully
Luca's script helps a lot with it). With so many warning, it is
difficult to draw the line where to stop fixing things to generate a
digestable patch and not having the feeling of unraveling an infinite
ball of yarn. So, worried about having to change hundreds of lines of
code, I submitted the minimal change instead.

In this case though unsigned int is obviously the right type and the
patch below works as well. So I think that's better.

---
[PATCH v2] bitmap: fix nbits signess

To avoid potentially dangerous sign conversions in bitmap_switch, all
the callers of the bitmap_switch macro (which are all within bitmap.h)
should pass an unsigned int as first parameter.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- change nbits instead

diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 3caf92c76d..657390e32e 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -110,7 +110,7 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
 		large;							  \
 	}
 
-static inline void bitmap_zero(unsigned long *dst, int nbits)
+static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
 {
 	bitmap_switch(nbits,,
 		*dst = 0UL,
@@ -134,7 +134,7 @@ static inline void bitmap_fill(unsigned long *dst, int nbits)
 }
 
 static inline void bitmap_copy(unsigned long *dst, const unsigned long *src,
-			int nbits)
+			unsigned int nbits)
 {
 	bitmap_switch(nbits,,
 		*dst = *src,
@@ -142,7 +142,7 @@ static inline void bitmap_copy(unsigned long *dst, const unsigned long *src,
 }
 
 static inline void bitmap_and(unsigned long *dst, const unsigned long *src1,
-			const unsigned long *src2, int nbits)
+			const unsigned long *src2, unsigned int nbits)
 {
 	bitmap_switch(nbits,,
 		*dst = *src1 & *src2,
@@ -150,7 +150,7 @@ static inline void bitmap_and(unsigned long *dst, const unsigned long *src1,
 }
 
 static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
-			const unsigned long *src2, int nbits)
+			const unsigned long *src2, unsigned int nbits)
 {
 	bitmap_switch(nbits,,
 		*dst = *src1 | *src2,
@@ -158,7 +158,7 @@ static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
 }
 
 static inline void bitmap_xor(unsigned long *dst, const unsigned long *src1,
-			const unsigned long *src2, int nbits)
+			const unsigned long *src2, unsigned int nbits)
 {
 	bitmap_switch(nbits,,
 		*dst = *src1 ^ *src2,
@@ -166,7 +166,7 @@ static inline void bitmap_xor(unsigned long *dst, const unsigned long *src1,
 }
 
 static inline void bitmap_andnot(unsigned long *dst, const unsigned long *src1,
-			const unsigned long *src2, int nbits)
+			const unsigned long *src2, unsigned int nbits)
 {
 	bitmap_switch(nbits,,
 		*dst = *src1 & ~*src2,
@@ -174,7 +174,7 @@ static inline void bitmap_andnot(unsigned long *dst, const unsigned long *src1,
 }
 
 static inline void bitmap_complement(unsigned long *dst, const unsigned long *src,
-			int nbits)
+			unsigned int nbits)
 {
 	bitmap_switch(nbits,,
 		*dst = ~*src & BITMAP_LAST_WORD_MASK(nbits),
@@ -182,7 +182,7 @@ static inline void bitmap_complement(unsigned long *dst, const unsigned long *sr
 }
 
 static inline int bitmap_equal(const unsigned long *src1,
-			const unsigned long *src2, int nbits)
+			const unsigned long *src2, unsigned int nbits)
 {
 	bitmap_switch(nbits,
 		return -1,
@@ -191,7 +191,7 @@ static inline int bitmap_equal(const unsigned long *src1,
 }
 
 static inline int bitmap_intersects(const unsigned long *src1,
-			const unsigned long *src2, int nbits)
+			const unsigned long *src2, unsigned int nbits)
 {
 	bitmap_switch(nbits,
 		return -1,
@@ -200,7 +200,7 @@ static inline int bitmap_intersects(const unsigned long *src1,
 }
 
 static inline int bitmap_subset(const unsigned long *src1,
-			const unsigned long *src2, int nbits)
+			const unsigned long *src2, unsigned int nbits)
 {
 	bitmap_switch(nbits,
 		return -1,
@@ -208,7 +208,7 @@ static inline int bitmap_subset(const unsigned long *src1,
 		return __bitmap_subset(src1, src2, nbits));
 }
 
-static inline int bitmap_empty(const unsigned long *src, int nbits)
+static inline int bitmap_empty(const unsigned long *src, unsigned int nbits)
 {
 	bitmap_switch(nbits,
 		return -1,
@@ -216,7 +216,7 @@ static inline int bitmap_empty(const unsigned long *src, int nbits)
 		return __bitmap_empty(src, nbits));
 }
 
-static inline int bitmap_full(const unsigned long *src, int nbits)
+static inline int bitmap_full(const unsigned long *src, unsigned int nbits)
 {
 	bitmap_switch(nbits,
 		return -1,

