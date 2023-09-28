Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A4B7B28B4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 01:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610079.949354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0IR-0003m6-82; Thu, 28 Sep 2023 23:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610079.949354; Thu, 28 Sep 2023 23:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0IR-0003gp-0T; Thu, 28 Sep 2023 23:19:51 +0000
Received: by outflank-mailman (input) for mailman id 610079;
 Thu, 28 Sep 2023 23:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qm0IP-0003MQ-HA
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 23:19:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83802657-5e55-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 01:19:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4330A61DA0;
 Thu, 28 Sep 2023 23:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B483FC433C7;
 Thu, 28 Sep 2023 23:19:44 +0000 (UTC)
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
X-Inumbo-ID: 83802657-5e55-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695943185;
	bh=N3bxzgJ1s2K6v+njeepztZaSboFqG44A04jELbAY81w=;
	h=Date:From:To:cc:Subject:From;
	b=YfaBnK07AZJvJvc8X0IpNQl1JJqdCsvG0+pLxfxyslw1frmyLEWvd/eV76YRWtrbo
	 eYfhkz2+kwyBeHiRrEe8PWY+qWp8q6NoerFdVmdNUkEYcNPnjo1j56W1y8BslQ+01z
	 aamioCiuavD0b5tni6ba83RV4iexyZAqHkZ7uF/EQVwEufkU4MbXt4Z7AaxFjxfuzu
	 5P5fAWsq7SwKt7aEIVM9uV7txCkZoX7a0/tr/gWk3OHdc8gtnKYf2gNCkvTMEg9HI0
	 lVGfO5JTZQvGVLKrh/IgAM7cZ5qLWs+j3SF2FiJUbyM3icRU6epocRXRkxCNsT6fiV
	 b1NbfJk0k+GHg==
Date: Thu, 28 Sep 2023 16:19:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, bertrand.marquis@arm.com, 
    george.dunlap@citrix.com, wl@xen.org
Subject: [PATCH] bitmap: fix n__ signess 
Message-ID: <alpine.DEB.2.22.394.2309281616200.1996340@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

All callers of the bitmap_switch macro (which are all within bitmap.h)
pass an int as first parameter. Do not assign it to an unsigned int
potentially introducing errors.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---

We could also have gone the other way and change all the callers and the
callers' callers to use an unsigned int instead, but I went for the path
of least resistance.

diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 3caf92c76d..7caec098d7 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -101,7 +101,7 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
 #define bitmap_bytes(nbits) (BITS_TO_LONGS(nbits) * sizeof(unsigned long))
 
 #define bitmap_switch(nbits, zero, small, large)			  \
-	unsigned int n__ = (nbits);					  \
+	int n__ = (nbits);					  \
 	if (__builtin_constant_p(nbits) && !n__) {			  \
 		zero;							  \
 	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \

