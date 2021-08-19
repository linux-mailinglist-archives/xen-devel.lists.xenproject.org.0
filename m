Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF5E3F1DBC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 18:23:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168938.308522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkpK-00051w-Lf; Thu, 19 Aug 2021 16:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168938.308522; Thu, 19 Aug 2021 16:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkpK-0004yz-IY; Thu, 19 Aug 2021 16:23:34 +0000
Received: by outflank-mailman (input) for mailman id 168938;
 Thu, 19 Aug 2021 16:23:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGkpI-0004yt-Oj
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:23:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGkpI-000437-M1
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:23:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGkpI-0003CQ-L8
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:23:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGkpC-0002G5-Bb; Thu, 19 Aug 2021 17:23:26 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=YtbXuxtd66ZnTRRJEQTJ9b17GWXGF66DJtQgoOMIPFo=; b=rTZKjJaOKm2/robHVx2BrVrYJt
	yCA/URy90LCz64x+3XoVlK7yYdlMxmkJakyfq5RuYrIGLABxcZuKOdfixPGPM95fOZ8LDxMhxuIMm
	QssZ6fDa63fQitGP6F/v+Xveo1/xNETu4BToc7hS5oUv/YESe9L90UJ9pOGdIQr74ozE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.34174.101215.640300@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 17:23:26 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Olaf Hering <olaf@aepfle.de>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    "Julien  Grall" <julien@xen.org>
Subject: QEMU 6.0+ in 4.15 and 4.14 (Re: preparations for 4.15.1 and 4.13.4)
In-Reply-To: <YO/5lPNSjjY0NQZx@perard>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
	<YO/5lPNSjjY0NQZx@perard>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("Re: preparations for 4.15.1 and 4.13.4"):
> Can we backport support of QEMU 6.0 to Xen 4.15? I'm pretty sure
> distributions are going to want to use the latest QEMU and latest Xen,
> without needed to build two different QEMU binaries.

I think this is appropriate.  Xen 4.15 is still now, and there was an
unfortunate interaction between release dates.  Your argument makes
sense.

> [XEN PATCH v2 0/8] Fix libxl with QEMU 6.0 + remove some more deprecated usages.
> <20210511092810.13759-1-anthony.perard@citrix.com>
> Commits: d5f54009db^..fe6630ddc4
> 
> Some more QEMU 6.0 fixes
> <20210628100157.5010-1-anthony.perard@citrix.com>
> Commits: 217eef30f7  3bc3be978f

So I have queued all these.

> Also, Olaf want them to be backported to 4.14, see
>     <20210629095952.7b0b94c1.olaf@aepfle.de>

I'm unsure about this.  The diff seems moderately large.  Also, are we
sure that it wouldn't break anything other than very old qemu ?  OTOH
compat problems with newer qemu are indeed a problem especially for
distros.

I'm currently leaning towards "no" but I am very open to being
convinced this is a good idea.

Ian.

