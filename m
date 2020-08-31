Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B374D257BF0
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 17:13:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kClTn-0003zE-G9; Mon, 31 Aug 2020 15:12:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWhU=CJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kClTm-0003z9-M0
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 15:12:18 +0000
X-Inumbo-ID: f1f199ec-e964-4b4e-821e-79dce944dc0a
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1f199ec-e964-4b4e-821e-79dce944dc0a;
 Mon, 31 Aug 2020 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598886738;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i2p3koI2qcbJfRP6ve5L4Rtzx0noyKtM5FKQkJryCHI=;
 b=RG+uxOTCJuelWpRh1LlJ8RV4vj2zgks3TEaA+Wmaq+xl0fntuTbEG7BT
 gGwmrBwmThbgv75WWMN4iMZqw+33yF1+odbJm82fWldXn/Ue4TWXhRD09
 dKW4bbSq4o5PBVJz47ytV7jFuNwVcqGalYaYRcPEGM9eMwc+O9RtSnlHT E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +XQJ0gWoC4jgkY6Jw4479eLYuyfK9r0MUn3os83TzOJCRUcOfik3of28nY98GaW7Eb3glvDHYK
 vxFzrLCIfCMwAxIJ9YCZpDH04J3sxAlqt5cgmresoxOql9xLUPLYr4KfPybQbHB786rU9D1rrF
 N6JsNq9/w0LJ4b4mD+q1yxugqQBfcmZpRZboSip/nA5qm4feF/da2bV9MoKmkKq9O5ThEA1Lve
 NmVcS7HgrHO2ahmGfI4zoB41z5TWVcuA62xkzjXx7uiLoGzs2IMLko61ZPpl5olj/dUV2xMmVQ
 J9M=
X-SBRS: 2.7
X-MesageID: 25991742
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,376,1592884800"; d="scan'208";a="25991742"
Date: Mon, 31 Aug 2020 17:12:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 5/8] x86/pv: allow reading FEATURE_CONTROL MSR
Message-ID: <20200831151204.GF753@Air-de-Roger>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-6-roger.pau@citrix.com>
 <3e260ee3-674b-82d2-d983-f17d3d91c230@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e260ee3-674b-82d2-d983-f17d3d91c230@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Thu, Aug 27, 2020 at 05:53:16PM +0200, Jan Beulich wrote:
> On 20.08.2020 17:08, Roger Pau Monne wrote:
> > @@ -181,6 +182,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >          /* Not offered to guests. */
> >          goto gp_fault;
> >  
> > +    case MSR_IA32_FEATURE_CONTROL:
> > +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
> > +            goto gp_fault;
> 
> Can we really do it this way round, rather than raising #GP when
> we know the MSR isn't there (AMD / Hygon)? I realized code e.g.
> ...
> 
> > +        *val = IA32_FEATURE_CONTROL_LOCK;
> > +        if ( vmce_has_lmce(v) )
> > +            *val |= IA32_FEATURE_CONTROL_LMCE_ON;
> > +        if ( nestedhvm_enabled(d) )
> > +            *val |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
> > +        break;
> > +
> > +
> >      case MSR_IA32_PLATFORM_ID:
> >          if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
> >               !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
> 
> ... in context right here does it the same way, but I still
> wonder whether we wouldn't better switch existing instances, too.

Hm, no idea really. Right now it seems better to check for != Intel
rather than AMD | Hygon | Centaur | Shanghai, as that's a MSR specific
to Intel.

Do those MSRs exist in Centaur / Shanghai?

Thanks, Roger.

