Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D2764F1F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 11:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570971.893652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOx6Q-0006qM-IK; Thu, 27 Jul 2023 09:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570971.893652; Thu, 27 Jul 2023 09:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOx6Q-0006nU-EP; Thu, 27 Jul 2023 09:16:10 +0000
Received: by outflank-mailman (input) for mailman id 570971;
 Thu, 27 Jul 2023 09:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qOx6P-0006nD-R0
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 09:16:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35d13b47-2c5e-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 11:16:05 +0200 (CEST)
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
X-Inumbo-ID: 35d13b47-2c5e-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690449365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=btc558rjz9ZQrySV2UKToDcsFfhkolEBCXRy8DW+EXU=;
  b=AdXreoqK3lxtp9JYxV/lr1vRBD/Kr1OdqQVEDEH7sYnS1zKepifz8iY6
   n25XldulGLeGiWIzultvZk/SIAyTF8P0LwzTPrO6Bq8albGzUrBiHL9PB
   FNwTPDBlgWb7Eq7gRXgWDQ8HyRDVDam+Te0MjffyUW+ZSD5XBhYYUg7m5
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116312952
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:n2P0jqJOnQugFi9DFE+RAJUlxSXFcZb7ZxGr2PjKsXjdYENS3mAFm
 mAeWGuHO/2CZ2f3eo8ibYy29BtX6JTXzdRhSQRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZhPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5tKm5kq
 PUmEgxSZw+KpcCJkO2rELZz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJsOxxzJ+
 ziuE2LRQQAoC9mZ0za/wHO8uujQzB7afaxILejtnhJtqALKnTFCYPEMbnO5q/Skjk+1W/pEN
 lcZvCEpqMAa9kWtQsPsQh6Qr3uNvxpaUN1Ve8U49QWMx6z88wufQG8eQVZpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq16bO8vT60fy8PIgcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxAA3n7gJhNQH/7m691vAxTmro/D0ohUdv1uNGDj/t0UgOdDjPtbzgbTG0RpeBJyyQXPct
 UY+p5eX8+ksL67dyzzXH/pYSdlF+M253C3gbU9HRsdwr2/8oC77Iei88xkleh43b59slSvBJ
 RaK5FgPvMI70G6CN/cfXm6nNyg9IUEM//zBX+ucUNdBa4MZmOSvrHA3Ph74M4wAfSERfUAD1
 XSzK5zE4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+ZdawrQNL9ot/vbyOkwz
 zq5H5HUo/m4eLSgChQ7DKZJdQxaRZTFLc6eRzNrmh6rfVM9RTBJ5w75yrI9YY1195m5Zc+Rl
 kxRrnRwkQKl7VWecFXiV5yWQO+3NXqJhS5hbHNE0JfB8yRLXLtDG49GKMBsIOh4rLc4pRO2J
 tFcE/i97j10Ymyv01wggVPV9eSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:FNrn+6yhh3TK8eZ3XRgRKrPxU+skLtp133Aq2lEZdPWaSL3iqy
 nOpoVr6faQslwssR4b6La90cW7MArhHNtOkPQs1NSZLXfbURWTXftfBOLZqlWKJ8S9zJ8g6U
 4KSdkANDSfNykDsS842mWFOudl7t+A/qWlwc/a1HtkQBEvQ7pr7gdnBgvzKCxLbTgDK5w+Gp
 +RouJDvDapdGRSRt+wB3kbU+WGicbMiIujQRNuPX4aAcu14A+A2frVFR6X2xtbfjVEhZcumF
 K18DDR1+GMtfe0zxOZ82PI9ZxZlJ/c0d4rPr3otiHYEFrRozftSoJmVbiP+A01u+2m5RILnb
 D30nUdFvU2xXXWcGS45SbtwAXp3XIT8HqK8y79vVLT5eL+Qjw+B45+iYkcWB7Y50081esMt5
 6jFlj2i6Zq
X-Talos-CUID: =?us-ascii?q?9a23=3AhvK/0Gmm35Kr+oZ45a6ihseKjWXXOWf2w12NKnG?=
 =?us-ascii?q?CNTlgV7S3a2DAp7M+zNU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A7kLfPgzxWoQoZ3TWJ9NkXiyzZs6aqOe/On8Il48?=
 =?us-ascii?q?KgfuFJRB3JGagrRGZGLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,234,1684814400"; 
   d="scan'208";a="116312952"
Date: Thu, 27 Jul 2023 10:15:53 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2 4/5] build: evaluate XEN_BUILD_* and XEN_DOMAIN on
 first use
Message-ID: <b74752d6-54b2-4dd1-88a9-c23ceb014e56@perard>
References: <20230622153005.31604-1-anthony.perard@citrix.com>
 <20230622153005.31604-5-anthony.perard@citrix.com>
 <edc3f2b5-8722-7f11-f759-b87d71a840ef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <edc3f2b5-8722-7f11-f759-b87d71a840ef@suse.com>

On Fri, Jun 23, 2023 at 10:07:02AM +0200, Jan Beulich wrote:
> On 22.06.2023 17:30, Anthony PERARD wrote:
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -11,10 +11,10 @@ export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
> >  -include xen-version
> >  
> >  export XEN_WHOAMI	?= $(USER)
> > -export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
> > -export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
> > -export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
> > -export XEN_BUILD_HOST	?= $(shell hostname)
> > +export XEN_DOMAIN	?= $(eval XEN_DOMAIN := $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown])))$(XEN_DOMAIN)
> > +export XEN_BUILD_DATE	?= $(eval XEN_BUILD_DATE := $(shell LC_ALL=C date))$(XEN_BUILD_DATE)
> > +export XEN_BUILD_TIME	?= $(eval XEN_BUILD_TIME := $(shell LC_ALL=C date +%T))$(XEN_BUILD_TIME)
> > +export XEN_BUILD_HOST	?= $(eval XEN_BUILD_HOST := $(shell hostname))$(XEN_BUILD_HOST)
> 
> Interesting approach. It looks like it should be independent of make's
> internal workings, but I still wonder: Is this documented somewhere,
> so we won't be caught by surprise of it not working anymore because of
> some change to make's internals?

So, this is a makefile trick that I've seen on someone's blog post.

But I tried to find evidence in the GNU make manual if variable expansion is
expected to work like that, and I can't. So I can imagine one day make
doing expansion of variable in parallel, or were the result of the eval
would happen only on the next line. So I don't know if this approach is
always going to work.

Maybe we could go for a safer alternative:

Simply replacing ?= by something actually documented in the manual, and
then replacing = by := .

    ifeq ($(origin XEN_BUILD_DATE), undefined)
    export XEN_BUILD_DATE := $(shell LC_ALL=C date)
    endif

An alternative, with a macro could be:

    set-shell-if-undef = $(if $(filter undefined,$(origin $(1))),$(eval $(1) := $(shell $(2))))

    $(call set-shell-if-undef,XEN_BUILD_DATE,LC_ALL=C date)
    export XEN_BUILD_DATE

But this kind of hide that a shell command is been called. But having
$(shell) as parameter of call $(call) mean the shell command is always
called even when unneeded.

But then, with the macro, I'm not sure where to put it, to be able to
use it here and in Config.mk for the next patch, another file in
xen.git/config/*.mk ?

Should I replace all the eval with "ifeq (); endif" ?

Thanks,

-- 
Anthony PERARD

