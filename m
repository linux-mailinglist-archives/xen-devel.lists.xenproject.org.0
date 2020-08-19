Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F42249A6C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 12:32:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8LN4-0001q6-Nh; Wed, 19 Aug 2020 10:31:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8LN3-0001q0-25
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 10:31:05 +0000
X-Inumbo-ID: af386eca-bdd1-4cd8-97bb-3bd6163fab5b
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af386eca-bdd1-4cd8-97bb-3bd6163fab5b;
 Wed, 19 Aug 2020 10:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597833063;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=T27VgrL2uYw+iPe1gGhmI7/jEHit1OD703MIIQ5Z7+A=;
 b=UqrF7eBxn428hIPCHSey5rEimqcFxrseSjCSYt5c/38d1MIGdmWaY99/
 KGM9lV7PmSODVoseeH2vcLjpsystpR14Vg0R1bxdiRbNqNZFEQTcjFWOh
 /bZa30WkiKCrYP+EcKpG6WCJ8Hv2u3EwI5VVP16M0D+HSdA2jsAkbcoPN Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4vKh1Zl9xUMMnfXu4oxN2NHUcaV2FFB9STVHE2rmPgbGa6rFi9VLL/QejBqz/Ys/V7+Vh6BvCb
 8uIq+hisSNG0WbYY0qA+9wkCGBRj++bsnhQ+al6ifA1TxmiUtDnpML/TUuzuwbcBcemgSXFH/P
 VChVEFYM92sZO9GhtHdk3PCfcMlmijgjHR/bwJONRRs2/3MfRJTbphTzRz96Qwq+rDq+h6Tx5j
 wqw2mNCeyRg/QpSJLhSwsj9zhhnWzZzZT6+axuaWRge7espdv7YqAboWDaG+kDGXg8KSaEWBnZ
 0Tk=
X-SBRS: 2.7
X-MesageID: 25770585
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="25770585"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24380.65377.44583.51170@mariner.uk.xensource.com>
Date: Wed, 19 Aug 2020 11:30:57 +0100
To: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
CC: Elliott Mitchell <ehem+xen@m5p.com>, <xen-devel@lists.xenproject.org>,
 "Wei Liu" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: fix -Werror=stringop-truncation in
 libxl__prepare_sockaddr_un
In-Reply-To: <20200819094123.GO1626@mail-itl>
References: <20200819020036.599065-1-marmarek@invisiblethingslab.com>
 <20200819020036.599065-2-marmarek@invisiblethingslab.com>
 <20200819034356.GA29116@mattapan.m5p.com>	<20200819094123.GO1626@mail-itl>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Marek Marczykowski-G??recki writes ("Re: [PATCH 2/2] libxl: fix -Werror=stringop-truncation in libxl__prepare_sockaddr_un"):
> On Tue, Aug 18, 2020 at 08:43:56PM -0700, Elliott Mitchell wrote:
> > On Wed, Aug 19, 2020 at 04:00:36AM +0200, Marek Marczykowski-G??recki wrote:
> > > diff --git a/tools/libxl/libxl_utils.c b/tools/libxl/libxl_utils.c
> > > index f360f5e228..b039143b8a 100644
> > > --- a/tools/libxl/libxl_utils.c
> > > +++ b/tools/libxl/libxl_utils.c
> > 
> > 
> > >      }
> > >      memset(un, 0, sizeof(struct sockaddr_un));
> > >      un->sun_family = AF_UNIX;
> > > -    strncpy(un->sun_path, path, sizeof(un->sun_path));
> > > +    strncpy(un->sun_path, path, sizeof(un->sun_path) - 1);
> > >      return 0;
> > >  }
> > 
> > While the earlier lines are okay, this line introduces an error.  
> 
> Why exactly? strncpy() copies up to n characters, quoting its manual
> page:
> 
>     If there is no null byte among the first n bytes of src, the string
>     placed in dest will not be null-terminated
> 
> But since the whole struct is zeroed out initially, this should still
> result in a null terminated string, as the last byte of that buffer will
> not be touched by the strncpy.

Everyone here so far, including the compiler, seems to be assuming
that sun_path must be nul-terminated.  But that is not strictly
correct.  So the old code is not buggy and the compiler is wrong.

Some systems insist on sun_path being nul-terminated, but I don't
think that includes any we care about.  AFAICT from the manpage
FreeBSD doesn't and uses a variable socklen for AF_UNIX.

OTOH I don't think there is much benefit in the additional byte so I
don't mind if we take some version of these changes.

I think Marek is right that his patch does leave sun_path
nul-terminated, so, for that original patch:

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks,
Ian.

