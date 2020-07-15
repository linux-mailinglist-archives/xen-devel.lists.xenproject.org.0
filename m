Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6831220E34
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 15:33:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvhWM-0002hs-89; Wed, 15 Jul 2020 13:32:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvhWK-0002hn-Rf
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 13:32:24 +0000
X-Inumbo-ID: 9d76f3e6-c69f-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d76f3e6-c69f-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594819944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XxZF1lQLVaj+iOEvxrgNcgapri9fOtFZTq6pex1n/ek=;
 b=iikROLQjzIDybMHYeq4D+B4d8Fw81gah/GUhnefO7KSZDQot4AU8rhEB
 tRKbiUl9TRGV5RSasyUP0XrrQHoMcYnrDf0evoQXx3vz9vpPd5KJiA8L7
 a+9wX0QXRXTfQ0pCpPtPpjNosAXgGg11r0sVK+tiR0ABxFk9P5ZBZ3Hn7 Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PXo8abT0JRIxGXqYuhOP3KYoEMNinXjxLJDHexb8tzyRu5HoFBEYgg1x2wuCHspLNfver4FMWk
 s/j5Tk2ox3JSvjh3opu6Hb+yUD6lhFyayrrj03kDH3RobhvmpO0RkmxyhqnqoVDSCwissXGNty
 zu2h8O8R5b5ApfFWTDrZR588lbtItKQ44yRWA8jWq/UXBuPax4AMSr6lBNMZ1TzR1EY1WY8Y+q
 ooV2+DI5sZHtmlD7ot4lhASgokJh1Cuk5M0aXC3U3YY+KU3PTevMw5L/Yz8PuChuSAzV9ith/D
 ix8=
X-SBRS: 2.7
X-MesageID: 22429765
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22429765"
Date: Wed, 15 Jul 2020 15:32:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
Message-ID: <20200715133217.GZ7191@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
 <20200715121347.GY7191@Air-de-Roger>
 <2b9de0fd-5973-ed66-868c-ffadca83edf3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b9de0fd-5973-ed66-868c-ffadca83edf3@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Wed, Jul 15, 2020 at 02:36:49PM +0200, Jan Beulich wrote:
> On 15.07.2020 14:13, Roger Pau Monné wrote:
> > On Wed, Jul 15, 2020 at 01:56:47PM +0200, Jan Beulich wrote:
> >> @@ -1160,6 +1162,14 @@ void rtc_guest_write(unsigned int port,
> >>      case RTC_PORT(1):
> >>          if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
> >>              break;
> >> +
> >> +        spin_lock_irqsave(&rtc_lock, flags);
> >> +        hook = pv_rtc_handler;
> >> +        spin_unlock_irqrestore(&rtc_lock, flags);
> > 
> > Given that clearing the pv_rtc_handler variable in handle_rtc_once is
> > not done while holding the rtc_lock, I'm not sure there's much point
> > in holding the lock here, ie: just doing something like:
> > 
> > hook = pv_rtc_handler;
> > if ( hook )
> >     hook(currd->arch.cmos_idx & 0x7f, data);
> > 
> > Should be as safe as what you do.
> 
> No, the compiler is free to eliminate the local variable and read
> the global one twice (and it may change contents in between) then.
> I could use ACCESS_ONCE() or read_atomic() here, but then it would
> become quite clear that at the same time ...
> 
> > We also assume that setting pv_rtc_handler to NULL is an atomic
> > operation.
> 
> ... this (which isn't different from what we do elsewhere, and we
> really can't fix everything at the same time) ought to also become
> ACCESS_ONCE() (or write_atomic()).
> 
> A compromise might be to use barrier() in place of the locking for
> now ...

Oh, right. Didn't realize you did it in order to prevent
optimizations. Using the lock seems also quite weird IMO, so I'm not
sure it's much better than just using ACCESS_ONCE (or a barrier).
Anyway, I don't want to delay this any longer, so:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Feel free to change to ACCESS_ONCE or barrier if you think it's
clearer.

Thanks.

