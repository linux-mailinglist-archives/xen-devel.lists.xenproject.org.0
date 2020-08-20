Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E624C363
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 18:34:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8nVh-0004pi-9j; Thu, 20 Aug 2020 16:33:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8nVf-0004pd-VL
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 16:33:51 +0000
X-Inumbo-ID: c9da658c-86d7-421e-a3f3-140f28e4df5d
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9da658c-86d7-421e-a3f3-140f28e4df5d;
 Thu, 20 Aug 2020 16:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597941231;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c+A+sm925m170y3AZR+V3Zlr8nGEk0PENvCXbHZyrBM=;
 b=DN58R2LRkmfslN3WEotpvPKCKZk08W6crA/8WO2T+uRV8MuU6NtUVeL/
 kAegMnK75Sip5zJoJChWp3xlBtBwDfA3xDSzby4ALHMf2zztY6NR76utN
 5lsWP3v3jAwyLhm0FJ6RbaEVi9j4eV2tlZru5nA4+bHaWaG9WOg/OOOKb E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2iBLv8LY7tOcI99mHVNIrFjliobHunU37dZY699zGtMqnSgFsGZLRAk+f1hvPlwBfAUvL6wHeo
 tUupAJDgxhu+aHqUFAbXPi0ewuo1JJ7uaash90jJu2IjadUV3FbYLmNpxz+jZVExN2EXbnbWI/
 IkN/JWmQzR2ubXoov4bwPcQ5Oa7SqT7fMBZUeDqzvJf4lNGHeuPtbpJMZHl9H/XPwd92S+n9zM
 04ZgedIfiBiJfW5WtI4q4jKUE5JpusdJaFOW8Z7PUO2TusMR5XXzrBEM9J+F6cqMzXT4yLMasr
 71E=
X-SBRS: 2.7
X-MesageID: 24952376
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="24952376"
Date: Thu, 20 Aug 2020 18:33:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH 2/2] x86/vpic: also execute dpci callback for
 non-specific EOI
Message-ID: <20200820163343.GW828@Air-de-Roger>
References: <20200820153442.28305-1-roger.pau@citrix.com>
 <20200820153442.28305-3-roger.pau@citrix.com>
 <625060e6-bdd0-c72c-c7fc-9a31588511b3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <625060e6-bdd0-c72c-c7fc-9a31588511b3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Aug 20, 2020 at 05:28:21PM +0100, Andrew Cooper wrote:
> On 20/08/2020 16:34, Roger Pau Monne wrote:
> > Currently the dpci EOI callback is only executed for specific EOIs.
> > This is wrong as non-specific EOIs will also clear the ISR bit and
> > thus end the interrupt. Re-arrange the code a bit so that the common
> > EOI handling path can be shared between all EOI modes.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/hvm/vpic.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
> > index feb1db2ee3..3cf12581e9 100644
> > --- a/xen/arch/x86/hvm/vpic.c
> > +++ b/xen/arch/x86/hvm/vpic.c
> > @@ -249,15 +249,15 @@ static void vpic_ioport_write(
> >                  if ( priority == VPIC_PRIO_NONE )
> >                      break;
> >                  pin = (priority + vpic->priority_add) & 7;
> > -                vpic->isr &= ~(1 << pin);
> > -                if ( cmd == 5 )
> > -                    vpic->priority_add = (pin + 1) & 7;
> > -                break;
> > +                goto common_eoi;
> > +
> >              case 3: /* Specific EOI                */
> >              case 7: /* Specific EOI & Rotate       */
> >                  pin = val & 7;
> 
> You'll need a /* Fallthrough */ here to keep various things happy.
> 
> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Can fix on commit if you're happy.

Sure, I was borderline to add it but somehow assumed that
/* Fallthrough */ was required for cases but not labels.

Thanks, Roger.

