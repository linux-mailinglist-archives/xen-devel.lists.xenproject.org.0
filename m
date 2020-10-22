Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89EB295BB9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 11:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10300.27361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVWrF-0002U9-3d; Thu, 22 Oct 2020 09:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10300.27361; Thu, 22 Oct 2020 09:26:05 +0000
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
	id 1kVWrF-0002Tn-0B; Thu, 22 Oct 2020 09:26:05 +0000
Received: by outflank-mailman (input) for mailman id 10300;
 Thu, 22 Oct 2020 09:26:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVWrD-0002Ti-Si
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:26:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22415894-75c2-4a61-ab6c-9c8f46d9b6e4;
 Thu, 22 Oct 2020 09:26:03 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVWrD-0002Ti-Si
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:26:03 +0000
X-Inumbo-ID: 22415894-75c2-4a61-ab6c-9c8f46d9b6e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 22415894-75c2-4a61-ab6c-9c8f46d9b6e4;
	Thu, 22 Oct 2020 09:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603358763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sYRjzewN0a2IME8RSLdVajEVL/ZhMXvyWZlOdP+c8j4=;
  b=iLiJm7pJ3QkqZuHNlQPIUgcNQ60n7RlO5KPciQCuqqjUYL6ANvyHa3g3
   QfbBpPNd4l0GkQPal645YP8mv40sC9cnmLjBSV/dd3GP7V7G6jMvS4Cni
   HOurFUlEV/J1bZYyN01zLDshGkpDBEdO/aWuYvUnKh6JttrqvpT1b0VgA
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ir8dgV9DBXFyznyP+Om+OQWgSq8sGtxLnlSKtoxLu0bsQFaqY5g+4++2AmyfuvOcYilZcnDUhf
 Uz8ldwNgbie06CBHFDfDPUfbGZ8w3/2C0toSHwO+Mj1WDN/Nkvv6riL+pFi9CifqQlX1PvoyPQ
 35cBT/sa7yNrMUWgzC7JoRC9gXblozSDYHnPrs8az2mh7AiAjwpLJzvQEktUbZHc4NpWok+6DR
 wNBDBdFrlteegfPjmDBb/EnL6Ydjsg3LI8K7iiwGst81Zn9wtHU+cvZ9rfPlS0xD4Pqrw0RDWK
 +f4=
X-SBRS: 2.5
X-MesageID: 29524186
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,404,1596513600"; 
   d="scan'208";a="29524186"
Date: Thu, 22 Oct 2020 11:25:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/8] evtchn: avoid race in get_xen_consumer()
Message-ID: <20201022092553.a45yqdy7zsdivi3r@Air-de-Roger>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <9ecafa4d-db5b-20a2-3a9d-6a6cda91252c@suse.com>
 <20201021154650.zz77ircyuedr7gpm@Air-de-Roger>
 <3fd4c197-617e-dd48-6781-9ff0b1a82bf8@suse.com>
 <20201022081100.bedkkvuqf7ymjpbl@Air-de-Roger>
 <2172763f-9f3d-588e-b4f2-0f9187a40ff9@suse.com>
 <20201022082938.jnpw7wvzuvxqa6iy@Air-de-Roger>
 <2bc15e6b-cc53-3092-2a56-492a302fbc1e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bc15e6b-cc53-3092-2a56-492a302fbc1e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Thu, Oct 22, 2020 at 10:56:15AM +0200, Jan Beulich wrote:
> On 22.10.2020 10:29, Roger Pau Monné wrote:
> > On Thu, Oct 22, 2020 at 10:15:45AM +0200, Jan Beulich wrote:
> >> On 22.10.2020 10:11, Roger Pau Monné wrote:
> >>> On Thu, Oct 22, 2020 at 09:33:27AM +0200, Jan Beulich wrote:
> >>>> On 21.10.2020 17:46, Roger Pau Monné wrote:
> >>>>> On Tue, Oct 20, 2020 at 04:08:13PM +0200, Jan Beulich wrote:
> >>>>>> @@ -80,8 +81,9 @@ static uint8_t get_xen_consumer(xen_even
> >>>>>>  
> >>>>>>      for ( i = 0; i < ARRAY_SIZE(xen_consumers); i++ )
> >>>>>>      {
> >>>>>> +        /* Use cmpxchgptr() in lieu of a global lock. */
> >>>>>>          if ( xen_consumers[i] == NULL )
> >>>>>> -            xen_consumers[i] = fn;
> >>>>>> +            cmpxchgptr(&xen_consumers[i], NULL, fn);
> >>>>>>          if ( xen_consumers[i] == fn )
> >>>>>>              break;
> >>>>>
> >>>>> I think you could join it as:
> >>>>>
> >>>>> if ( !xen_consumers[i] &&
> >>>>>      !cmpxchgptr(&xen_consumers[i], NULL, fn) )
> >>>>>     break;
> >>>>>
> >>>>> As cmpxchgptr will return the previous value of &xen_consumers[i]?
> >>>>
> >>>> But then you also have to check whether the returned value is
> >>>> fn (or retain the 2nd if()).
> >>>
> >>> __cmpxchg comment says that success of the operation is indicated when
> >>> the returned value equals the old value, so it's my understanding that
> >>> cmpxchgptr returning NULL would mean the exchange has succeed and that
> >>> xen_consumers[i] == fn?
> >>
> >> Correct. But if xen_consumers[i] == fn before the call, the return
> >> value will be fn. The cmpxchg() wasn't "successful" in this case
> >> (it didn't update anything), but the state of the array slot is what
> >> we want.
> > 
> > Oh, I get it now. You don't want the same fn populating more than one
> > slot.
> 
> FAOD it's not just "want", it's a strict requirement.

I wouldn't mind having a comment to that effect in the function, but I
won't insist.

Thanks, Roger.

