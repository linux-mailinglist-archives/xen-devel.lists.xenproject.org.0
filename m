Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB372340ED
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 10:13:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Q9s-0003eY-Bf; Fri, 31 Jul 2020 08:12:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDYK=BK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k1Q9r-0003eT-2z
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 08:12:51 +0000
X-Inumbo-ID: 9fbc8842-d305-11ea-8e14-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fbc8842-d305-11ea-8e14-bc764e2007e4;
 Fri, 31 Jul 2020 08:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596183170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=orBigK7HqKlYuFLBbF5hlm/uG7lMoFm/YSH2dLvDWT8=;
 b=SqNv6IY3Gk+K1hVuwa3SWi532gWiBXAnNLZE35rs9sJpGrqoC0PAsQPu
 G8R7kGHfcBdp4btagUnGh2dxFBNg4g9g3Q56Xmc6n2vrDJ+iCWATm3xDS
 xEl+AxXP6lYmbzvzd7t78qMvUoMtByg5y/QsRr0rZWgDIcZHBESRQPXDy k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: aTKWflshIQYZiRGFowlSt8uYZHLOxGIFHVqPkTgbEUeY+d3imjLlTXY30yyXRe4XQ6PzRuNy4t
 H4N7Rr+bgVtqyPVEcJ2CmvItFwmC/jdKykQQaNd5jjdeIKxi2Pi2Qgx6ZzbgUNoEtgzkPVc1Xo
 4swGR/UCLnC7Xno15vG4gC+nOM8JaXVxe6gna3a/7Fh8H/rpU2nsUxyVk9Y/WDFzXtxqwzckjN
 SFvPj98a4cTjnuyuurE96iqeQWhrbYEaJxD1Y4MMCHiOgUOLwd4aa4ZfAvkL4ijMajV4gHXKsv
 uhs=
X-SBRS: 2.7
X-MesageID: 24486609
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,417,1589256000"; d="scan'208";a="24486609"
Date: Fri, 31 Jul 2020 10:12:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
Message-ID: <20200731081240.GA88772@Air-de-Roger>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
 <20200727145526.GR7191@Air-de-Roger>
 <b29e4b17-8ec2-a0db-8426-94393e9eb2c0@suse.com>
 <20200728090618.GZ7191@Air-de-Roger>
 <32c79b37-a93c-7a72-7c0f-753cf603adfb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32c79b37-a93c-7a72-7c0f-753cf603adfb@suse.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 31, 2020 at 10:05:07AM +0200, Jan Beulich wrote:
> On 28.07.2020 11:06, Roger Pau Monné wrote:
> > On Mon, Jul 27, 2020 at 09:47:52PM +0200, Jan Beulich wrote:
> >> On 27.07.2020 16:55, Roger Pau Monné wrote:
> >>> On Wed, Jul 15, 2020 at 12:48:14PM +0200, Jan Beulich wrote:
> >>>> --- /dev/null
> >>>> +++ b/xen/include/asm-x86/asm-defns.h
> >>>
> >>> Maybe this could be asm-insn.h or a different name? I find it
> >>> confusing to have asm-defns.h and an asm_defs.h.
> >>
> >> While indeed I anticipated a reply to this effect, I don't consider
> >> asm-insn.h or asm-macros.h suitable: We don't want to limit this
> >> header to a more narrow purpose than "all sorts of definition", I
> >> don't think. Hence I chose that name despite its similarity to the
> >> C header's one.
> > 
> > I think it's confusing, but I also think the whole magic we do with
> > asm includes is already confusing (me), so if you and Andrew agree
> > this is the best name I'm certainly fine with it. FWIW:
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Please quote the clac/stac instructions in order to match the other
> > usages of ALTERNATIVE.
> 
> We're not consistently quoting when there's just a single word, see
> in particular spec_ctrl_asm.h. And thinking about it again I also
> don't see why we would want or need to enforce quotation when none
> is needed. Therefore both here and in patch 2 I'll keep (or make,
> when I touch a line anyway) things consistently unquoted where no
> quotes are needed. Please let me know if your R-b holds without the
> requested adjustment.

Yes, I'm fine as long as we are consistent with quoting of single word
instructions. Ideally I would like that we quote both single and multi
word for consistency, but you are the one doing the work so I'm not
going to oppose to not quoting single words.

Thanks, Roger.

