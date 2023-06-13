Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC83772E5B1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 16:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548177.855979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q94zA-0006wV-4p; Tue, 13 Jun 2023 14:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548177.855979; Tue, 13 Jun 2023 14:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q94zA-0006up-1O; Tue, 13 Jun 2023 14:27:04 +0000
Received: by outflank-mailman (input) for mailman id 548177;
 Tue, 13 Jun 2023 14:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ia/t=CB=citrix.com=prvs=5214cf225=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q94z8-0006uj-VT
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 14:27:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a99c1d0-09f6-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 16:27:00 +0200 (CEST)
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
X-Inumbo-ID: 5a99c1d0-09f6-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686666420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bFnADqzkMN61RkkpTC47rENmf+qhl+HhTmip0vSX+HY=;
  b=gTDFLyr3vG+2RrKlZ9QpoWtzI0kbMBPmLiZJSiSyueXBUF/N9F+ZLDf0
   ZjOM6scMmdyEU1XlhecABbWlRg272/y9ek/twl3keAwvU3tQgdOsXfNf7
   dnW2z5SUbrbvNPCSfGANwSAFU19aD7vimjFUOJS4tL2m3z2N4svC8vhY7
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111945583
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:fwm86K9FGzDhuJc11YztDrUDk36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mAXUG7QOf+OMWDzLo9+Odji9EwE7ZfRzN5nTANlriA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmO6kQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklq1
 fomcDAGbSmIqO+MxYrhFNdC3tg8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Mxx/J+
 j+brz+R7hcyPfCYzmaa/FWWvsDVtBnhfrwNNJDi+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8VUO/037keK0KW8ywSWHG8fVRZadccr8sQxQFQC3
 0eEhdrzCRRzsbeeTjSW8bL8kN+pEXFLdylYP3ZCFFZbpYC5++nfky4jUP5HMKiL1t3+Ggj77
 D2wqRBk2Ys91dIUgvDTEU/8v968mnTYZldrtluJBD79sV8RiJ2NPNLxtwWChRpUBMPAFwTa4
 iBZ8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirnUWWzC
 KMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YhKlLWoH41NBLAhggBdXTAd4llY
 f93lu72VB4n5VlPlmLqF4/xL5d2rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRtcu5TPHu2
 48HbaOikkwPONASlwGLqeb/23hWdylkbX03wuQLHtO+zv1OQjB5UKKMme95J+SIXc19z4/1w
 510YWcAoHKXuJENAV7ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:4IVbNK1SKjDgm0fF+UfRgQqjBU5yeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ/+xoS5PwOE80lKQFlbX5Uo3SODUO1FHIEGgA1/qU/9SDIVyYygc178
 4JGZSWYOeAQmSS5vyKgzVQZuxQpeVvh5rY59s2oU0MceniAJsK0+/2YjzrU3GfG2J9aKYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0nj5sRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqp9jIDPr3FtiEmEESntu+aXvUtZ1S2hkF/nAjg0idnrD
 CGmWZZAy060QKrQogem2qi5+Co6kdV11byjVCfmnftusr/WXYzDNdAn5tQdl/D51Mnp8wU6t
 M544u1jesnMfr7plWM2/HYExVx0kakq3srluAey3RZTIsFcbdU6YgS5llcHpsMFD/zrNlPKp
 gaMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wi0EY2MsclHEd849Vceg32w
 0FCNUXqFhjdL5oUUsmPpZ9fSKeMB2wfS7x
X-Talos-CUID: 9a23:/dtKImxLW+haNucUskI2BgUwOsYbKn3Wz07bDEKCDF4zFoO7EUOPrfY=
X-Talos-MUID: 9a23:ILs+3Qbc4hm1LeBTvhPrg219OuBS24u0IXoXt6sZm+TeOnkl
X-IronPort-AV: E=Sophos;i="6.00,239,1681185600"; 
   d="scan'208";a="111945583"
Date: Tue, 13 Jun 2023 15:26:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libs/light: use the cpuid feature names from
 cpufeatureset.h
Message-ID: <1dcc1302-4a11-4b83-8a52-0bdbb3b64785@perard>
References: <20230605103657.14191-1-roger.pau@citrix.com>
 <cab94580-70cc-4f9e-9da1-4830ba7eaf13@perard>
 <ZIhMm2D8pOmsEuY9@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIhMm2D8pOmsEuY9@Air-de-Roger>

On Tue, Jun 13, 2023 at 01:01:47PM +0200, Roger Pau Monné wrote:
> On Tue, Jun 13, 2023 at 11:44:51AM +0100, Anthony PERARD wrote:
> > On Mon, Jun 05, 2023 at 12:36:57PM +0200, Roger Pau Monne wrote:
> > > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > > index 24ac92718288..c5c5b8716521 100644
> > > --- a/docs/man/xl.cfg.5.pod.in
> > > +++ b/docs/man/xl.cfg.5.pod.in
> > > @@ -2010,24 +2010,12 @@ proccount procpkg stepping
> > >  
> > >  =back
> > >  
> > > -List of keys taking a character:
> > > +List of keys taking a character can be found in the public header file
> > > +L<arch-x86/cpufeatureset.h|http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,arch-x86,cpufeatureset.h.html>
> > 
> > https:// ;-)
> > 
> > And this probably want to be "xenbits.xenproject.org"
> > 
> > Also, I think there's maybe an issue with this link. Maybe someone can
> > assume that "TM1" takes a character, but that flags I think would get
> > rejected, issue with upper case vs lower case. Then, if we deal with
> > the casing, we still have feature like "AVX512_IFMA", which would only
> > be recognize if written "avx512-ifma", so issue with "-" vs "_".
> 
> Right, it's not perfect, but I don't see much better way if we want to
> keep the documentation in sync.

I guess we can start with the change you proposed.

Then, maybe adding that the keys needs to be lower case with dash
instead of underscore might be helpful in the man page.

And if we really feel generous, we could just handle both syntax, and
have the function apply the necessary transformation, lower case and
s/_/-/.

> > > diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> > > index f5ce9f97959c..0c7ffff416fe 100644
> > > --- a/tools/libs/light/libxl_cpuid.c
> > > +++ b/tools/libs/light/libxl_cpuid.c
> > > @@ -342,6 +214,28 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
> > >          if(!strncmp(str, flag->name, sep - str) && flag->name[sep - str] == 0)
> > >              break;
> > >      }
> > > +    if (flag->name == NULL) {
> > > +        const struct feature_name *feat;
> > > +        /* Provide a NUL terminated feature name to the search helper. */
> > > +        char *name = strndup(str, sep - str);
> > > +
> > > +        if (name == NULL)
> > > +            return 4;
> > So, instead of returning an arbitrary integer that isn't returned yet by
> > the function, could you return ERROR_NOMEM?
> 
> That would be my preference, but the function already returns
> (arbitrary) integers as error codes, so I'm not sure whether
> ERROR_NOMEM won't alias with one of the existing error codes.

All libxl error code are negative, so we should be fine.

Cheers,

-- 
Anthony PERARD

