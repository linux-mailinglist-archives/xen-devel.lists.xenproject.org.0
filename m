Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B856492510
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 12:41:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258455.445127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9mrP-0000n2-LR; Tue, 18 Jan 2022 11:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258455.445127; Tue, 18 Jan 2022 11:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9mrP-0000kn-I7; Tue, 18 Jan 2022 11:41:11 +0000
Received: by outflank-mailman (input) for mailman id 258455;
 Tue, 18 Jan 2022 11:41:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BW1=SC=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n9mrO-0000ke-1E
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 11:41:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84db028f-7853-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 12:41:06 +0100 (CET)
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
X-Inumbo-ID: 84db028f-7853-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642506067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yh2q8WWVm18AcF8TwG6hB8sfVb3dSI9zWs8lOCBxGmw=;
  b=ZjJYbN1tf6qte23ww7vEHZllKMehvKZOi3P1647HvZHza16bHmlvlege
   JxLGck5lD3gdHHCLUbxrMdAJu9CeTmL902ajBmudxPFkY8tQ5piAqW37F
   69FOS05Exesprh4lkpR0eQIwUgrZD4Mv9PXjSnoWsYU93ZZ94nOTc/Wie
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hesjMCSwHbE2QiGA8GD6g8Cr5Gw7sOHzM3frikIUszfVeKvsli9qhqpLNDge0JpgOB0kV6pBy8
 /UPEriuD8LECow81JLRSqONyhjrYVbKkC2mhnW2mvMzz7UW/WOyaueZH6Zmptuvq01DKM1vx+N
 1BLVUk4ZFv4N9aRWpdYDVW78kqiD0elFnGjP1zmFZBmVPsmMZWIzvld9iGIlYSR5mCwX6O/XuY
 0gi5IF1YWN40p5lMyhCdZtO9MLQNKW/KZpXimIcR6ObnFct9Vdh+H5uzrIoT4UFJZfAaP9qIaQ
 pkuU5Te4gvcP4MvjhdlOozca
X-SBRS: 5.2
X-MesageID: 64345779
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VghI4qpZDg+uwa212LMZThifWyReBmKTYhIvgKrLsJaIsI4StFCzt
 garIBnQOP7famKgKI8lbYqyoBhT6J/dmINmTARlqy02QihG9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IHpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZ2QViZqLozvocgcXDRaPT1OAf0cqIaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZZCNWcwM0WojxtnFQ0mV5QSgr+RmiP1bCV29lHFvJAM2j2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfQmQvrVYRUE6e3ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3E6hQ8T5Xha4iGWZpRNaUN1Ve8U79wOl2qfS+xyeBGUPUnhGctNOnM0rQT0n0
 HeZktWvAiZg2IB5UlrEqO3S92nrf3FIcylSPkfoUDfp/fHigJ4SzQLube9PEaGYjPPpKQ2gm
 WCz+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0swpDGtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5ZIVcFg
 2eJ4Gu9AaO/2lPwMsebhKrrWqwXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8vBLZrwXChGUv46pNZTewv7+eV0rszZ7TmCLa0XMjz9iebODJJrYept3KSyghARs/rf/VS9H
 yd3PMqW0RRPONASkQGMmbP/2WsidCBhbbiv8pQ/XrfafmJORT99Y9eMn+JJU9E1zsx9y7aTl
 lngCxAw9bYKrSCdQel8Qio9OOqHsFcWhS9TABHAyn7ziidzOtj+vf5PH3b1FJF+nNFeITdPZ
 6FtU6297j5nE1wrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:OB+0Iqu3VFTfxxSHTNlq0D9q7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="64345779"
Date: Tue, 18 Jan 2022 11:41:01 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 30/47] build: rework "headers*.chk" prerequisite
 in include/
Message-ID: <YeanTdmX8Kynig18@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-31-anthony.perard@citrix.com>
 <dcd485e8-3c46-460c-7d0e-13f50aebbf87@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dcd485e8-3c46-460c-7d0e-13f50aebbf87@suse.com>

On Tue, Dec 21, 2021 at 03:07:52PM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> > @@ -81,10 +81,21 @@ ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
> >  
> >  all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
> >  
> > -PUBLIC_HEADERS := $(filter-out $(src)/public/arch-% $(src)/public/dom0_ops.h, $(wildcard $(src)/public/*.h $(src)/public/*/*.h) $(public-y))
> > +public-hdrs-path := $(srcdir)/public
> >  
> > -PUBLIC_C99_HEADERS := $(src)/public/io/9pfs.h $(src)/public/io/pvcalls.h
> > -PUBLIC_ANSI_HEADERS := $(filter-out $(src)/public/%ctl.h $(src)/public/xsm/% $(src)/public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
> > +public-list-headers = $(wildcard $1/*.h $1/*/*.h)
> > +public-filter-headers = $(filter-out $(addprefix $(public-hdrs-path)/,$($1-filter)), $($1))
> > +
> > +public-c99-headers := io/9pfs.h io/pvcalls.h
> > +public-headers := $(call public-list-headers,$(public-hdrs-path)) $(public-y)
> > +public-ansi-headers := $(public-headers)
> 
> Personally I find it odd for public-c99-headers to be first in this group.
> Further down, in the upper-case counterparts, you have it at the end (still
> in context below).
> 
> > +public-headers-filter := dom0_ops.h arch-%
> 
> What is the criteria to be listed here vs ...
> 
> > +public-ansi-headers-filter := %ctl.h xsm/% %hvm/save.h $(public-headers-filter) $(public-c99-headers)
> 
> ... outside of that macro's expansion here? There's no other use of the
> macro that I can spot, so its presence is puzzling me.

The "%-filter" macro are used by the macro "public-filter-headers",
which takes "$(%)" and filter-out "$(%-filter)".

Currently, PUBLIC_ANSI_HEADERS is PUBLIC_HEADERS with headers
filtered-out.
And PUBLIC_HEADERS is public-y with headers filtered-out.

In my patch, I derive PUBLIC_ANSI_HEADERS from public-y, so I also need
to use the filter used to generate PUBLIC_HEADERS. So
$(public-headers-filter) is both used on its own and in the ansi-filter.

> > +PUBLIC_HEADERS := $(call public-filter-headers,public-headers)
> > +PUBLIC_ANSI_HEADERS := $(call public-filter-headers,public-ansi-headers)
> > +PUBLIC_C99_HEADERS := $(addprefix $(public-hdrs-path)/, $(public-c99-headers))
> 
> While benign right now, wouldn't it be more consistent if
> public-filter-headers was also applied in this last case? Or is
> there a reason not to?

It wouldn't work at the moment because $(public-c99-headers) aren't
prefix with "$(public-hdrs-path)" like $(public-headers). This is
because I'm using $(public-c99-headers) in
$(public-ansi-headers-filter).

Maybe I should just had the prefix to the c99-headers and removing the
prefix when using it in the filter, something like that:

    public-c99-headers := $(addprefix $(public-hdrs-path)/,io/9pfs.h io/pvcalls.h)
    public-ansi-headers-filter := %ctl.h xsm/% %hvm/save.h $(public-headers-filter) \
        $(patsubst $(public-hdrs-path)/%,%,$(public-c99-headers))

then I thin that would work:
    PUBLIC_C99_HEADERS := $(call public-filter-headers,public-c99-headers)

I could put an empty "public-c99-headers-filter :=" somewhere, just in
case one is looking for it later.

Thanks,

-- 
Anthony PERARD

