Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E7347C502
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 18:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250519.431496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mziuC-0004R2-FT; Tue, 21 Dec 2021 17:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250519.431496; Tue, 21 Dec 2021 17:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mziuC-0004PF-Ca; Tue, 21 Dec 2021 17:26:28 +0000
Received: by outflank-mailman (input) for mailman id 250519;
 Tue, 21 Dec 2021 17:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mziuA-0004P9-Td
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 17:26:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1db661e1-6283-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 18:26:25 +0100 (CET)
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
X-Inumbo-ID: 1db661e1-6283-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640107585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3SB8VNGpH09J4DsV/MUYfNfzgo5i5lh1tdAvMj2ZDzc=;
  b=OeqzFZ9mEF6qvEJ7Pe2Sk4ieOLJqHbLh/Oe+hPbePA7jeQloRE7Cnq8h
   RGioZTj87pcSBLGFXw1l3ryinKUEpB7x5+z2VIUPnJs/R4vp9T8pBj7UV
   BFtJcfjUYHp2R2v27quag7S2pTY4oS/B9DAoZZELymFoC2a7p1zO7qocB
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nTtVF0yl2JT9To0kyOIL+yF2/loZ2iTHvQi4VWlsZ6WjsUvQz5zD2wBHLaoeu5AJ9Zu5iKJjX2
 3rrHdCnyh7cs22XIZJG+htapSBH49M/XpI2sUUnuq09Thd/dQohxvyNIatt095cUIecNMtj93J
 FzbKqyh8V6ZclUXfg4T5wMDw9csLKBEi6NnaxKLkkOM+aqoOt/XvHa42RamW5/fzIlJ78fOqTj
 6jknLrgJ5y/gAy0giy1ManHUN+1dVj9iGHX2dSmxzCmzlcfbooVwaFxFCBpGhJxwJgCcWZ8AtG
 qOjAq1ZUB7rf5H4zInwXQkCV
X-SBRS: 5.1
X-MesageID: 60024723
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rTUDj6PJjb8qV+rvrR0PkMFynXyQoLVcMsEvi/4bfWQNrUojhmRRy
 jEXWmGEP6uDN2ryetoiaoW2oE9UvZXUx9ZlSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400g6w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozCiufdt4
 vVvjLu1ajgXZKidpKcTbBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm9o3JwRR622i
 8wxdBsyPSmeQRJ2N0o5N5Bgu/WyikPEWmgNwL6SjfVuuDWCpOBr65DvLd7Ud9qiVchT2EGCq
 Qru/W70HxUbP9y30iee/zSngeqntTz/cJIfEvu/7PECqEaI2mUZBRkSVF26ifq0kEizX5RYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL86gOSVzYsVSRKZpogudNebT011
 HeZktXxHzttvbaJD3WH+d+8pDWuOS8TPCkaaDUNVwct7NzqoYV1hRXKJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY2+1nbgnxiMhKHuSy0K2F/SD17m4Dx2MdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFoib7JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiIP7KigbArLWdrGR2Cg2bKhwgBd2B2zskC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bGPCTIFutfaQDUBgzc0E9iiF+Nm
 zq4H5HVoyizrcWkOnWHmWLtBQ1iwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNyAyAJuyDM0XhS9qYkQR0aOAhiFLjXCHt/xEKfPavNAPqYRe8BKDZ
 6VfJpjbXK0QEm+vFvZ0RcCVkbGOvS+D3WqmVxdJqhBlJfaMniTFpY3peBXB7i4LAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIU6eTbsivIXIt0XLUmRzDWty
 AvLUwwTovPAotFp/YCR17yEtYqgD8B3AlFeQzvA9b+zOCSDpjijzIZMXfymZzfYUG+oqqyua
 f8Ml6P3MeEdnUYMuI15Su45waU77trphrlb0gU7QymbMwX1UutteyDU09NOu6tBwq5ilTG3A
 k/fqMNHPbipOd/+FAJDLgQSceneh+ofnSPf7KppLRyitjN35reOTW5bIwKI1H5GNLJwPY4on
 bUhtcoR51DtgxYmKI/b3CVd9mDKJX0cSaQ38JodBdaz2AYsz1hDZ73aCzP3v87TO4kdbBFyL
 2/GnrfGipRd2lHGIig6GnX61OZAgYgD5UJRx1gYKlXVwtfIi5fbBvGKHejbmuiN8ih67g==
IronPort-HdrOrdr: A9a23:1flLMKOrjwnkAMBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.88,224,1635220800"; 
   d="scan'208";a="60024723"
Date: Tue, 21 Dec 2021 17:25:36 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"George Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 22/57] tools/console: have one Makefile per
 program/directory
Message-ID: <YcIOEC0kNjMfCQUl@perard>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-23-anthony.perard@citrix.com>
 <edcb690b-c21c-137f-0bda-79eda64a0164@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <edcb690b-c21c-137f-0bda-79eda64a0164@srcf.net>

On Thu, Dec 16, 2021 at 05:26:49PM +0000, Andrew Cooper wrote:
> On 06/12/2021 17:02, Anthony PERARD wrote:
> > Sources of both xenconsoled and xenconsole are already separated into
> > different directory and don't share anything in common. Having two
> > different Makefile means it's easier to deal with *FLAGS.
> >
> > Some common changes:
> > Rename $(BIN) to $(TARGETS), this will be useful later.
> > Stop removing *.so *.rpm *.a as they aren't created here.
> > Use $(OBJS-y) to list objects.
> > Update $(CFLAGS) for the directory rather than a single object.
> >
> > daemon:
> >     Remove the need for $(LDLIBS_xenconsoled), use $(LDLIBS) instead.
> >     Remove the need for $(CONSOLE_CFLAGS-y) and use $(CFLAGS-y)
> > 	instead.
> >
> > client:
> >     Remove the unused $(LDLIBS_xenconsole)
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  .gitignore                    |  4 +--
> >  tools/console/Makefile        | 49 +++-------------------------------
> >  tools/console/client/Makefile | 39 +++++++++++++++++++++++++++
> >  tools/console/daemon/Makefile | 50 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 94 insertions(+), 48 deletions(-)
> >  create mode 100644 tools/console/client/Makefile
> >  create mode 100644 tools/console/daemon/Makefile
> >
> > diff --git a/.gitignore b/.gitignore
> > index b39b996718..c31fa9b841 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -159,8 +159,8 @@ tools/libs/util/libxenutil.map
> >  tools/libs/vchan/headers.chk
> >  tools/libs/vchan/libxenvchan.map
> >  tools/libs/vchan/xenvchan.pc
> > -tools/console/xenconsole
> > -tools/console/xenconsoled
> > +tools/console/client/xenconsole
> > +tools/console/daemon/xenconsoled
> 
> $ git ls-files -- :/ | grep gitignore
> ../.gitignore
> ../tools/fuzz/cpu-policy/.gitignore
> ../tools/libs/.gitignore
> ../tools/misc/.gitignore
> ../tools/tests/cpu-policy/.gitignore
> ../tools/tests/resource/.gitignore
> ../tools/tests/tsx/.gitignore
> ../tools/tests/vhpet/.gitignore
> ../tools/tests/xenstore/.gitignore
> tools/kconfig/.gitignore
> xsm/flask/.gitignore
> 
> 
> We're starting to use per-dir gitignores, because it has far less
> problematic behaviour for code movement.

You mean "we", I don't think everyone agree we that yet ;-). They aren't
any "xen/.gitignore" yet, despite me trying to add one at some point.

> I think we ought to take this opportunity to clean things up for the better.

Sounds good to me, I'll make the change.

> > diff --git a/tools/console/client/Makefile b/tools/console/client/Makefile
> > new file mode 100644
> > index 0000000000..44176c6d93
> > --- /dev/null
> > +++ b/tools/console/client/Makefile
> > @@ -0,0 +1,39 @@
> > +XEN_ROOT=$(CURDIR)/../../..
> > +include $(XEN_ROOT)/tools/Rules.mk
> > +
> > +CFLAGS += -Werror
> 
> -Werror really ought to come from somewhere common, seeing as we expect
> it to be unilaterally set.

Yes. I think I'll also look at having "./configure --disable-werror" or
similar so -Werror could be easly disable, by for example someone
building an ancient release and not wanting to deal with warnings.

Thanks,

-- 
Anthony PERARD

