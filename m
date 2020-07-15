Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C743220FE6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 16:52:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvilL-0001dj-Gu; Wed, 15 Jul 2020 14:51:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvilJ-0001de-NU
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 14:51:57 +0000
X-Inumbo-ID: b9cfe394-c6aa-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9cfe394-c6aa-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594824716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V9kxh95A7KNWJvFvSiPuEvHRhmMVhybG14SBrb4QY+E=;
 b=EIVyseaYNLTMjGKi7B4bXp5wvzfV9PtV2NZlWaPXeqoe8RuGwz3jq7Uh
 HVa/Bp6RMETHU1Lz+51juj7+UuE0CEQqKLHy2GgapUe+T5SBD8oc6CAKv
 5EtbOuLWr/pYGSYwhIqeUbjVHp+osvW1Vbg2LkvGLP5+dxwi4aGsjnPL9 s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: f1sF7yFgansxJzTdNSfXVLpbKRJOxUUfXhqwzcRT1UUeoMqh5ONM+bti1/z7HeNB2mKLtOfNgc
 /1L4DlYsmLCrNwEcPZVKUeHbv3lL4eXZYTc6U85X5nsjvNmPMVflVG5snfjeTclJ3JcUz0O0Da
 6bKy7af6HyRYQEPbBbYZc8OlICyCRx6GixQJg5CYtyLP6zoUAYr/mBNu+BS4MBetmfmrwGmQL7
 o7JTOYPmqaeSAt7SwObxy8fd5iiIBeGy5a5UJZMoD7wwbN4jMVb4sM51Q03ZzrtlEAWQZRLxFT
 9Xs=
X-SBRS: 2.7
X-MesageID: 22761476
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22761476"
Date: Wed, 15 Jul 2020 16:51:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
Message-ID: <20200715145144.GA7191@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
 <20200715121347.GY7191@Air-de-Roger>
 <2b9de0fd-5973-ed66-868c-ffadca83edf3@suse.com>
 <20200715133217.GZ7191@Air-de-Roger>
 <cd08f928-2be9-314b-56e6-bb414247caff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd08f928-2be9-314b-56e6-bb414247caff@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 03:51:17PM +0200, Jan Beulich wrote:
> On 15.07.2020 15:32, Roger Pau Monné wrote:
> > On Wed, Jul 15, 2020 at 02:36:49PM +0200, Jan Beulich wrote:
> >> On 15.07.2020 14:13, Roger Pau Monné wrote:
> >>> On Wed, Jul 15, 2020 at 01:56:47PM +0200, Jan Beulich wrote:
> >>>> @@ -1160,6 +1162,14 @@ void rtc_guest_write(unsigned int port,
> >>>>      case RTC_PORT(1):
> >>>>          if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
> >>>>              break;
> >>>> +
> >>>> +        spin_lock_irqsave(&rtc_lock, flags);
> >>>> +        hook = pv_rtc_handler;
> >>>> +        spin_unlock_irqrestore(&rtc_lock, flags);
> >>>
> >>> Given that clearing the pv_rtc_handler variable in handle_rtc_once is
> >>> not done while holding the rtc_lock, I'm not sure there's much point
> >>> in holding the lock here, ie: just doing something like:
> >>>
> >>> hook = pv_rtc_handler;
> >>> if ( hook )
> >>>     hook(currd->arch.cmos_idx & 0x7f, data);
> >>>
> >>> Should be as safe as what you do.
> >>
> >> No, the compiler is free to eliminate the local variable and read
> >> the global one twice (and it may change contents in between) then.
> >> I could use ACCESS_ONCE() or read_atomic() here, but then it would
> >> become quite clear that at the same time ...
> >>
> >>> We also assume that setting pv_rtc_handler to NULL is an atomic
> >>> operation.
> >>
> >> ... this (which isn't different from what we do elsewhere, and we
> >> really can't fix everything at the same time) ought to also become
> >> ACCESS_ONCE() (or write_atomic()).
> >>
> >> A compromise might be to use barrier() in place of the locking for
> >> now ...
> > 
> > Oh, right. Didn't realize you did it in order to prevent
> > optimizations. Using the lock seems also quite weird IMO, so I'm not
> > sure it's much better than just using ACCESS_ONCE (or a barrier).
> > Anyway, I don't want to delay this any longer, so:
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > Feel free to change to ACCESS_ONCE or barrier if you think it's
> > clearer.
> 
> I did so (also on the writer side), not the least based on guessing
> what Andrew would presumably have preferred.

Thanks! Sorry I might be pedantic, but is the ACCESS_ONCE on the write
side actually required? I'm not sure I see what ACCESS_ONCE protects
against in handle_rtc_once.

Roger.

