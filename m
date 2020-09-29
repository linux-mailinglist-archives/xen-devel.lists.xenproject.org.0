Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F032627C25F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 12:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.17.72 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNCrW-00035S-2h; Tue, 29 Sep 2020 10:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17.72; Tue, 29 Sep 2020 10:27:58 +0000
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
	id 1kNCrV-000356-VQ; Tue, 29 Sep 2020 10:27:57 +0000
Received: by outflank-mailman (input) for mailman id 17;
 Tue, 29 Sep 2020 10:27:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FnP=DG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNCrU-000351-Om
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:27:56 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23871d96-2f34-4278-82e6-421d0f19aedb;
 Tue, 29 Sep 2020 10:27:55 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5FnP=DG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNCrU-000351-Om
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:27:56 +0000
X-Inumbo-ID: 23871d96-2f34-4278-82e6-421d0f19aedb
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 23871d96-2f34-4278-82e6-421d0f19aedb;
	Tue, 29 Sep 2020 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601375275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NIF2wSzDuVcB6nC4O9YGUS1TPOSCnCUnqQZsCsOO4s8=;
  b=ClOlJx9i7KTLCFotzk/A5T2g+iFCml/mXyjAQBRXwXhpDteEN5WxtxJC
   oim1I3HUUWJoZZuwj7mkyIkI1NjBagpeFSAgxVEADG3+VFKHzm53VSz+p
   HkYUk9mrZRfYC490AAC8G/tnBxk4ghg+Nbr8Zi00vHWaA28XauUetCgkv
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VtoUKpiXRwSLL6nHHIYMva+55gmMsBJzZjhkPr2gtS5CIQXXpKJvMN448lu2G/FKitrVu/bipr
 jWfa6P7EZHw/Q8jKvPbmVcyM0RT4+cSwtkyDwF4Yc6p02tzft8mFMardF+sREaRGNVMWous6BX
 IeMeHd0A2xmSAD4HptcGlykmW0N+b18khJip4w7+80wHLFf3sUVk+7Sc12WfQjjRZ3JzYpmmMV
 iE7llsG2kmCVU6kq/bMDLDfA25zOovR0uq7M5KXliSh/heNsUGBdgI39Cgm2CMLT+x/X1ly0LW
 3WE=
X-SBRS: None
X-MesageID: 27934961
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,318,1596513600"; 
   d="scan'208";a="27934961"
Date: Tue, 29 Sep 2020 12:27:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: Ping: [PATCH 2/2] x86/vpic: also execute dpci callback for
 non-specific EOI
Message-ID: <20200929102746.GQ19254@Air-de-Roger>
References: <20200820153442.28305-1-roger.pau@citrix.com>
 <20200820153442.28305-3-roger.pau@citrix.com>
 <625060e6-bdd0-c72c-c7fc-9a31588511b3@citrix.com>
 <4ac81e8f-f6e5-7226-49c7-135aa88a7b12@suse.com>
 <8e21a5fc-6c76-171f-8493-4a084ac1a779@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e21a5fc-6c76-171f-8493-4a084ac1a779@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Mon, Sep 21, 2020 at 12:05:51PM +0200, Jan Beulich wrote:
> On 21.08.2020 09:45, Jan Beulich wrote:
> > On 20.08.2020 18:28, Andrew Cooper wrote:
> >> On 20/08/2020 16:34, Roger Pau Monne wrote:
> >>> Currently the dpci EOI callback is only executed for specific EOIs.
> >>> This is wrong as non-specific EOIs will also clear the ISR bit and
> >>> thus end the interrupt. Re-arrange the code a bit so that the common
> >>> EOI handling path can be shared between all EOI modes.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>>  xen/arch/x86/hvm/vpic.c | 10 +++++-----
> >>>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
> >>> index feb1db2ee3..3cf12581e9 100644
> >>> --- a/xen/arch/x86/hvm/vpic.c
> >>> +++ b/xen/arch/x86/hvm/vpic.c
> >>> @@ -249,15 +249,15 @@ static void vpic_ioport_write(
> >>>                  if ( priority == VPIC_PRIO_NONE )
> >>>                      break;
> >>>                  pin = (priority + vpic->priority_add) & 7;
> >>> -                vpic->isr &= ~(1 << pin);
> >>> -                if ( cmd == 5 )
> >>> -                    vpic->priority_add = (pin + 1) & 7;
> >>> -                break;
> >>> +                goto common_eoi;
> >>> +
> >>>              case 3: /* Specific EOI                */
> >>>              case 7: /* Specific EOI & Rotate       */
> >>>                  pin = val & 7;
> >>
> >> You'll need a /* Fallthrough */ here to keep various things happy.
> > 
> > Are you sure? There's ...
> > 
> >> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>
> >> Can fix on commit if you're happy.
> >>
> >>> +
> >>> +            common_eoi:
> > 
> > ... an ordinary label here, not a case one.
> 
> I would have wanted to commit this, but it's still not clear to me
> whether the adjustment you ask for is really needed.

Hello,

Was about to send a further series I have on top of this and saw this
is still on my patch queue. I'm happy with either way, but I would
like to get this committed if possible (as I think from a technical
PoV we all agree it's correct).

Thanks, Roger.

