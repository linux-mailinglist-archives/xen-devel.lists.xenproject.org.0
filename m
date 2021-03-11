Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B763433734B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 14:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96513.182625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKKwv-0002mQ-Fv; Thu, 11 Mar 2021 13:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96513.182625; Thu, 11 Mar 2021 13:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKKwv-0002m0-CT; Thu, 11 Mar 2021 13:01:57 +0000
Received: by outflank-mailman (input) for mailman id 96513;
 Thu, 11 Mar 2021 13:01:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKKwt-0002lc-Ti
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 13:01:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4d77ad6-7fa4-4099-9559-6315289181ae;
 Thu, 11 Mar 2021 13:01:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49C5CAC16;
 Thu, 11 Mar 2021 13:01:54 +0000 (UTC)
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
X-Inumbo-ID: d4d77ad6-7fa4-4099-9559-6315289181ae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615467714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LX4kSJDVCVwQMzj45QZ8QAyUyw/ZVjuaoRQUn153FRQ=;
	b=hFs1/xKfAYxQj4/ok4wrrhekigK1xVHH88/97tpk66GnxDwItLvb8v/m3Bjn94IKOxBRUM
	gDt1ZKIrLY/rKcIDPtrf1Nz48CcnIfSEt5i8D2xQ/ugM8cNGdEwoqIxM+GzO1dRKJ+lZXv
	RuY7LaICRYo58mbG3nHaVjh6ffMODJg=
Subject: Re: [PATCH RFC] build: detect outdated configure outputs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210311114601.42460-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb3f5b7d-ad73-2cf7-6171-e4b66ce2e98a@suse.com>
Date: Thu, 11 Mar 2021 14:01:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311114601.42460-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.03.2021 12:46, Roger Pau Monne wrote:
> The Xen build system relies on configure to parse some .in files in
> order to do substitutions based on the data gathered from configure.
> 
> The main issue with those substitutions done at the configure level is
> that make is not able to detect when they go out of date because the
> .in file has been modified, and hence it's possible to end up in a
> situation where .in files have been modified but the build is using
> outdated ones. This is made even worse because the 'clean' targets
> don't remove the output of the .in parsing, so doing a typical `make
> clean && make` will still use the old files without complaining.
> Note that 'clean' not removing the output of the .in transformations
> is the right behavior, otherwise Xen would require re-executing the
> configure script after each clean.
> 
> Attempt to improve the situation by adding a global rule that spot the
> outdated files as long as they are properly listed as makefile target
> prerequisites.
> 
> Ultimately those substitutions should be part of the build phase, not
> the configure one.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> RFC because I'm not sure if there's some better way to handle this.
> Also I think we would want to make sure all the .in outputs are
> properly listed as target prerequisites, or else this won't work.
> 
> Also not sure whether this will break some other usage of .in files
> I'm not aware.

There are a number of such files in the tree which aren't used to
record configure results. Whether their existence could actually
case a problem with this approach I can't tell. Would it be
possible to ...

> --- a/Config.mk
> +++ b/Config.mk
> @@ -65,6 +65,10 @@ DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
>  %.d2: %.d
>  	sed "s!\(^\| \)$$PWD/! !" $^ >$@.tmp && mv -f $@.tmp $@
>  
> +# Make sure the configure generated files are up to date
> +%: %.in
> +	$(error $@ is outdated, please re-run configure)

... make this a static pattern rule for just the file names that
are actually processed / produced by configure? Of course it
wouldn't be very nice to have to keep in sync that list and what
the various configure.ac scripts list in AC_CONFIG_FILES() et al.
But not listing the targets explicitly would always risk the rule
to kick in for a file where it's not supposed to apply.

Jan

