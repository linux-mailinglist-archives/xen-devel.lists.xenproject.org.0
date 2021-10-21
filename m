Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91184363D1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 16:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214452.373000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYmc-0001GZ-Cn; Thu, 21 Oct 2021 14:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214452.373000; Thu, 21 Oct 2021 14:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYmc-0001EV-9U; Thu, 21 Oct 2021 14:11:02 +0000
Received: by outflank-mailman (input) for mailman id 214452;
 Thu, 21 Oct 2021 14:11:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JnKy=PJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mdYma-0001EP-MI
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 14:11:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b71dad9e-3278-11ec-8379-12813bfff9fa;
 Thu, 21 Oct 2021 14:10:59 +0000 (UTC)
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
X-Inumbo-ID: b71dad9e-3278-11ec-8379-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634825459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=45N65VZQcxPM9cickRp478SlWsWzibHoassEhe4ILUk=;
  b=TUwmE4FsdLUw3Q7win9/7Eb/LBOYV8xjqWHsBmF08wY4czPRca82gKMu
   XeWpmYNgSS3tgpZwHJ3i6x4K+0Xp6m84eYGAbzww9qV0Rbtoace07AhBR
   NXqhtV0vDydbCM+Op//5jNr5nVl2FSI87Zg2LfKhzwyfCF+SNbo9e7Vdh
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uIbS3Rzip1lnZpIpauQUlkpcOoON0FVDl+Q8GjGt+CBbmwAhvUr4PWOklYpn1qfwBZPaB9SQyC
 /bgw461+gdc6N6H0I8BVlx2O9q+qs96VvDiOeZSd1BrrDAlGH4MybNJ826HPmripTDNuqWaOWF
 k4ArbRld+oY7/ljtPh8fCXsQMTk9I04jWbQezOyDLTlARRddcZ9+AwsbS2yrz0pxCYq0adFtvG
 BT4mSKZOdCJot1Qhnaaf5BfnuoK+I/o2vZ3nZLxsoasvtIVRm7/k86mh7HgP5Fp7LwpAqZNPC3
 PpvXyn6UBxVlDOQaLLPyLEA5
X-SBRS: 5.1
X-MesageID: 57650170
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YN1gbKKENJtPx//DFE+R1pMlxSXFcZb7ZxGr2PjKsXjdYENS32QOy
 mseW2yOaa2NYGr8ft93YN++8UxVscXSx9NgSVFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5wrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3TgPcuz
 9wO7KCWUAQqNJ/KyLQhUkdHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gpv2J0WRKmGD
 yYfQRVeLy7HSQVAA2dNWL8ysryCp1PjVyIN/Tp5ooJoujOOnWSdyoPFM93TYNWGA9pUmkWwo
 XjP9GD0RBodMbS39z2B9X69g/7VqgnyUokSCb6Q++ZjhRuYwWl7IBEZWVa0u/CRll+1W9UZL
 VcdvCUps8Aa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAIViVEacAmnMYuSCY2y
 0SSmNf0GT1otqbTQnWYnp+LqRuiNC5TKnUNDQcGQhEC+MLLu5wog1TESdMLOKy/g8DxGDrw6
 yuXtyV4jLIW5eYKyKeT7V3BmyirpJXCUkgy/Aq/dnm+8gpzaYqhZoqpwVvW9/BNKMCeVFbpl
 HoZn8mT6sgeAJfLkzaCKNjhB5nwuazDameFxwcyQd9xrFxB5kJPY6gK/xYhI04qa/oiYDzqa
 n3V6VNt5cFMaS7CgbBMX6q9DMEjzK7FHNvjV+zJYtcmXqWdZDNr7wk1OhbOhzGFfFwE1PhlY
 8/CIJnE4WMyUPw/lFKLq/EhPajHL8zU7VjYQozn1FyZ2L6aaW/9pVwtYQbWML5RAE9ppmzoH
 zdj2ymil0o3vA7WOHC/HWsvwbYidyVT6Xfe8JQ/SwJ7ClA6cFzN8teIqV/bR6Rrnr5OisDD9
 WynV0lTxTLX3COcdVrXNyw7N+ywBv6TSE7X2wR2YD5EPFB4Oe6SAFo3LcNrLdHLCsQypRKLc
 xX1U5rZWakeItg20z8ccYP8vORfmOeD3mqz096eSGFnJfZIHlWRkve9J1eH3HReX0Kf6Jply
 5X9h1yzfHb2b1k7ZCogQKn0lA3ZULl0sL8aYnYk1fEJJR62r9Qzenev5hL1SulVQSj+KvKh/
 17+KX8lSSPl/ufZKfHF2vKJqZmHCex7EhYIFmXX9+/uZyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64csQax2ya8e5sf0o+MIxApTA3iWPU+gDaltIyfa0JAX5LFN3LJQpSC/R
 lmLpotBIbyMNc68SAwRKQMpY/6tz/YRnjWOv/05LF+jvH18/aadUFUUNB6J0XQPILxwOYIj4
 OEgpM9JtFDv1kt0ao6L13kG+X6NI3oMV7QcmqsbWIK72BA2zlxiYIDHDnOk6p+4dNgRYFIhJ
 SWZhfSeiu0ElFbCaXc6CVPEwfFZ2cYVoBlPwVIPewaJl97CiqNl1RFd621qHAFczxEB2ONvI
 Gl7cUZyIPzWrTtvgcFCWUGqGh1AW0LFqhCglQNRmT2LVVSsW0zMMHY5aLSE800u+m5BeiRWo
 eODw2H/XDe2JMz800Peg6K+RyAPmTCpyjD/pQ==
IronPort-HdrOrdr: A9a23:x3LgD6tOC1dYlDSvdg1TbYyi7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.87,170,1631592000"; 
   d="scan'208";a="57650170"
Date: Thu, 21 Oct 2021 15:10:35 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the
 xen build
Message-ID: <YXF02ztUiXXiRwxQ@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
 <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com>
 <YWmzSkLdH5wtQ77V@perard>
 <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com>
 <YW1Dhn+oEwvKgj04@perard>
 <70b8f320-bcd8-b864-f9de-a7ea35d53928@suse.com>
 <5a4df707-5b12-a471-e957-1a1c43340bff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5a4df707-5b12-a471-e957-1a1c43340bff@suse.com>

On Mon, Oct 18, 2021 at 12:36:45PM +0200, Jan Beulich wrote:
> On 18.10.2021 12:28, Juergen Gross wrote:
> > On 18.10.21 11:51, Anthony PERARD wrote:
> >> On Mon, Oct 18, 2021 at 11:02:20AM +0200, Jan Beulich wrote:
> >>> Oh, now I'm curious as to the why here. I thought use of $(srctree)
> >>> ought to be the exception.
> >>
> >> In Linux, the use of $(srctree) is indeed the exception. This is because
> >> we have VPATH=$(srctree), so when `make` look for a prerequisite or a
> >> target it will look first in the current directory and then in
> >> $(srctree). That works fine as long as the source tree only have sources
> >> and no built files.
> >>
> >> But if we want to be able to build the pv-shim without the linkfarm and
> >> thus using out-of-tree build, we are going to need the ability to build
> >> from a non-clean source tree. I don't think another way is possible.
> > 
> > Is there any reason (apart from historical ones) to build the hypervisor
> > in $(srctree)?
> > 
> > I could see several advantages to build it in another directory as soon
> > as the build system has this capability:
> > 
> > - possibility to have a simple build target for building multiple archs
> >    (assuming the cross-tools are available), leading to probably less
> >    problems with breaking the build of "the other" architecture we are
> >    normally not working with (and in future with e.g. Risc-V being added
> >    this will be even more important)
> > 
> > - possibility to have a debug and a non-debug build in parallel (in fact
> >    at least at SUSE we are working around that by building those with an
> >    intermediate "make clean" for being able to package both variants)
> > 
> > - make clean for the hypervisor part would be just a "rm -r"
> 
> I fully agree, yet ...
> 
> > Yes, this would require us (the developers) to maybe change some habits,
> > but I think this would be better than working around the issues by
> > adding $(srctree) all over the build system.
> 
> ... developers' habits would only be my second concern here (and if that
> had been the only one, then I would not see this as a reason speaking
> against the change, but as said I've never been building from the root,
> and I've also been building sort of out-of-tree all the time). Yet while
> writing this reply I came to realize that my primary concern was wrong:
> People would not need to adjust their spec files (or alike), at least
> not as long as they consume only files living under dist/.
> 
> So, Anthony - thoughts about making the default in-tree Xen build
> actually build into, say, build/xen/?

I don't think I should be the one answering this question. It would
probably be fairly easy to do.

But, I've already got some unfinished patches which add the ability to
do in-tree and out-of-tree at the same time, so I'll propose them and we
can decide whether they are worth it or if they are too much. That is,
after we have at least the ability to do out-of-tree build.

Cheers,

-- 
Anthony PERARD

