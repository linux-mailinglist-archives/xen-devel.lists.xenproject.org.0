Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9029C47C4D7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 18:18:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250515.431484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzilx-0002sN-N4; Tue, 21 Dec 2021 17:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250515.431484; Tue, 21 Dec 2021 17:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzilx-0002qc-Jl; Tue, 21 Dec 2021 17:17:57 +0000
Received: by outflank-mailman (input) for mailman id 250515;
 Tue, 21 Dec 2021 17:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzilw-0002qW-12
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 17:17:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee22ce13-6281-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 18:17:54 +0100 (CET)
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
X-Inumbo-ID: ee22ce13-6281-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640107074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JSGaBk8rAOLskSdIFgZRZA47zfJVyAtj6pMUbWzuJ2o=;
  b=T3GqltWGyRNNpkzqX06mYaiFmM/0oh/40TeQOonF0ovoSB40QYTG/P3E
   xXplkQ0wPT4cbTBePfSolW5DiZ6sQ2wig77LigFfNTifXomWTGUrgvl+e
   5YVGxTTmm1JWvH+0jtTYeVdmtYULrGvXGuYN2ow1sWKDnhcexcUoXjCEd
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bc2BvPbjns3XwvwnuPyUIuD/RPeDXo15vFzUs58Dlm7tlAGnGoRWES6nwEKL1FIt6Q1S/Erj0P
 aEAK37iUkWOVwwCbjputEhm3Emvc1BRUCUvucfesvJkxIXYVZiCY3Wns8nCX1ALCIR86f1Iq06
 Ak/GoWLsCy43/Y3JDSjGU04VcAhImfBiyqu7v7FrgVFsX4DANtJeM+/b8ei5YPw6u60zjQJ1lL
 xILvhHbFWYxf6aU/C3c6g9G+m/R2kJuAffDcgZu5CFwZMMX2hln898U5f8rxoYrFdPlEu3xxEb
 FpvAtzQ9UZnNCpD6mUeSvk/v
X-SBRS: 5.1
X-MesageID: 60023931
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bfp8tK6hCjz+3FN2ytWeYwxRtLnAchMFZxGqfqrLsTDasY5as4F+v
 mcdWm3QP/qNYzDzet4ibdyx9htQ7MXUmoc2GVY4pS0wHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wrdj2Ncw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 dV1kMaVUx8SZYLpku4xYkZaNQV+MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQRa6EP
 JtCMFKDajzuTzBMfXsQT64zv+usnzrdfAICohG88P9fD2/7k1UqjemF3MDuUt2VR+1Fk0CAv
 GXE8m/lRBYAO7S31j6t4n+qwOjVkkvTWo0IE6aj3uV3m1DVzWsWYDUfUFDq/9GikEWwHdRSN
 yQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLd5RqZAW4VCCZMctU8uOc5QDUr0
 hmCmNaBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZSIF2/y5hZsrtUnga9xpPJ/qjPvRGT6ll
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3HY5
 CBc8/Vy+tziGn1keMalZOwWVI+k6P+eWNE3qQ4+RsJxn9hBFpPKQGyx3N2cDBs4WirnUWWwC
 KM2he+3zMULVJdNRfUoC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyzflnY
 8rELZz1Vixy5UFbINyeHb91PVgDnH9W+I8ubcqjk0TPPUS2ORZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLaWX8UjyqZKdQpiBSFiXfje8pULHsbeclsOMDxwUJf5nOJ+E7GJaowIz48kC
 FnmARQGoLc+7FWaQTi3hodLNOmyAM0h9C1jZkTB/z+AghAeXGpm149HH7NfQFXt3LcLISdcQ
 6ZXdsOeLO5ITzibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz8
 ++6ywfWYZsfXAA+XszYX+2ikgGqtn8HleMsA0aReotPeF/h+ZRBIjDqiqNlONkFLBjOn2PI1
 wufDRoCi/PKpos5rIvAiaye9t/7GOpiBEtKWWLc6O/uZyXd+2Oix65GUfqJIm+BBD+lpv36a
 LwMnf/mMfABkFJbiKZGEu5mnfAk+t/ih75G1QA4Tn/FWEumV+F7KX6c0MgR6qAUnu1FuRG7U
 16k88VBPenbI9vsFVMcKVZ3bumH0v1IyDDe4e5sfRf/7S5zurGGTV9TL1+HjykEdOl5N4Ysw
 OEAvs8K6lPg1kp2Y4je1i0EpX6RKnEgUrk8ssBICYDmvQMn11VebMGOESTx+pyON41BP0RCz
 uV4X0Yea2CwHnb/Tkc=
IronPort-HdrOrdr: A9a23:bZYKi6C/5dSycWrlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.88,224,1635220800"; 
   d="scan'208";a="60023931"
Date: Tue, 21 Dec 2021 17:17:10 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 19/57] tools/configure.ac: Create ZLIB_LIBS and
 ZLIB_CFLAGS
Message-ID: <YcIMFkm1OOwqrieT@perard>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-20-anthony.perard@citrix.com>
 <6af001a9-75a2-2992-59ea-170af8d1627e@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6af001a9-75a2-2992-59ea-170af8d1627e@srcf.net>

On Thu, Dec 16, 2021 at 05:16:05PM +0000, Andrew Cooper wrote:
> On 06/12/2021 17:02, Anthony PERARD wrote:
> > diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
> > index 8f5f3acd21..1f4b7f7c58 100644
> > --- a/tools/libs/guest/Makefile
> > +++ b/tools/libs/guest/Makefile
> > @@ -103,8 +102,7 @@ NO_HEADERS_CHK := y
> >  
> >  include $(XEN_ROOT)/tools/libs/libs.mk
> >  
> > -libxenguest.so.$(MAJOR).$(MINOR): COMPRESSION_LIBS = $(filter -l%,$(zlib-options))
> > -libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(COMPRESSION_LIBS) -lz
> > +libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(ZLIB_LIBS) -lz
> 
> Looking ZLIB vs the other compression libs, shouldn't -lz be inside
> $(ZLIB_LIBS) ?

I don't think so because -lz is also used by libxenhypfs for example,
and maybe go binding for libxl. It seems that the name of the variable
is misleading, as it seems that -lz is zlib but $ZLIB doesn't contain it
or anything that would be called zlib.

-lz is check explicitly by configure and fail if missing, while $ZLIB
can be empty.

> Also, shouldn't this be LDLIBS rather than APPEND_LDFLAGS ?

Yes, I think I'm doing that in a different patch.
    libs: rename LDUSELIBS to LDLIBS and use it instead of APPEND_LDFLAGS

Thanks,

-- 
Anthony PERARD

