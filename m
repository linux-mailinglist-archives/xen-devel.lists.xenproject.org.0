Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3141E254D
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 17:20:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdbN0-0004Cc-Rp; Tue, 26 May 2020 15:19:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LE0D=7I=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jdbN0-0004CX-1r
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 15:19:58 +0000
X-Inumbo-ID: 5b7af0e4-9f64-11ea-9947-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b7af0e4-9f64-11ea-9947-bc764e2007e4;
 Tue, 26 May 2020 15:19:57 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e4so2518529ljn.4
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2020 08:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LkQKRSobVUAHtal/uWlHiNLYAfFspWICdN15Jpx80uc=;
 b=j1ewBqqXkChli7grKCYNwueXzWyyZaWWId1En+lzsZCj3tEIFvqKsYtTuvJiFRJXhF
 Pa29OX38mPo+Z15+0xzBLXit9d2BiKik3oT3X2yvzIFroCrbWOCdazvrsvcfazVQFpae
 rQyg3s5XcIedXETdhbxFXnLY1XW4rzW6XkF5XH0ioobPIFFfcgktMk8Q64+OI/lJ3tjG
 Nu3YeVZqyLPsl7O/MkW/YFQrh6FtAsNl2IDE+hu1DIZozWr+GQ3HSF4GpFVPlhYBvzBW
 c3U7Tm3U3OiMPXAsERRZ+43BDFx4OEb5THsqYHqITDsni/Je7Rr8bI4fReop9dkv0vjY
 WScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LkQKRSobVUAHtal/uWlHiNLYAfFspWICdN15Jpx80uc=;
 b=mb42kSRcWe70NtfIvpiUamxqQFPBeTyYQ0d3yTDOIxAmeuVq0GwZEkDD2qQCKS56/I
 URHL41tLqlvizOROMgFXUMfzEgHL9fGcmOzXs8iazfBXiwRQ/xuldlNEFS1TeRQHRXmj
 AXdVOsUF+ew5tNSiOxrVs4hw/xk2iD5seuEbfT/I5SXDekMm13/rZCGUU4OOf6qwD/w1
 MCHKLe3r0C1822fLzhx9gbz47Vn4Uaqhh6MO+6AocFzlUXSdlUJkPbR4QzrEr18lrai5
 pe15MNNAW7FcnyRaARnns8ta4fsF8vMrLWwFp/B0Sx85PKGbkMHmC2j/4wY1TnAkot+e
 r4ww==
X-Gm-Message-State: AOAM5321g7uS7/xMBZxjUlWZ9MH88Iznkh9UOW4/rgM4J2D7Gnj6skCY
 mWO4PhcnbI4+jxiMkZ9mZT1kYyhz+/VAu8BlbuQ=
X-Google-Smtp-Source: ABdhPJxTyBk69b2Q5nBvmxqW4yz5PZRYtGqxez+3t+OmIZPurtYWzEdL8ixeJqTMvnDyDVqMvsuMR96n44hCXzlmPCs=
X-Received: by 2002:a2e:9953:: with SMTP id r19mr798833ljj.235.1590506396351; 
 Tue, 26 May 2020 08:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-5-george.dunlap@citrix.com>
 <CAEBZRSfF8KAnzz5LW8GhcuJu=2rex3d6bvgz=a7-kLMp-itjqQ@mail.gmail.com>
 <CAEBZRScpycd2_A8moi68AA3asbsUSRjkW1kUVdpsdwgx-SZKpQ@mail.gmail.com>
 <8040BE07-B452-4036-ADE8-6E5CA0ED41A9@citrix.com>
In-Reply-To: <8040BE07-B452-4036-ADE8-6E5CA0ED41A9@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 26 May 2020 11:19:41 -0400
Message-ID: <CAEBZRSe1DHR6vLzj7j8iB9kkJD2zqELcToU4U9Kbwi6tgdpXPA@mail.gmail.com>
Subject: Re: [PATCH 4/5] golang/xenlight: Use XEN_PKG_DIR variable rather than
 open-coding
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 26, 2020 at 5:31 AM George Dunlap <George.Dunlap@citrix.com> wrote:
>
>
>
> > On May 23, 2020, at 5:48 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> >
> >>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> >> Reviewed-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> >
> > Oh, I just noticed your commit message calls the variable
> > "XEN_PKG_DIR", but it's actually named "GOXL_PKG_DIR."
>
> Oh, weird.  I presume the R-b stands if I fix the title?

Yes, of course.

-NR

