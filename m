Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E28C24A48B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 19:00:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8RRf-0005bp-UG; Wed, 19 Aug 2020 17:00:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BZrp=B5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1k8RRe-0005bk-LD
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 17:00:14 +0000
X-Inumbo-ID: dc1fc70d-e7ac-4386-b396-f879ff58bed4
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc1fc70d-e7ac-4386-b396-f879ff58bed4;
 Wed, 19 Aug 2020 17:00:13 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 07JH00bg038153
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Wed, 19 Aug 2020 13:00:06 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 07JH00Gc038152;
 Wed, 19 Aug 2020 10:00:00 -0700 (PDT) (envelope-from ehem)
Date: Wed, 19 Aug 2020 10:00:00 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: fix -Werror=stringop-truncation in
 libxl__prepare_sockaddr_un
Message-ID: <20200819170000.GA37849@mattapan.m5p.com>
References: <20200819020036.599065-1-marmarek@invisiblethingslab.com>
 <20200819020036.599065-2-marmarek@invisiblethingslab.com>
 <20200819034356.GA29116@mattapan.m5p.com>
 <20200819094123.GO1626@mail-itl>
 <24380.65377.44583.51170@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24380.65377.44583.51170@mariner.uk.xensource.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
 autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
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

On Wed, Aug 19, 2020 at 11:30:57AM +0100, Ian Jackson wrote:
> Marek Marczykowski-G??recki writes ("Re: [PATCH 2/2] libxl: fix -Werror=stringop-truncation in libxl__prepare_sockaddr_un"):
> > On Tue, Aug 18, 2020 at 08:43:56PM -0700, Elliott Mitchell wrote:
> > > On Wed, Aug 19, 2020 at 04:00:36AM +0200, Marek Marczykowski-G??recki wrote:
> > > > diff --git a/tools/libxl/libxl_utils.c b/tools/libxl/libxl_utils.c
> > > > index f360f5e228..b039143b8a 100644
> > > > --- a/tools/libxl/libxl_utils.c
> > > > +++ b/tools/libxl/libxl_utils.c
> > > 
> > > 
> > > >      }
> > > >      memset(un, 0, sizeof(struct sockaddr_un));
> > > >      un->sun_family = AF_UNIX;
> > > > -    strncpy(un->sun_path, path, sizeof(un->sun_path));
> > > > +    strncpy(un->sun_path, path, sizeof(un->sun_path) - 1);
> > > >      return 0;
> > > >  }
> > > 
> > > While the earlier lines are okay, this line introduces an error.  
> > 
> > Why exactly? strncpy() copies up to n characters, quoting its manual
> > page:
> > 
> >     If there is no null byte among the first n bytes of src, the string
> >     placed in dest will not be null-terminated
> > 
> > But since the whole struct is zeroed out initially, this should still
> > result in a null terminated string, as the last byte of that buffer will
> > not be touched by the strncpy.
> 
> Everyone here so far, including the compiler, seems to be assuming
> that sun_path must be nul-terminated.  But that is not strictly
> correct.  So the old code is not buggy and the compiler is wrong.

For portability it /should/ be nul-terminated.  According to the man
pages for both Linux and FreeBSD, neither actually depends on the
nul-byte.

I would argue for using either strcpy(), memcpy(), or merging things
together with strlcpy().

Rereading, the log message is "Path must be less than...".  If it said
"no more than", then subtracting 1 would be correct, but with "less" it
should state the buffer length.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



