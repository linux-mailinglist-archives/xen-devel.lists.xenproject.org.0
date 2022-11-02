Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACB5616654
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 16:39:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435986.689977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqFpY-0006A0-I8; Wed, 02 Nov 2022 15:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435986.689977; Wed, 02 Nov 2022 15:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqFpY-00067V-Eq; Wed, 02 Nov 2022 15:39:04 +0000
Received: by outflank-mailman (input) for mailman id 435986;
 Wed, 02 Nov 2022 15:39:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cji=3C=citrix.com=prvs=298722737=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqFpW-00067P-Oj
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 15:39:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77d2c749-5ac4-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 16:39:00 +0100 (CET)
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
X-Inumbo-ID: 77d2c749-5ac4-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667403540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RGEEqNl9smxBROa5nfaheIgphZedWkrD7OyQg4TiCwE=;
  b=UDZRPMbssdVtEJcGBsI7hl2DToL41ulmIVI9RQA6RgpTaBUSxPaaAaCF
   jufnjZnUfv9M0nZiFBrVm7f7IsYDuspKY/jx3aprdNuO7u8g93agcU/D4
   QvclIT2br8i0fGUbBER5V6JsYkS3/Rb1T1XSukSRFAWucOGV93FubK8jn
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83111231
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+JW3kqJffrxza5XiFE+RHJUlxSXFcZb7ZxGr2PjKsXjdYENS0DYAn
 GpNWGCCOK6NZjSmfdtxOoq1/EhQ7JSDnddhTFRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5wRkPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5WGEZE/
 6YWEAkHNAyniPqbmpO+T8Jj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozRHJwMxB3Bz
 o7A13nVUhpGGNW69SCA0Sjwp8GMvw3DVY1HQdVU8dY12QbOlwT/EiY+TkCnqPO0jkq/XdN3K
 EEO/Ccq668o+ySDUd3VTxC+5nmesXY0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neLld70AT1ksJWOVGmQsLyTqFuaGSUTN35EWiYCQiMM+dylq4Y25jrNU9JiHaidntDzXzbqz
 Fi3QDMW3utJy5RRjuPioA6B02nESoX1ohAdxxzwVGj/4DtAbtS5Q4OwxAL66PNrI9PMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONl1HswDaJz9zq3+KTJrU3YE
 c7CGftA9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLF+heagTRNrFotf/sTODpH
 zF3bpXi9vmieLemPnm/HXA7cDjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9UNokihrc+Rp
 ynVZ6Ot4ACg7ZExAVnVNysLhXKGdcoXkE/XygR3Zwz5hCRyMd/+hErdHrNuFYQaGCVY5aYcZ
 5E4lw+oWZyjlhyvF+whUKTA
IronPort-HdrOrdr: A9a23:XIic2KikCIeD3kDh+09O+XBIQnBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.95,234,1661832000"; 
   d="scan'208";a="83111231"
Date: Wed, 2 Nov 2022 15:38:38 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH for-4.17 4/4] Rework COPYING installed in
 /usr/include/xen/, due to several licences
Message-ID: <Y2KO/jA/aTpYkgge@perard.uk.xensource.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-5-anthony.perard@citrix.com>
 <619bb7bb-a60a-5f13-53da-72e1d3a4aaf1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <619bb7bb-a60a-5f13-53da-72e1d3a4aaf1@suse.com>

On Wed, Nov 02, 2022 at 02:09:08PM +0100, Jan Beulich wrote:
> On 02.11.2022 12:28, Anthony PERARD wrote:
> > --- /dev/null
> > +++ b/tools/include/xen/COPYING
> > @@ -0,0 +1,26 @@
> > +XEN NOTICE
> > +==========
> > +
> > +This licence applies to all files within this subdirectory ("/usr/include/xen")
> > +with the exception of "sys/" which may include an header under public domain or
> > +BSD-2 licence.
> 
> Nit: s/an header/headers/ ? And perhaps better to not name the two licenses
> here but instead keep this more generic so it wouldn't need changing if a
> header with yet another license appeared?

I guess I can make the text more generic without to much issue. As long
as the exception is for the "sys/" headers, we would probably be fine.
New change would be:

    +with the exception of "sys/" which may include headers under different
    +licences.

> > +=====================================================================
> > +
> > +Permission is hereby granted, free of charge, to any person obtaining a copy
> > +of this software and associated documentation files (the "Software"), to
> > +deal in the Software without restriction, including without limitation the
> 
> I understand you've simply copied this from ./COPYING, but shouldn't it be
> "limitation of" or "limiting"?

The text match the text at https://spdx.org/licenses/MIT.html, so I'm
not going to change it.

Thanks,

-- 
Anthony PERARD

