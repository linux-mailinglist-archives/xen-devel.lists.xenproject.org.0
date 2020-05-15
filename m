Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB01D4947
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 11:18:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZWTi-0006KI-D1; Fri, 15 May 2020 09:18:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZWTg-0006KD-VN
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 09:18:00 +0000
X-Inumbo-ID: f8a68aa8-968c-11ea-a536-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8a68aa8-968c-11ea-a536-12813bfff9fa;
 Fri, 15 May 2020 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589534280;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QGQk0kPjoJHxXoRzVfmJN/xTWWRnGgjce91XlkHH8wQ=;
 b=ZYA9rCdwhuXi2SvnCk/2oQKIX+96LgQW1EZ1609gWuV2dW8rmfwjGgUK
 eIt3jW9YrLppiGVyrsLXMXcqFiO6mIkdrBdxrrzcvCxopMzoz23gV/m26
 x3eNq0DPSmV/eZWP0JKR88JEl83T4G/Xd5oC1dysrePOxPVo8T+brhi8C U=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: c2l1EbN9LXFJ1tUwxQXfHTZt+iF0Oszqvi8gGc0SSyCOlYTZhR0XKY+ceqO8hDmGukQ1CoDI6T
 lg79OOfZ4SkFaZ+yPH7p+4yJx5xYxtmmLCJlyuSObNjOJTqtz+TKYel6he0apQnnYWj7t6CAl3
 0D7VHunt2KnQPLpONc/kj0GaqYiPXA4wJCOTZOovLfkD78tq+rJkwUBA9Bk5ZUrcvd4497O3Mj
 n2lzCu4drNpZGN+AF9DYP3S1HA7zP4EAwKNuzkH3GSmo6R3Q5H1koYjGlG9V7qrlHHvp74bGqC
 +qY=
X-SBRS: 2.7
X-MesageID: 17634068
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,394,1583211600"; d="scan'208";a="17634068"
Date: Fri, 15 May 2020 11:17:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: retrieve and log CPU frequency information
Message-ID: <20200515091750.GP54375@Air-de-Roger>
References: <1fd091d2-30e2-0691-0485-3f5142bd457f@suse.com>
 <20200515083204.GM54375@Air-de-Roger>
 <b672f753-cffd-def9-35bb-0d1314b682ba@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b672f753-cffd-def9-35bb-0d1314b682ba@suse.com>
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

On Fri, May 15, 2020 at 11:08:04AM +0200, Jan Beulich wrote:
> On 15.05.2020 10:32, Roger Pau Monné wrote:
> > On Wed, Apr 15, 2020 at 01:55:24PM +0200, Jan Beulich wrote:
> >> While from just a single Skylake system it is already clear that we
> >> can't base any of our logic on CPUID leaf 15 [1] (leaf 16 is
> >> documented to be used for display purposes only anyway), logging this
> >> information may still give us some reference in case of problems as well
> >> as for future work. Additionally on the AMD side it is unclear whether
> >> the deviation between reported and measured frequencies is because of us
> >> not doing well, or because of nominal and actual frequencies being quite
> >> far apart.
> >>
> >> The chosen variable naming in amd_log_freq() has pointed out a naming
> >> problem in rdmsr_safe(), which is being taken care of at the same time.
> >> Symmetrically wrmsr_safe(), being an inline function, also gets an
> >> unnecessary underscore dropped from one of its local variables.
> >>
> >> [1] With a core crystal clock of 24MHz and a ratio of 216/2, the
> >>     reported frequency nevertheless is 2600MHz, rather than the to be
> >>     expected (and calibrated by both us and Linux) 2592MHz.
> >>
> >> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks, but please clarify whether this is with or without the
> two suggested changes (breaking out intel_log_freq() and introducing
> local variables for (uint8_t)(msrval >> NN)), or whether you
> mean to leave it to me whether to make them. And if I'm to make the
> change, whether you'd trust me to not screw up things, i.e. whether
> I can keep you R-b in that case.

None of those are mandatory in order to keep the RB, just suggestions.

> >> +#undef PCI_ECS_ADDRESS
> >> +		wrmsrl(MSR_AMD64_NB_CFG, nbcfg);
> >> +	}
> >> +
> >> +	lo = 0; /* gcc may not recognize the loop having at least 5 iterations */
> >> +	for (h = c->x86 == 0x10 ? 5 : 8; h--; )
> >> +		if (!rdmsr_safe(0xC0010064 + h, lo) && (lo >> 63))
> >> +			break;
> >> +	if (!(lo >> 63))
> >> +		return;
> > 
> > Should you also take the P-state limit here into account (from MSR
> > 0xC0010061)?
> > 
> > I assume the firmware could set a minimum P-state higher than the
> > possible ones present in the list of P-states, effectively preventing
> > switching to lowest-performance P-states?
> 
> We're not after permitted P-states here - these would matter only if
> we were meaning to alter the current P-state by direct MSR accesses.
> Here we're only after logging capabilities (and the P-state limits
> can, aiui, in principle also change at runtime).

OK, I have to admit I'm not aware of how this is supposed to work.

One scenario I had in mind was that the firmware would set P-state
control to a value higher than the minimum one in order to prevent the
OS from switching to a lower P-state, in which case reporting the
frequency of the minimum P-state would be kind of incorrect since
switching to it won't be possible anyway. But if this is supposed to
change at runtime then reporting the lowest possible makes sense.

Thanks, Roger.

