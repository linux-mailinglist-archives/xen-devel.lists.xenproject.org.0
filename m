Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F72B3FF206
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 19:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177585.323110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLq8o-0006r3-Sx; Thu, 02 Sep 2021 17:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177585.323110; Thu, 02 Sep 2021 17:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLq8o-0006oU-Q3; Thu, 02 Sep 2021 17:04:42 +0000
Received: by outflank-mailman (input) for mailman id 177585;
 Thu, 02 Sep 2021 17:04:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLq8m-0006oO-Du
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 17:04:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLq8m-0001Du-Bo
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 17:04:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLq8m-0007tR-An
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 17:04:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mLq8h-0003Xd-Jy; Thu, 02 Sep 2021 18:04:35 +0100
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
	bh=EwrkcWG+KtHbspcp5DkvRxCnd1eWWHv+1cIErtfTVjg=; b=bDDDwbvXfOyL/MbBT9A/njs4zb
	em1e437Z8ewV8Lv6fGTbNJIZomyxOWXWYlm//NqfiS7MRZdRoeta/VN1GRMWGndWGkp+Ejq5SVvtT
	h5YmeOcJJ0DTtUGyR2/0eARjqYU+oV8vVR/yj7yjFffgKAyXKJUB0ro9395wQ1BLQ758=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24881.1059.344754.415908@mariner.uk.xensource.com>
Date: Thu, 2 Sep 2021 18:04:35 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Anthony Perard <anthony.perard@citrix.com>,
    Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 02/13] libxc: split xc_logdirty_control() from
 xc_shadow_control() [and 1 more messages]
In-Reply-To: <7284e7d0-99cc-e35d-2d44-46e7a3132498@suse.com>,
	<cb3b7a87-d480-d431-58a9-b47dab20d2ca@suse.com>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
	<4b68233b-259c-3308-3292-82e991e1e108@suse.com>
	<7284e7d0-99cc-e35d-2d44-46e7a3132498@suse.com>
	<eba44638-699e-36e4-afd5-5b78270baafa@suse.com>
	<cb3b7a87-d480-d431-58a9-b47dab20d2ca@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v2 02/13] libxc: split xc_logdirty_control() from xc_shadow_control()"):
> On 05.07.21 17:12, Jan Beulich wrote:
> >>> +long long xc_logdirty_control(xc_interface *xch,
> >>> +                              uint32_t domid,
> >>> +                              unsigned int sop,
> >>> +                              xc_hypercall_buffer_t *dirty_bitmap,
> >>> +                              unsigned long pages,
> >>> +                              unsigned int mode,
> >>> +                              xc_shadow_op_stats_t *stats)
> >>> +{
> >>> +    int rc;
> >>> +    struct xen_domctl domctl = {
> >>> +        .cmd         = XEN_DOMCTL_shadow_op,
> >>> +        .domain      = domid,
> >>> +        .u.shadow_op = {
> >>> +            .op    = sop,
> >>
> >> And same here the other way round: sop should really only be one of
> >> XEN_DOMCTL_SHADOW_OP_CLEAN or XEN_DOMCTL_SHADOW_OP_PEEK.
> >>
> >> With that fixed you can add my:
> >>
> >> Reviewed-by: Juergen Gross <jgross@suse.com>
> > 
> > Thanks, but I won't take this just yet, awaiting your (and maybe
> > others') view(s) on my reply above.
> 
> I'm not feeling really strong in this regard. Either way is fine for
> me.

OK.  My understanding then is that you are happy with Jan's patch and
he can add the Reviewed-by even though he's not checking the ops.
Is that right ?

If so, then Jan, please add my
Acked-by: Ian Jackson <iwj@xenproject.org>
along with Juergen's review.

If I have misunderstood please explain :-).

Thanks,
Ian.

