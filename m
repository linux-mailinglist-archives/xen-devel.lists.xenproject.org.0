Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F92F30A8EB
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 14:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79887.145643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ZQM-0001QH-LZ; Mon, 01 Feb 2021 13:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79887.145643; Mon, 01 Feb 2021 13:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ZQM-0001Ps-IM; Mon, 01 Feb 2021 13:39:26 +0000
Received: by outflank-mailman (input) for mailman id 79887;
 Mon, 01 Feb 2021 13:39:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6ZQK-0001Pn-UZ
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 13:39:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69491309-3bb8-4c86-8196-14ef3dc5bfa0;
 Mon, 01 Feb 2021 13:39:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5860AB92;
 Mon,  1 Feb 2021 13:39:22 +0000 (UTC)
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
X-Inumbo-ID: 69491309-3bb8-4c86-8196-14ef3dc5bfa0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612186763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUY99SqnKBeXZzlYj2VlDDRXfhI6LC4XP4ZRoVG/cIQ=;
	b=F7UdL39RVWKQ9o2wFgFCvRkLUTgi8ELiMLLjmjqk6e8BK7VoItatrXSE3sP0qvr8x0XqMd
	1Gy/W4aCvutMeNgVPhDsbJASIzEFas4MHqjK4UaL8ugA6fp1uctfZutWFOPq+xHT4TtJrl
	BEbOsPn+NgYYN3AexyGmxzsz6gUOz7s=
Subject: Re: [PATCH for 4.16] xl: Add xl.conf-based dom0 autoballoon limits
To: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210129164858.3280477-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <606292ed-9083-d9a7-33e9-a02485cbbca0@suse.com>
Date: Mon, 1 Feb 2021 14:39:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129164858.3280477-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 17:48, George Dunlap wrote:
> When in "autoballoon" mode, xl will attempt to balloon dom0 down in
> order to free up memory to start a guest, based on the expected amount
> of memory reported by libxl.  Currently, this is limited in libxl with
> a hard-coded value of 128MiB, to prevent squeezing dom0 so hard that
> it OOMs.  On many systems, however, 128MiB is far too low a limit, and
> dom0 may crash anyway.
> 
> Furthermore, "autoballoon" mode, although strongly recommended
> against, must be the default mode for most distros: Having the memory
> available to Linux drop to 1GiB would be too much of an unexpected
> surprise for those not familiar with Xen.  This leads to a situation,
> however, where starting too many guests on a large-ish system can
> unexpectedly cause the system to slow down and crash with no warning,
> as xl squeezes dom0 until it OOMs.
> 
> Ideally what we want is to retain the "just works after install"
> functionality that we have now with respect to autoballooning, but
> prompts the admin to consider autoballooning issues once they've
> demonstrated that they intend to use a significant percentage of the
> host memory to start guests, and also allow knowledgable users the
> flexibility to configure the system as they see fit.
> 
> To do this, introduce two new xl.conf-based dom0 autoballoon limits:
> autoballoon_dom0_min_memmb, and autoballoon_dom0_min_mempct.
> 
> When parsing xl.conf, xl will always calculate a minimum value for
> dom0 target.  If autoballoon_dom0_min_memmb is set, it will just use
> that; if that is not set and _min_mempct is set, it will calculate the
> minimum target based on a percentage of host memory.  If neither is
> set, it will default to 25% of host memory.
> 
> Add a more useful error message when autoballoon fails due to missing
> the target.  Additionally, if the autoballoon target was automatic,
> post an additional message prompting the admin to consider autoballoon
> explicitly.  Hopefully this will balance things working out of the box
> (and make it possible for advanced users to configure their systems as
> they wish), yet prompt admins to explore further when it's
> appropriate.
> 
> NB that there's a race in the resulting code between
> libxl_get_memory_target() and libxl_set_memory_target(); but there was
> already a race between the latter and libxl_get_free_memory() anyway;
> this doesn't really make the situation worse.
> 
> While here, reduce the scope of the free_memkb variable, which isn't
> used outside the do{} loop in freemem().
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

I'm not convinced it is the tool stack to set a lower limit here.
Imo the kernel should guard itself from too aggressive ballooning.
In fact, the old XenoLinux driver did, as of
https://xenbits.xen.org/hg/linux-2.6.18-xen.hg/rev/b61443b1bf76,
which in our forward ports we then extended to have exposure in
/proc and /sys, alongside an upper limit (for purely informational
purposes iirc).

Jan

