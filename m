Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6CB6A69DA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503920.776332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIr6-0003Qf-WA; Wed, 01 Mar 2023 09:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503920.776332; Wed, 01 Mar 2023 09:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIr6-0003O6-Sm; Wed, 01 Mar 2023 09:34:36 +0000
Received: by outflank-mailman (input) for mailman id 503920;
 Wed, 01 Mar 2023 09:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+deI=6Z=citrix.com=prvs=41760556e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pXIr5-0003O0-Fk
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:34:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45391394-b814-11ed-96a0-2f268f93b82a;
 Wed, 01 Mar 2023 10:34:34 +0100 (CET)
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
X-Inumbo-ID: 45391394-b814-11ed-96a0-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677663273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZIIN8U2JdP2J4jSKpbH0dD+3F1ihZCBbCdcFRnEBVWA=;
  b=DMRuDZ140B/mVTL+qLQbg6lUZ0Pa749ShDiOzeeD8N9y2NdEutPg0IfB
   21cMd0lZy8oURJKau3R9IVuTGJcc6t3iDnuUIj0LWbt0gshQm6ckmufqH
   gBZkeEJBI7JQu2z1hg3rhtNMEtDHE+N35CgWvDxw/UbG4rCplSrFqWT6t
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98990256
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:uNCbB6JKymPuqaAVFE+R5ZUlxSXFcZb7ZxGr2PjKsXjdYENS1TJUy
 2ZOX2mDO62PM2fwfdkiPY++8kpQ6pLVm99rGwplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QRnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5zBlpQy
 MYRFAsRY0uAu+GH+4u7W8VV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbFZQExhzF+
 Aoq+Uz/OUldbfiH5gOI2VKioe7KmnjJW4I7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxastRcGV91dO+Yz8g2Kx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmLSNRGiU7Lu8sTK4Mi9TJmgHDRLoViNcvYOl+ttqyEuSEJA6SvXdYsDJ9S/Yx
 zexshUEjokokcNQ1Jm4zGv+gyOAn82cJuIq3Tn/UmWg5wJ/QYeqYY209FTWhcp9wJalokqp5
 yZdxZXHhAwaJdTUzXHWHr1RdF28z6zdWAAwl2KDCHXIG96F33e4Nb5d7zhlTKuCGpZVIGS5C
 KM/VO442XOyAJdIRfUqC25SI55wpUQFKTgCfqG8Uza2SsItHDJrBQk3DaJq40jjkVI3jYY0M
 oqBfMCnAB4yUPo4k2TuFrxFje5wnUjSIF8/orihknyaPUe2PibJGd/pznPVBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07dDg3wYwALcmu8aR/L7fTSjeK7Ul9U5c9N5t9Id0690mU/8+Ul
 kyAtrhwkgeu2Caed1XbAp2hAZu2NatCQbsAFXREFT6VN7ILONfHAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:rJ7hgK9C7lDm3ch+Cs1uk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.98,224,1673931600"; 
   d="scan'208";a="98990256"
Date: Wed, 1 Mar 2023 09:34:20 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation: Rework archlinux container
Message-ID: <Y/8cHAV6L8sN+dDr@perard>
References: <20230228181649.51066-1-anthony.perard@citrix.com>
 <27e9e2bb-423c-8ad0-aaf0-351b756c6c40@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <27e9e2bb-423c-8ad0-aaf0-351b756c6c40@citrix.com>

On Tue, Feb 28, 2023 at 06:48:26PM +0000, Andrew Cooper wrote:
> On 28/02/2023 6:16 pm, Anthony PERARD wrote:
> > Base image "archlinux/base" isn't available anymore,
> >     https://lists.archlinux.org/pipermail/arch-dev-public/2020-November/030181.html
> >
> > But instead of switching to archlinux/archlinux, we will use the
> > official image from Docker. Main difference is that the first one is
> > updated daily while the second is updated weekly.
> >
> > Also, as we will install the packages from "base-devel" anyway, switch
> > to the "base-devel" tag.
> >
> > "dev86" package is now available from the main repo, no need for
> > multilib repo anymore.
> >
> > It is recommended to initialise local signing key used by pacman, so
> > let's do that.
> >
> > Replace "markdown" by "discount" as the former isn't available anymore
> > and has been replaced by the later.
> >
> > Also, clean pacman's cache.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, I've rebuild the container with my prototype:
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/791711467

I'll send a patch series for this prototype soon.

Cheers,

-- 
Anthony PERARD

