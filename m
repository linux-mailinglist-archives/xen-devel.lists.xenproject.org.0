Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144903C5EA1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 16:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154593.285631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2xK8-0001np-85; Mon, 12 Jul 2021 14:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154593.285631; Mon, 12 Jul 2021 14:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2xK8-0001lL-5B; Mon, 12 Jul 2021 14:54:20 +0000
Received: by outflank-mailman (input) for mailman id 154593;
 Mon, 12 Jul 2021 14:54:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKSD=ME=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m2xK7-0001lF-EG
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 14:54:19 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08401b6e-e321-11eb-86ef-12813bfff9fa;
 Mon, 12 Jul 2021 14:54:18 +0000 (UTC)
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
X-Inumbo-ID: 08401b6e-e321-11eb-86ef-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626101657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mlp4vXboFWNjT2ndWvNd8eo+Kao87TBHZbzIe22ZgyM=;
  b=LTgo4HQKRNW4H/45+PQT+W+vBAh6VOztLEBTk+6Sv37eabUc1n0gI77/
   wzn3qtqmzDx9143poXpKNKTG8bzS4Kjk9cime7RCCJIx1AH/UuYmZ4Khp
   uJOpIlz02gMjgKZdPjXZOZHkrxqu/REkNoBDTd9hCfarfZZbja4jch9Q4
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JPB299ONwkUGzCZHFfcalILyp5qTFYkS6lFBvF5YknLdZuFQVr86u+fydN373RQu/gdXrMXd9c
 HTrAiKKLGq4RLi2mfJRj8vTjFmZl0gT59RJ7kTItM6nE99wOEvLfnbKPmBKKMivCFusw+Dharj
 rThOX5JG1lILA7A7RnrhS75FzJfrkKz5BEcgAhF/5A4S+VfRZJuOntVJRFstvW7QJ01vLooZmQ
 g7E6ZiumAWq5wOdsdatkYfAeMUF+UuHyLvVd3k/3vl2KBbbJKsxnhl3180DXbyNJLWQvGhCuGQ
 xG4=
X-SBRS: 5.1
X-MesageID: 47773444
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BcS2Y6Oi7cX4A8BcTsOjsMiBIKoaSvp037Eqv3oRdfVwSL3+qy
 nOpoV+6faaslossR0b9uxofZPwJ080lqQFhLX5X43SPzUO0VHAROoJgLcKgQeQeREWntQtrJ
 uIGJIfNDSfNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.84,234,1620705600"; 
   d="scan'208";a="47773444"
Date: Mon, 12 Jul 2021 15:54:14 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 11/31] build: fix clean targets when subdir-y is
 used
Message-ID: <YOxXljEDXDTWpD1H@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-12-anthony.perard@citrix.com>
 <ecdf93e1-ad03-9257-4d97-a1532878b873@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ecdf93e1-ad03-9257-4d97-a1532878b873@suse.com>

On Wed, Jul 07, 2021 at 05:15:44PM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> > The make variable $(subdir-y) isn't used yet but will be in a
> > following patch. Anything in $(subdir-y) doesn't to have a '/' as
> > suffix as we already now it's a directory.
> > 
> > Rework the rules so that it doesn't matter whether there is a '/' or
> > not. It also mimic more closely to the way Linux's Kbuild descend in
> > subdirectories.
> > 
> > FORCE phony target isn't needed anymore running clean, so it can be
> > removed.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> > --- a/xen/scripts/Makefile.clean
> > +++ b/xen/scripts/Makefile.clean
> > @@ -12,19 +12,18 @@ include Makefile
> >  # Figure out what we need to clean from the various variables
> >  # ==========================================================================
> >  subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
> > -              $(filter %/, $(obj-y) $(obj-n) $(obj-))
> > +              $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
> 
> Isn't this a normalization which also wants doing in xen/Rules.mk for
> subdir-y? Or perhaps this is part of one of the subsequent patches
> already?

Indeed, a similar change is done as part of
    build: build everything from the root dir, use obj=$subdir

Cheers,

-- 
Anthony PERARD

