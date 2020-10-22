Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDA62959ED
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 10:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10249.27176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVgx-0002fn-Jr; Thu, 22 Oct 2020 08:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10249.27176; Thu, 22 Oct 2020 08:11:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVgx-0002fO-GE; Thu, 22 Oct 2020 08:11:23 +0000
Received: by outflank-mailman (input) for mailman id 10249;
 Thu, 22 Oct 2020 08:11:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVVgw-0002fJ-HS
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:11:22 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2352429f-5a1f-4088-a736-96698618b774;
 Thu, 22 Oct 2020 08:11:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVVgw-0002fJ-HS
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:11:22 +0000
X-Inumbo-ID: 2352429f-5a1f-4088-a736-96698618b774
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2352429f-5a1f-4088-a736-96698618b774;
	Thu, 22 Oct 2020 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603354281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8mZiS1O4rn+XJrW2/0Ahdl+RjgsJk6lkb2Ch4WsgDGA=;
  b=TN+pNR2oK3YSKh5PqdTqjfNx0YVT2AcToMZDxbXkh5Xf8rnDs7aLQrQY
   JCBgvgZWyqbKv4lNO+P4F6buFRu5UAXTlKHS7QQWnpHT7/yPLYK9WEXSQ
   Yye31HfPBMjc8xcdxC0yhY0KPjiKTjl4ijlkP25YeQPuTxZJrsuDBttpU
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pVW4pBa1EpyVhUq/aTYjkhlE+ZIid9t+92pUpor+liVcXi4DkxVt2PUkOreGWF0W6XjTA+15Al
 rmnh3Up3L/P8cdiVJQWNvwJlawEiOrfqGRYcjj7JzJgr37Hu+f5GEzHHkn7Mf2XbeAKFPChqoF
 RLcpdGBteUhgMbTLjtKfpDIGmJo+Y9i5YbrjiKKswi0dxrZVVELJb49nIHe7Dr2o8gw6DKQeI4
 HFkccQGHSt9gfIt+pYMO55P6yUWiMWUx8f6a7PX/XDXJr8w3vkdcl8jjPfJWm8fAcVu8+dm5LT
 wAY=
X-SBRS: 2.5
X-MesageID: 29879736
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,404,1596513600"; 
   d="scan'208";a="29879736"
Date: Thu, 22 Oct 2020 10:11:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/8] evtchn: avoid race in get_xen_consumer()
Message-ID: <20201022081100.bedkkvuqf7ymjpbl@Air-de-Roger>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <9ecafa4d-db5b-20a2-3a9d-6a6cda91252c@suse.com>
 <20201021154650.zz77ircyuedr7gpm@Air-de-Roger>
 <3fd4c197-617e-dd48-6781-9ff0b1a82bf8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fd4c197-617e-dd48-6781-9ff0b1a82bf8@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Thu, Oct 22, 2020 at 09:33:27AM +0200, Jan Beulich wrote:
> On 21.10.2020 17:46, Roger Pau Monné wrote:
> > On Tue, Oct 20, 2020 at 04:08:13PM +0200, Jan Beulich wrote:
> >> There's no global lock around the updating of this global piece of data.
> >> Make use of cmpxchgptr() to avoid two entities racing with their
> >> updates.
> >>
> >> While touching the functionality, mark xen_consumers[] read-mostly (or
> >> else the if() condition could use the result of cmpxchgptr(), writing to
> >> the slot unconditionally).
> > 
> > I'm not sure I get this, likely related to the comment I have below.
> 
> This is about the alternative case of invoking cmpxchgptr()
> without the if() around it. On x86 this would mean always
> writing the field, even if the designated value is already in
> place.
> 
> >> --- a/xen/common/event_channel.c
> >> +++ b/xen/common/event_channel.c
> >> @@ -57,7 +57,8 @@
> >>   * with a pointer, we stash them dynamically in a small lookup array which
> >>   * can be indexed by a small integer.
> >>   */
> >> -static xen_event_channel_notification_t xen_consumers[NR_XEN_CONSUMERS];
> >> +static xen_event_channel_notification_t __read_mostly
> >> +    xen_consumers[NR_XEN_CONSUMERS];
> >>  
> >>  /* Default notification action: wake up from wait_on_xen_event_channel(). */
> >>  static void default_xen_notification_fn(struct vcpu *v, unsigned int port)
> >> @@ -80,8 +81,9 @@ static uint8_t get_xen_consumer(xen_even
> >>  
> >>      for ( i = 0; i < ARRAY_SIZE(xen_consumers); i++ )
> >>      {
> >> +        /* Use cmpxchgptr() in lieu of a global lock. */
> >>          if ( xen_consumers[i] == NULL )
> >> -            xen_consumers[i] = fn;
> >> +            cmpxchgptr(&xen_consumers[i], NULL, fn);
> >>          if ( xen_consumers[i] == fn )
> >>              break;
> > 
> > I think you could join it as:
> > 
> > if ( !xen_consumers[i] &&
> >      !cmpxchgptr(&xen_consumers[i], NULL, fn) )
> >     break;
> > 
> > As cmpxchgptr will return the previous value of &xen_consumers[i]?
> 
> But then you also have to check whether the returned value is
> fn (or retain the 2nd if()).

__cmpxchg comment says that success of the operation is indicated when
the returned value equals the old value, so it's my understanding that
cmpxchgptr returning NULL would mean the exchange has succeed and that
xen_consumers[i] == fn?

Roger.

