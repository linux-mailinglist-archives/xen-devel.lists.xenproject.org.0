Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32253CB76A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 14:38:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157158.290075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4N5U-0002Hl-Sr; Fri, 16 Jul 2021 12:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157158.290075; Fri, 16 Jul 2021 12:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4N5U-0002Fv-PN; Fri, 16 Jul 2021 12:37:04 +0000
Received: by outflank-mailman (input) for mailman id 157158;
 Fri, 16 Jul 2021 12:37:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KHJG=MI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m4N5T-0002Fo-68
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 12:37:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c08a77b8-8ab5-43b4-8792-d5dc012a85b9;
 Fri, 16 Jul 2021 12:37:01 +0000 (UTC)
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
X-Inumbo-ID: c08a77b8-8ab5-43b4-8792-d5dc012a85b9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626439021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z+/E6MCLpy5a3yCLkRvyZ0t5Qd4p7eurbh5yAHfm6dA=;
  b=CzGVV3fIwpcsDOvccVffVIJDibyd7ymx7UbxcWD5CUKnFen2UH5z+Juc
   FJJy7XUjBquaT2i/MSASRI2cDFghcsW5TiTJ2hotXTeWi4MBI5Rh6TdZU
   YoR86uu2inl01R8kphIkx5EfyVl4a4kWV/TGbLyUVOl9mEhrjlVP3I/01
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QwcBnXXBY8wO2zbLFvcaOJFNqoN9N7neiqK3VvEBXQ1WRjK9piskC/0UbO0SouvEDGe1SzqANv
 rcqHti11lryfxAt7lOj6EAfWgMEJOW8hOMQBc0pRP+R4dmJ/iTQ9JUkUg7kkcAW4vBou00q1dr
 ieDP8JpVzTPqKOZJZonJdb76F4KuXJyvA4U55R6uXJ4WeBwmdAgQ0BCTXPdIsWjF0YbE/G5mF+
 rh08MHa+Tp5O29d+bvlOU8sbeZDTj7dyhQVnvr57Bjtj5gzxxTOz0di6NXW3U7Tadhsg8BJGwt
 xd8=
X-SBRS: 5.1
X-MesageID: 48435439
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3WhGWaFLj1LDTNKOpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-IronPort-AV: E=Sophos;i="5.84,244,1620705600"; 
   d="scan'208";a="48435439"
Date: Fri, 16 Jul 2021 13:36:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Message-ID: <YPF9ab0Ia3U0oFWv@perard>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <be712d94-7fac-fc34-3f61-61819c5cbc42@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be712d94-7fac-fc34-3f61-61819c5cbc42@suse.com>

On Thu, Jul 15, 2021 at 08:25:31AM +0200, Jan Beulich wrote:
> On 14.07.2021 18:17, Anthony PERARD wrote:
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -25,6 +25,9 @@ config GRANT_TABLE
> >  config HAS_ALTERNATIVE
> >  	bool
> >  
> > +config HAS_CHECKPOLICY
> > +	def_bool $(success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
> > +
> 
> This is no different from other aspects of "Kconfig vs tool chain
> capabilities" sent out last August to start a discussion about
> whether we really want such. Besides Jürgen no-one cared to reply
> iirc, which to me means no-one really cares one way or the other.
> Which I didn't think was the case ... So here we are again, with
> all the same questions still open.

It's true, I don't really care either way. But with maybe a slight
preference for testing the environment every time `make` is run. But
there weren't really a precedent for testing in Makefile and using the
result in Kconfig (or I don't think there is).

> I'm not going to nack the patch, because there's an immediate
> purpose / need, but I also can't avoid commenting (and I won't
> put my name on it in any positive way, i.e. also not as a
> committer; if anything then to record my reservations).

I've prepared an update which test in Makefile, which I hope you'll like
better.

Thanks,

-- 
Anthony PERARD

