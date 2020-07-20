Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B77226D3F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 19:37:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxZjN-0007br-DE; Mon, 20 Jul 2020 17:37:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhL3=A7=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jxZjM-0007bi-89
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 17:37:36 +0000
X-Inumbo-ID: b228c418-caaf-11ea-84ac-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b228c418-caaf-11ea-84ac-bc764e2007e4;
 Mon, 20 Jul 2020 17:37:35 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jxZjJ-000ILK-Oo; Mon, 20 Jul 2020 17:37:33 +0000
Date: Mon, 20 Jul 2020 18:37:33 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 5/5] x86/shadow: l3table[] and gl3e[] are HVM only
Message-ID: <20200720173733.GA70485@deinos.phlegethon.org>
References: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
 <a3b9b496-e860-e657-2afc-c0658871fa3f@suse.com>
 <20200718182037.GA48915@deinos.phlegethon.org>
 <1baa0d50-86a4-b0ba-d43a-ad0c0446b54b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1baa0d50-86a4-b0ba-d43a-ad0c0446b54b@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 10:55 +0200 on 20 Jul (1595242521), Jan Beulich wrote:
> On 18.07.2020 20:20, Tim Deegan wrote:
> > At 12:00 +0200 on 15 Jul (1594814409), Jan Beulich wrote:
> >> ... by the very fact that they're 3-level specific, while PV always gets
> >> run in 4-level mode. This requires adding some seemingly redundant
> >> #ifdef-s - some of them will be possible to drop again once 2- and
> >> 3-level guest code doesn't get built anymore in !HVM configs, but I'm
> >> afraid there's still quite a bit of disentangling work to be done to
> >> make this possible.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Looks good.  It seems like the new code for '3-level non-HVM' in
> > guest-walks ought to have some sort of assert-unreachable in them too
> > - or is there a reason to to?
> 
> You mean this piece of code
> 
> +#elif !defined(CONFIG_HVM)
> +    (void)root_gfn;
> +    memset(gw, 0, sizeof(*gw));
> +    return false;
> +#else /* PAE */
> 
> If so - sure, ASSERT_UNREACHABLE() could be added there. It simply
> didn't occur to me. I take it your ack for the entire series holds
> here with this addition.

Yes, it does.  Thanks!

Tim.

