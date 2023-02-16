Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3AC699AA0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 17:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496683.767554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pShXs-0006xY-JH; Thu, 16 Feb 2023 16:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496683.767554; Thu, 16 Feb 2023 16:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pShXs-0006uR-GR; Thu, 16 Feb 2023 16:55:44 +0000
Received: by outflank-mailman (input) for mailman id 496683;
 Thu, 16 Feb 2023 16:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7p0N=6M=citrix.com=prvs=40464162c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pShXr-0006uL-AA
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 16:55:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be1224c0-ae1a-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 17:55:41 +0100 (CET)
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
X-Inumbo-ID: be1224c0-ae1a-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676566541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=peLqcPhOHzbL3yJ5ZAfpVvZr9eOT+PLTqpxYT+hcofg=;
  b=AxxIydf/L/oVlCgUNw8WYx0gGLUhZHBIzUn4601myQgxIk5FRDAT8NGT
   DQNmhvsn4BaWFMyfLnZulHOdhJpj5awwqzZzULwC8fTtVbqAiHOA9ws5I
   uM91IVDjIjokiWBUfdVugG3bvlUk3pbX9LbC10fQ5GBjp8Ikwn0hMljQL
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97257848
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:dNqqr62OZB3iXmpk//bD5eBxkn2cJEfYwER7XKvMYLTBsI5bp2YDz
 2cfDTjXOazeNDP1LdAjO9jjph4OvJXRm9RlTVc5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZnO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfP08X6
 6FbERM3VgmJl+iI3vW9cLRumZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFJoPwxnI+
 jKuE2LRLkEGN+GfxAC8tSyilNHtugL9SIIOLejtnhJtqALKnTFCYPEMbnOkpdGph0j4XMhQQ
 2QW9TAptrMa71GwQ5/2WBjQiHecswQVQdZ4D+ww4wbLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi+QPu6lq0EiJFIw6Vvfo0JusQ2qYL
 y22QDYWuZtKk5NI7oaBxUnNkziSuN/PdFM3+VCCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQQ3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI552pUQDPY6/PhwxUjapSskZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlCj+N7mHhknzKKFPgXKihLNpLEORaopUotagPSPojVEovayOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3wYsTXPjLRzhsXrfbeGJOQThxY8I9NJt9I+SJaYwJzLaXl
 px8M2cEoGfCaYrvc17QNy46NuixBv6SbxsTZEQRALph4FB7Ca7H0UvVX8BfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:EeGj3a19urX79bl4FlYewAqjBS9yeYIsimQD101hICG9Lfbo8v
 xGzc5rtyMc1gxhO03IwerwSZVohEmsgKKdkrNhTYtKPTOGhILMFupfBOTZskDd8kHFh4hgPO
 JbAtZD4b7LfBVHZKTBkXWF+r8bqbHsnc7J9IOuqEuBVTsEV0gj1XYHNu/yKDw2eOAsP+tAKH
 Po3Ls8m9PWQwVtUi3UPAh9Y8Hz4/fMmZ7afxhDIxI88gGBgROEgYSKXCSw71M1VT5C/KklyH
 PCmQDi/Kmv2svLhCM041Wjr6i+1eGRjOeqy6S3+4IoAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKZQongyyGA5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHof
 129lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjR9o+a87bXzHAb0cYb
 NT5YDnla1rmGqhHijkV7xUsYGRtndaJGbxfqFNgL3YomlrdLYQ9Tpa+CVVpAZyyHsHcegy2w
 wfWp4Y0Y2mfvVmL56VTN1xM/dfKla9BS4kY1jiZmgO4sk8SjnwQ2me2sR82AjtQu1Q8HIbou
 W0bG9l
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="97257848"
Date: Thu, 16 Feb 2023 16:55:34 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2] libs: Fix unstable libs build on FreeBSD,
 auto-generate version-script
Message-ID: <Y+5gBpQiogKinuHf@l14>
References: <20230216141007.21827-1-anthony.perard@citrix.com>
 <fa7e1420-b7a3-23f5-e0a4-99bc8905cd91@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fa7e1420-b7a3-23f5-e0a4-99bc8905cd91@citrix.com>

On Thu, Feb 16, 2023 at 04:50:09PM +0000, Andrew Cooper wrote:
> On 16/02/2023 2:10 pm, Anthony PERARD wrote:
> > diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
> > index 0e4b5e0bd0..ffb6c9f064 100644
> > --- a/tools/libs/libs.mk
> > +++ b/tools/libs/libs.mk
> > @@ -120,7 +127,7 @@ TAGS:
> >  clean::
> >  	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
> >  	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
> > -	rm -f headers.chk headers.lst
> > +	rm -f headers.chk headers.lst lib*.map.tmp .*.tmp
> 
> Doesn't *.tmp cover lib*.map.tmp ?

There is no "*.tmp" on this command line, but there is ".*.tmp".

> Also the subject still needs a FreeBSD->LLVM fix.

Sounds good.

> Both can be fixed on commit.

If you only fix the subject, then that's fine by me.

Thanks,

-- 
Anthony PERARD

