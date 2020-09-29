Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02E27C3A7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 13:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.30.145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDUw-00077M-NI; Tue, 29 Sep 2020 11:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30.145; Tue, 29 Sep 2020 11:08:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDUw-00076x-JX; Tue, 29 Sep 2020 11:08:42 +0000
Received: by outflank-mailman (input) for mailman id 30;
 Tue, 29 Sep 2020 11:08:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FnP=DG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNDUu-00076s-Oq
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:08:40 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad057cc8-b286-494f-9210-5b4f048f5cfa;
 Tue, 29 Sep 2020 11:08:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5FnP=DG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNDUu-00076s-Oq
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:08:40 +0000
X-Inumbo-ID: ad057cc8-b286-494f-9210-5b4f048f5cfa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ad057cc8-b286-494f-9210-5b4f048f5cfa;
	Tue, 29 Sep 2020 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601377719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ihzm/UPzkM4ADlF04LYReYUmr+nIqNZCyWxCagWdOfE=;
  b=NIAyXUEZl7Hw/neBp/0dMPxH9Yhl3QcjJdtapgw0EgCSli4rbcAAUsoR
   vKZSwxX/xd7T0emfJVdGHmYQEiJXGaI1aP6/KGzYQ1C1WIAqiFHADuZWR
   SafYa9rSyXbXz6k+f5Clj/sMObWoaguao6/BYkY5xurHqjicgMVspsLUm
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: W3mJ5CSa+YHh3OaT9hJrqvDVUHRtEMWLhl6dOfjZh5SPVBw3X7X2BGXN357RaSiFZNlCa2EWTg
 awggXvuZ1hYzDxRbBx6K4OztujWuGIOZo/A0XopRhijpUkkbDws4FcO/i5ju5L3emuKXwepA6J
 aEK3pkV5rOiT29GYjt/1yxrbx6AwBlSld6my6++itWFUCJUFh4Knk1G+vFPaAceuSSzEm63/lL
 /qZVy6uzVofzImFIZKgK6KV2uDswPY5NwQ6JRIrhLNklkdEZwii6hY2O7yFtF5FJLXKlvxFca9
 p/A=
X-SBRS: None
X-MesageID: 28849326
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,318,1596513600"; 
   d="scan'208";a="28849326"
Date: Tue, 29 Sep 2020 13:08:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: Ping: [PATCH 2/2] x86/vpic: also execute dpci callback for
 non-specific EOI
Message-ID: <20200929110830.GT19254@Air-de-Roger>
References: <20200820153442.28305-1-roger.pau@citrix.com>
 <20200820153442.28305-3-roger.pau@citrix.com>
 <625060e6-bdd0-c72c-c7fc-9a31588511b3@citrix.com>
 <4ac81e8f-f6e5-7226-49c7-135aa88a7b12@suse.com>
 <8e21a5fc-6c76-171f-8493-4a084ac1a779@suse.com>
 <20200929102746.GQ19254@Air-de-Roger>
 <b1e90afe-1e9f-3230-a5d8-1e3e2307da3d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1e90afe-1e9f-3230-a5d8-1e3e2307da3d@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Tue, Sep 29, 2020 at 12:58:20PM +0200, Jan Beulich wrote:
> On 29.09.2020 12:27, Roger Pau Monné wrote:
> > On Mon, Sep 21, 2020 at 12:05:51PM +0200, Jan Beulich wrote:
> >> On 21.08.2020 09:45, Jan Beulich wrote:
> >>> On 20.08.2020 18:28, Andrew Cooper wrote:
> >>>> On 20/08/2020 16:34, Roger Pau Monne wrote:
> >>>>> Currently the dpci EOI callback is only executed for specific EOIs.
> >>>>> This is wrong as non-specific EOIs will also clear the ISR bit and
> >>>>> thus end the interrupt. Re-arrange the code a bit so that the common
> >>>>> EOI handling path can be shared between all EOI modes.
> >>>>>
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>> ---
> >>>>>  xen/arch/x86/hvm/vpic.c | 10 +++++-----
> >>>>>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>>>>
> >>>>> diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
> >>>>> index feb1db2ee3..3cf12581e9 100644
> >>>>> --- a/xen/arch/x86/hvm/vpic.c
> >>>>> +++ b/xen/arch/x86/hvm/vpic.c
> >>>>> @@ -249,15 +249,15 @@ static void vpic_ioport_write(
> >>>>>                  if ( priority == VPIC_PRIO_NONE )
> >>>>>                      break;
> >>>>>                  pin = (priority + vpic->priority_add) & 7;
> >>>>> -                vpic->isr &= ~(1 << pin);
> >>>>> -                if ( cmd == 5 )
> >>>>> -                    vpic->priority_add = (pin + 1) & 7;
> >>>>> -                break;
> >>>>> +                goto common_eoi;
> >>>>> +
> >>>>>              case 3: /* Specific EOI                */
> >>>>>              case 7: /* Specific EOI & Rotate       */
> >>>>>                  pin = val & 7;
> >>>>
> >>>> You'll need a /* Fallthrough */ here to keep various things happy.
> >>>
> >>> Are you sure? There's ...
> >>>
> >>>> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>
> >>>> Can fix on commit if you're happy.
> >>>>
> >>>>> +
> >>>>> +            common_eoi:
> >>>
> >>> ... an ordinary label here, not a case one.
> >>
> >> I would have wanted to commit this, but it's still not clear to me
> >> whether the adjustment you ask for is really needed.
> > 
> > Was about to send a further series I have on top of this and saw this
> > is still on my patch queue. I'm happy with either way, but I would
> > like to get this committed if possible (as I think from a technical
> > PoV we all agree it's correct).
> 
> Hmm, did you mean to send this _to_ Andrew, with me on _cc_? There's
> nothing I can do without his further input.

Yes, it's fixed now.

Please see above Andrew.

Roger.

